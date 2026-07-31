import { cleanup, fireEvent, render, screen, waitFor } from '@testing-library/react'
import { afterEach, beforeEach, describe, expect, it, vi } from 'vitest'

import AuthForm from './AuthForm'

const push = vi.fn()
const refresh = vi.fn()
const signInWithPassword = vi.fn()
const signUp = vi.fn()
const signInWithOAuth = vi.fn()

vi.mock('next/navigation', () => ({
  useRouter: () => ({ push, refresh }),
}))

vi.mock('@/lib/supabase/client', () => ({
  createClient: () => ({
    auth: { signInWithPassword, signUp, signInWithOAuth },
  }),
}))

describe('AuthForm', () => {
  afterEach(() => {
    cleanup()
    vi.unstubAllGlobals()
  })

  beforeEach(() => {
    push.mockReset()
    refresh.mockReset()
    signInWithPassword.mockReset().mockResolvedValue({ error: null })
    signUp.mockReset().mockResolvedValue({ error: null })
    signInWithOAuth.mockReset().mockResolvedValue({ error: null })
    vi.stubGlobal('fetch', vi.fn().mockResolvedValue({
      ok: true,
      json: async () => ({ ok: true }),
    }))
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

  it('returns to a safe internal next path after the server establishes the session', async () => {
    await signIn('/admin?tab=questions')

    expect(push).toHaveBeenCalledWith('/admin?tab=questions')
    expect(refresh).toHaveBeenCalledTimes(1)
    expect(fetch).toHaveBeenCalledWith('/api/auth/login', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ email: 'master@example.com', password: 'password' }),
    })
    expect(signInWithPassword).not.toHaveBeenCalled()
  })

  it.each([
    'https://attacker.example',
    '//attacker.example',
    '\\attacker.example',
    '/%2F%2Fattacker.example',
    '/\n//attacker.example',
    '/\r//attacker.example',
    '/\t//attacker.example',
    '/%0A//attacker.example',
    '/%0D//attacker.example',
    '/%09//attacker.example',
    'javascript:alert(1)',
  ])(
    'falls back to my page for an unsafe next path: %s',
    async (nextPath) => {
      await signIn(nextPath)

      expect(push).toHaveBeenCalledWith('/mypage')
    },
  )

  it('displays the server credential error without navigating', async () => {
    vi.stubGlobal('fetch', vi.fn().mockResolvedValue({
      ok: false,
      json: async () => ({ error: 'Invalid email or password' }),
    }))
    const { container } = render(<AuthForm mode="login" />)
    const email = container.querySelector('input[type="email"]') as HTMLInputElement
    const password = container.querySelector('input[type="password"]') as HTMLInputElement

    fireEvent.change(email, { target: { value: 'master@example.com' } })
    fireEvent.change(password, { target: { value: 'wrong-password' } })
    fireEvent.submit(container.querySelector('form')!)

    expect(await screen.findByText('Invalid email or password')).toBeInTheDocument()
    expect(push).not.toHaveBeenCalled()
    expect(signInWithPassword).not.toHaveBeenCalled()
  })

  it('redacts unexpected login errors', async () => {
    vi.stubGlobal('fetch', vi.fn().mockRejectedValue(new Error('network password=secret')))
    const { container } = render(<AuthForm mode="login" />)
    const email = container.querySelector('input[type="email"]') as HTMLInputElement
    const password = container.querySelector('input[type="password"]') as HTMLInputElement

    fireEvent.change(email, { target: { value: 'master@example.com' } })
    fireEvent.change(password, { target: { value: 'password' } })
    fireEvent.submit(container.querySelector('form')!)

    expect(await screen.findByText('Unable to sign in. Please try again.')).toBeInTheDocument()
    expect(push).not.toHaveBeenCalled()
  })

  it('does not navigate for a successful response with extra fields', async () => {
    vi.stubGlobal('fetch', vi.fn().mockResolvedValue({
      ok: true,
      json: async () => ({ ok: true, role: 'master' }),
    }))
    const { container } = render(<AuthForm mode="login" />)
    const email = container.querySelector('input[type="email"]') as HTMLInputElement
    const password = container.querySelector('input[type="password"]') as HTMLInputElement

    fireEvent.change(email, { target: { value: 'master@example.com' } })
    fireEvent.change(password, { target: { value: 'password' } })
    fireEvent.submit(container.querySelector('form')!)

    expect(await screen.findByText('Unable to sign in. Please try again.')).toBeInTheDocument()
    expect(push).not.toHaveBeenCalled()
  })

  it('does not navigate for a successful response without JSON', async () => {
    vi.stubGlobal('fetch', vi.fn().mockResolvedValue({
      ok: true,
      json: async () => { throw new Error('invalid JSON') },
    }))
    const { container } = render(<AuthForm mode="login" />)
    const email = container.querySelector('input[type="email"]') as HTMLInputElement
    const password = container.querySelector('input[type="password"]') as HTMLInputElement

    fireEvent.change(email, { target: { value: 'master@example.com' } })
    fireEvent.change(password, { target: { value: 'password' } })
    fireEvent.submit(container.querySelector('form')!)

    expect(await screen.findByText('Unable to sign in. Please try again.')).toBeInTheDocument()
    expect(push).not.toHaveBeenCalled()
  })

  it('keeps sign-up in the browser client flow', async () => {
    const { container } = render(<AuthForm mode="signup" />)
    const email = container.querySelector('input[type="email"]') as HTMLInputElement
    const password = container.querySelector('input[type="password"]') as HTMLInputElement

    fireEvent.change(email, { target: { value: 'new@example.com' } })
    fireEvent.change(password, { target: { value: 'password' } })
    fireEvent.submit(container.querySelector('form')!)

    await waitFor(() => expect(signUp).toHaveBeenCalledWith({
      email: 'new@example.com',
      password: 'password',
      options: { data: { nickname: 'new' } },
    }))
    expect(fetch).not.toHaveBeenCalled()
  })
})
