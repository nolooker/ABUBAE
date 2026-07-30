import { cleanup, render, screen, waitFor } from '@testing-library/react'
import userEvent from '@testing-library/user-event'
import { afterEach, describe, expect, it, vi } from 'vitest'

const push = vi.fn()
const refresh = vi.fn()

vi.mock('next/navigation', () => ({
  useRouter: () => ({ push, refresh }),
}))

import BoardPostDeleteButton from './BoardPostDeleteButton'

const postId = 'd7d68087-a5a8-4b6e-a0aa-550a4f5937a1'

describe('BoardPostDeleteButton', () => {
  afterEach(() => {
    cleanup()
    push.mockReset()
    refresh.mockReset()
    vi.unstubAllGlobals()
    vi.restoreAllMocks()
  })

  it('shows the given label and confirm message, then deletes and redirects', async () => {
    vi.spyOn(window, 'confirm').mockReturnValue(true)
    const fetchMock = vi.fn().mockResolvedValue({ ok: true, status: 204 })
    vi.stubGlobal('fetch', fetchMock)
    const user = userEvent.setup()
    render(<BoardPostDeleteButton postId={postId} label="삭제" confirmMessage="정말 삭제할까요?" />)

    await user.click(screen.getByRole('button', { name: '삭제' }))

    expect(window.confirm).toHaveBeenCalledWith('정말 삭제할까요?')
    expect(fetchMock).toHaveBeenCalledWith(`/api/board/posts/${postId}`, { method: 'DELETE' })
    await waitFor(() => expect(push).toHaveBeenCalledWith('/board'))
  })

  it('does not delete when the confirmation is dismissed', async () => {
    vi.spyOn(window, 'confirm').mockReturnValue(false)
    const fetchMock = vi.fn()
    vi.stubGlobal('fetch', fetchMock)
    const user = userEvent.setup()
    render(<BoardPostDeleteButton postId={postId} label="삭제" confirmMessage="정말 삭제할까요?" />)

    await user.click(screen.getByRole('button', { name: '삭제' }))

    expect(fetchMock).not.toHaveBeenCalled()
    expect(push).not.toHaveBeenCalled()
  })

  it('shows a safe error when deletion fails', async () => {
    vi.spyOn(window, 'confirm').mockReturnValue(true)
    vi.stubGlobal('fetch', vi.fn().mockResolvedValue({ ok: false, status: 500 }))
    const user = userEvent.setup()
    render(<BoardPostDeleteButton postId={postId} label="삭제" confirmMessage="정말 삭제할까요?" />)

    await user.click(screen.getByRole('button', { name: '삭제' }))

    expect(await screen.findByRole('alert')).toHaveTextContent('삭제하지 못했습니다.')
    expect(push).not.toHaveBeenCalled()
  })
})
