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

const targetId = 'd7d68087-a5a8-4b6e-a0aa-550a4f5937a1'
const user = { id: 'a1111111-a5a8-4b6e-a0aa-550a4f5937a1', email: 'runner@example.com', user_metadata: { nickname: '아부배러너' } }

function supabaseClient(currentUser: typeof user | null = user) {
  return { auth: { getUser: vi.fn().mockResolvedValue({ data: { user: currentUser } }) } }
}

function request(body: unknown = { targetType: 'post', targetId, reason: '스팸입니다' }) {
  return new Request('http://localhost/api/board/reports', {
    method: 'POST',
    headers: { 'content-type': 'application/json' },
    body: JSON.stringify(body),
  })
}

describe('/api/board/reports', () => {
  beforeEach(() => {
    createClient.mockReset()
    createBoardRepository.mockReset()
  })

  it('rejects an anonymous report', async () => {
    createClient.mockResolvedValue(supabaseClient(null))
    const createReport = vi.fn()
    createBoardRepository.mockReturnValue({ createReport })

    const response = await POST(request())

    expect(response.status).toBe(401)
    expect(createReport).not.toHaveBeenCalled()
  })

  it('creates a report for the authenticated user', async () => {
    createClient.mockResolvedValue(supabaseClient(user))
    const createReport = vi.fn().mockResolvedValue({ id: 'r1', targetType: 'post', targetId, status: 'pending' })
    createBoardRepository.mockReturnValue({ createReport })

    const response = await POST(request())

    expect(response.status).toBe(201)
    expect(createReport).toHaveBeenCalledWith(user.id, '아부배러너', { targetType: 'post', targetId, reason: '스팸입니다' })
  })

  it('falls back to the email prefix when nickname metadata is missing', async () => {
    createClient.mockResolvedValue(supabaseClient({ ...user, user_metadata: {} }))
    const createReport = vi.fn().mockResolvedValue({})
    createBoardRepository.mockReturnValue({ createReport })

    await POST(request())

    expect(createReport).toHaveBeenCalledWith(user.id, 'runner', { targetType: 'post', targetId, reason: '스팸입니다' })
  })

  it('returns 404 when reporting missing content', async () => {
    createClient.mockResolvedValue(supabaseClient(user))
    createBoardRepository.mockReturnValue({ createReport: vi.fn().mockRejectedValue(new BoardNotFoundError()) })

    const response = await POST(request())

    expect(response.status).toBe(404)
  })

  it('returns 400 for malformed JSON and invalid payloads', async () => {
    createClient.mockResolvedValue(supabaseClient(user))
    const createReport = vi.fn()
    createBoardRepository.mockReturnValue({ createReport })

    const malformed = await POST(new Request('http://localhost', { method: 'POST', body: '{' }))
    const invalid = await POST(request({ targetType: 'post', targetId, reason: '' }))

    expect(malformed.status).toBe(400)
    expect(invalid.status).toBe(400)
    expect(createReport).not.toHaveBeenCalled()
  })
})
