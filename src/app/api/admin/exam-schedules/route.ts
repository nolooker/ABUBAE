import { MasterAuthorizationError, requireMaster, type MasterAuthClient } from '@/lib/master-auth'
import { ExamScheduleValidationError, validateExamScheduleInput } from '@/lib/exam-schedule'
import {
  ExamNotFoundError,
  ExamScheduleDuplicateError,
  createExamScheduleRepository,
} from '@/lib/exam-schedule-repository'
import { createClient } from '@/lib/supabase/server'
import { createServiceClient } from '@/lib/supabase/service'

function authorizationFailure(error: unknown): Response | undefined {
  if (!(error instanceof MasterAuthorizationError)) return undefined
  if (error.role === 'anonymous') {
    return Response.json({ error: 'authentication required' }, { status: 401 })
  }
  return Response.json({ error: 'master access is required' }, { status: 403 })
}

async function requireAuthenticatedMaster() {
  const supabase = await createClient() as unknown as MasterAuthClient
  await requireMaster(supabase)
}

function examSlugFrom(body: unknown): string {
  if (typeof body !== 'object' || body === null || Array.isArray(body)) {
    throw new ExamScheduleValidationError('exam schedule input must be an object')
  }
  const { examSlug } = body as Record<string, unknown>
  if (typeof examSlug !== 'string' || !examSlug.trim()) {
    throw new ExamScheduleValidationError('examSlug is required')
  }
  return examSlug.trim()
}

export async function POST(request: Request) {
  try {
    await requireAuthenticatedMaster()

    let body: unknown
    try {
      body = await request.json()
    } catch {
      return Response.json({ error: 'request body must be valid JSON' }, { status: 400 })
    }

    let examSlug: string
    let input
    try {
      examSlug = examSlugFrom(body)
      const rest = { ...(body as Record<string, unknown>) }
      delete rest.examSlug
      input = validateExamScheduleInput(rest)
    } catch (error) {
      const message = error instanceof Error ? error.message : 'invalid exam schedule input'
      return Response.json({ error: message }, { status: 400 })
    }

    const repository = createExamScheduleRepository(createServiceClient())
    const schedule = await repository.create(examSlug, input)
    return Response.json(schedule, { status: 201 })
  } catch (error) {
    const authorization = authorizationFailure(error)
    if (authorization) return authorization
    if (error instanceof ExamNotFoundError) {
      return Response.json({ error: 'exam not found' }, { status: 404 })
    }
    if (error instanceof ExamScheduleDuplicateError) {
      return Response.json({ error: error.message }, { status: 409 })
    }
    return Response.json({ error: 'unable to create the exam schedule' }, { status: 500 })
  }
}
