import { beforeEach, describe, expect, it, vi } from 'vitest'

const { gradePracticalSubmission, PracticalContentUnavailableError } = vi.hoisted(() => {
  class PracticalContentUnavailableError extends Error {
    constructor() {
      super('practical content is unavailable')
      this.name = 'PracticalContentUnavailableError'
    }
  }

  return {
    gradePracticalSubmission: vi.fn(),
    PracticalContentUnavailableError,
  }
})

vi.mock('@/lib/practical-content', () => ({ gradePracticalSubmission, PracticalContentUnavailableError }))

const { getUser, saveAttempt } = vi.hoisted(() => ({
  getUser: vi.fn(),
  saveAttempt: vi.fn(),
}))

vi.mock('@/lib/supabase/server', () => ({
  createClient: vi.fn(async () => ({ auth: { getUser } })),
}))

vi.mock('@/lib/exam-attempt-repository', () => ({
  createExamAttemptRepository: vi.fn(() => ({ saveAttempt })),
}))

import { POST } from './route'

function request(body: unknown = { answers: {} }) {
  return new Request('http://localhost/api/grade', {
    method: 'POST',
    headers: { 'content-type': 'application/json' },
    body: JSON.stringify(body),
  })
}

describe('practical round grade API', () => {
  beforeEach(() => {
    gradePracticalSubmission.mockReset()
    getUser.mockReset().mockResolvedValue({ data: { user: null } })
    saveAttempt.mockReset().mockResolvedValue(undefined)
  })

  it('returns a grade only after answers are posted', async () => {
    gradePracticalSubmission.mockResolvedValue({ total: 1, unanswered: 1, score: 0 })

    const response = await POST(request({ answers: { q1: ['SSH'] } }), { params: Promise.resolve({ year: '2025', round: '2' }) })
    const body = await response.json()

    expect(response.status).toBe(200)
    expect(body).toMatchObject({ total: 1, unanswered: 1, score: 0 })
    expect(gradePracticalSubmission).toHaveBeenCalledWith(2025, 2, { q1: ['SSH'] })
  })

  it('returns not found only after the repository resolves without a round', async () => {
    gradePracticalSubmission.mockResolvedValue(undefined)

    const response = await POST(request(), { params: Promise.resolve({ year: '2025', round: '9' }) })

    expect(response.status).toBe(404)
    await expect(response.json()).resolves.toEqual({ error: 'round not found' })
  })

  it('reports content unavailability without treating it as a missing round', async () => {
    gradePracticalSubmission.mockRejectedValue(new PracticalContentUnavailableError())

    const response = await POST(request(), { params: Promise.resolve({ year: '2025', round: '2' }) })

    expect(response.status).toBe(503)
    await expect(response.json()).resolves.toEqual({ error: 'practical content unavailable' })
  })

  it.each([
    { year: 'invalid', round: '2' },
    { year: '2025.5', round: '2' },
    { year: '0', round: '2' },
    { year: '2025', round: '-1' },
  ])('rejects invalid round parameters before loading content', async ({ year, round }) => {
    const response = await POST(request(), { params: Promise.resolve({ year, round }) })

    expect(response.status).toBe(400)
    expect(gradePracticalSubmission).not.toHaveBeenCalled()
  })

  it.each([
    { answers: null },
    { answers: 'nope' },
    { answers: [] },
    { answers: { q1: 'not-an-array' } },
    { answers: { q1: [42] } },
  ])('rejects a malformed answers payload before loading content', async (body) => {
    const response = await POST(request(body), { params: Promise.resolve({ year: '2025', round: '2' }) })

    expect(response.status).toBe(400)
    expect(gradePracticalSubmission).not.toHaveBeenCalled()
  })

  it('saves an attempt for a signed-in user without changing the response', async () => {
    gradePracticalSubmission.mockResolvedValue({ total: 1, unanswered: 1, score: 0 })
    getUser.mockResolvedValue({ data: { user: { id: 'user-1' } } })

    const response = await POST(request({ answers: { q1: ['SSH'] } }), { params: Promise.resolve({ year: '2025', round: '2' }) })

    expect(response.status).toBe(200)
    expect(saveAttempt).toHaveBeenCalledWith(expect.objectContaining({
      userId: 'user-1',
      examSlug: 'jeongchogi',
      examType: 'practical',
      year: 2025,
      round: 2,
    }))
  })

  it('does not attempt to save a result for an anonymous submission', async () => {
    gradePracticalSubmission.mockResolvedValue({ total: 1, unanswered: 1, score: 0 })

    await POST(request(), { params: Promise.resolve({ year: '2025', round: '2' }) })

    expect(saveAttempt).not.toHaveBeenCalled()
  })

  it('still returns the grade when saving the attempt fails', async () => {
    gradePracticalSubmission.mockResolvedValue({ total: 1, unanswered: 1, score: 0 })
    getUser.mockResolvedValue({ data: { user: { id: 'user-1' } } })
    saveAttempt.mockRejectedValue(new Error('db unavailable'))

    const response = await POST(request(), { params: Promise.resolve({ year: '2025', round: '2' }) })
    const body = await response.json()

    expect(response.status).toBe(200)
    expect(body).toMatchObject({ total: 1, unanswered: 1, score: 0 })
  })
})
