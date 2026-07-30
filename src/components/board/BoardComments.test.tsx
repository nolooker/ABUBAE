import { cleanup, render, screen, waitFor } from '@testing-library/react'
import userEvent from '@testing-library/user-event'
import { afterEach, describe, expect, it, vi } from 'vitest'

import BoardComments from './BoardComments'

const postId = 'd7d68087-a5a8-4b6e-a0aa-550a4f5937a1'
const ownComment = {
  id: 'c1111111-a5a8-4b6e-a0aa-550a4f5937a1',
  postId,
  userId: 'a1111111-a5a8-4b6e-a0aa-550a4f5937a1',
  authorNickname: '아부배러너',
  content: '내 댓글',
  createdAt: '2026-07-24T00:00:00Z',
  updatedAt: null,
  parentCommentId: null,
}
const othersComment = {
  ...ownComment,
  id: 'c2222222-a5a8-4b6e-a0aa-550a4f5937a1',
  userId: 'b2222222-a5a8-4b6e-a0aa-550a4f5937a1',
  authorNickname: '다른회원',
  content: '다른 사람 댓글',
}
const ownReply = {
  ...ownComment,
  id: 'r1111111-a5a8-4b6e-a0aa-550a4f5937a1',
  content: '내 답글',
  parentCommentId: ownComment.id,
}

describe('BoardComments', () => {
  afterEach(() => {
    cleanup()
    vi.unstubAllGlobals()
    vi.restoreAllMocks()
  })

  it('shows a login prompt instead of a comment form when signed out', () => {
    render(<BoardComments postId={postId} initialComments={[]} currentUserId={null} />)

    expect(screen.queryByLabelText('댓글')).not.toBeInTheDocument()
    expect(screen.getByRole('link', { name: '로그인' })).toHaveAttribute('href', '/login')
  })

  it('shows edit and delete only on the current user\'s own comments', () => {
    render(<BoardComments postId={postId} initialComments={[ownComment, othersComment]} currentUserId={ownComment.userId} />)

    expect(screen.getAllByRole('button', { name: '수정' })).toHaveLength(1)
    expect(screen.getAllByRole('button', { name: '삭제' })).toHaveLength(1)
  })

  it('lets a moderator delete but not edit someone else\'s comment', () => {
    render(<BoardComments postId={postId} initialComments={[othersComment]} currentUserId={ownComment.userId} canModerate />)

    expect(screen.queryByRole('button', { name: '수정' })).not.toBeInTheDocument()
    expect(screen.getByRole('button', { name: '삭제' })).toBeInTheDocument()
  })

  it('posts a new top-level comment and appends it to the list', async () => {
    const fetchMock = vi.fn().mockResolvedValue({ ok: true, json: async () => ({ ...ownComment, id: 'new-comment', content: '새 댓글' }) })
    vi.stubGlobal('fetch', fetchMock)
    const user = userEvent.setup()
    render(<BoardComments postId={postId} initialComments={[]} currentUserId={ownComment.userId} />)

    await user.type(screen.getByLabelText('댓글'), '새 댓글')
    await user.click(screen.getByRole('button', { name: '댓글 등록' }))

    expect(fetchMock).toHaveBeenCalledWith(`/api/board/posts/${postId}/comments`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ content: '새 댓글', parentCommentId: null }),
    })
    expect(await screen.findByText('새 댓글')).toBeInTheDocument()
    expect(screen.getByLabelText('댓글')).toHaveValue('')
  })

  it('shows a safe error when posting a comment fails', async () => {
    vi.stubGlobal('fetch', vi.fn().mockResolvedValue({ ok: false, status: 500 }))
    const user = userEvent.setup()
    render(<BoardComments postId={postId} initialComments={[]} currentUserId={ownComment.userId} />)

    await user.type(screen.getByLabelText('댓글'), '새 댓글')
    await user.click(screen.getByRole('button', { name: '댓글 등록' }))

    expect(await screen.findByRole('alert')).toHaveTextContent('댓글을 등록하지 못했습니다.')
  })

  it('edits its own comment, showing the "edited" tag', async () => {
    const fetchMock = vi.fn().mockResolvedValue({
      ok: true,
      json: async () => ({ ...ownComment, content: '고친 댓글', updatedAt: '2026-07-24T01:00:00Z' }),
    })
    vi.stubGlobal('fetch', fetchMock)
    const user = userEvent.setup()
    render(<BoardComments postId={postId} initialComments={[ownComment]} currentUserId={ownComment.userId} />)

    await user.click(screen.getByRole('button', { name: '수정' }))
    await user.clear(screen.getByLabelText('댓글 수정'))
    await user.type(screen.getByLabelText('댓글 수정'), '고친 댓글')
    await user.click(screen.getByRole('button', { name: '저장' }))

    expect(fetchMock).toHaveBeenCalledWith(`/api/board/comments/${ownComment.id}`, {
      method: 'PATCH',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ content: '고친 댓글' }),
    })
    expect(await screen.findByText('고친 댓글')).toBeInTheDocument()
    expect(screen.getByText(/\(수정됨\)/)).toBeInTheDocument()
  })

  it('shows a safe error when editing a comment fails', async () => {
    vi.stubGlobal('fetch', vi.fn().mockResolvedValue({ ok: false, status: 500 }))
    const user = userEvent.setup()
    render(<BoardComments postId={postId} initialComments={[ownComment]} currentUserId={ownComment.userId} />)

    await user.click(screen.getByRole('button', { name: '수정' }))
    await user.click(screen.getByRole('button', { name: '저장' }))

    expect(await screen.findByRole('alert')).toHaveTextContent('댓글을 수정하지 못했습니다.')
  })

  it('deletes a comment after confirmation', async () => {
    vi.spyOn(window, 'confirm').mockReturnValue(true)
    const fetchMock = vi.fn().mockResolvedValue({ ok: true, status: 204 })
    vi.stubGlobal('fetch', fetchMock)
    const user = userEvent.setup()
    render(<BoardComments postId={postId} initialComments={[ownComment]} currentUserId={ownComment.userId} />)

    await user.click(screen.getByRole('button', { name: '삭제' }))

    expect(fetchMock).toHaveBeenCalledWith(`/api/board/comments/${ownComment.id}`, { method: 'DELETE' })
    await waitFor(() => expect(screen.queryByText('내 댓글')).not.toBeInTheDocument())
  })

  it('does not delete when the confirmation is dismissed', async () => {
    vi.spyOn(window, 'confirm').mockReturnValue(false)
    const fetchMock = vi.fn()
    vi.stubGlobal('fetch', fetchMock)
    const user = userEvent.setup()
    render(<BoardComments postId={postId} initialComments={[ownComment]} currentUserId={ownComment.userId} />)

    await user.click(screen.getByRole('button', { name: '삭제' }))

    expect(fetchMock).not.toHaveBeenCalled()
    expect(screen.getByText('내 댓글')).toBeInTheDocument()
  })

  it('does not offer a reply toggle when signed out', () => {
    render(<BoardComments postId={postId} initialComments={[ownComment]} currentUserId={null} />)

    expect(screen.queryByRole('button', { name: '답글' })).not.toBeInTheDocument()
  })

  it('renders existing replies nested under their parent comment', () => {
    render(<BoardComments postId={postId} initialComments={[ownComment, ownReply]} currentUserId={ownComment.userId} />)

    expect(screen.getByText('내 답글')).toBeInTheDocument()
    expect(screen.getAllByRole('button', { name: '삭제' })).toHaveLength(2)
  })

  it('does not offer a reply toggle on a reply itself', () => {
    render(<BoardComments postId={postId} initialComments={[ownComment, ownReply]} currentUserId={ownComment.userId} />)

    expect(screen.getAllByRole('button', { name: '답글' })).toHaveLength(1)
  })

  it('posts a reply scoped to its parent comment and renders it nested', async () => {
    const fetchMock = vi.fn().mockResolvedValue({ ok: true, json: async () => ownReply })
    vi.stubGlobal('fetch', fetchMock)
    const user = userEvent.setup()
    render(<BoardComments postId={postId} initialComments={[ownComment]} currentUserId={ownComment.userId} />)

    await user.click(screen.getByRole('button', { name: '답글' }))
    await user.type(screen.getByLabelText('답글'), '내 답글')
    await user.click(screen.getByRole('button', { name: '답글 등록' }))

    expect(fetchMock).toHaveBeenCalledWith(`/api/board/posts/${postId}/comments`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ content: '내 답글', parentCommentId: ownComment.id }),
    })
    expect(await screen.findByText('내 답글')).toBeInTheDocument()
  })

  it('toggles the reply form closed when clicked again', async () => {
    const user = userEvent.setup()
    render(<BoardComments postId={postId} initialComments={[ownComment]} currentUserId={ownComment.userId} />)

    await user.click(screen.getByRole('button', { name: '답글' }))
    expect(screen.getByLabelText('답글')).toBeInTheDocument()

    await user.click(screen.getByRole('button', { name: '답글 취소' }))
    expect(screen.queryByLabelText('답글')).not.toBeInTheDocument()
  })
})
