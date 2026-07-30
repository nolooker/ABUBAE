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

import { DELETE, PATCH } from './route'

const commentId = 'd7d68087-a5a8-4b6e-a0aa-550a4f5937a1'
const user = { id: 'a1111111-a5a8-4b6e-a0aa-550a4f5937a1', email: 'runner@example.com', user_metadata: {} }

function supabaseClient(currentUser: typeof user | null = user) {
  return { auth: { getUser: vi.fn().mockResolvedValue({ data: { user: currentUser } }) } }
}

function context(id = commentId) {
  return { params: Promise.resolve({ commentId: id }) }
}

function patchRequest(body: unknown = { content: 'Edited' }) {
  return new Request(`http://localhost/api/board/comments/${commentId}`, {
    method: 'PATCH',
    headers: { 'content-type': 'application/json' },
    body: JSON.stringify(body),
  })
}

describe('/api/board/comments/[commentId]', () => {
  beforeEach(() => {
    createClient.mockReset()
    createBoardRepository.mockReset()
  })

  it('returns 400 for a malformed id', async () => {
    createClient.mockResolvedValue(supabaseClient(null))
    const response = await DELETE(new Request('http://localhost', { method: 'DELETE' }), context('not-a-uuid'))

    expect(response.status).toBe(400)
  })

  it('rejects an anonymous delete', async () => {
    createClient.mockResolvedValue(supabaseClient(null))
    const deleteComment = vi.fn()
    createBoardRepository.mockReturnValue({ deleteComment })

    const response = await DELETE(new Request('http://localhost', { method: 'DELETE' }), context())

    expect(response.status).toBe(401)
    expect(deleteComment).not.toHaveBeenCalled()
  })

  it('deletes a comment owned by the caller', async () => {
    createClient.mockResolvedValue(supabaseClient(user))
    const deleteComment = vi.fn().mockResolvedValue(undefined)
    createBoardRepository.mockReturnValue({ deleteComment })

    const response = await DELETE(new Request('http://localhost', { method: 'DELETE' }), context())

    expect(response.status).toBe(204)
    expect(deleteComment).toHaveBeenCalledWith(commentId)
  })

  it('maps not-found (including someone else\'s comment) to 404', async () => {
    createClient.mockResolvedValue(supabaseClient(user))
    createBoardRepository.mockReturnValue({ deleteComment: vi.fn().mockRejectedValue(new BoardNotFoundError()) })

    const response = await DELETE(new Request('http://localhost', { method: 'DELETE' }), context())

    expect(response.status).toBe(404)
  })

  it('returns 400 for a malformed id on edit', async () => {
    createClient.mockResolvedValue(supabaseClient(null))
    const response = await PATCH(patchRequest(), context('not-a-uuid'))

    expect(response.status).toBe(400)
  })

  it('rejects an anonymous edit', async () => {
    createClient.mockResolvedValue(supabaseClient(null))
    const updateComment = vi.fn()
    createBoardRepository.mockReturnValue({ updateComment })

    const response = await PATCH(patchRequest(), context())

    expect(response.status).toBe(401)
    expect(updateComment).not.toHaveBeenCalled()
  })

  it('updates a comment owned by the caller', async () => {
    createClient.mockResolvedValue(supabaseClient(user))
    const updateComment = vi.fn().mockResolvedValue({ id: commentId, content: 'Edited' })
    createBoardRepository.mockReturnValue({ updateComment })

    const response = await PATCH(patchRequest(), context())

    expect(response.status).toBe(200)
    expect(updateComment).toHaveBeenCalledWith(commentId, { content: 'Edited' })
  })

  it('maps not-found (including someone else\'s comment) to 404 on edit', async () => {
    createClient.mockResolvedValue(supabaseClient(user))
    createBoardRepository.mockReturnValue({ updateComment: vi.fn().mockRejectedValue(new BoardNotFoundError()) })

    const response = await PATCH(patchRequest(), context())

    expect(response.status).toBe(404)
  })

  it('returns 400 for malformed JSON and invalid edit payloads', async () => {
    createClient.mockResolvedValue(supabaseClient(user))
    const updateComment = vi.fn()
    createBoardRepository.mockReturnValue({ updateComment })

    const malformed = await PATCH(new Request('http://localhost', { method: 'PATCH', body: '{' }), context())
    const invalid = await PATCH(patchRequest({ content: '' }), context())

    expect(malformed.status).toBe(400)
    expect(invalid.status).toBe(400)
    expect(updateComment).not.toHaveBeenCalled()
  })
})
