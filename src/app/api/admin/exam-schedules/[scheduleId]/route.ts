import { MasterAuthorizationError, requireMaster, type MasterAuthClient } from '@/lib/master-auth'
import { validateExamScheduleId, validateExamScheduleInput } from '@/lib/exam-schedule'
import {
  ExamScheduleDuplicateError,
  ExamScheduleNotFoundError,
  createExamScheduleRepository,
} from '@/lib/exam-schedule-repository'
import { createClient } from '@/lib/supabase/server'
import { createServiceClient } from '@/lib/supabase/service'

type Context = {
  params: Promise<{ scheduleId: string }>
}

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

async function scheduleIdFrom(context: Context): Promise<string> {
  return validateExamScheduleId((await context.params).scheduleId)
}

export async function PATCH(request: Request, context: Context) {
  try {
    const scheduleId = await scheduleIdFrom(context)
    await requireAuthenticatedMaster()

    let body: unknown
    try {
      body = await request.json()
    } catch {
      return Response.json({ error: 'request body must be valid JSON' }, { status: 400 })
    }

    let input
    try {
      input = validateExamScheduleInput(body)
    } catch (error) {
      const message = error instanceof Error ? error.message : 'invalid exam schedule input'
      return Response.json({ error: message }, { status: 400 })
    }

    const repository = createExamScheduleRepository(createServiceClient())
    return Response.json(await repository.update(scheduleId, input))
  } catch (error) {
    const authorization = authorizationFailure(error)
    if (authorization) return authorization
    if (error instanceof ExamScheduleNotFoundError) {
      return Response.json({ error: 'exam schedule not found' }, { status: 404 })
    }
    if (error instanceof ExamScheduleDuplicateError) {
      return Response.json({ error: error.message }, { status: 409 })
    }
    if (error instanceof Error && error.message === 'scheduleId must be a UUID') {
      return Response.json({ error: error.message }, { status: 400 })
    }
    return Response.json({ error: 'unable to update the exam schedule' }, { status: 500 })
  }
}

export async function DELETE(_request: Request, context: Context) {
  try {
    const scheduleId = await scheduleIdFrom(context)
    await requireAuthenticatedMaster()
    const repository = createExamScheduleRepository(createServiceClient())
    await repository.delete(scheduleId)
    return new Response(null, { status: 204 })
  } catch (error) {
    const authorization = authorizationFailure(error)
    if (authorization) return authorization
    if (error instanceof ExamScheduleNotFoundError) {
      return Response.json({ error: 'exam schedule not found' }, { status: 404 })
    }
    if (error instanceof Error && error.message === 'scheduleId must be a UUID') {
      return Response.json({ error: error.message }, { status: 400 })
    }
    return Response.json({ error: 'unable to delete the exam schedule' }, { status: 500 })
  }
}
