import { MasterAuthorizationError, requireMaster, type MasterAuthClient } from '@/lib/master-auth'
import { validatePracticalQuestionEdit, type PracticalQuestionEditInput } from '@/lib/practical-question-edit'
import { createClient } from '@/lib/supabase/server'

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

type EditedPracticalQuestion = {
  id: string
  number: number
  subject: string
  content: string
  blankCount: number
  updatedAt: string
  blanks: PracticalQuestionEditInput['blanks']
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

  if (code === 'PGRST116' || details.includes('practical question not found')) {
    return Response.json({ error: 'question not found' }, { status: 404 })
  }
  if (code === '40001' || details.includes('stale question')) {
    return Response.json({ error: 'question was updated by another request' }, { status: 409 })
  }
  return Response.json({ error: 'unable to update question' }, { status: 500 })
}

function editedQuestion(
  data: unknown,
  input: PracticalQuestionEditInput,
): EditedPracticalQuestion | undefined {
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
    blankCount: input.blanks.length,
    updatedAt: row.updated_at,
    blanks: [...input.blanks],
    explanation: input.explanation,
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

    let input: PracticalQuestionEditInput
    try {
      input = validatePracticalQuestionEdit(body)
    } catch (error) {
      const message = error instanceof Error ? error.message : 'invalid edit payload'
      return Response.json({ error: message }, { status: 400 })
    }

    const { data, error } = await supabase.rpc('update_practical_question', {
      p_question_id: questionId,
      p_content: input.content,
      p_explanation: input.explanation,
      p_blanks: input.blanks.map((blank) => ({ blank_number: blank.blankNumber, accepted_answers: blank.acceptedAnswers })),
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
