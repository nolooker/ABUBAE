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

import { DELETE, GET, PATCH } from './route'

const postId = 'd7d68087-a5a8-4b6e-a0aa-550a4f5937a1'
const user = { id: 'a1111111-a5a8-4b6e-a0aa-550a4f5937a1', email: 'runner@example.com', user_metadata: {} }

function supabaseClient(currentUser: typeof user | null = user) {
  return { auth: { getUser: vi.fn().mockResolvedValue({ data: { user: currentUser } }) } }
}

function context(id = postId) {
  return { params: Promise.resolve({ postId: id }) }
}

function patchRequest(body: unknown = { title: 'Title', content: 'Content' }) {
  return new Request(`http://localhost/api/board/posts/${postId}`, {
    method: 'PATCH',
    headers: { 'content-type': 'application/json' },
    body: JSON.stringify(body),
  })
}

describe('/api/board/posts/[postId]', () => {
  beforeEach(() => {
    createClient.mockReset()
    createBoardRepository.mockReset()
  })

  it('returns 400 for a malformed id', async () => {
    createClient.mockResolvedValue(supabaseClient(null))
    const response = await GET(new Request('http://localhost'), context('not-a-uuid'))

    expect(response.status).toBe(400)
  })

  it('returns 404 for a missing post', async () => {
    createClient.mockResolvedValue(supabaseClient(null))
    createBoardRepository.mockReturnValue({ getPost: vi.fn().mockResolvedValue(undefined) })

    const response = await GET(new Request('http://localhost'), context())

    expect(response.status).toBe(404)
  })

  it('returns the post with comments without requiring authentication', async () => {
    createClient.mockResolvedValue(supabaseClient(null))
    const result = { post: { id: postId, title: 'Title' }, comments: [] }
    createBoardRepository.mockReturnValue({ getPost: vi.fn().mockResolvedValue(result) })

    const response = await GET(new Request('http://localhost'), context())

    expect(response.status).toBe(200)
    await expect(response.json()).resolves.toEqual(result)
  })

  it('rejects an anonymous update or delete', async () => {
    createClient.mockResolvedValue(supabaseClient(null))
    const updatePost = vi.fn()
    const deletePost = vi.fn()
    createBoardRepository.mockReturnValue({ updatePost, deletePost })

    const patchResponse = await PATCH(patchRequest(), context())
    const deleteResponse = await DELETE(new Request('http://localhost', { method: 'DELETE' }), context())

    expect(patchResponse.status).toBe(401)
    expect(deleteResponse.status).toBe(401)
    expect(updatePost).not.toHaveBeenCalled()
    expect(deletePost).not.toHaveBeenCalled()
  })

  it('updates a post owned by the caller', async () => {
    createClient.mockResolvedValue(supabaseClient(user))
    const updatePost = vi.fn().mockResolvedValue({ id: postId, title: 'Title', content: 'Content' })
    createBoardRepository.mockReturnValue({ updatePost })

    const response = await PATCH(patchRequest(), context())

    expect(response.status).toBe(200)
    expect(updatePost).toHaveBeenCalledWith(postId, { title: 'Title', content: 'Content' })
  })

  it('maps not-found (including someone else\'s post) to 404 on update and delete', async () => {
    createClient.mockResolvedValue(supabaseClient(user))
    createBoardRepository.mockReturnValue({
      updatePost: vi.fn().mockRejectedValue(new BoardNotFoundError()),
      deletePost: vi.fn().mockRejectedValue(new BoardNotFoundError()),
    })

    const patchResponse = await PATCH(patchRequest(), context())
    const deleteResponse = await DELETE(new Request('http://localhost', { method: 'DELETE' }), context())

    expect(patchResponse.status).toBe(404)
    expect(deleteResponse.status).toBe(404)
  })

  it('deletes a post owned by the caller', async () => {
    createClient.mockResolvedValue(supabaseClient(user))
    const deletePost = vi.fn().mockResolvedValue(undefined)
    createBoardRepository.mockReturnValue({ deletePost })

    const response = await DELETE(new Request('http://localhost', { method: 'DELETE' }), context())

    expect(response.status).toBe(204)
    expect(deletePost).toHaveBeenCalledWith(postId)
  })

  it('returns 400 for an invalid update payload', async () => {
    createClient.mockResolvedValue(supabaseClient(user))
    const updatePost = vi.fn()
    createBoardRepository.mockReturnValue({ updatePost })

    const response = await PATCH(patchRequest({ title: '', content: 'Content' }), context())

    expect(response.status).toBe(400)
    expect(updatePost).not.toHaveBeenCalled()
  })
})
