import { UserNotFoundError, UserValidationError, validateSuspensionInput, validateUserId } from '@/lib/user-admin'
import { createUserRepository } from '@/lib/user-repository'
import { MasterAuthorizationError, requireMaster, type MasterAuthClient } from '@/lib/master-auth'
import { createClient } from '@/lib/supabase/server'
import { createServiceClient } from '@/lib/supabase/service'

type Context = {
  params: Promise<{ userId: string }>
}

export async function PATCH(request: Request, context: Context) {
  try {
    const userId = validateUserId((await context.params).userId)
    const supabase = await createClient()
    try {
      await requireMaster(supabase as unknown as MasterAuthClient)
    } catch (error) {
      if (error instanceof MasterAuthorizationError) {
        return Response.json(
          { error: error.role === 'anonymous' ? 'authentication required' : 'master access is required' },
          { status: error.role === 'anonymous' ? 401 : 403 },
        )
      }
      throw error
    }

    const { data: { user } } = await supabase.auth.getUser()
    if (user?.id === userId) {
      return Response.json({ error: 'cannot suspend your own account' }, { status: 400 })
    }

    let body: unknown
    try {
      body = await request.json()
    } catch {
      return Response.json({ error: 'request body must be valid JSON' }, { status: 400 })
    }

    let input
    try {
      input = validateSuspensionInput(body)
    } catch (error) {
      const message = error instanceof Error ? error.message : 'invalid suspension input'
      return Response.json({ error: message }, { status: 400 })
    }

    const repository = createUserRepository(createServiceClient())
    await repository.setSuspended(userId, input.suspended)
    return new Response(null, { status: 204 })
  } catch (error) {
    if (error instanceof UserValidationError) {
      return Response.json({ error: error.message }, { status: 400 })
    }
    if (error instanceof UserNotFoundError) {
      return Response.json({ error: 'user not found' }, { status: 404 })
    }
    return Response.json({ error: 'unable to update the user' }, { status: 500 })
  }
}
