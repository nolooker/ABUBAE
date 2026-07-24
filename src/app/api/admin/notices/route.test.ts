import { beforeEach, describe, expect, it, vi } from 'vitest'

const mocks = vi.hoisted(() => {
  class MasterAuthorizationError extends Error {
    constructor(readonly role: 'anonymous' | 'user') {
      super('Master access is required')
    }
  }
  class NoticeConflictError extends Error {}

  return {
    createClient: vi.fn(),
    createServiceClient: vi.fn(),
    createNoticeRepository: vi.fn(),
    requireMaster: vi.fn(),
    MasterAuthorizationError,
    NoticeConflictError,
  }
})

vi.mock('@/lib/supabase/server', () => ({ createClient: mocks.createClient }))
vi.mock('@/lib/supabase/service', () => ({ createServiceClient: mocks.createServiceClient }))
vi.mock('@/lib/master-auth', () => ({
  requireMaster: mocks.requireMaster,
  MasterAuthorizationError: mocks.MasterAuthorizationError,
}))
vi.mock('@/lib/notice-repository', () => ({
  createNoticeRepository: mocks.createNoticeRepository,
  NoticeConflictError: mocks.NoticeConflictError,
}))

import { GET, POST } from './route'

const notice = {
  id: 'd7d68087-a5a8-4b6e-a0aa-550a4f5937a1',
  title: 'Notice',
  slug: 'first-notice',
  content: 'Content',
  isPublished: true,
  createdAt: '2026-07-24T00:00:00Z',
  updatedAt: '2026-07-24T00:00:00Z',
}

function request(body: unknown = {
  title: notice.title,
  slug: notice.slug,
  content: notice.content,
  isPublished: true,
}) {
  return new Request('http://localhost/api/admin/notices', {
    method: 'POST',
    headers: { 'content-type': 'application/json' },
    body: JSON.stringify(body),
  })
}

describe('/api/admin/notices', () => {
  beforeEach(() => {
    mocks.createClient.mockReset()
    mocks.createServiceClient.mockReset()
    mocks.createNoticeRepository.mockReset()
    mocks.requireMaster.mockReset()
    mocks.createClient.mockResolvedValue({ auth: {}, from: vi.fn() })
    mocks.requireMaster.mockResolvedValue(undefined)
    mocks.createServiceClient.mockReturnValue({})
  })

  it('returns 401 and 403 before creating a service-role repository', async () => {
    mocks.requireMaster.mockRejectedValueOnce(new mocks.MasterAuthorizationError('anonymous'))
    const anonymous = await GET()
    mocks.requireMaster.mockRejectedValueOnce(new mocks.MasterAuthorizationError('user'))
    const nonMaster = await GET()

    expect(anonymous.status).toBe(401)
    expect(nonMaster.status).toBe(403)
    expect(mocks.createServiceClient).not.toHaveBeenCalled()
  })

  it('lists only the typed admin DTO for a master', async () => {
    const repository = { listAdminNotices: vi.fn().mockResolvedValue([notice]) }
    mocks.createNoticeRepository.mockReturnValue(repository)

    const response = await GET()

    expect(response.status).toBe(200)
    await expect(response.json()).resolves.toEqual([notice])
    expect(mocks.requireMaster).toHaveBeenCalledWith(await mocks.createClient.mock.results[0].value)
    expect(mocks.createNoticeRepository).toHaveBeenCalledWith({})
  })

  it('returns 400 for malformed JSON or invalid inputs', async () => {
    const malformed = await POST(new Request('http://localhost', { method: 'POST', body: '{' }))
    const invalid = await POST(request({ ...notice, unexpected: true }))

    expect(malformed.status).toBe(400)
    expect(invalid.status).toBe(400)
    expect(mocks.createNoticeRepository).not.toHaveBeenCalled()
  })

  it('creates a valid notice through the service repository', async () => {
    const repository = { createNotice: vi.fn().mockResolvedValue(notice) }
    mocks.createNoticeRepository.mockReturnValue(repository)

    const response = await POST(request())

    expect(response.status).toBe(201)
    await expect(response.json()).resolves.toEqual(notice)
    expect(repository.createNotice).toHaveBeenCalledWith({
      title: notice.title,
      slug: notice.slug,
      content: notice.content,
      isPublished: true,
    })
  })

  it('maps duplicate slugs to 409 and redacts unexpected failures', async () => {
    mocks.createNoticeRepository.mockReturnValueOnce({
      createNotice: vi.fn().mockRejectedValue(new mocks.NoticeConflictError('duplicate slug')),
    }).mockReturnValueOnce({
      createNotice: vi.fn().mockRejectedValue(new Error('database password=secret')),
    })

    const duplicate = await POST(request())
    const unexpected = await POST(request())

    expect(duplicate.status).toBe(409)
    expect(unexpected.status).toBe(500)
    await expect(unexpected.json()).resolves.toEqual({ error: 'unable to manage notices' })
  })
})
