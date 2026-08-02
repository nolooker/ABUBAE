import { MasterAuthorizationError, requireMaster, type MasterAuthClient } from '@/lib/master-auth'
import { validateWrittenQuestionEdit, type WrittenQuestionEditInput } from '@/lib/written-question-edit'
import { createClient } from '@/lib/supabase/server'
import type { PublicWrittenQuestion } from '@/lib/written-question-repository'

type Context = {
  params: Promise<{ questionId: string }>
}

type RpcError = {
  code?: unknown
  message?: unknown
  details?: unknown
  hint?: unknown
}

type AuthenticatedSupabaseClient = MasterAuthClient & {
  rpc: (fn: string, args: Record<string, unknown>) => Promise<{ data: unknown; error: RpcError | null }>
}

type EditedWrittenQuestion = PublicWrittenQuestion & {
  acceptedAnswerIndexes: number[]
  explanation: string
}

const uuid = /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/i

function isRecord(value: unknown): value is Record<string, unknown> {
  return typeof value === 'object' && value !== null && !Array.isArray(value)
}

function errorText(error: RpcError): string {
  return [error.message, error.details, error.hint]
    .filter((value): value is string => typeof value === 'string')
    .join(' ')
    .toLowerCase()
}

function rpcFailure(error: RpcError): Response {
  const code = typeof error.code === 'string' ? error.code : ''
  const details = errorText(error)

  if (code === 'PGRST116' || details.includes('written question not found')) {
    return Response.json({ error: 'question not found' }, { status: 404 })
  }
  if (code === '40001' || details.includes('stale question')) {
    return Response.json({ error: 'question was updated by another request' }, { status: 409 })
  }
  return Response.json({ error: 'unable to update question' }, { status: 500 })
}

function editedQuestion(
  data: unknown,
  input: WrittenQuestionEditInput,
): EditedWrittenQuestion | undefined {
  const row = Array.isArray(data) ? data[0] : data
  if (!isRecord(row)
    || typeof row.id !== 'string'
    || typeof row.number !== 'number'
    || !Number.isSafeInteger(row.number)
    || row.number < 1
    || typeof row.subject !== 'string'
    || typeof row.content !== 'string'
    || typeof row.updated_at !== 'string') {
    return undefined
  }

  return {
    id: row.id,
    number: row.number,
    subject: row.subject,
    content: row.content,
    choices: [...input.choices],
    updatedAt: row.updated_at,
    acceptedAnswerIndexes: [...input.acceptedAnswerIndexes],
    explanation: input.explanation,
  }
}

function deleteRpcFailure(error: RpcError): Response {
  const code = typeof error.code === 'string' ? error.code : ''
  const details = errorText(error)

  if (code === 'PGRST116' || details.includes('written question not found')) {
    return Response.json({ error: 'question not found' }, { status: 404 })
  }
  return Response.json({ error: 'unable to delete question' }, { status: 500 })
}

export async function DELETE(_request: Request, { params }: Context) {
  try {
    const { questionId } = await params
    if (!uuid.test(questionId)) {
      return Response.json({ error: 'questionId must be a UUID' }, { status: 400 })
    }

    const supabase = await createClient() as unknown as AuthenticatedSupabaseClient
    try {
      await requireMaster(supabase)
    } catch (error) {
      if (error instanceof MasterAuthorizationError) {
        return Response.json({ error: error.role === 'anonymous' ? 'authentication required' : 'master access is required' }, { status: error.role === 'anonymous' ? 401 : 403 })
      }
      throw error
    }

    const { error } = await supabase.rpc('delete_written_question', { p_question_id: questionId })
    if (error) return deleteRpcFailure(error)

    return new Response(null, { status: 204 })
  } catch {
    return Response.json({ error: 'unable to delete question' }, { status: 500 })
  }
}

export async function PATCH(request: Request, { params }: Context) {
  try {
    const { questionId } = await params
    if (!uuid.test(questionId)) {
      return Response.json({ error: 'questionId must be a UUID' }, { status: 400 })
    }

    let body: unknown
    try {
      body = await request.json()
    } catch {
      return Response.json({ error: 'request body must be valid JSON' }, { status: 400 })
    }

    const supabase = await createClient() as unknown as AuthenticatedSupabaseClient
    try {
      await requireMaster(supabase)
    } catch (error) {
      if (error instanceof MasterAuthorizationError) {
        const status = error.role === 'anonymous' ? 401 : 403
        return Response.json({ error: error.role === 'anonymous' ? 'authentication required' : 'master access is required' }, { status })
      }
      throw error
    }

    let input: WrittenQuestionEditInput
    try {
      input = validateWrittenQuestionEdit(body)
    } catch (error) {
      const message = error instanceof Error ? error.message : 'invalid edit payload'
      return Response.json({ error: message }, { status: 400 })
    }

    const { data, error } = await supabase.rpc('update_written_question', {
      p_question_id: questionId,
      p_content: input.content,
      p_choices: input.choices,
      p_correct_numbers: input.acceptedAnswerIndexes.map((index) => index + 1),
      p_explanation: input.explanation,
      p_expected_updated_at: input.expectedUpdatedAt,
    })
    if (error) return rpcFailure(error)

    const question = editedQuestion(data, input)
    if (!question) return Response.json({ error: 'unable to update question' }, { status: 500 })
    return Response.json(question)
  } catch {
    return Response.json({ error: 'unable to update question' }, { status: 500 })
  }
}
