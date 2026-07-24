import { render, screen } from '@testing-library/react'
import { beforeEach, describe, expect, it, vi } from 'vitest'

const mocks = vi.hoisted(() => ({
  getCurrentUserRole: vi.fn(),
  listAdminNotices: vi.fn(),
  getAdminNotice: vi.fn(),
  redirect: vi.fn((path: string) => { throw new Error(`redirect:${path}`) }),
}))

vi.mock('next/navigation', () => ({ redirect: mocks.redirect }))
vi.mock('@/lib/master-auth', () => ({ getCurrentUserRole: mocks.getCurrentUserRole }))
vi.mock('@/lib/notice-repository', () => ({
  listAdminNotices: mocks.listAdminNotices,
  getAdminNotice: mocks.getAdminNotice,
}))

import AdminPage from '../page'
import NoticesPage from './page'
import NewNoticePage from './new/page'
import EditNoticePage from './[noticeId]/edit/page'

const notice = {
  id: 'd7d68087-a5a8-4b6e-a0aa-550a4f5937a1',
  title: 'Published notice',
  slug: 'published-notice',
  content: 'This notice contains enough text to be valid.',
  isPublished: true,
  createdAt: '2026-07-24T00:00:00.000Z',
  updatedAt: '2026-07-24T01:00:00.000Z',
}

describe('admin notice pages', () => {
  beforeEach(() => {
    mocks.getCurrentUserRole.mockReset().mockResolvedValue('master')
    mocks.listAdminNotices.mockReset().mockResolvedValue([notice, { ...notice, id: 'a7d68087-a5a8-4b6e-a0aa-550a4f5937a1', title: 'Draft notice', isPublished: false }])
    mocks.getAdminNotice.mockReset().mockResolvedValue(notice)
    mocks.redirect.mockClear()
  })

  it('redirects non-master visitors from every notice management route', async () => {
    mocks.getCurrentUserRole.mockResolvedValue('user')

    await expect(NoticesPage()).rejects.toThrow('redirect:/login?next=/admin/notices')
    await expect(NewNoticePage()).rejects.toThrow('redirect:/login?next=/admin/notices/new')
    await expect(EditNoticePage({ params: Promise.resolve({ noticeId: notice.id }) })).rejects.toThrow(`redirect:/login?next=/admin/notices/${notice.id}/edit`)
  })

  it('lists notices with explicit published status badges and edit affordances', async () => {
    render(await NoticesPage())

    expect(screen.getByRole('heading', { name: 'Notices' })).toBeInTheDocument()
    expect(screen.getByText('Published notice')).toBeInTheDocument()
    expect(screen.getByText('Published')).toBeInTheDocument()
    expect(screen.getByText('Draft')).toBeInTheDocument()
    expect(screen.getByRole('link', { name: '새 공지 작성' })).toHaveAttribute('href', '/admin/notices/new')
    expect(screen.getAllByRole('link', { name: '수정' })).toHaveLength(2)
    expect(screen.getAllByText('Updated Jul 24, 2026')).toHaveLength(2)
  })

  it('announces a saved notice on the destination list page', async () => {
    render(await NoticesPage({ searchParams: Promise.resolve({ status: 'saved' }) }))

    expect(screen.getByRole('status')).toHaveTextContent('공지사항이 저장되었습니다.')
  })

  it('links the admin notice card to notice management', async () => {
    render(await AdminPage())

    expect(screen.getByRole('link', { name: /블로그\/공지 관리/ })).toHaveAttribute('href', '/admin/notices')
  })
})
