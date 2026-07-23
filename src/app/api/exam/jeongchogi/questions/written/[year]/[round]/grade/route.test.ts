import { describe, expect, it } from 'vitest'

import { POST } from './route'

describe('written round grade API', () => {
  it('returns a grade only after answers are posted', async () => {
    const request = new Request('http://localhost/api/grade', {
      method: 'POST',
      headers: { 'content-type': 'application/json' },
      body: JSON.stringify({ answers: {} }),
    })

    const response = await POST(request, { params: Promise.resolve({ year: '2021', round: '1' }) })
    const body = await response.json()

    expect(response.status).toBe(200)
    expect(body).toMatchObject({ total: 100, unanswered: 100, score: 0 })
  })
})
