import { redirect } from 'next/navigation'
import NoticeForm from '@/components/admin/NoticeForm'
import { getCurrentUserRole } from '@/lib/master-auth'
import { getAdminNotice } from '@/lib/notice-repository'

type EditNoticePageProps = { params: Promise<{ noticeId: string }> }

export default async function EditNoticePage({ params }: EditNoticePageProps) {
  const { noticeId } = await params
  if ((await getCurrentUserRole()) !== 'master') redirect(`/login?next=/admin/notices/${noticeId}/edit`)
  const notice = await getAdminNotice(noticeId)
  if (!notice) redirect('/admin/notices')

  return (
    <section className="mx-auto max-w-3xl px-4 py-12">
      <p className="mb-2 text-[13px] font-bold text-[var(--primary)]">SYSTEM ADMIN</p>
      <h1 className="text-3xl font-bold text-[var(--text-primary)]">공지 수정</h1>
      <div className="mt-8 rounded-[var(--radius-lg)] border border-[var(--border)] bg-white p-6"><NoticeForm mode="edit" initialNotice={notice} /></div>
    </section>
  )
}
