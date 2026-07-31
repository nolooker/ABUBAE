import {
  UserAlreadyExistsError,
  UserValidationError,
  validateCreateUserInput,
} from '@/lib/user-admin'
import { createUserRepository } from '@/lib/user-repository'
import { MasterAuthorizationError, requireMaster, type MasterAuthClient } from '@/lib/master-auth'
import { createClient } from '@/lib/supabase/server'
import { createServiceClient } from '@/lib/supabase/service'

async function requireAuthenticatedMaster() {
  const supabase = await createClient() as unknown as MasterAuthClient
  await requireMaster(supabase)
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

    let input
    try {
      input = validateCreateUserInput(body)
    } catch (error) {
      const message = error instanceof Error ? error.message : 'invalid user input'
      return Response.json({ error: message }, { status: 400 })
    }

    const repository = createUserRepository(createServiceClient())
    const user = await repository.createUser(input)
    return Response.json(user, { status: 201 })
  } catch (error) {
    if (error instanceof MasterAuthorizationError) {
      return Response.json(
        { error: error.role === 'anonymous' ? 'authentication required' : 'master access is required' },
        { status: error.role === 'anonymous' ? 401 : 403 },
      )
    }
    if (error instanceof UserValidationError) {
      return Response.json({ error: error.message }, { status: 400 })
    }
    if (error instanceof UserAlreadyExistsError) {
      return Response.json({ error: 'a user with this email already exists' }, { status: 409 })
    }
    return Response.json({ error: 'unable to create the user' }, { status: 500 })
  }
}
