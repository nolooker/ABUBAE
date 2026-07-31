import { cleanup, fireEvent, render, screen } from '@testing-library/react'
import { afterEach, beforeEach, describe, expect, it, vi } from 'vitest'

import SocialLoginButtons from './SocialLoginButtons'

const signInWithOAuth = vi.fn()

vi.mock('@/lib/supabase/client', () => ({
  createClient: () => ({
    auth: { signInWithOAuth },
  }),
}))

describe('SocialLoginButtons', () => {
  afterEach(() => cleanup())

  beforeEach(() => {
    signInWithOAuth.mockReset().mockResolvedValue({ error: null })
  })

  it('starts the Google OAuth flow with the callback redirect and next path', async () => {
    render(<SocialLoginButtons nextPath="/admin?tab=questions" />)

    fireEvent.click(screen.getByRole('button', { name: /구글로 계속하기/ }))

    expect(signInWithOAuth).toHaveBeenCalledWith({
      provider: 'google',
      options: { redirectTo: 'http://localhost:3000/auth/callback?next=%2Fadmin%3Ftab%3Dquestions' },
    })
  })

  it('hides the Kakao button while Kakao login is on hold', () => {
    render(<SocialLoginButtons />)

    expect(screen.queryByRole('button', { name: /카카오로 계속하기/ })).not.toBeInTheDocument()
  })

  it('shows an error and re-enables the buttons when starting OAuth fails', async () => {
    signInWithOAuth.mockResolvedValue({ error: { message: 'provider not configured' } })
    render(<SocialLoginButtons />)

    fireEvent.click(screen.getByRole('button', { name: /구글로 계속하기/ }))

    expect(await screen.findByText('소셜 로그인을 시작하지 못했습니다. 잠시 후 다시 시도해 주세요.')).toBeInTheDocument()
    expect(screen.getByRole('button', { name: /구글로 계속하기/ })).not.toBeDisabled()
  })
})
