import { cleanup, render, screen } from '@testing-library/react'
import userEvent from '@testing-library/user-event'
import { afterEach, describe, expect, it, vi } from 'vitest'

import BoardReportButton from './BoardReportButton'

const targetId = 'd7d68087-a5a8-4b6e-a0aa-550a4f5937a1'

describe('BoardReportButton', () => {
  afterEach(() => {
    cleanup()
    vi.unstubAllGlobals()
  })

  it('toggles the report form open and closed', async () => {
    const user = userEvent.setup()
    render(<BoardReportButton targetType="post" targetId={targetId} />)

    await user.click(screen.getByRole('button', { name: '신고' }))
    expect(screen.getByLabelText('신고 사유')).toBeInTheDocument()

    await user.click(screen.getByRole('button', { name: '신고 취소' }))
    expect(screen.queryByLabelText('신고 사유')).not.toBeInTheDocument()
  })

  it('submits a post report with the free-text reason and shows a confirmation', async () => {
    const fetchMock = vi.fn().mockResolvedValue({ ok: true, status: 201 })
    vi.stubGlobal('fetch', fetchMock)
    const user = userEvent.setup()
    render(<BoardReportButton targetType="post" targetId={targetId} />)

    await user.click(screen.getByRole('button', { name: '신고' }))
    await user.type(screen.getByLabelText('신고 사유'), '스팸 홍보 글입니다')
    await user.click(screen.getByRole('button', { name: '신고 제출' }))

    expect(fetchMock).toHaveBeenCalledWith('/api/board/reports', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ targetType: 'post', targetId, reason: '스팸 홍보 글입니다' }),
    })
    expect(await screen.findByText('신고가 접수되었습니다.')).toBeInTheDocument()
    expect(screen.queryByRole('button', { name: '신고' })).not.toBeInTheDocument()
  })

  it('submits a comment report with its target type', async () => {
    const fetchMock = vi.fn().mockResolvedValue({ ok: true, status: 201 })
    vi.stubGlobal('fetch', fetchMock)
    const user = userEvent.setup()
    render(<BoardReportButton targetType="comment" targetId={targetId} />)

    await user.click(screen.getByRole('button', { name: '신고' }))
    await user.type(screen.getByLabelText('신고 사유'), '욕설입니다')
    await user.click(screen.getByRole('button', { name: '신고 제출' }))

    expect(fetchMock).toHaveBeenCalledWith('/api/board/reports', expect.objectContaining({
      body: JSON.stringify({ targetType: 'comment', targetId, reason: '욕설입니다' }),
    }))
  })

  it('shows a safe error and keeps the form open when submission fails', async () => {
    vi.stubGlobal('fetch', vi.fn().mockResolvedValue({ ok: false, status: 400 }))
    const user = userEvent.setup()
    render(<BoardReportButton targetType="post" targetId={targetId} />)

    await user.click(screen.getByRole('button', { name: '신고' }))
    await user.type(screen.getByLabelText('신고 사유'), '스팸')
    await user.click(screen.getByRole('button', { name: '신고 제출' }))

    expect(await screen.findByRole('alert')).toHaveTextContent('신고를 접수하지 못했습니다.')
    expect(screen.getByLabelText('신고 사유')).toBeInTheDocument()
  })
})
