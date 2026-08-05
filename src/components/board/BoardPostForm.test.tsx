import { cleanup, fireEvent, render, screen, waitFor } from '@testing-library/react'
import userEvent from '@testing-library/user-event'
import { afterEach, describe, expect, it, vi } from 'vitest'

const push = vi.fn()
const refresh = vi.fn()

vi.mock('next/navigation', () => ({
  useRouter: () => ({ push, refresh }),
}))

import BoardPostForm from './BoardPostForm'

const postId = 'd7d68087-a5a8-4b6e-a0aa-550a4f5937a1'

describe('BoardPostForm', () => {
  afterEach(() => {
    cleanup()
    push.mockReset()
    refresh.mockReset()
    vi.unstubAllGlobals()
    vi.restoreAllMocks()
  })

  it('posts the exact create DTO and redirects to the new post', async () => {
    const fetchMock = vi.fn().mockResolvedValue({ ok: true, status: 201, json: async () => ({ id: postId }) })
    vi.stubGlobal('fetch', fetchMock)
    const user = userEvent.setup()
    render(<BoardPostForm mode="create" />)

    await user.type(screen.getByLabelText('제목'), '제목입니다')
    await user.type(screen.getByLabelText('내용'), '내용입니다')
    await user.click(screen.getByRole('button', { name: '글 등록' }))

    expect(fetchMock).toHaveBeenCalledWith('/api/board/posts', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ title: '제목입니다', content: '내용입니다', category: 'free' }),
    })
    await waitFor(() => expect(push).toHaveBeenCalledWith(`/board/${postId}`))
  })

  it('submits the review category once selected', async () => {
    const fetchMock = vi.fn().mockResolvedValue({ ok: true, status: 201, json: async () => ({ id: postId }) })
    vi.stubGlobal('fetch', fetchMock)
    const user = userEvent.setup()
    render(<BoardPostForm mode="create" />)

    await user.type(screen.getByLabelText('제목'), '제목입니다')
    await user.type(screen.getByLabelText('내용'), '내용입니다')
    await user.click(screen.getByRole('radio', { name: '후기' }))
    await user.click(screen.getByRole('button', { name: '글 등록' }))

    expect(fetchMock).toHaveBeenCalledWith('/api/board/posts', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ title: '제목입니다', content: '내용입니다', category: 'review' }),
    })
  })

  it('does not render a delete button in create mode', () => {
    render(<BoardPostForm mode="create" />)

    expect(screen.queryByRole('button', { name: '글 삭제' })).not.toBeInTheDocument()
  })

  it('patches the exact edit DTO and redirects back to the post', async () => {
    const fetchMock = vi.fn().mockResolvedValue({ ok: true, status: 200, json: async () => ({ id: postId }) })
    vi.stubGlobal('fetch', fetchMock)
    const user = userEvent.setup()
    render(<BoardPostForm mode="edit" postId={postId} initialDraft={{ title: 'Original', content: 'Original content', category: 'free' }} />)

    await user.clear(screen.getByLabelText('제목'))
    await user.type(screen.getByLabelText('제목'), 'Revised')
    await user.click(screen.getByRole('button', { name: '수정 완료' }))

    expect(fetchMock).toHaveBeenCalledWith(`/api/board/posts/${postId}`, {
      method: 'PATCH',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ title: 'Revised', content: 'Original content', category: 'free' }),
    })
    await waitFor(() => expect(push).toHaveBeenCalledWith(`/board/${postId}`))
  })

  it('uses a synchronous mutex for same-tick submissions', async () => {
    const fetchMock = vi.fn().mockReturnValue(new Promise(() => {}))
    vi.stubGlobal('fetch', fetchMock)
    render(<BoardPostForm mode="create" />)

    const form = screen.getByRole('button', { name: '글 등록' }).closest('form')!
    fireEvent.submit(form)
    fireEvent.submit(form)

    expect(fetchMock).toHaveBeenCalledOnce()
    expect(screen.getByRole('button', { name: '저장 중...' })).toBeDisabled()
  })

  it.each([
    [400, '입력값을 다시 확인해 주세요.'],
    [401, '로그인이 필요합니다.'],
    [500, '저장하지 못했습니다. 다시 시도해 주세요.'],
  ])('announces a safe error for status %s', async (status) => {
    vi.stubGlobal('fetch', vi.fn().mockResolvedValue({ ok: false, status, json: async () => ({ error: 'server-only detail' }) }))
    const user = userEvent.setup()
    render(<BoardPostForm mode="create" />)

    await user.click(screen.getByRole('button', { name: '글 등록' }))

    expect(await screen.findByRole('alert')).toBeInTheDocument()
  })

  it('deletes the post after confirmation and redirects to the list', async () => {
    vi.spyOn(window, 'confirm').mockReturnValue(true)
    const fetchMock = vi.fn().mockResolvedValue({ ok: true, status: 204 })
    vi.stubGlobal('fetch', fetchMock)
    const user = userEvent.setup()
    render(<BoardPostForm mode="edit" postId={postId} initialDraft={{ title: 'Title', content: 'Content', category: 'free' }} />)

    await user.click(screen.getByRole('button', { name: '글 삭제' }))

    expect(fetchMock).toHaveBeenCalledWith(`/api/board/posts/${postId}`, { method: 'DELETE' })
    await waitFor(() => expect(push).toHaveBeenCalledWith('/board'))
  })

  it('does not delete when the confirmation is dismissed', async () => {
    vi.spyOn(window, 'confirm').mockReturnValue(false)
    const fetchMock = vi.fn()
    vi.stubGlobal('fetch', fetchMock)
    const user = userEvent.setup()
    render(<BoardPostForm mode="edit" postId={postId} initialDraft={{ title: 'Title', content: 'Content', category: 'free' }} />)

    await user.click(screen.getByRole('button', { name: '글 삭제' }))

    expect(fetchMock).not.toHaveBeenCalled()
    expect(push).not.toHaveBeenCalled()
  })
})
