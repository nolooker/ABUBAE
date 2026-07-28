import { redirect } from 'next/navigation'
import NoticeForm from '@/components/admin/NoticeForm'
import { getCurrentUserRole } from '@/lib/master-auth'

export default async function NewNoticePage() {
  if ((await getCurrentUserRole()) !== 'master') redirect('/login?next=/admin/notices/new')
  return (
    <section className="mx-auto max-w-3xl px-4 py-12">
      <p className="mb-2 text-[13px] font-bold text-[var(--primary)]">SYSTEM ADMIN</p>
      <h1 className="text-3xl font-bold text-[var(--text-primary)]">Create notice</h1>
      <div className="mt-8 rounded-[var(--radius-lg)] border border-[var(--border)] bg-white p-6"><NoticeForm mode="create" /></div>
    </section>
  )
}
