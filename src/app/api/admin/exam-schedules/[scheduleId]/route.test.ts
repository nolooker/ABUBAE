import { beforeEach, describe, expect, it, vi } from 'vitest'

const { createClient, createServiceClient, createExamScheduleRepository, requireMaster, MasterAuthorizationError, ExamScheduleNotFoundError, ExamScheduleDuplicateError } = vi.hoisted(() => {
  class MasterAuthorizationError extends Error {
    constructor(readonly role: 'anonymous' | 'user') {
      super('Master access is required')
    }
  }
  class ExamScheduleNotFoundError extends Error {}
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
    ExamScheduleNotFoundError,
    ExamScheduleDuplicateError,
  }
})

vi.mock('@/lib/supabase/server', () => ({ createClient }))
vi.mock('@/lib/supabase/service', () => ({ createServiceClient }))
vi.mock('@/lib/master-auth', () => ({ requireMaster, MasterAuthorizationError }))
vi.mock('@/lib/exam-schedule-repository', () => ({ createExamScheduleRepository, ExamScheduleNotFoundError, ExamScheduleDuplicateError }))

import { DELETE, PATCH } from './route'

const scheduleId = 'a1111111-a5a8-4b6e-a0aa-550a4f5937a1'

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

const updatedSchedule = { id: scheduleId, ...scheduleInput, createdAt: '2026-01-01T00:00:00Z', updatedAt: '2026-01-02T00:00:00Z' }

function context(id = scheduleId) {
  return { params: Promise.resolve({ scheduleId: id }) }
}

function patchRequest(body: unknown = scheduleInput) {
  return new Request(`http://localhost/api/admin/exam-schedules/${scheduleId}`, {
    method: 'PATCH',
    headers: { 'content-type': 'application/json' },
    body: JSON.stringify(body),
  })
}

describe('PATCH /api/admin/exam-schedules/[scheduleId]', () => {
  beforeEach(() => {
    createClient.mockReset().mockResolvedValue({})
    createServiceClient.mockReset()
    createExamScheduleRepository.mockReset()
    requireMaster.mockReset().mockResolvedValue(undefined)
  })

  it('returns 400 for a malformed id before authorizing', async () => {
    const response = await PATCH(patchRequest(), context('not-a-uuid'))

    expect(response.status).toBe(400)
    expect(requireMaster).not.toHaveBeenCalled()
  })

  it('returns 401 for an anonymous request', async () => {
    requireMaster.mockRejectedValue(new MasterAuthorizationError('anonymous'))
    const update = vi.fn()
    createExamScheduleRepository.mockReturnValue({ update })

    const response = await PATCH(patchRequest(), context())

    expect(response.status).toBe(401)
    expect(update).not.toHaveBeenCalled()
  })

  it('returns 403 for a signed-in non-master', async () => {
    requireMaster.mockRejectedValue(new MasterAuthorizationError('user'))
    const update = vi.fn()
    createExamScheduleRepository.mockReturnValue({ update })

    const response = await PATCH(patchRequest(), context())

    expect(response.status).toBe(403)
    expect(update).not.toHaveBeenCalled()
  })

  it('updates a schedule for a master', async () => {
    const update = vi.fn().mockResolvedValue(updatedSchedule)
    createExamScheduleRepository.mockReturnValue({ update })

    const response = await PATCH(patchRequest(), context())

    expect(response.status).toBe(200)
    await expect(response.json()).resolves.toEqual(updatedSchedule)
    expect(update).toHaveBeenCalledWith(scheduleId, scheduleInput)
  })

  it('returns 400 for malformed JSON and invalid payloads', async () => {
    const update = vi.fn()
    createExamScheduleRepository.mockReturnValue({ update })

    const malformed = await PATCH(new Request('http://localhost', { method: 'PATCH', body: '{' }), context())
    const invalid = await PATCH(patchRequest({ ...scheduleInput, round: 0 }), context())

    expect(malformed.status).toBe(400)
    expect(invalid.status).toBe(400)
    expect(update).not.toHaveBeenCalled()
  })

  it('returns 404 for a missing schedule', async () => {
    createExamScheduleRepository.mockReturnValue({ update: vi.fn().mockRejectedValue(new ExamScheduleNotFoundError()) })

    const response = await PATCH(patchRequest(), context())

    expect(response.status).toBe(404)
  })

  it('returns 409 for a duplicate year/round', async () => {
    createExamScheduleRepository.mockReturnValue({ update: vi.fn().mockRejectedValue(new ExamScheduleDuplicateError()) })

    const response = await PATCH(patchRequest(), context())

    expect(response.status).toBe(409)
  })

  it('returns a redacted 500 for unexpected failures', async () => {
    createExamScheduleRepository.mockReturnValue({ update: vi.fn().mockRejectedValue(new Error('connection password=secret')) })

    const response = await PATCH(patchRequest(), context())

    expect(response.status).toBe(500)
    await expect(response.json()).resolves.toEqual({ error: 'unable to update the exam schedule' })
  })
})

describe('DELETE /api/admin/exam-schedules/[scheduleId]', () => {
  beforeEach(() => {
    createClient.mockReset().mockResolvedValue({})
    createServiceClient.mockReset()
    createExamScheduleRepository.mockReset()
    requireMaster.mockReset().mockResolvedValue(undefined)
  })

  it('returns 400 for a malformed id before authorizing', async () => {
    const response = await DELETE(new Request('http://localhost', { method: 'DELETE' }), context('not-a-uuid'))

    expect(response.status).toBe(400)
    expect(requireMaster).not.toHaveBeenCalled()
  })

  it('returns 401 for an anonymous request', async () => {
    requireMaster.mockRejectedValue(new MasterAuthorizationError('anonymous'))
    const del = vi.fn()
    createExamScheduleRepository.mockReturnValue({ delete: del })

    const response = await DELETE(new Request('http://localhost', { method: 'DELETE' }), context())

    expect(response.status).toBe(401)
    expect(del).not.toHaveBeenCalled()
  })

  it('returns 403 for a signed-in non-master', async () => {
    requireMaster.mockRejectedValue(new MasterAuthorizationError('user'))
    const del = vi.fn()
    createExamScheduleRepository.mockReturnValue({ delete: del })

    const response = await DELETE(new Request('http://localhost', { method: 'DELETE' }), context())

    expect(response.status).toBe(403)
    expect(del).not.toHaveBeenCalled()
  })

  it('deletes a schedule for a master', async () => {
    const del = vi.fn().mockResolvedValue(undefined)
    createExamScheduleRepository.mockReturnValue({ delete: del })

    const response = await DELETE(new Request('http://localhost', { method: 'DELETE' }), context())

    expect(response.status).toBe(204)
    expect(del).toHaveBeenCalledWith(scheduleId)
  })

  it('returns 404 for a missing schedule', async () => {
    createExamScheduleRepository.mockReturnValue({ delete: vi.fn().mockRejectedValue(new ExamScheduleNotFoundError()) })

    const response = await DELETE(new Request('http://localhost', { method: 'DELETE' }), context())

    expect(response.status).toBe(404)
  })

  it('returns a redacted 500 for unexpected failures', async () => {
    createExamScheduleRepository.mockReturnValue({ delete: vi.fn().mockRejectedValue(new Error('connection password=secret')) })

    const response = await DELETE(new Request('http://localhost', { method: 'DELETE' }), context())

    expect(response.status).toBe(500)
    await expect(response.json()).resolves.toEqual({ error: 'unable to delete the exam schedule' })
  })
})
