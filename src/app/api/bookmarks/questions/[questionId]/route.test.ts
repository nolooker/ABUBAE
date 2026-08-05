import { beforeEach, describe, expect, it, vi } from 'vitest'

const { getUser, addBookmark, removeBookmark } = vi.hoisted(() => ({
  getUser: vi.fn(),
  addBookmark: vi.fn(),
  removeBookmark: vi.fn(),
}))

vi.mock('@/lib/supabase/server', () => ({
  createClient: vi.fn(async () => ({ auth: { getUser } })),
}))

vi.mock('@/lib/bookmark-repository', () => ({
  createBookmarkRepository: vi.fn(() => ({ addBookmark, removeBookmark })),
}))

import { DELETE, POST } from './route'

const questionId = '11111111-1111-4111-8111-111111111111'

function context(id: string) {
  return { params: Promise.resolve({ questionId: id }) }
}

describe('bookmark toggle API', () => {
  beforeEach(() => {
    getUser.mockReset().mockResolvedValue({ data: { user: { id: 'user-1' } } })
    addBookmark.mockReset().mockResolvedValue(undefined)
    removeBookmark.mockReset().mockResolvedValue(undefined)
  })

  it('adds a bookmark for the signed-in user', async () => {
    const response = await POST(new Request('http://localhost/api/bookmarks/questions/x', { method: 'POST' }), context(questionId))

    expect(response.status).toBe(200)
    await expect(response.json()).resolves.toEqual({ bookmarked: true })
    expect(addBookmark).toHaveBeenCalledWith('user-1', questionId)
  })

  it('removes a bookmark for the signed-in user', async () => {
    const response = await DELETE(new Request('http://localhost/api/bookmarks/questions/x', { method: 'DELETE' }), context(questionId))

    expect(response.status).toBe(200)
    await expect(response.json()).resolves.toEqual({ bookmarked: false })
    expect(removeBookmark).toHaveBeenCalledWith('user-1', questionId)
  })

  it('rejects anonymous requests', async () => {
    getUser.mockResolvedValue({ data: { user: null } })

    const response = await POST(new Request('http://localhost/api/bookmarks/questions/x', { method: 'POST' }), context(questionId))

    expect(response.status).toBe(401)
    expect(addBookmark).not.toHaveBeenCalled()
  })

  it('rejects a malformed question id before touching the database', async () => {
    const response = await POST(new Request('http://localhost/api/bookmarks/questions/x', { method: 'POST' }), context('not-a-uuid'))

    expect(response.status).toBe(400)
    expect(addBookmark).not.toHaveBeenCalled()
  })

  it('redacts repository failures', async () => {
    addBookmark.mockRejectedValue(new Error('db exploded with secrets'))

    const response = await POST(new Request('http://localhost/api/bookmarks/questions/x', { method: 'POST' }), context(questionId))
    const body = await response.json()

    expect(response.status).toBe(500)
    expect(body.error).not.toMatch(/secrets/)
  })
})
