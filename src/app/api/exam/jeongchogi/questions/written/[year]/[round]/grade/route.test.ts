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

import { POST } from './route'

describe('written round grade API', () => {
  beforeEach(() => {
    gradeWrittenSubmission.mockReset()
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
})
