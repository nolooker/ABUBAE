import { beforeEach, describe, expect, it, vi } from 'vitest'

const mocks = vi.hoisted(() => {
  class MasterAuthorizationError extends Error {
    constructor(readonly role: 'anonymous' | 'user') {
      super('Master access is required')
    }
  }
  class NoticeDuplicateSlugError extends Error {}
  class NoticeStaleUpdateError extends Error {}
  class NoticeNotFoundError extends Error {}

  return {
    createClient: vi.fn(),
    createServiceClient: vi.fn(),
    createNoticeRepository: vi.fn(),
    requireMaster: vi.fn(),
    MasterAuthorizationError,
    NoticeDuplicateSlugError,
    NoticeStaleUpdateError,
    NoticeNotFoundError,
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
  NoticeDuplicateSlugError: mocks.NoticeDuplicateSlugError,
  NoticeStaleUpdateError: mocks.NoticeStaleUpdateError,
  NoticeNotFoundError: mocks.NoticeNotFoundError,
}))

import { GET, PATCH } from './route'

const noticeId = 'd7d68087-a5a8-4b6e-a0aa-550a4f5937a1'
const notice = {
  id: noticeId,
  title: 'Notice',
  slug: 'first-notice',
  content: 'Content',
  isPublished: true,
  createdAt: '2026-07-24T00:00:00.123456+00:00',
  updatedAt: '2026-07-24T09:00:00.654321+09:00',
}

function context(id = noticeId) {
  return { params: Promise.resolve({ noticeId: id }) }
}

function request(body: unknown = {
  title: notice.title,
  slug: notice.slug,
  content: notice.content,
  isPublished: notice.isPublished,
  expectedUpdatedAt: notice.updatedAt,
}) {
  return new Request(`http://localhost/api/admin/notices/${noticeId}`, {
    method: 'PATCH',
    headers: { 'content-type': 'application/json' },
    body: JSON.stringify(body),
  })
}

describe('/api/admin/notices/[noticeId]', () => {
  beforeEach(() => {
    mocks.createClient.mockReset()
    mocks.createServiceClient.mockReset()
    mocks.createNoticeRepository.mockReset()
    mocks.requireMaster.mockReset()
    mocks.createClient.mockResolvedValue({ auth: {}, from: vi.fn() })
    mocks.requireMaster.mockResolvedValue(undefined)
    mocks.createServiceClient.mockReturnValue({})
  })

  it('rejects malformed IDs before service access', async () => {
    const response = await GET(new Request('http://localhost'), context('not-a-uuid'))

    expect(response.status).toBe(400)
    expect(mocks.createServiceClient).not.toHaveBeenCalled()
  })

  it('authorizes detail GET and PATCH before it creates the service-role repository', async () => {
    mocks.requireMaster.mockRejectedValueOnce(new mocks.MasterAuthorizationError('anonymous'))
    const getAnonymous = await GET(new Request('http://localhost'), context())
    mocks.requireMaster.mockRejectedValueOnce(new mocks.MasterAuthorizationError('user'))
    const getNonMaster = await GET(new Request('http://localhost'), context())
    mocks.requireMaster.mockRejectedValueOnce(new mocks.MasterAuthorizationError('anonymous'))
    const patchAnonymous = await PATCH(request(), context())
    mocks.requireMaster.mockRejectedValueOnce(new mocks.MasterAuthorizationError('user'))
    const patchNonMaster = await PATCH(request(), context())

    expect([getAnonymous.status, getNonMaster.status, patchAnonymous.status, patchNonMaster.status])
      .toEqual([401, 403, 401, 403])
    expect(mocks.createServiceClient).not.toHaveBeenCalled()
    expect(mocks.createNoticeRepository).not.toHaveBeenCalled()
  })

  it('returns 404 for a missing notice and the typed DTO for an existing notice', async () => {
    mocks.createNoticeRepository.mockReturnValueOnce({ getAdminNotice: vi.fn().mockResolvedValue(undefined) })
      .mockReturnValueOnce({ getAdminNotice: vi.fn().mockResolvedValue(notice) })

    const missing = await GET(new Request('http://localhost'), context())
    const found = await GET(new Request('http://localhost'), context())

    expect(missing.status).toBe(404)
    expect(found.status).toBe(200)
    await expect(found.json()).resolves.toEqual(notice)
  })

  it('validates a PATCH payload and updates using its expected timestamp', async () => {
    const repository = { updateNotice: vi.fn().mockResolvedValue({ ...notice, updatedAt: '2026-07-24T01:00:00Z' }) }
    mocks.createNoticeRepository.mockReturnValue(repository)

    const response = await PATCH(request(), context())

    expect(response.status).toBe(200)
    expect(repository.updateNotice).toHaveBeenCalledWith(noticeId, {
      title: notice.title,
      slug: notice.slug,
      content: notice.content,
      isPublished: true,
    }, notice.updatedAt)
  })

  it('returns 400 for malformed JSON, bad payloads, and bad timestamps', async () => {
    const malformed = await PATCH(new Request('http://localhost', { method: 'PATCH', body: '{' }), context())
    const invalid = await PATCH(request({ ...notice, expectedUpdatedAt: 'not-a-date' }), context())

    expect(malformed.status).toBe(400)
    expect(invalid.status).toBe(400)
    expect(mocks.createNoticeRepository).not.toHaveBeenCalled()
  })

  it('maps stale updates, missing notices, and unexpected errors safely', async () => {
    mocks.createNoticeRepository.mockReturnValueOnce({
      updateNotice: vi.fn().mockRejectedValue(new mocks.NoticeStaleUpdateError()),
    }).mockReturnValueOnce({
      updateNotice: vi.fn().mockRejectedValue(new mocks.NoticeNotFoundError()),
    }).mockReturnValueOnce({
      updateNotice: vi.fn().mockRejectedValue(new Error('host=internal password=secret')),
    })

    const stale = await PATCH(request(), context())
    const missing = await PATCH(request(), context())
    const unexpected = await PATCH(request(), context())

    expect(stale.status).toBe(409)
    expect(missing.status).toBe(404)
    expect(unexpected.status).toBe(500)
    await expect(unexpected.json()).resolves.toEqual({ error: 'unable to manage notices' })
  })

  it('maps duplicate slugs from PATCH to the specific 409 response', async () => {
    mocks.createNoticeRepository.mockReturnValue({
      updateNotice: vi.fn().mockRejectedValue(new mocks.NoticeDuplicateSlugError()),
    })

    const response = await PATCH(request(), context())

    expect(response.status).toBe(409)
    await expect(response.json()).resolves.toEqual({ error: 'notice slug already exists' })
  })
})
