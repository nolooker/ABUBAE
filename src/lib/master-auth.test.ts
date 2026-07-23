import { describe, expect, it, vi } from 'vitest'

vi.mock('server-only', () => ({}))

import {
  getCurrentUserRole,
  MasterAuthorizationError,
  requireMaster,
} from './master-auth'

function makeSupabase(user: { id: string } | null, role: string | null) {
  return {
    auth: { getUser: vi.fn().mockResolvedValue({ data: { user } }) },
    from: vi.fn().mockReturnValue({
      select: vi.fn().mockReturnValue({
        eq: vi.fn().mockReturnValue({
          single: vi.fn().mockResolvedValue({ data: role ? { role } : null }),
        }),
      }),
    }),
  }
}

describe('getCurrentUserRole', () => {
  it.each([
    [null, null, 'anonymous'],
    [{ id: 'u1' }, 'user', 'user'],
    [{ id: 'u1' }, 'master', 'master'],
    [{ id: 'u1' }, 'admin', 'user'],
  ] as const)('returns the server-managed role', async (user, dbRole, expected) => {
    expect(await getCurrentUserRole(makeSupabase(user, dbRole))).toBe(expected)
  })

  it('does not treat user metadata as a role', async () => {
    const client = makeSupabase({ id: 'u1', user_metadata: { role: 'master' } } as { id: string }, 'user')

    expect(await getCurrentUserRole(client)).toBe('user')
  })
})

describe('requireMaster', () => {
  it('permits a master user', async () => {
    await expect(requireMaster(makeSupabase({ id: 'u1' }, 'master'))).resolves.toBeUndefined()
  })

  it.each([
    [null, null, 'anonymous'],
    [{ id: 'u1' }, 'user', 'user'],
  ] as const)('throws a mappable authorization error for %s', async (user, dbRole, role) => {
    await expect(requireMaster(makeSupabase(user, dbRole))).rejects.toMatchObject({
      name: MasterAuthorizationError.name,
      role,
    })
  })
})
