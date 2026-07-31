import { beforeEach, describe, expect, it, vi } from 'vitest'
import { NextRequest } from 'next/server'

const { createClient, exchangeCodeForSession } = vi.hoisted(() => ({
  createClient: vi.fn(),
  exchangeCodeForSession: vi.fn(),
}))

vi.mock('@/lib/supabase/server', () => ({ createClient }))

import { GET } from './route'

function request(query: string) {
  return new NextRequest(`http://localhost/auth/callback${query}`)
}

describe('GET /auth/callback', () => {
  beforeEach(() => {
    createClient.mockReset().mockResolvedValue({ auth: { exchangeCodeForSession } })
    exchangeCodeForSession.mockReset().mockResolvedValue({ error: null })
  })

  it('exchanges the code and redirects to the next path', async () => {
    const response = await GET(request('?code=abc123&next=/admin?tab=questions'))

    expect(exchangeCodeForSession).toHaveBeenCalledWith('abc123')
    expect(response.status).toBe(307)
    expect(response.headers.get('location')).toBe('http://localhost/admin?tab=questions')
  })

  it('falls back to my page when next is missing', async () => {
    const response = await GET(request('?code=abc123'))

    expect(response.headers.get('location')).toBe('http://localhost/mypage')
  })

  it.each([
    'https://attacker.example',
    '//attacker.example',
    '\\attacker.example',
  ])('falls back to my page for an unsafe next path: %s', async (next) => {
    const response = await GET(request(`?code=abc123&next=${encodeURIComponent(next)}`))

    expect(response.headers.get('location')).toBe('http://localhost/mypage')
  })

  it('redirects to login with an error when the code exchange fails', async () => {
    exchangeCodeForSession.mockResolvedValue({ error: { message: 'invalid code' } })

    const response = await GET(request('?code=abc123'))

    expect(response.headers.get('location')).toBe('http://localhost/login?error=oauth')
  })

  it('redirects to login with an error when no code is present', async () => {
    const response = await GET(request(''))

    expect(response.headers.get('location')).toBe('http://localhost/login?error=oauth')
    expect(exchangeCodeForSession).not.toHaveBeenCalled()
  })
})
