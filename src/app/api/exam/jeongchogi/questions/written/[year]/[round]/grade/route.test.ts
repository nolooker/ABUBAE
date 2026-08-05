import { beforeEach, describe, expect, it, vi } from 'vitest'

const { gradeWrittenSubmission, WrittenContentUnavailableError } = vi.hoisted(() => {
  class WrittenContentUnavailableError extends Error {
    constructor() {
      super('written content is unavailable')
      this.name = 'WrittenContentUnavailableError'
    }
  }

  return {
    gradeWrittenSubmission: vi.fn(),
    WrittenContentUnavailableError,
  }
})

vi.mock('@/lib/written-content', () => ({ gradeWrittenSubmission, WrittenContentUnavailableError }))

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

describe('written round grade API', () => {
  beforeEach(() => {
    gradeWrittenSubmission.mockReset()
    getUser.mockReset().mockResolvedValue({ data: { user: null } })
    saveAttempt.mockReset().mockResolvedValue(undefined)
  })

  it('returns a grade only after answers are posted', async () => {
    gradeWrittenSubmission.mockResolvedValue({ total: 1, unanswered: 1, score: 0 })
    const request = new Request('http://localhost/api/grade', {
      method: 'POST',
      headers: { 'content-type': 'application/json' },
      body: JSON.stringify({ answers: {} }),
    })

    const response = await POST(request, { params: Promise.resolve({ year: '2021', round: '1' }) })
    const body = await response.json()

    expect(response.status).toBe(200)
    expect(body).toMatchObject({ total: 1, unanswered: 1, score: 0 })
  })

  it('returns not found only after the repository resolves without a round', async () => {
    gradeWrittenSubmission.mockResolvedValue(undefined)
    const request = new Request('http://localhost/api/grade', {
      method: 'POST',
      headers: { 'content-type': 'application/json' },
      body: JSON.stringify({ answers: {} }),
    })

    const response = await POST(request, { params: Promise.resolve({ year: '2021', round: '9' }) })

    expect(response.status).toBe(404)
    await expect(response.json()).resolves.toEqual({ error: 'round not found' })
  })

  it('reports content unavailability without treating it as a missing round', async () => {
    gradeWrittenSubmission.mockRejectedValue(new WrittenContentUnavailableError())
    const request = new Request('http://localhost/api/grade', {
      method: 'POST',
      headers: { 'content-type': 'application/json' },
      body: JSON.stringify({ answers: {} }),
    })

    const response = await POST(request, { params: Promise.resolve({ year: '2021', round: '1' }) })

    expect(response.status).toBe(503)
    await expect(response.json()).resolves.toEqual({ error: 'written content unavailable' })
  })

  it.each([
    { year: 'invalid', round: '1' },
    { year: '2021.5', round: '1' },
    { year: '0', round: '1' },
    { year: '2021', round: '-1' },
  ])('rejects invalid round parameters before loading content', async ({ year, round }) => {
    const request = new Request('http://localhost/api/grade', {
      method: 'POST',
      headers: { 'content-type': 'application/json' },
      body: JSON.stringify({ answers: {} }),
    })

    const response = await POST(request, { params: Promise.resolve({ year, round }) })

    expect(response.status).toBe(400)
    expect(gradeWrittenSubmission).not.toHaveBeenCalled()
  })

  it('saves an attempt for a signed-in user without changing the response', async () => {
    gradeWrittenSubmission.mockResolvedValue({ total: 1, unanswered: 1, score: 0 })
    getUser.mockResolvedValue({ data: { user: { id: 'user-1' } } })
    const request = new Request('http://localhost/api/grade', {
      method: 'POST',
      headers: { 'content-type': 'application/json' },
      body: JSON.stringify({ answers: {} }),
    })

    const response = await POST(request, { params: Promise.resolve({ year: '2021', round: '1' }) })

    expect(response.status).toBe(200)
    expect(saveAttempt).toHaveBeenCalledWith(expect.objectContaining({
      userId: 'user-1',
      examSlug: 'jeongchogi',
      examType: 'written',
      year: 2021,
      round: 1,
    }))
  })

  it('does not attempt to save a result for an anonymous submission', async () => {
    gradeWrittenSubmission.mockResolvedValue({ total: 1, unanswered: 1, score: 0 })
    const request = new Request('http://localhost/api/grade', {
      method: 'POST',
      headers: { 'content-type': 'application/json' },
      body: JSON.stringify({ answers: {} }),
    })

    await POST(request, { params: Promise.resolve({ year: '2021', round: '1' }) })

    expect(saveAttempt).not.toHaveBeenCalled()
  })

  it('still returns the grade when saving the attempt fails', async () => {
    gradeWrittenSubmission.mockResolvedValue({ total: 1, unanswered: 1, score: 0 })
    getUser.mockResolvedValue({ data: { user: { id: 'user-1' } } })
    saveAttempt.mockRejectedValue(new Error('db unavailable'))
    const request = new Request('http://localhost/api/grade', {
      method: 'POST',
      headers: { 'content-type': 'application/json' },
      body: JSON.stringify({ answers: {} }),
    })

    const response = await POST(request, { params: Promise.resolve({ year: '2021', round: '1' }) })
    const body = await response.json()

    expect(response.status).toBe(200)
    expect(body).toMatchObject({ total: 1, unanswered: 1, score: 0 })
  })
})
