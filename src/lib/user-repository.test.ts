import { describe, expect, it, vi } from 'vitest'

import { UserAdminError, UserNotFoundError } from './user-admin'
import { createUserRepository } from './user-repository'

type Result = { data: unknown; error: { message?: string } | null }

function client(options: {
  profiles?: Result
  authUsers?: { data: { users: unknown[] }; error: { message?: string } | null }
  updateResult?: Result
  banResult?: { data: { user: unknown | null }; error: { message?: string } | null }
} = {}) {
  const calls: Array<[string, unknown[]]> = []
  const profiles = options.profiles ?? { data: [], error: null }
  const updateResult = options.updateResult ?? { data: null, error: null }

  const query = {
    select: vi.fn((...args: unknown[]) => { calls.push(['select', args]); return query }),
    eq: vi.fn((...args: unknown[]) => { calls.push(['eq', args]); return query }),
    order: vi.fn((...args: unknown[]) => { calls.push(['order', args]); return Promise.resolve(profiles) }),
    update: vi.fn((...args: unknown[]) => { calls.push(['update', args]); return query }),
    maybeSingle: vi.fn(() => { calls.push(['maybeSingle', []]); return Promise.resolve(updateResult) }),
  }

  const listUsers = vi.fn().mockResolvedValue(options.authUsers ?? { data: { users: [] }, error: null })
  const updateUserById = vi.fn().mockResolvedValue(options.banResult ?? { data: { user: {} }, error: null })

  return {
    supabase: {
      from: vi.fn(() => query),
      auth: { admin: { listUsers, updateUserById } },
    },
    calls,
    listUsers,
    updateUserById,
  }
}

const profile = {
  id: 'a1111111-a5a8-4b6e-a0aa-550a4f5937a1',
  email: 'runner@example.com',
  nickname: '아부배러너',
  membership_type: 'free',
  role: 'user',
  created_at: '2026-07-24T00:00:00Z',
}

describe('user repository', () => {
  it('lists users merged with their current suspension status', async () => {
    const { supabase } = client({
      profiles: { data: [profile, { ...profile, id: 'b2222222-a5a8-4b6e-a0aa-550a4f5937a1', email: 'other@example.com', nickname: null }], error: null },
      authUsers: {
        data: { users: [{ id: profile.id, banned_until: '2099-01-01T00:00:00Z' }] },
        error: null,
      },
    })

    await expect(createUserRepository(supabase as never).listUsers()).resolves.toEqual([
      {
        id: profile.id,
        email: profile.email,
        nickname: profile.nickname,
        membershipType: 'free',
        role: 'user',
        createdAt: profile.created_at,
        suspended: true,
      },
      {
        id: 'b2222222-a5a8-4b6e-a0aa-550a4f5937a1',
        email: 'other@example.com',
        nickname: null,
        membershipType: 'free',
        role: 'user',
        createdAt: profile.created_at,
        suspended: false,
      },
    ])
  })

  it('treats an expired ban as not currently suspended', async () => {
    const { supabase } = client({
      profiles: { data: [profile], error: null },
      authUsers: { data: { users: [{ id: profile.id, banned_until: '2020-01-01T00:00:00Z' }] }, error: null },
    })

    const [result] = await createUserRepository(supabase as never).listUsers()
    expect(result.suspended).toBe(false)
  })

  it('filters users by a case-insensitive email or nickname match', async () => {
    const other = { ...profile, id: 'b2222222-a5a8-4b6e-a0aa-550a4f5937a1', email: 'other@example.com', nickname: '다른유저' }
    const { supabase } = client({ profiles: { data: [profile, other], error: null } })

    await expect(createUserRepository(supabase as never).listUsers('RUNNER')).resolves.toEqual([
      expect.objectContaining({ id: profile.id }),
    ])
    await expect(createUserRepository(supabase as never).listUsers('다른')).resolves.toEqual([
      expect.objectContaining({ id: other.id }),
    ])
  })

  it('reports a database failure while listing as unavailable', async () => {
    const { supabase } = client({ profiles: { data: null, error: { message: 'connection failed' } } })

    await expect(createUserRepository(supabase as never).listUsers()).rejects.toBeInstanceOf(UserAdminError)
  })

  it('reports an auth admin failure while listing as unavailable', async () => {
    const { supabase } = client({
      profiles: { data: [profile], error: null },
      authUsers: { data: { users: [] }, error: { message: 'admin api unavailable' } },
    })

    await expect(createUserRepository(supabase as never).listUsers()).rejects.toBeInstanceOf(UserAdminError)
  })

  it('updates a membership type and reports a missing user as not found', async () => {
    const found = client({ updateResult: { data: { id: profile.id }, error: null } })
    await expect(createUserRepository(found.supabase as never).updateMembership(profile.id, 'premium')).resolves.toBeUndefined()
    expect(found.calls).toContainEqual(['update', [{ membership_type: 'premium' }]])
    expect(found.calls).toContainEqual(['eq', ['id', profile.id]])

    const missing = client({ updateResult: { data: null, error: null } })
    await expect(createUserRepository(missing.supabase as never).updateMembership(profile.id, 'premium'))
      .rejects.toBeInstanceOf(UserNotFoundError)
  })

  it('suspends and unsuspends a user via the Supabase auth admin API', async () => {
    const { supabase, updateUserById } = client({ banResult: { data: { user: { id: profile.id } }, error: null } })
    const repository = createUserRepository(supabase as never)

    await repository.setSuspended(profile.id, true)
    expect(updateUserById).toHaveBeenCalledWith(profile.id, { ban_duration: '876000h' })

    await repository.setSuspended(profile.id, false)
    expect(updateUserById).toHaveBeenCalledWith(profile.id, { ban_duration: 'none' })
  })

  it('reports a missing user or admin API failure when (un)suspending', async () => {
    const missing = client({ banResult: { data: { user: null }, error: null } })
    await expect(createUserRepository(missing.supabase as never).setSuspended(profile.id, true))
      .rejects.toBeInstanceOf(UserNotFoundError)

    const failed = client({ banResult: { data: { user: null }, error: { message: 'admin api unavailable' } } })
    await expect(createUserRepository(failed.supabase as never).setSuspended(profile.id, true))
      .rejects.toBeInstanceOf(UserAdminError)
  })
})
