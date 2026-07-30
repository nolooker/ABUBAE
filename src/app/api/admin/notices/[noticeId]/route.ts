import { MasterAuthorizationError, requireMaster, type MasterAuthClient } from '@/lib/master-auth'
import { validateNoticeId, validateNoticeInput } from '@/lib/notice'
import {
  NoticeDuplicateSlugError,
  NoticeNotFoundError,
  NoticeStaleUpdateError,
  createNoticeRepository,
} from '@/lib/notice-repository'
import { createClient } from '@/lib/supabase/server'
import { createServiceClient } from '@/lib/supabase/service'

type Context = {
  params: Promise<{ noticeId: string }>
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

async function noticeIdFrom(context: Context): Promise<string> {
  return validateNoticeId((await context.params).noticeId)
}

export async function GET(_request: Request, context: Context) {
  try {
    const noticeId = await noticeIdFrom(context)
    await requireAuthenticatedMaster()
    const repository = createNoticeRepository(createServiceClient())
    const notice = await repository.getAdminNotice(noticeId)
    if (!notice) return Response.json({ error: 'notice not found' }, { status: 404 })
    return Response.json(notice)
  } catch (error) {
    const authorization = authorizationFailure(error)
    if (authorization) return authorization
    if (error instanceof Error && error.message === 'noticeId must be a UUID') {
      return Response.json({ error: error.message }, { status: 400 })
    }
    return Response.json({ error: 'unable to manage notices' }, { status: 500 })
  }
}

export async function PATCH(request: Request, context: Context) {
  try {
    const noticeId = await noticeIdFrom(context)
    await requireAuthenticatedMaster()
    let body: unknown
    try {
      body = await request.json()
    } catch {
      return Response.json({ error: 'request body must be valid JSON' }, { status: 400 })
    }

    let input
    try {
      input = validateNoticeInput(body, { expectedUpdatedAt: true })
    } catch (error) {
      const message = error instanceof Error ? error.message : 'invalid notice input'
      return Response.json({ error: message }, { status: 400 })
    }

    const { expectedUpdatedAt, ...notice } = input
    const repository = createNoticeRepository(createServiceClient())
    return Response.json(await repository.updateNotice(noticeId, notice, expectedUpdatedAt))
  } catch (error) {
    const authorization = authorizationFailure(error)
    if (authorization) return authorization
    if (error instanceof NoticeNotFoundError) {
      return Response.json({ error: 'notice not found' }, { status: 404 })
    }
    if (error instanceof NoticeStaleUpdateError) {
      return Response.json({ error: 'notice was updated by another request' }, { status: 409 })
    }
    if (error instanceof NoticeDuplicateSlugError) {
      return Response.json({ error: 'notice slug already exists' }, { status: 409 })
    }
    if (error instanceof Error && error.message === 'noticeId must be a UUID') {
      return Response.json({ error: error.message }, { status: 400 })
    }
    return Response.json({ error: 'unable to manage notices' }, { status: 500 })
  }
}

export async function DELETE(_request: Request, context: Context) {
  try {
    const noticeId = await noticeIdFrom(context)
    await requireAuthenticatedMaster()
    const repository = createNoticeRepository(createServiceClient())
    await repository.deleteNotice(noticeId)
    return new Response(null, { status: 204 })
  } catch (error) {
    const authorization = authorizationFailure(error)
    if (authorization) return authorization
    if (error instanceof NoticeNotFoundError) {
      return Response.json({ error: 'notice not found' }, { status: 404 })
    }
    if (error instanceof Error && error.message === 'noticeId must be a UUID') {
      return Response.json({ error: error.message }, { status: 400 })
    }
    return Response.json({ error: 'unable to manage notices' }, { status: 500 })
  }
}
