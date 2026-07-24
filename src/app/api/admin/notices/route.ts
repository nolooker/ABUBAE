import { MasterAuthorizationError, requireMaster, type MasterAuthClient } from '@/lib/master-auth'
import { validateNoticeInput } from '@/lib/notice'
import { NoticeConflictError, createNoticeRepository } from '@/lib/notice-repository'
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

async function requestBody(request: Request): Promise<unknown> {
  try {
    return await request.json()
  } catch {
    throw new Error('invalid JSON')
  }
}

export async function GET() {
  try {
    await requireAuthenticatedMaster()
    const repository = createNoticeRepository(createServiceClient())
    return Response.json(await repository.listAdminNotices())
  } catch (error) {
    return authorizationFailure(error)
      ?? Response.json({ error: 'unable to manage notices' }, { status: 500 })
  }
}

export async function POST(request: Request) {
  try {
    await requireAuthenticatedMaster()
    let body: unknown
    try {
      body = await requestBody(request)
    } catch {
      return Response.json({ error: 'request body must be valid JSON' }, { status: 400 })
    }

    let input
    try {
      input = validateNoticeInput(body)
    } catch (error) {
      const message = error instanceof Error ? error.message : 'invalid notice input'
      return Response.json({ error: message }, { status: 400 })
    }

    const repository = createNoticeRepository(createServiceClient())
    return Response.json(await repository.createNotice(input), { status: 201 })
  } catch (error) {
    const authorization = authorizationFailure(error)
    if (authorization) return authorization
    if (error instanceof NoticeConflictError) {
      return Response.json({ error: 'notice slug already exists' }, { status: 409 })
    }
    return Response.json({ error: 'unable to manage notices' }, { status: 500 })
  }
}
