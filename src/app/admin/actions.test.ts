import { beforeEach, describe, expect, it, vi } from 'vitest'

import { logout } from './actions'

const { signOut, redirect } = vi.hoisted(() => ({
  signOut: vi.fn(),
  redirect: vi.fn(),
}))

vi.mock('next/navigation', () => ({ redirect }))
vi.mock('@/lib/supabase/server', () => ({
  createClient: vi.fn().mockResolvedValue({ auth: { signOut } }),
}))

describe('logout', () => {
  beforeEach(() => {
    signOut.mockReset()
    redirect.mockReset()
  })

  it('ends the Supabase session and returns to login', async () => {
    signOut.mockResolvedValue({ error: null })

    await logout()

    expect(signOut).toHaveBeenCalledOnce()
    expect(redirect).toHaveBeenCalledWith('/login')
  })

  it('does not redirect when ending the Supabase session fails', async () => {
    const error = new Error('sign out failed')
    signOut.mockResolvedValue({ error })

    await expect(logout()).rejects.toThrow(error)

    expect(redirect).not.toHaveBeenCalled()
  })
})
