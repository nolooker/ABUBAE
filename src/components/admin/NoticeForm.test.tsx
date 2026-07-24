import { cleanup, fireEvent, render, screen } from '@testing-library/react'
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
  })

  it('posts the exact create DTO and redirects after a successful create', async () => {
    const fetchMock = vi.fn().mockResolvedValue({ ok: true, status: 201, json: async () => notice })
    vi.stubGlobal('fetch', fetchMock)
    const user = userEvent.setup()
    render(<NoticeForm mode="create" />)

    await user.type(screen.getByLabelText('Title'), notice.title)
    await user.type(screen.getByLabelText('Slug'), notice.slug)
    await user.type(screen.getByLabelText('Content'), notice.content)
    await user.click(screen.getByLabelText('Published'))
    await user.click(screen.getByRole('button', { name: 'Create notice' }))

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
    expect(screen.getByLabelText('Title')).toHaveValue('')
    expect(screen.getByLabelText('Slug')).toHaveValue('')
    expect(screen.getByLabelText('Content')).toHaveValue('')
    expect(screen.getByLabelText('Published')).not.toBeChecked()
    expect(push).toHaveBeenCalledWith('/admin/notices?status=saved')
  })

  it('patches the exact edit DTO including the original expectedUpdatedAt timestamp', async () => {
    const fetchMock = vi.fn().mockResolvedValue({ ok: true, status: 200, json: async () => ({ ...notice, title: 'Revised update' }) })
    vi.stubGlobal('fetch', fetchMock)
    const user = userEvent.setup()
    render(<NoticeForm mode="edit" initialNotice={notice} />)

    await user.clear(screen.getByLabelText('Title'))
    await user.type(screen.getByLabelText('Title'), 'Revised update')
    await user.click(screen.getByRole('button', { name: 'Save changes' }))

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

  it('locks every editable control and ignores a second submit while saving', async () => {
    let resolveResponse: ((response: { ok: boolean; status: number; json: () => Promise<typeof notice> }) => void) | undefined
    const fetchMock = vi.fn().mockReturnValue(new Promise((resolve) => { resolveResponse = resolve }))
    vi.stubGlobal('fetch', fetchMock)
    const user = userEvent.setup()
    render(<NoticeForm mode="edit" initialNotice={notice} />)

    await user.click(screen.getByRole('button', { name: 'Save changes' }))

    expect(screen.getByLabelText('Title')).toBeDisabled()
    expect(screen.getByLabelText('Slug')).toBeDisabled()
    expect(screen.getByLabelText('Content')).toBeDisabled()
    expect(screen.getByLabelText('Published')).toBeDisabled()
    expect(screen.getByRole('button', { name: 'Saving...' })).toBeDisabled()
    fireEvent.submit(screen.getByRole('button', { name: 'Saving...' }).closest('form')!)
    expect(fetchMock).toHaveBeenCalledOnce()

    resolveResponse?.({ ok: false, status: 500, json: async () => notice })
    await screen.findByRole('alert')
  })

  it.each([
    [400, 'Please check the notice details and try again.'],
    [409, 'The notice conflicts with an existing or newer notice.'],
    [500, 'Unable to save the notice. Please try again.'],
  ])('announces a safe error for status %s', async (status, message) => {
    vi.stubGlobal('fetch', vi.fn().mockResolvedValue({ ok: false, status, json: async () => ({ error: 'server-only detail' }) }))
    const user = userEvent.setup()
    render(<NoticeForm mode="create" />)

    await user.click(screen.getByRole('button', { name: 'Create notice' }))

    expect(await screen.findByRole('alert')).toHaveTextContent(message)
  })

})
