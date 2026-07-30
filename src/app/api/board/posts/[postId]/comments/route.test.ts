import { beforeEach, describe, expect, it, vi } from 'vitest'

const { createClient, createBoardRepository, BoardNotFoundError } = vi.hoisted(() => {
  class BoardNotFoundError extends Error {}
  return {
    createClient: vi.fn(),
    createBoardRepository: vi.fn(),
    BoardNotFoundError,
  }
})

vi.mock('@/lib/supabase/server', () => ({ createClient }))
vi.mock('@/lib/board-repository', async () => {
  const actual = await vi.importActual<typeof import('@/lib/board-repository')>('@/lib/board-repository')
  return { ...actual, createBoardRepository, BoardNotFoundError }
})

import { POST } from './route'

const postId = 'd7d68087-a5a8-4b6e-a0aa-550a4f5937a1'
const user = { id: 'a1111111-a5a8-4b6e-a0aa-550a4f5937a1', email: 'runner@example.com', user_metadata: { nickname: '아부배러너' } }

function supabaseClient(currentUser: typeof user | null = user) {
  return { auth: { getUser: vi.fn().mockResolvedValue({ data: { user: currentUser } }) } }
}

function context(id = postId) {
  return { params: Promise.resolve({ postId: id }) }
}

function request(body: unknown = { content: 'Comment' }) {
  return new Request(`http://localhost/api/board/posts/${postId}/comments`, {
    method: 'POST',
    headers: { 'content-type': 'application/json' },
    body: JSON.stringify(body),
  })
}

describe('/api/board/posts/[postId]/comments', () => {
  beforeEach(() => {
    createClient.mockReset()
    createBoardRepository.mockReset()
  })

  it('rejects an anonymous comment', async () => {
    createClient.mockResolvedValue(supabaseClient(null))
    const createComment = vi.fn()
    createBoardRepository.mockReturnValue({ createComment })

    const response = await POST(request(), context())

    expect(response.status).toBe(401)
    expect(createComment).not.toHaveBeenCalled()
  })

  it('creates a comment for the authenticated user', async () => {
    createClient.mockResolvedValue(supabaseClient(user))
    const createComment = vi.fn().mockResolvedValue({ id: 'c1', postId, content: 'Comment' })
    createBoardRepository.mockReturnValue({ createComment })

    const response = await POST(request(), context())

    expect(response.status).toBe(201)
    expect(createComment).toHaveBeenCalledWith(postId, user.id, '아부배러너', { content: 'Comment', parentCommentId: null })
  })

  it('passes a valid parentCommentId through for a reply', async () => {
    createClient.mockResolvedValue(supabaseClient(user))
    const parentCommentId = 'c7d68087-a5a8-4b6e-a0aa-550a4f5937a1'
    const createComment = vi.fn().mockResolvedValue({ id: 'c2', postId, content: 'Reply', parentCommentId })
    createBoardRepository.mockReturnValue({ createComment })

    const response = await POST(request({ content: 'Reply', parentCommentId }), context())

    expect(response.status).toBe(201)
    expect(createComment).toHaveBeenCalledWith(postId, user.id, '아부배러너', { content: 'Reply', parentCommentId })
  })

  it('returns 404 when commenting on a missing post', async () => {
    createClient.mockResolvedValue(supabaseClient(user))
    createBoardRepository.mockReturnValue({ createComment: vi.fn().mockRejectedValue(new BoardNotFoundError()) })

    const response = await POST(request(), context())

    expect(response.status).toBe(404)
  })

  it('returns 400 for malformed JSON and invalid payloads', async () => {
    createClient.mockResolvedValue(supabaseClient(user))
    const createComment = vi.fn()
    createBoardRepository.mockReturnValue({ createComment })

    const malformed = await POST(new Request('http://localhost', { method: 'POST', body: '{' }), context())
    const invalid = await POST(request({ content: '' }), context())
    const invalidId = await POST(request(), context('not-a-uuid'))

    expect(malformed.status).toBe(400)
    expect(invalid.status).toBe(400)
    expect(invalidId.status).toBe(400)
    expect(createComment).not.toHaveBeenCalled()
  })
})
