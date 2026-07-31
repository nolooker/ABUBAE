import type { SupabaseClient } from '@supabase/supabase-js'

import {
  UserAdminError,
  UserAlreadyExistsError,
  UserNotFoundError,
  type AdminUserSummary,
  type CreateUserInput,
  type MembershipType,
} from './user-admin'

type RecordValue = Record<string, unknown>

function isRecord(value: unknown): value is RecordValue {
  return typeof value === 'object' && value !== null && !Array.isArray(value)
}

function recordValue(value: unknown): RecordValue {
  if (!isRecord(value)) throw new UserAdminError()
  return value
}

function stringValue(value: unknown): string {
  if (typeof value !== 'string') throw new UserAdminError()
  return value
}

function nullableStringValue(value: unknown): string | null {
  if (value === null || value === undefined) return null
  return stringValue(value)
}

function membershipTypeValue(value: unknown): MembershipType {
  if (value !== 'free' && value !== 'standard' && value !== 'premium') throw new UserAdminError()
  return value
}

function roleValue(value: unknown): 'user' | 'master' {
  return value === 'master' ? 'master' : 'user'
}

function rows(value: unknown): RecordValue[] {
  if (value === null || value === undefined) return []
  if (!Array.isArray(value) || !value.every(isRecord)) throw new UserAdminError()
  return value
}

const profileFields = 'id,email,nickname,membership_type,role,created_at'

function isCurrentlyBanned(user: { banned_until?: string | null }): boolean {
  if (!user.banned_until) return false
  const bannedUntil = Date.parse(user.banned_until)
  return Number.isFinite(bannedUntil) && bannedUntil > Date.now()
}

export function createUserRepository(supabase: SupabaseClient) {
  return {
    async listUsers(query?: string): Promise<AdminUserSummary[]> {
      const { data: profileRows, error: profileError } = await supabase
        .from('users')
        .select(profileFields)
        .order('created_at', { ascending: false })
      if (profileError) throw new UserAdminError(profileError.message)

      const { data: authData, error: authError } = await supabase.auth.admin.listUsers({ perPage: 1000 })
      if (authError) throw new UserAdminError(authError.message)

      const bannedIds = new Set(
        authData.users.filter(isCurrentlyBanned).map((authUser) => authUser.id),
      )

      const summaries = rows(profileRows).map((row) => {
        const id = stringValue(row.id)
        return {
          id,
          email: stringValue(row.email),
          nickname: nullableStringValue(row.nickname),
          membershipType: membershipTypeValue(row.membership_type),
          role: roleValue(row.role),
          createdAt: stringValue(row.created_at),
          suspended: bannedIds.has(id),
        }
      })

      if (!query?.trim()) return summaries

      const normalizedQuery = query.trim().toLowerCase()
      return summaries.filter((summary) => (
        summary.email.toLowerCase().includes(normalizedQuery)
        || (summary.nickname ?? '').toLowerCase().includes(normalizedQuery)
      ))
    },

    async updateMembership(userId: string, membershipType: MembershipType): Promise<void> {
      const { data, error } = await supabase
        .from('users')
        .update({ membership_type: membershipType })
        .eq('id', userId)
        .select('id')
        .maybeSingle()
      if (error) throw new UserAdminError(error.message)
      if (data === null) throw new UserNotFoundError()
    },

    async setSuspended(userId: string, suspended: boolean): Promise<void> {
      const { data, error } = await supabase.auth.admin.updateUserById(userId, {
        ban_duration: suspended ? '876000h' : 'none',
      })
      if (error) throw new UserAdminError(error.message)
      if (!data.user) throw new UserNotFoundError()
    },

    async createUser(input: CreateUserInput): Promise<AdminUserSummary> {
      const { data, error } = await supabase.auth.admin.createUser({
        email: input.email,
        password: input.password,
        email_confirm: true,
        user_metadata: input.nickname ? { nickname: input.nickname } : undefined,
      })
      if (error) {
        if (error.code === 'email_exists') throw new UserAlreadyExistsError()
        throw new UserAdminError(error.message)
      }

      const userId = data.user.id

      if (input.role === 'master') {
        const { error: roleError } = await supabase.from('users').update({ role: 'master' }).eq('id', userId)
        if (roleError) throw new UserAdminError(roleError.message)
      }

      const { data: profile, error: profileError } = await supabase
        .from('users')
        .select(profileFields)
        .eq('id', userId)
        .single()
      if (profileError) throw new UserAdminError(profileError.message)

      const row = recordValue(profile)
      return {
        id: userId,
        email: stringValue(row.email),
        nickname: nullableStringValue(row.nickname),
        membershipType: membershipTypeValue(row.membership_type),
        role: roleValue(row.role),
        createdAt: stringValue(row.created_at),
        suspended: false,
      }
    },
  }
}
