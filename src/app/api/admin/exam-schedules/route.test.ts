import { beforeEach, describe, expect, it, vi } from 'vitest'

const { createClient, createServiceClient, createExamScheduleRepository, requireMaster, MasterAuthorizationError, ExamNotFoundError, ExamScheduleDuplicateError } = vi.hoisted(() => {
  class MasterAuthorizationError extends Error {
    constructor(readonly role: 'anonymous' | 'user') {
      super('Master access is required')
    }
  }
  class ExamNotFoundError extends Error {}
  class ExamScheduleDuplicateError extends Error {
    constructor() {
      super('a schedule for this year and round already exists')
    }
  }

  return {
    createClient: vi.fn(),
    createServiceClient: vi.fn(),
    createExamScheduleRepository: vi.fn(),
    requireMaster: vi.fn(),
    MasterAuthorizationError,
    ExamNotFoundError,
    ExamScheduleDuplicateError,
  }
})

vi.mock('@/lib/supabase/server', () => ({ createClient }))
vi.mock('@/lib/supabase/service', () => ({ createServiceClient }))
vi.mock('@/lib/master-auth', () => ({ requireMaster, MasterAuthorizationError }))
vi.mock('@/lib/exam-schedule-repository', () => ({ createExamScheduleRepository, ExamNotFoundError, ExamScheduleDuplicateError }))

import { POST } from './route'

const scheduleInput = {
  year: 2026,
  round: 1,
  writtenApplyStart: '2026-01-05',
  writtenApplyEnd: '2026-01-09',
  writtenExamDate: '2026-02-07',
  writtenResultDate: '2026-03-11',
  practicalApplyStart: '2026-03-16',
  practicalApplyEnd: '2026-03-20',
  practicalExamDate: '2026-04-18',
  finalResultDate: '2026-06-10',
}

const createdSchedule = { id: 'a1111111-a5a8-4b6e-a0aa-550a4f5937a1', ...scheduleInput, createdAt: '2026-01-01T00:00:00Z', updatedAt: '2026-01-01T00:00:00Z' }

function request(body: unknown = { examSlug: 'jeongchogi', ...scheduleInput }) {
  return new Request('http://localhost/api/admin/exam-schedules', {
    method: 'POST',
    headers: { 'content-type': 'application/json' },
    body: JSON.stringify(body),
  })
}

describe('POST /api/admin/exam-schedules', () => {
  beforeEach(() => {
    createClient.mockReset().mockResolvedValue({})
    createServiceClient.mockReset()
    createExamScheduleRepository.mockReset()
    requireMaster.mockReset().mockResolvedValue(undefined)
  })

  it('returns 401 for an anonymous request', async () => {
    requireMaster.mockRejectedValue(new MasterAuthorizationError('anonymous'))
    const create = vi.fn()
    createExamScheduleRepository.mockReturnValue({ create })

    const response = await POST(request())

    expect(response.status).toBe(401)
    expect(create).not.toHaveBeenCalled()
  })

  it('returns 403 for a signed-in non-master', async () => {
    requireMaster.mockRejectedValue(new MasterAuthorizationError('user'))
    const create = vi.fn()
    createExamScheduleRepository.mockReturnValue({ create })

    const response = await POST(request())

    expect(response.status).toBe(403)
    expect(create).not.toHaveBeenCalled()
  })

  it('creates a schedule for a master and returns 201', async () => {
    const create = vi.fn().mockResolvedValue(createdSchedule)
    createExamScheduleRepository.mockReturnValue({ create })

    const response = await POST(request())

    expect(response.status).toBe(201)
    await expect(response.json()).resolves.toEqual(createdSchedule)
    expect(create).toHaveBeenCalledWith('jeongchogi', scheduleInput)
  })

  it('returns 400 for malformed JSON, a missing examSlug, and invalid payloads', async () => {
    const create = vi.fn()
    createExamScheduleRepository.mockReturnValue({ create })

    const malformed = await POST(new Request('http://localhost', { method: 'POST', body: '{' }))
    const missingSlug = await POST(request(scheduleInput))
    const invalid = await POST(request({ examSlug: 'jeongchogi', ...scheduleInput, round: 0 }))

    expect(malformed.status).toBe(400)
    expect(missingSlug.status).toBe(400)
    expect(invalid.status).toBe(400)
    expect(create).not.toHaveBeenCalled()
  })

  it('returns 404 for an unknown exam', async () => {
    createExamScheduleRepository.mockReturnValue({ create: vi.fn().mockRejectedValue(new ExamNotFoundError()) })

    const response = await POST(request())

    expect(response.status).toBe(404)
  })

  it('returns 409 for a duplicate year/round', async () => {
    createExamScheduleRepository.mockReturnValue({ create: vi.fn().mockRejectedValue(new ExamScheduleDuplicateError()) })

    const response = await POST(request())

    expect(response.status).toBe(409)
  })

  it('returns a redacted 500 for unexpected failures', async () => {
    createExamScheduleRepository.mockReturnValue({ create: vi.fn().mockRejectedValue(new Error('connection password=secret')) })

    const response = await POST(request())

    expect(response.status).toBe(500)
    await expect(response.json()).resolves.toEqual({ error: 'unable to create the exam schedule' })
  })
})
