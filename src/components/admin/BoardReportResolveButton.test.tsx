import { cleanup, render, screen, waitFor } from '@testing-library/react'
import userEvent from '@testing-library/user-event'
import { afterEach, describe, expect, it, vi } from 'vitest'

const refresh = vi.fn()

vi.mock('next/navigation', () => ({
  useRouter: () => ({ refresh }),
}))

import BoardReportResolveButton from './BoardReportResolveButton'

const reportId = 'd7d68087-a5a8-4b6e-a0aa-550a4f5937a1'

describe('BoardReportResolveButton', () => {
  afterEach(() => {
    cleanup()
    refresh.mockReset()
    vi.unstubAllGlobals()
  })

  it('marks the report resolved and refreshes the list', async () => {
    const fetchMock = vi.fn().mockResolvedValue({ ok: true, status: 200 })
    vi.stubGlobal('fetch', fetchMock)
    const user = userEvent.setup()
    render(<BoardReportResolveButton reportId={reportId} />)

    await user.click(screen.getByRole('button', { name: '처리 완료' }))

    expect(fetchMock).toHaveBeenCalledWith(`/api/admin/board-reports/${reportId}`, { method: 'PATCH' })
    await waitFor(() => expect(refresh).toHaveBeenCalledOnce())
  })

  it('shows a safe error when resolving fails', async () => {
    vi.stubGlobal('fetch', vi.fn().mockResolvedValue({ ok: false, status: 500 }))
    const user = userEvent.setup()
    render(<BoardReportResolveButton reportId={reportId} />)

    await user.click(screen.getByRole('button', { name: '처리 완료' }))

    expect(await screen.findByRole('alert')).toHaveTextContent('처리하지 못했습니다.')
    expect(refresh).not.toHaveBeenCalled()
  })
})
