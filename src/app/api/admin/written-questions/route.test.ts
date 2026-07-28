import { beforeEach, describe, expect, it, vi } from 'vitest'

const { createClient, requireMaster, MasterAuthorizationError } = vi.hoisted(() => {
  class MasterAuthorizationError extends Error {
    constructor(readonly role: 'anonymous' | 'user') {
      super('Master access is required')
      this.name = 'MasterAuthorizationError'
    }
  }

  return {
    createClient: vi.fn(),
    requireMaster: vi.fn(),
    MasterAuthorizationError,
  }
})

vi.mock('@/lib/supabase/server', () => ({ createClient }))
vi.mock('@/lib/master-auth', () => ({ requireMaster, MasterAuthorizationError }))

import { POST } from './route'

const valid = {
  examSlug: 'jeongchogi',
  year: 2021,
  round: 1,
  subject: '소프트웨어 설계',
  number: 101,
  content: 'New question',
  choices: ['First', 'Second', 'Third', 'Fourth'],
  acceptedAnswerIndexes: [1, 3],
  explanation: '',
}

function request(body: unknown = valid) {
  return new Request('http://localhost/api/admin/written-questions', {
    method: 'POST',
    headers: { 'content-type': 'application/json' },
    body: JSON.stringify(body),
  })
}

function client(rpcResult: { data: unknown; error: unknown } = { data: null, error: null }) {
  return { rpc: vi.fn().mockResolvedValue(rpcResult) }
}

describe('POST /api/admin/written-questions', () => {
  beforeEach(() => {
    createClient.mockReset()
    requireMaster.mockReset()
    requireMaster.mockResolvedValue(undefined)
  })

  it('returns 401 for an anonymous request', async () => {
    const supabase = client()
    createClient.mockResolvedValue(supabase)
    requireMaster.mockRejectedValue(new MasterAuthorizationError('anonymous'))

    const response = await POST(request())

    expect(response.status).toBe(401)
    await expect(response.json()).resolves.toEqual({ error: 'authentication required' })
    expect(supabase.rpc).not.toHaveBeenCalled()
  })

  it('returns 403 for a signed-in non-master', async () => {
    const supabase = client()
    createClient.mockResolvedValue(supabase)
    requireMaster.mockRejectedValue(new MasterAuthorizationError('user'))

    const response = await POST(request())

    expect(response.status).toBe(403)
    await expect(response.json()).resolves.toEqual({ error: 'master access is required' })
    expect(supabase.rpc).not.toHaveBeenCalled()
  })

  it('returns 400 for malformed JSON and invalid create payloads', async () => {
    const supabase = client()
    createClient.mockResolvedValue(supabase)

    const malformed = await POST(new Request('http://localhost', { method: 'POST', body: '{' }))
    const invalidPayload = await POST(request({ ...valid, choices: ['only'] }))

    expect(malformed.status).toBe(400)
    expect(invalidPayload.status).toBe(400)
    expect(supabase.rpc).not.toHaveBeenCalled()
  })

  it('uses the authenticated server client to create and return the UI-safe result', async () => {
    const supabase = client({
      data: {
        id: 'd7d68087-a5a8-4b6e-a0aa-550a4f5937a1',
        number: 101,
        subject: '소프트웨어 설계',
        content: valid.content,
        updated_at: '2026-07-23T01:00:00Z',
      },
      error: null,
    })
    createClient.mockResolvedValue(supabase)

    const response = await POST(request())

    expect(response.status).toBe(201)
    await expect(response.json()).resolves.toEqual({
      id: 'd7d68087-a5a8-4b6e-a0aa-550a4f5937a1',
      number: 101,
      subject: '소프트웨어 설계',
      content: valid.content,
      choices: valid.choices,
      updatedAt: '2026-07-23T01:00:00Z',
      acceptedAnswerIndexes: [1, 3],
      explanation: '',
    })
    expect(requireMaster).toHaveBeenCalledWith(supabase)
    expect(supabase.rpc).toHaveBeenCalledWith('create_written_question', {
      p_exam_slug: 'jeongchogi',
      p_year: 2021,
      p_round: 1,
      p_subject: '소프트웨어 설계',
      p_number: 101,
      p_content: valid.content,
      p_choices: valid.choices,
      p_correct_numbers: [2, 4],
      p_explanation: '',
    })
  })

  it.each([
    [{ code: 'P0001', message: 'a question with this year, round, and number already exists' }, 409],
    [{ code: 'P0001', message: 'exam not found' }, 404],
    [{ code: 'P0001', message: 'master role required' }, 500],
    [{ code: 'XX000', message: 'database failed' }, 500],
  ])('maps RPC errors safely: %o', async (error, status) => {
    const supabase = client({ data: null, error })
    createClient.mockResolvedValue(supabase)

    const response = await POST(request())

    expect(response.status).toBe(status)
    await expect(response.json()).resolves.toHaveProperty('error')
  })

  it('does not expose database error details', async () => {
    const supabase = client({
      data: null,
      error: { code: 'XX000', message: 'connection password=secret', details: 'internal host name' },
    })
    createClient.mockResolvedValue(supabase)

    const response = await POST(request())

    expect(response.status).toBe(500)
    await expect(response.json()).resolves.toEqual({ error: 'unable to create question' })
  })

  it.each([
    null,
    [],
    {},
  ])('returns a redacted 500 for a malformed successful RPC result: %o', async (data) => {
    const supabase = client({ data, error: null })
    createClient.mockResolvedValue(supabase)

    const response = await POST(request())

    expect(response.status).toBe(500)
    await expect(response.json()).resolves.toEqual({ error: 'unable to create question' })
  })
})
