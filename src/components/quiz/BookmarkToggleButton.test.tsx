import { cleanup, render, screen, waitFor } from '@testing-library/react'
import userEvent from '@testing-library/user-event'
import { afterEach, describe, expect, it, vi } from 'vitest'

const { push } = vi.hoisted(() => ({ push: vi.fn() }))
vi.mock('next/navigation', () => ({ useRouter: () => ({ push }) }))

import BookmarkToggleButton from './BookmarkToggleButton'

describe('BookmarkToggleButton', () => {
  afterEach(() => {
    cleanup()
    vi.unstubAllGlobals()
    push.mockClear()
  })

  it('sends the user to login instead of calling the API when signed out', async () => {
    const fetchMock = vi.fn()
    vi.stubGlobal('fetch', fetchMock)
    const user = userEvent.setup()
    render(<BookmarkToggleButton questionId="q1" initiallyBookmarked={false} isLoggedIn={false} loginRedirectPath="/exam/jeongchogi/questions/written/2021/1" />)

    await user.click(screen.getByRole('button', { name: '즐겨찾기' }))

    expect(push).toHaveBeenCalledWith('/login?next=%2Fexam%2Fjeongchogi%2Fquestions%2Fwritten%2F2021%2F1')
    expect(fetchMock).not.toHaveBeenCalled()
  })

  it('optimistically bookmarks a question and calls the API', async () => {
    const fetchMock = vi.fn().mockResolvedValue({ ok: true })
    vi.stubGlobal('fetch', fetchMock)
    const user = userEvent.setup()
    render(<BookmarkToggleButton questionId="q1" initiallyBookmarked={false} isLoggedIn loginRedirectPath="/x" />)

    await user.click(screen.getByRole('button', { name: '즐겨찾기' }))

    expect(await screen.findByRole('button', { name: '즐겨찾기됨' })).toBeInTheDocument()
    expect(fetchMock).toHaveBeenCalledWith('/api/bookmarks/questions/q1', { method: 'POST' })
  })

  it('removes an existing bookmark', async () => {
    const fetchMock = vi.fn().mockResolvedValue({ ok: true })
    vi.stubGlobal('fetch', fetchMock)
    const user = userEvent.setup()
    render(<BookmarkToggleButton questionId="q1" initiallyBookmarked isLoggedIn loginRedirectPath="/x" />)

    await user.click(screen.getByRole('button', { name: '즐겨찾기됨' }))

    expect(await screen.findByRole('button', { name: '즐겨찾기' })).toBeInTheDocument()
    expect(fetchMock).toHaveBeenCalledWith('/api/bookmarks/questions/q1', { method: 'DELETE' })
  })

  it('reverts the optimistic update when the request fails', async () => {
    const fetchMock = vi.fn().mockResolvedValue({ ok: false })
    vi.stubGlobal('fetch', fetchMock)
    const user = userEvent.setup()
    render(<BookmarkToggleButton questionId="q1" initiallyBookmarked={false} isLoggedIn loginRedirectPath="/x" />)

    await user.click(screen.getByRole('button', { name: '즐겨찾기' }))

    await waitFor(() => expect(screen.getByRole('button', { name: '즐겨찾기' })).toBeInTheDocument())
  })
})
