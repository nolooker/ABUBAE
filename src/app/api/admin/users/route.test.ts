import { beforeEach, describe, expect, it, vi } from 'vitest'

const { createClient, createServiceClient, createUserRepository, requireMaster, MasterAuthorizationError, UserAlreadyExistsError } = vi.hoisted(() => {
  class MasterAuthorizationError extends Error {
    constructor(readonly role: 'anonymous' | 'user') {
      super('Master access is required')
    }
  }
  class UserAlreadyExistsError extends Error {}

  return {
    createClient: vi.fn(),
    createServiceClient: vi.fn(),
    createUserRepository: vi.fn(),
    requireMaster: vi.fn(),
    MasterAuthorizationError,
    UserAlreadyExistsError,
  }
})

vi.mock('@/lib/supabase/server', () => ({ createClient }))
vi.mock('@/lib/supabase/service', () => ({ createServiceClient }))
vi.mock('@/lib/master-auth', () => ({ requireMaster, MasterAuthorizationError }))
vi.mock('@/lib/user-repository', () => ({ createUserRepository }))
vi.mock('@/lib/user-admin', async () => {
  const actual = await vi.importActual<typeof import('@/lib/user-admin')>('@/lib/user-admin')
  return { ...actual, UserAlreadyExistsError }
})

import { POST } from './route'

const createdUser = {
  id: 'd7d68087-a5a8-4b6e-a0aa-550a4f5937a1',
  email: 'runner@example.com',
  nickname: '아부배러너',
  membershipType: 'free',
  role: 'user',
  createdAt: '2026-07-31T00:00:00Z',
  suspended: false,
}

function request(body: unknown = {
  email: 'runner@example.com',
  password: 'password123',
  nickname: '아부배러너',
  role: 'user',
}) {
  return new Request('http://localhost/api/admin/users', {
    method: 'POST',
    headers: { 'content-type': 'application/json' },
    body: JSON.stringify(body),
  })
}

describe('POST /api/admin/users', () => {
  beforeEach(() => {
    createClient.mockReset().mockResolvedValue({})
    createServiceClient.mockReset()
    createUserRepository.mockReset()
    requireMaster.mockReset().mockResolvedValue(undefined)
  })

  it('returns 401 for an anonymous request', async () => {
    requireMaster.mockRejectedValue(new MasterAuthorizationError('anonymous'))
    const createUser = vi.fn()
    createUserRepository.mockReturnValue({ createUser })

    const response = await POST(request())

    expect(response.status).toBe(401)
    expect(createUser).not.toHaveBeenCalled()
  })

  it('returns 403 for a signed-in non-master', async () => {
    requireMaster.mockRejectedValue(new MasterAuthorizationError('user'))
    const createUser = vi.fn()
    createUserRepository.mockReturnValue({ createUser })

    const response = await POST(request())

    expect(response.status).toBe(403)
    expect(createUser).not.toHaveBeenCalled()
  })

  it('creates a user for a master and returns 201 with the created profile', async () => {
    const createUser = vi.fn().mockResolvedValue(createdUser)
    createUserRepository.mockReturnValue({ createUser })

    const response = await POST(request())

    expect(response.status).toBe(201)
    await expect(response.json()).resolves.toEqual(createdUser)
    expect(createUser).toHaveBeenCalledWith({
      email: 'runner@example.com',
      password: 'password123',
      nickname: '아부배러너',
      role: 'user',
    })
  })

  it('returns 400 for malformed JSON and invalid payloads', async () => {
    const createUser = vi.fn()
    createUserRepository.mockReturnValue({ createUser })

    const malformed = await POST(new Request('http://localhost/api/admin/users', { method: 'POST', body: '{' }))
    const invalid = await POST(request({ email: 'runner@example.com', password: '123', nickname: null, role: 'user' }))

    expect(malformed.status).toBe(400)
    expect(invalid.status).toBe(400)
    expect(createUser).not.toHaveBeenCalled()
  })

  it('returns 409 for a duplicate email', async () => {
    createUserRepository.mockReturnValue({ createUser: vi.fn().mockRejectedValue(new UserAlreadyExistsError()) })

    const response = await POST(request())

    expect(response.status).toBe(409)
  })

  it('returns a redacted 500 for unexpected failures', async () => {
    createUserRepository.mockReturnValue({ createUser: vi.fn().mockRejectedValue(new Error('connection password=secret')) })

    const response = await POST(request())

    expect(response.status).toBe(500)
    await expect(response.json()).resolves.toEqual({ error: 'unable to create the user' })
  })
})
