import { cleanup, fireEvent, render, screen, waitFor } from '@testing-library/react'
import userEvent from '@testing-library/user-event'
import { afterEach, describe, expect, it, vi } from 'vitest'

const push = vi.fn()

vi.mock('next/navigation', () => ({
  useRouter: () => ({ push }),
}))

import NoticeForm from './NoticeForm'

const notice = {
  id: 'd7d68087-a5a8-4b6e-a0aa-550a4f5937a1',
  title: 'Important update',
  slug: 'important-update',
  content: 'This notice contains enough text to be valid.',
  isPublished: true,
  createdAt: '2026-07-24T00:00:00.000Z',
  updatedAt: '2026-07-24T01:00:00.000Z',
}

describe('NoticeForm', () => {
  afterEach(() => {
    cleanup()
    push.mockReset()
    vi.unstubAllGlobals()
    vi.restoreAllMocks()
  })

  it('posts the exact create DTO and redirects after a successful create', async () => {
    const fetchMock = vi.fn().mockResolvedValue({ ok: true, status: 201, json: async () => notice })
    vi.stubGlobal('fetch', fetchMock)
    const user = userEvent.setup()
    render(<NoticeForm mode="create" />)

    await user.type(screen.getByLabelText('제목'), notice.title)
    await user.type(screen.getByLabelText('슬러그'), notice.slug)
    await user.type(screen.getByLabelText('내용'), notice.content)
    await user.click(screen.getByLabelText('공개'))
    await user.click(screen.getByRole('button', { name: '공지 생성' }))

    expect(fetchMock).toHaveBeenCalledWith('/api/admin/notices', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({
        title: notice.title,
        slug: notice.slug,
        content: notice.content,
        isPublished: true,
      }),
    })
    expect(screen.getByLabelText('제목')).toHaveValue('')
    expect(screen.getByLabelText('슬러그')).toHaveValue('')
    expect(screen.getByLabelText('내용')).toHaveValue('')
    expect(screen.getByLabelText('공개')).not.toBeChecked()
    expect(push).toHaveBeenCalledWith('/admin/notices?status=saved')
  })

  it('does not render a delete button in create mode', () => {
    render(<NoticeForm mode="create" />)

    expect(screen.queryByRole('button', { name: '공지 삭제' })).not.toBeInTheDocument()
  })

  it('patches the exact edit DTO including the original expectedUpdatedAt timestamp', async () => {
    const fetchMock = vi.fn().mockResolvedValue({ ok: true, status: 200, json: async () => ({ ...notice, title: 'Revised update' }) })
    vi.stubGlobal('fetch', fetchMock)
    const user = userEvent.setup()
    render(<NoticeForm mode="edit" initialNotice={notice} />)

    await user.clear(screen.getByLabelText('제목'))
    await user.type(screen.getByLabelText('제목'), 'Revised update')
    await user.click(screen.getByRole('button', { name: '변경사항 저장' }))

    expect(fetchMock).toHaveBeenCalledWith(`/api/admin/notices/${notice.id}`, {
      method: 'PATCH',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({
        title: 'Revised update',
        slug: notice.slug,
        content: notice.content,
        isPublished: true,
        expectedUpdatedAt: notice.updatedAt,
      }),
    })
  })

  it('uses a synchronous mutex for same-tick submissions and stays locked after a successful redirect begins', async () => {
    let resolveResponse: ((response: { ok: boolean; status: number; json: () => Promise<typeof notice> }) => void) | undefined
    const fetchMock = vi.fn().mockReturnValue(new Promise((resolve) => { resolveResponse = resolve }))
    vi.stubGlobal('fetch', fetchMock)
    render(<NoticeForm mode="create" />)

    const form = screen.getByRole('button', { name: '공지 생성' }).closest('form')!
    fireEvent.submit(form)
    fireEvent.submit(form)

    expect(screen.getByLabelText('제목')).toBeDisabled()
    expect(screen.getByLabelText('슬러그')).toBeDisabled()
    expect(screen.getByLabelText('내용')).toBeDisabled()
    expect(screen.getByLabelText('공개')).toBeDisabled()
    expect(screen.getByRole('button', { name: '저장 중...' })).toBeDisabled()
    expect(fetchMock).toHaveBeenCalledOnce()

    resolveResponse?.({ ok: true, status: 201, json: async () => notice })
    await waitFor(() => expect(push).toHaveBeenCalledWith('/admin/notices?status=saved'))
    expect(screen.getByRole('button', { name: '저장 중...' })).toBeDisabled()
  })

  it('unlocks after a failed save so the form can be retried', async () => {
    let resolveResponse: ((response: { ok: boolean; status: number; json: () => Promise<typeof notice> }) => void) | undefined
    const fetchMock = vi.fn()
      .mockReturnValueOnce(new Promise((resolve) => { resolveResponse = resolve }))
      .mockResolvedValue({ ok: false, status: 500, json: async () => notice })
    vi.stubGlobal('fetch', fetchMock)
    render(<NoticeForm mode="edit" initialNotice={notice} />)

    const form = screen.getByRole('button', { name: '변경사항 저장' }).closest('form')!
    fireEvent.submit(form)
    resolveResponse?.({ ok: false, status: 500, json: async () => notice })

    await screen.findByRole('alert')
    expect(screen.getByRole('button', { name: '변경사항 저장' })).toBeEnabled()
    fireEvent.submit(form)
    expect(fetchMock).toHaveBeenCalledTimes(2)
  })

  it.each([
    [400, '입력값을 다시 확인해 주세요.'],
    [409, '다른 공지와 충돌하거나, 그 사이 다른 곳에서 먼저 수정되었습니다.'],
    [500, '공지를 저장하지 못했습니다. 다시 시도해 주세요.'],
  ])('announces a safe error for status %s', async (status, message) => {
    vi.stubGlobal('fetch', vi.fn().mockResolvedValue({ ok: false, status, json: async () => ({ error: 'server-only detail' }) }))
    const user = userEvent.setup()
    render(<NoticeForm mode="create" />)

    await user.click(screen.getByRole('button', { name: '공지 생성' }))

    expect(await screen.findByRole('alert')).toHaveTextContent(message)
  })

  it('deletes the notice after confirmation and redirects to the deleted list state', async () => {
    vi.spyOn(window, 'confirm').mockReturnValue(true)
    const fetchMock = vi.fn().mockResolvedValue({ ok: true, status: 204 })
    vi.stubGlobal('fetch', fetchMock)
    const user = userEvent.setup()
    render(<NoticeForm mode="edit" initialNotice={notice} />)

    await user.click(screen.getByRole('button', { name: '공지 삭제' }))

    expect(window.confirm).toHaveBeenCalledOnce()
    expect(fetchMock).toHaveBeenCalledWith(`/api/admin/notices/${notice.id}`, { method: 'DELETE' })
    await waitFor(() => expect(push).toHaveBeenCalledWith('/admin/notices?status=deleted'))
  })

  it('does not delete when the confirmation is dismissed', async () => {
    vi.spyOn(window, 'confirm').mockReturnValue(false)
    const fetchMock = vi.fn()
    vi.stubGlobal('fetch', fetchMock)
    const user = userEvent.setup()
    render(<NoticeForm mode="edit" initialNotice={notice} />)

    await user.click(screen.getByRole('button', { name: '공지 삭제' }))

    expect(fetchMock).not.toHaveBeenCalled()
    expect(push).not.toHaveBeenCalled()
  })

  it('announces a safe error when deletion fails', async () => {
    vi.spyOn(window, 'confirm').mockReturnValue(true)
    vi.stubGlobal('fetch', vi.fn().mockResolvedValue({ ok: false, status: 500, json: async () => ({ error: 'server-only detail' }) }))
    const user = userEvent.setup()
    render(<NoticeForm mode="edit" initialNotice={notice} />)

    await user.click(screen.getByRole('button', { name: '공지 삭제' }))

    expect(await screen.findByRole('alert')).toHaveTextContent('공지를 삭제하지 못했습니다. 다시 시도해 주세요.')
    expect(screen.getByRole('button', { name: '공지 삭제' })).toBeEnabled()
  })
})
