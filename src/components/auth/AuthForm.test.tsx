import { fireEvent, render, waitFor } from '@testing-library/react'
import { beforeEach, describe, expect, it, vi } from 'vitest'

import AuthForm from './AuthForm'

const push = vi.fn()
const refresh = vi.fn()
const signInWithPassword = vi.fn()

vi.mock('next/navigation', () => ({
  useRouter: () => ({ push, refresh }),
}))

vi.mock('@/lib/supabase/client', () => ({
  createClient: () => ({
    auth: { signInWithPassword },
  }),
}))

describe('AuthForm', () => {
  beforeEach(() => {
    push.mockReset()
    refresh.mockReset()
    signInWithPassword.mockReset().mockResolvedValue({ error: null })
  })

  async function signIn(nextPath?: string) {
    const { container } = render(<AuthForm mode="login" nextPath={nextPath} />)
    const email = container.querySelector('input[type="email"]') as HTMLInputElement
    const password = container.querySelector('input[type="password"]') as HTMLInputElement

    fireEvent.change(email, { target: { value: 'master@example.com' } })
    fireEvent.change(password, { target: { value: 'password' } })
    fireEvent.submit(container.querySelector('form')!)

    await waitFor(() => expect(push).toHaveBeenCalledTimes(1))
  }

  it('returns to a safe internal next path after login', async () => {
    await signIn('/admin?tab=questions')

    expect(push).toHaveBeenCalledWith('/admin?tab=questions')
    expect(refresh).toHaveBeenCalledTimes(1)
  })

  it.each([
    'https://attacker.example',
    '//attacker.example',
    '\\attacker.example',
    '/%2F%2Fattacker.example',
    'javascript:alert(1)',
  ])(
    'falls back to my page for an unsafe next path: %s',
    async (nextPath) => {
      await signIn(nextPath)

      expect(push).toHaveBeenCalledWith('/mypage')
    },
  )
})
