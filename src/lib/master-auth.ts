import 'server-only'

import type { SupabaseClient } from '@supabase/supabase-js'
import { createClient } from '@/lib/supabase/server'

export type UserRole = 'anonymous' | 'user' | 'master'

export type MasterAuthClient = {
  auth: Pick<SupabaseClient['auth'], 'getUser'>
  from: SupabaseClient['from']
}

export class MasterAuthorizationError extends Error {
  readonly name = 'MasterAuthorizationError'

  constructor(readonly role: Exclude<UserRole, 'master'>) {
    super('Master access is required')
  }
}

export async function getCurrentUserRole(
  client?: MasterAuthClient,
): Promise<UserRole> {
  const supabase = client ?? await createClient()
  const {
    data: { user },
  } = await supabase.auth.getUser()

  if (!user) return 'anonymous'

  const { data } = await supabase.from('users').select('role').eq('id', user.id).single()

  return data?.role === 'master' ? 'master' : 'user'
}

export async function requireMaster(client?: MasterAuthClient): Promise<void> {
  const role = await getCurrentUserRole(client)

  if (role !== 'master') throw new MasterAuthorizationError(role)
}
