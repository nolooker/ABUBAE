import { beforeEach, describe, expect, it, vi } from 'vitest'

const { createClient, createServiceClient, createUserRepository, requireMaster, MasterAuthorizationError, UserNotFoundError, getUser } = vi.hoisted(() => {
  class MasterAuthorizationError extends Error {
    constructor(readonly role: 'anonymous' | 'user') {
      super('Master access is required')
    }
  }
  class UserNotFoundError extends Error {}

  return {
    createClient: vi.fn(),
    createServiceClient: vi.fn(),
    createUserRepository: vi.fn(),
    requireMaster: vi.fn(),
    MasterAuthorizationError,
    UserNotFoundError,
    getUser: vi.fn(),
  }
})

vi.mock('@/lib/supabase/server', () => ({ createClient }))
vi.mock('@/lib/supabase/service', () => ({ createServiceClient }))
vi.mock('@/lib/master-auth', () => ({ requireMaster, MasterAuthorizationError }))
vi.mock('@/lib/user-repository', () => ({ createUserRepository }))
vi.mock('@/lib/user-admin', async () => {
  const actual = await vi.importActual<typeof import('@/lib/user-admin')>('@/lib/user-admin')
  return { ...actual, UserNotFoundError }
})

import { PATCH } from './route'

const userId = 'd7d68087-a5a8-4b6e-a0aa-550a4f5937a1'
const masterId = 'ffffffff-a5a8-4b6e-a0aa-550a4f5937a1'

function context(id = userId) {
  return { params: Promise.resolve({ userId: id }) }
}

function request(body: unknown = { suspended: true }) {
  return new Request(`http://localhost/api/admin/users/${userId}/suspension`, {
    method: 'PATCH',
    headers: { 'content-type': 'application/json' },
    body: JSON.stringify(body),
  })
}

describe('PATCH /api/admin/users/[userId]/suspension', () => {
  beforeEach(() => {
    getUser.mockReset().mockResolvedValue({ data: { user: { id: masterId } } })
    createClient.mockReset().mockResolvedValue({ auth: { getUser } })
    createServiceClient.mockReset()
    createUserRepository.mockReset()
    requireMaster.mockReset().mockResolvedValue(undefined)
  })

  it('returns 400 for a malformed id before authorizing', async () => {
    const response = await PATCH(request(), context('not-a-uuid'))

    expect(response.status).toBe(400)
    expect(requireMaster).not.toHaveBeenCalled()
  })

  it('returns 401 for an anonymous request', async () => {
    requireMaster.mockRejectedValue(new MasterAuthorizationError('anonymous'))
    const setSuspended = vi.fn()
    createUserRepository.mockReturnValue({ setSuspended })

    const response = await PATCH(request(), context())

    expect(response.status).toBe(401)
    expect(setSuspended).not.toHaveBeenCalled()
  })

  it('returns 403 for a signed-in non-master', async () => {
    requireMaster.mockRejectedValue(new MasterAuthorizationError('user'))
    const setSuspended = vi.fn()
    createUserRepository.mockReturnValue({ setSuspended })

    const response = await PATCH(request(), context())

    expect(response.status).toBe(403)
    expect(setSuspended).not.toHaveBeenCalled()
  })

  it('returns 400 when a master tries to suspend their own account', async () => {
    getUser.mockResolvedValue({ data: { user: { id: userId } } })
    const setSuspended = vi.fn()
    createUserRepository.mockReturnValue({ setSuspended })

    const response = await PATCH(request(), context())

    expect(response.status).toBe(400)
    await expect(response.json()).resolves.toEqual({ error: 'cannot suspend your own account' })
    expect(setSuspended).not.toHaveBeenCalled()
  })

  it('returns 400 for malformed JSON and invalid payloads', async () => {
    const setSuspended = vi.fn()
    createUserRepository.mockReturnValue({ setSuspended })

    const malformed = await PATCH(new Request('http://localhost', { method: 'PATCH', body: '{' }), context())
    const invalid = await PATCH(request({ suspended: 'yes' }), context())

    expect(malformed.status).toBe(400)
    expect(invalid.status).toBe(400)
    expect(setSuspended).not.toHaveBeenCalled()
  })

  it('suspends a user', async () => {
    const setSuspended = vi.fn().mockResolvedValue(undefined)
    createUserRepository.mockReturnValue({ setSuspended })

    const response = await PATCH(request({ suspended: true }), context())

    expect(response.status).toBe(204)
    expect(setSuspended).toHaveBeenCalledWith(userId, true)
  })

  it('unsuspends a user', async () => {
    const setSuspended = vi.fn().mockResolvedValue(undefined)
    createUserRepository.mockReturnValue({ setSuspended })

    const response = await PATCH(request({ suspended: false }), context())

    expect(response.status).toBe(204)
    expect(setSuspended).toHaveBeenCalledWith(userId, false)
  })

  it('returns 404 for a missing user', async () => {
    createUserRepository.mockReturnValue({ setSuspended: vi.fn().mockRejectedValue(new UserNotFoundError()) })

    const response = await PATCH(request(), context())

    expect(response.status).toBe(404)
  })

  it('returns a redacted 500 for unexpected failures', async () => {
    createUserRepository.mockReturnValue({ setSuspended: vi.fn().mockRejectedValue(new Error('connection password=secret')) })

    const response = await PATCH(request(), context())

    expect(response.status).toBe(500)
    await expect(response.json()).resolves.toEqual({ error: 'unable to update the user' })
  })
})
