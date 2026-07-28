import { beforeEach, describe, expect, it, vi } from 'vitest'
import { NextRequest } from 'next/server'

const mocks = vi.hoisted(() => ({
  createServerClient: vi.fn(),
  signInWithPassword: vi.fn(),
}))

vi.mock('@supabase/ssr', () => ({ createServerClient: mocks.createServerClient }))

import { POST } from './route'

function request(body: unknown, headers: HeadersInit = {}) {
  return new NextRequest('http://localhost/api/auth/login', {
    method: 'POST',
    headers: {
      'content-type': 'application/json',
      origin: 'http://localhost',
      'sec-fetch-site': 'same-origin',
      ...headers,
    },
    body: JSON.stringify(body),
  })
}

describe('POST /api/auth/login', () => {
  beforeEach(() => {
    mocks.createServerClient.mockReset().mockImplementation((_url, _key, options) => ({
      auth: {
        signInWithPassword: async (credentials: unknown) => {
          const result = await mocks.signInWithPassword(credentials)
          if (!result.error) {
            await options.cookies.setAll([{
              name: 'sb-access-token',
              value: 'session-token',
              options: { httpOnly: true, path: '/', sameSite: 'lax' },
            }])
          }
          return result
        },
      },
    }))
    mocks.signInWithPassword.mockReset().mockResolvedValue({ error: null })
  })

  it('signs in through the writable server client and returns its session cookie', async () => {
    const response = await POST(request({ email: 'master@example.com', password: 'password' }))

    expect(response.status).toBe(200)
    await expect(response.json()).resolves.toEqual({ ok: true })
    expect(response.cookies.get('sb-access-token')).toMatchObject({
      value: 'session-token',
      httpOnly: true,
      path: '/',
      sameSite: 'lax',
    })
    expect(mocks.createServerClient).toHaveBeenCalledOnce()
    expect(mocks.signInWithPassword).toHaveBeenCalledWith({
      email: 'master@example.com',
      password: 'password',
    })
  })

  it('allows same-site JSON requests that omit Origin when Fetch Metadata proves their site', async () => {
    const response = await POST(request(
      { email: 'master@example.com', password: 'password' },
      { origin: '', 'sec-fetch-site': 'same-site' },
    ))

    expect(response.status).toBe(200)
    expect(mocks.signInWithPassword).toHaveBeenCalledOnce()
  })

  it('rejects non-JSON, cross-origin, and cross-site login attempts before Supabase', async () => {
    const nonJson = await POST(request(
      { email: 'master@example.com', password: 'password' },
      { 'content-type': 'text/plain', origin: 'https://attacker.example', 'sec-fetch-site': 'cross-site' },
    ))
    const wrongOrigin = await POST(request(
      { email: 'master@example.com', password: 'password' },
      { origin: 'https://attacker.example' },
    ))
    const crossSiteMetadata = await POST(request(
      { email: 'master@example.com', password: 'password' },
      { 'sec-fetch-site': 'cross-site' },
    ))
    const missingProvenance = await POST(request(
      { email: 'master@example.com', password: 'password' },
      { origin: '', 'sec-fetch-site': '' },
    ))

    expect(nonJson.status).toBe(415)
    expect(wrongOrigin.status).toBe(403)
    expect(crossSiteMetadata.status).toBe(403)
    expect(missingProvenance.status).toBe(403)
    expect(mocks.createServerClient).not.toHaveBeenCalled()
    expect(mocks.signInWithPassword).not.toHaveBeenCalled()
  })

  it('rejects malformed JSON and invalid login payloads before sign-in', async () => {
    const malformed = await POST(new NextRequest('http://localhost/api/auth/login', {
      method: 'POST',
      headers: { 'content-type': 'application/json', origin: 'http://localhost', 'sec-fetch-site': 'same-origin' },
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

  it('classifies realistic resolved Supabase errors without exposing their messages', async () => {
    mocks.signInWithPassword
      .mockResolvedValueOnce({
        error: { name: 'AuthApiError', message: 'Invalid login credentials', status: 400, code: 'invalid_credentials' },
      })
      .mockResolvedValueOnce({
        error: { name: 'AuthApiError', message: 'Request limit exceeded', status: 429, code: 'over_request_rate_limit' },
      })
      .mockResolvedValueOnce({
        error: { name: 'AuthApiError', message: 'Upstream database unavailable', status: 503, code: 'unexpected_failure' },
      })
      .mockResolvedValueOnce({
        error: { name: 'AuthApiError', message: 'An internal validation detail', status: 400, code: 'invalid_request' },
      })
      .mockRejectedValueOnce(new Error('database password=secret'))

    const invalidCredentials = await POST(request({ email: 'master@example.com', password: 'wrong-password' }))
    const rateLimited = await POST(request({ email: 'master@example.com', password: 'password' }))
    const unavailable = await POST(request({ email: 'master@example.com', password: 'password' }))
    const unclassified = await POST(request({ email: 'master@example.com', password: 'password' }))
    const unexpected = await POST(request({ email: 'master@example.com', password: 'password' }))

    expect(invalidCredentials.status).toBe(401)
    await expect(invalidCredentials.json()).resolves.toEqual({ error: 'Invalid email or password' })
    expect(rateLimited.status).toBe(429)
    await expect(rateLimited.json()).resolves.toEqual({ error: 'Too many sign-in attempts. Please try again later.' })
    expect(unavailable.status).toBe(503)
    await expect(unavailable.json()).resolves.toEqual({ error: 'Unable to sign in. Please try again later.' })
    expect(unclassified.status).toBe(500)
    await expect(unclassified.json()).resolves.toEqual({ error: 'Unable to sign in. Please try again later.' })
    expect(unexpected.status).toBe(500)
    await expect(unexpected.json()).resolves.toEqual({ error: 'Unable to sign in. Please try again later.' })
  })
})
