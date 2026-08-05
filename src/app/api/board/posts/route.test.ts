import { beforeEach, describe, expect, it, vi } from 'vitest'

const { createClient, createBoardRepository } = vi.hoisted(() => ({
  createClient: vi.fn(),
  createBoardRepository: vi.fn(),
}))

vi.mock('@/lib/supabase/server', () => ({ createClient }))
vi.mock('@/lib/board-repository', async () => {
  const actual = await vi.importActual<typeof import('@/lib/board-repository')>('@/lib/board-repository')
  return { ...actual, createBoardRepository }
})

import { GET, POST } from './route'

const user = { id: 'a1111111-a5a8-4b6e-a0aa-550a4f5937a1', email: 'runner@example.com', user_metadata: { nickname: '아부배러너' } }

function supabaseClient(currentUser: typeof user | null = user) {
  return { auth: { getUser: vi.fn().mockResolvedValue({ data: { user: currentUser } }) } }
}

function request(body: unknown) {
  return new Request('http://localhost/api/board/posts', {
    method: 'POST',
    headers: { 'content-type': 'application/json' },
    body: JSON.stringify(body),
  })
}

describe('/api/board/posts', () => {
  beforeEach(() => {
    createClient.mockReset()
    createBoardRepository.mockReset()
  })

  it('lists posts without requiring authentication', async () => {
    createClient.mockResolvedValue(supabaseClient(null))
    const listPosts = vi.fn().mockResolvedValue([{ id: 'p1', title: 'Title', authorNickname: '아부배러너', createdAt: '2026-07-24T00:00:00Z', commentCount: 0 }])
    createBoardRepository.mockReturnValue({ listPosts })

    const response = await GET()

    expect(response.status).toBe(200)
    await expect(response.json()).resolves.toEqual([{ id: 'p1', title: 'Title', authorNickname: '아부배러너', createdAt: '2026-07-24T00:00:00Z', commentCount: 0 }])
  })

  it('returns a redacted 500 when listing fails unexpectedly', async () => {
    createClient.mockResolvedValue(supabaseClient(null))
    createBoardRepository.mockReturnValue({ listPosts: vi.fn().mockRejectedValue(new Error('connection password=secret')) })

    const response = await GET()

    expect(response.status).toBe(500)
    await expect(response.json()).resolves.toEqual({ error: 'unable to load posts' })
  })

  it('rejects an anonymous create', async () => {
    createClient.mockResolvedValue(supabaseClient(null))
    const createPost = vi.fn()
    createBoardRepository.mockReturnValue({ createPost })

    const response = await POST(request({ title: 'Title', content: 'Content', category: 'free' }))

    expect(response.status).toBe(401)
    expect(createPost).not.toHaveBeenCalled()
  })

  it('creates a post for the authenticated user, deriving the nickname from metadata', async () => {
    createClient.mockResolvedValue(supabaseClient(user))
    const createPost = vi.fn().mockResolvedValue({ id: 'p1', userId: user.id, title: 'Title', content: 'Content', authorNickname: '아부배러너', createdAt: '2026-07-24T00:00:00Z', updatedAt: '2026-07-24T00:00:00Z', category: 'free' })
    createBoardRepository.mockReturnValue({ createPost })

    const response = await POST(request({ title: 'Title', content: 'Content', category: 'free' }))

    expect(response.status).toBe(201)
    expect(createPost).toHaveBeenCalledWith(user.id, '아부배러너', { title: 'Title', content: 'Content', category: 'free' })
  })

  it('creates a review post', async () => {
    createClient.mockResolvedValue(supabaseClient(user))
    const createPost = vi.fn().mockResolvedValue({})
    createBoardRepository.mockReturnValue({ createPost })

    await POST(request({ title: 'Title', content: 'Content', category: 'review' }))

    expect(createPost).toHaveBeenCalledWith(user.id, '아부배러너', { title: 'Title', content: 'Content', category: 'review' })
  })

  it('falls back to the email prefix when nickname metadata is missing', async () => {
    createClient.mockResolvedValue(supabaseClient({ ...user, user_metadata: {} }))
    const createPost = vi.fn().mockResolvedValue({})
    createBoardRepository.mockReturnValue({ createPost })

    await POST(request({ title: 'Title', content: 'Content', category: 'free' }))

    expect(createPost).toHaveBeenCalledWith(user.id, 'runner', { title: 'Title', content: 'Content', category: 'free' })
  })

  it('returns 400 for malformed JSON and invalid payloads', async () => {
    createClient.mockResolvedValue(supabaseClient(user))
    const createPost = vi.fn()
    createBoardRepository.mockReturnValue({ createPost })

    const malformed = await POST(new Request('http://localhost', { method: 'POST', body: '{' }))
    const invalid = await POST(request({ title: '', content: 'Content', category: 'free' }))
    const missingCategory = await POST(request({ title: 'Title', content: 'Content' }))

    expect(malformed.status).toBe(400)
    expect(invalid.status).toBe(400)
    expect(missingCategory.status).toBe(400)
    expect(createPost).not.toHaveBeenCalled()
  })
})
