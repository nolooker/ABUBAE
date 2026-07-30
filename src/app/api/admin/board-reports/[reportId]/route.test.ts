import { beforeEach, describe, expect, it, vi } from 'vitest'

const { createClient, createBoardRepository, requireMaster, MasterAuthorizationError, BoardNotFoundError } = vi.hoisted(() => {
  class MasterAuthorizationError extends Error {
    constructor(readonly role: 'anonymous' | 'user') {
      super('Master access is required')
    }
  }
  class BoardNotFoundError extends Error {}

  return {
    createClient: vi.fn(),
    createBoardRepository: vi.fn(),
    requireMaster: vi.fn(),
    MasterAuthorizationError,
    BoardNotFoundError,
  }
})

vi.mock('@/lib/supabase/server', () => ({ createClient }))
vi.mock('@/lib/master-auth', () => ({ requireMaster, MasterAuthorizationError }))
vi.mock('@/lib/board-repository', async () => {
  const actual = await vi.importActual<typeof import('@/lib/board-repository')>('@/lib/board-repository')
  return { ...actual, createBoardRepository, BoardNotFoundError }
})

import { PATCH } from './route'

const reportId = 'd7d68087-a5a8-4b6e-a0aa-550a4f5937a1'

function context(id = reportId) {
  return { params: Promise.resolve({ reportId: id }) }
}

describe('PATCH /api/admin/board-reports/[reportId]', () => {
  beforeEach(() => {
    createClient.mockReset()
    createBoardRepository.mockReset()
    requireMaster.mockReset()
    requireMaster.mockResolvedValue(undefined)
    createClient.mockResolvedValue({})
  })

  it('returns 400 for a malformed id before authorizing', async () => {
    const response = await PATCH(new Request('http://localhost', { method: 'PATCH' }), context('not-a-uuid'))

    expect(response.status).toBe(400)
    expect(requireMaster).not.toHaveBeenCalled()
  })

  it('returns 401 for an anonymous request', async () => {
    requireMaster.mockRejectedValue(new MasterAuthorizationError('anonymous'))
    const resolveReport = vi.fn()
    createBoardRepository.mockReturnValue({ resolveReport })

    const response = await PATCH(new Request('http://localhost', { method: 'PATCH' }), context())

    expect(response.status).toBe(401)
    expect(resolveReport).not.toHaveBeenCalled()
  })

  it('returns 403 for a signed-in non-master', async () => {
    requireMaster.mockRejectedValue(new MasterAuthorizationError('user'))
    const resolveReport = vi.fn()
    createBoardRepository.mockReturnValue({ resolveReport })

    const response = await PATCH(new Request('http://localhost', { method: 'PATCH' }), context())

    expect(response.status).toBe(403)
    expect(resolveReport).not.toHaveBeenCalled()
  })

  it('resolves a report for a master', async () => {
    const resolveReport = vi.fn().mockResolvedValue({ id: reportId, status: 'resolved' })
    createBoardRepository.mockReturnValue({ resolveReport })

    const response = await PATCH(new Request('http://localhost', { method: 'PATCH' }), context())

    expect(response.status).toBe(200)
    expect(resolveReport).toHaveBeenCalledWith(reportId)
  })

  it('returns 404 for a missing report', async () => {
    createBoardRepository.mockReturnValue({ resolveReport: vi.fn().mockRejectedValue(new BoardNotFoundError()) })

    const response = await PATCH(new Request('http://localhost', { method: 'PATCH' }), context())

    expect(response.status).toBe(404)
  })

  it('returns a redacted 500 for unexpected failures', async () => {
    createBoardRepository.mockReturnValue({ resolveReport: vi.fn().mockRejectedValue(new Error('connection password=secret')) })

    const response = await PATCH(new Request('http://localhost', { method: 'PATCH' }), context())

    expect(response.status).toBe(500)
    await expect(response.json()).resolves.toEqual({ error: 'unable to resolve the report' })
  })
})
