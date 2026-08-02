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

import { DELETE } from './route'

function request() {
  return new Request('http://localhost/api/admin/written-questions/round/2024/1', { method: 'DELETE' })
}

function context(year = '2024', round = '1') {
  return { params: Promise.resolve({ year, round }) }
}

function client(rpcResult: { data: unknown; error: unknown } = { data: null, error: null }) {
  return { rpc: vi.fn().mockResolvedValue(rpcResult) }
}

describe('DELETE /api/admin/written-questions/round/[year]/[round]', () => {
  beforeEach(() => {
    createClient.mockReset()
    requireMaster.mockReset()
    requireMaster.mockResolvedValue(undefined)
  })

  it('returns 401 for an anonymous request', async () => {
    const supabase = client()
    createClient.mockResolvedValue(supabase)
    requireMaster.mockRejectedValue(new MasterAuthorizationError('anonymous'))

    const response = await DELETE(request(), context())

    expect(response.status).toBe(401)
    await expect(response.json()).resolves.toEqual({ error: 'authentication required' })
    expect(supabase.rpc).not.toHaveBeenCalled()
  })

  it('returns 403 for a signed-in non-master', async () => {
    const supabase = client()
    createClient.mockResolvedValue(supabase)
    requireMaster.mockRejectedValue(new MasterAuthorizationError('user'))

    const response = await DELETE(request(), context())

    expect(response.status).toBe(403)
    await expect(response.json()).resolves.toEqual({ error: 'master access is required' })
    expect(supabase.rpc).not.toHaveBeenCalled()
  })

  it.each([
    ['0', '1'],
    ['2024', '0'],
    ['abc', '1'],
    ['2024', 'abc'],
    ['-1', '1'],
    ['1.5', '1'],
  ])('returns 400 for invalid year/round %o', async (year, round) => {
    const supabase = client()
    createClient.mockResolvedValue(supabase)

    const response = await DELETE(request(), context(year, round))

    expect(response.status).toBe(400)
    expect(supabase.rpc).not.toHaveBeenCalled()
  })

  it('deletes every question in the round and returns 204', async () => {
    const supabase = client({ data: 20, error: null })
    createClient.mockResolvedValue(supabase)

    const response = await DELETE(request(), context())

    expect(response.status).toBe(204)
    expect(requireMaster).toHaveBeenCalledWith(supabase)
    expect(supabase.rpc).toHaveBeenCalledWith('delete_written_round', {
      p_exam_slug: 'jeongchogi',
      p_year: 2024,
      p_round: 1,
    })
  })

  it.each([
    [{ code: 'P0001', message: 'database exception', details: 'written round not found' }, 404],
    [{ code: 'P0001', message: 'database exception', details: 'exam not found' }, 404],
    [{ code: 'XX000', message: 'database failed' }, 500],
  ])('maps RPC errors safely: %o', async (error, status) => {
    const supabase = client({ data: null, error })
    createClient.mockResolvedValue(supabase)

    const response = await DELETE(request(), context())

    expect(response.status).toBe(status)
    await expect(response.json()).resolves.toHaveProperty('error')
  })

  it('does not expose database error details', async () => {
    const supabase = client({
      data: null,
      error: { code: 'XX000', message: 'connection password=secret', details: 'internal host name' },
    })
    createClient.mockResolvedValue(supabase)

    const response = await DELETE(request(), context())

    expect(response.status).toBe(500)
    await expect(response.json()).resolves.toEqual({ error: 'unable to delete round' })
  })
})
