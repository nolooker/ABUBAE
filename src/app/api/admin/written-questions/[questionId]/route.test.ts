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

import { PATCH } from './route'

const questionId = 'd7d68087-a5a8-4b6e-a0aa-550a4f5937a1'
const valid = {
  content: 'Updated question',
  choices: ['First', 'Second', 'Third', 'Fourth'],
  acceptedAnswerIndexes: [1, 3],
  explanation: '',
  expectedUpdatedAt: '2026-07-23T00:00:00Z',
}

function request(body: unknown = valid) {
  return new Request(`http://localhost/api/admin/written-questions/${questionId}`, {
    method: 'PATCH',
    headers: { 'content-type': 'application/json' },
    body: JSON.stringify(body),
  })
}

function context(id = questionId) {
  return { params: Promise.resolve({ questionId: id }) }
}

function client(rpcResult: { data: unknown; error: unknown } = { data: null, error: null }) {
  return { rpc: vi.fn().mockResolvedValue(rpcResult) }
}

describe('PATCH /api/admin/written-questions/[questionId]', () => {
  beforeEach(() => {
    createClient.mockReset()
    requireMaster.mockReset()
    requireMaster.mockResolvedValue(undefined)
  })

  it('returns 401 for an anonymous request', async () => {
    const supabase = client()
    createClient.mockResolvedValue(supabase)
    requireMaster.mockRejectedValue(new MasterAuthorizationError('anonymous'))

    const response = await PATCH(request(), context())

    expect(response.status).toBe(401)
    await expect(response.json()).resolves.toEqual({ error: 'authentication required' })
    expect(supabase.rpc).not.toHaveBeenCalled()
  })

  it('returns 403 for a signed-in non-master', async () => {
    const supabase = client()
    createClient.mockResolvedValue(supabase)
    requireMaster.mockRejectedValue(new MasterAuthorizationError('user'))

    const response = await PATCH(request(), context())

    expect(response.status).toBe(403)
    await expect(response.json()).resolves.toEqual({ error: 'master access is required' })
    expect(supabase.rpc).not.toHaveBeenCalled()
  })

  it.each([
    null,
    [],
    {},
    { id: questionId, number: '8', subject: 'Networking', content: valid.content, updated_at: '2026-07-23T01:00:00Z' },
  ])('returns a redacted 500 for a malformed successful RPC result: %o', async (data) => {
    const supabase = client({ data, error: null })
    createClient.mockResolvedValue(supabase)

    const response = await PATCH(request(), context())

    expect(response.status).toBe(500)
    await expect(response.json()).resolves.toEqual({ error: 'unable to update question' })
  })

  it('returns a redacted 500 for an unexpected RPC exception', async () => {
    const supabase = client()
    supabase.rpc.mockRejectedValue(new Error('database host and credentials'))
    createClient.mockResolvedValue(supabase)

    const response = await PATCH(request(), context())

    expect(response.status).toBe(500)
    await expect(response.json()).resolves.toEqual({ error: 'unable to update question' })
  })

  it('returns 400 for invalid ids, malformed JSON, and invalid edit payloads', async () => {
    const supabase = client()
    createClient.mockResolvedValue(supabase)

    const invalidId = await PATCH(request(), context('not-a-uuid'))
    const malformed = await PATCH(new Request('http://localhost', { method: 'PATCH', body: '{' }), context())
    const invalidPayload = await PATCH(request({ ...valid, choices: ['only'] }), context())

    expect(invalidId.status).toBe(400)
    expect(malformed.status).toBe(400)
    expect(invalidPayload.status).toBe(400)
    expect(supabase.rpc).not.toHaveBeenCalled()
  })

  it('uses the authenticated server client to atomically update and return the UI-safe result', async () => {
    const supabase = client({
      data: {
        id: questionId,
        number: 8,
        subject: 'Networking',
        content: valid.content,
        updated_at: '2026-07-23T01:00:00Z',
      },
      error: null,
    })
    createClient.mockResolvedValue(supabase)

    const response = await PATCH(request(), context())

    expect(response.status).toBe(200)
    await expect(response.json()).resolves.toEqual({
      id: questionId,
      number: 8,
      subject: 'Networking',
      content: valid.content,
      choices: valid.choices,
      updatedAt: '2026-07-23T01:00:00Z',
      acceptedAnswerIndexes: [1, 3],
      explanation: '',
    })
    expect(requireMaster).toHaveBeenCalledWith(supabase)
    expect(supabase.rpc).toHaveBeenCalledWith('update_written_question', {
      p_question_id: questionId,
      p_content: valid.content,
      p_choices: valid.choices,
      p_correct_numbers: [2, 4],
      p_explanation: '',
      p_expected_updated_at: valid.expectedUpdatedAt,
    })
  })

  it.each([
    [{ code: 'PGRST116', message: 'no rows returned' }, 404],
    [{ code: 'P0001', message: 'written question not found' }, 404],
    [{ code: 'P0001', message: 'database exception', details: 'stale question' }, 409],
    [{ code: '40001', message: 'serialization failure' }, 409],
    [{ code: 'XX000', message: 'database failed' }, 500],
  ])('maps RPC errors safely: %o', async (error, status) => {
    const supabase = client({ data: null, error })
    createClient.mockResolvedValue(supabase)

    const response = await PATCH(request(), context())

    expect(response.status).toBe(status)
    await expect(response.json()).resolves.toHaveProperty('error')
  })

  it('does not expose database error details', async () => {
    const supabase = client({
      data: null,
      error: { code: 'XX000', message: 'connection password=secret', details: 'internal host name' },
    })
    createClient.mockResolvedValue(supabase)

    const response = await PATCH(request(), context())

    expect(response.status).toBe(500)
    await expect(response.json()).resolves.toEqual({ error: 'unable to update question' })
  })
})
