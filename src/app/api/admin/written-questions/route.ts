import { MasterAuthorizationError, requireMaster, type MasterAuthClient } from '@/lib/master-auth'
import { validateWrittenQuestionCreate, type WrittenQuestionCreateInput } from '@/lib/written-question-create'
import { createClient } from '@/lib/supabase/server'

type RpcError = {
  code?: unknown
  message?: unknown
  details?: unknown
  hint?: unknown
}

type AuthenticatedSupabaseClient = MasterAuthClient & {
  rpc: (fn: string, args: Record<string, unknown>) => Promise<{ data: unknown; error: RpcError | null }>
}

type CreatedWrittenQuestion = {
  id: string
  number: number
  subject: string
  content: string
  choices: [string, string, string, string]
  updatedAt: string
  acceptedAnswerIndexes: number[]
  explanation: string
}

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
  const details = errorText(error)

  if (details.includes('already exists')) {
    return Response.json(
      { error: 'a question with this year, round, and number already exists' },
      { status: 409 },
    )
  }
  if (details.includes('exam not found')) {
    return Response.json({ error: 'exam not found' }, { status: 404 })
  }
  return Response.json({ error: 'unable to create question' }, { status: 500 })
}

function createdQuestion(
  data: unknown,
  input: WrittenQuestionCreateInput,
): CreatedWrittenQuestion | undefined {
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

export async function POST(request: Request) {
  try {
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
        return Response.json(
          { error: error.role === 'anonymous' ? 'authentication required' : 'master access is required' },
          { status },
        )
      }
      throw error
    }

    let input: WrittenQuestionCreateInput
    try {
      input = validateWrittenQuestionCreate(body)
    } catch (error) {
      const message = error instanceof Error ? error.message : 'invalid create payload'
      return Response.json({ error: message }, { status: 400 })
    }

    const { data, error } = await supabase.rpc('create_written_question', {
      p_exam_slug: input.examSlug,
      p_year: input.year,
      p_round: input.round,
      p_subject: input.subject,
      p_number: input.number,
      p_content: input.content,
      p_choices: input.choices,
      p_correct_numbers: input.acceptedAnswerIndexes.map((index) => index + 1),
      p_explanation: input.explanation,
    })
    if (error) return rpcFailure(error)

    const question = createdQuestion(data, input)
    if (!question) return Response.json({ error: 'unable to create question' }, { status: 500 })
    return Response.json(question, { status: 201 })
  } catch {
    return Response.json({ error: 'unable to create question' }, { status: 500 })
  }
}
