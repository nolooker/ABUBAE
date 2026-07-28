import { beforeEach, describe, expect, it, vi } from 'vitest'

const mocks = vi.hoisted(() => ({
  createClient: vi.fn(),
  signInWithPassword: vi.fn(),
}))

vi.mock('@/lib/supabase/server', () => ({ createClient: mocks.createClient }))

import { POST } from './route'

function request(body: unknown) {
  return new Request('http://localhost/api/auth/login', {
    method: 'POST',
    headers: { 'content-type': 'application/json' },
    body: JSON.stringify(body),
  })
}

describe('POST /api/auth/login', () => {
  beforeEach(() => {
    mocks.createClient.mockReset().mockResolvedValue({
      auth: { signInWithPassword: mocks.signInWithPassword },
    })
    mocks.signInWithPassword.mockReset().mockResolvedValue({ error: null })
  })

  it('signs in through the writable server client before returning success', async () => {
    const response = await POST(request({ email: 'master@example.com', password: 'password' }))

    expect(response.status).toBe(200)
    await expect(response.json()).resolves.toEqual({ ok: true })
    expect(mocks.signInWithPassword).toHaveBeenCalledWith({
      email: 'master@example.com',
      password: 'password',
    })
  })

  it('rejects malformed JSON and invalid login payloads before sign-in', async () => {
    const malformed = await POST(new Request('http://localhost/api/auth/login', {
      method: 'POST',
      headers: { 'content-type': 'application/json' },
      body: '{',
    }))
    const invalid = await POST(request({ email: 'master@example.com', password: 123 }))
    const unexpectedProperty = await POST(request({
      email: 'master@example.com',
      password: 'password',
      role: 'master',
    }))

    expect(malformed.status).toBe(400)
    expect(invalid.status).toBe(400)
    expect(unexpectedProperty.status).toBe(400)
    expect(mocks.signInWithPassword).not.toHaveBeenCalled()
  })

  it('maps invalid credentials and redacts unexpected server errors', async () => {
    mocks.signInWithPassword
      .mockResolvedValueOnce({ error: new Error('Invalid login credentials') })
      .mockRejectedValueOnce(new Error('database password=secret'))

    const invalidCredentials = await POST(request({ email: 'master@example.com', password: 'wrong-password' }))
    const unexpected = await POST(request({ email: 'master@example.com', password: 'password' }))

    expect(invalidCredentials.status).toBe(401)
    await expect(invalidCredentials.json()).resolves.toEqual({ error: 'Invalid email or password' })
    expect(unexpected.status).toBe(500)
    await expect(unexpected.json()).resolves.toEqual({ error: 'Unable to sign in. Please try again.' })
  })
})
