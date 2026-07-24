import Link from 'next/link'
import { redirect } from 'next/navigation'
import { getCurrentUserRole } from '@/lib/master-auth'
import { listAdminNotices } from '@/lib/notice-repository'

function updatedDate(timestamp: string) {
  return new Intl.DateTimeFormat('en-US', { month: 'short', day: 'numeric', year: 'numeric', timeZone: 'UTC' }).format(new Date(timestamp))
}

export default async function NoticesPage() {
  if ((await getCurrentUserRole()) !== 'master') redirect('/login?next=/admin/notices')
  const notices = await listAdminNotices()

  return (
    <section className="mx-auto max-w-6xl px-4 py-12">
      <div className="mb-8 flex flex-col gap-4 sm:flex-row sm:items-start sm:justify-between">
        <div>
          <p className="mb-2 text-[13px] font-bold text-[var(--primary)]">SYSTEM ADMIN</p>
          <h1 className="text-3xl font-bold text-[var(--text-primary)]">Notices</h1>
          <p className="mt-3 text-[15px] text-[var(--text-secondary)]">Create, publish, and update notices.</p>
        </div>
        <Link href="/admin/notices/new" className="rounded-xl bg-[var(--primary)] px-4 py-2 text-center text-sm font-bold text-white">Create notice</Link>
      </div>
      <div className="space-y-3">
        {notices.map((notice) => (
          <article key={notice.id} className="rounded-[var(--radius-lg)] border border-[var(--border)] bg-white p-5">
            <div className="flex flex-col gap-3 sm:flex-row sm:items-start sm:justify-between">
              <div>
                <h2 className="text-lg font-bold text-[var(--text-primary)]">{notice.title}</h2>
                <p className="mt-1 text-sm text-[var(--text-secondary)]">/{notice.slug}</p>
                <p className="mt-3 text-sm text-[var(--text-secondary)]">Updated {updatedDate(notice.updatedAt)}</p>
              </div>
              <div className="flex items-center gap-3">
                <span className={notice.isPublished ? 'rounded-full bg-emerald-100 px-2.5 py-1 text-xs font-bold text-emerald-700' : 'rounded-full bg-slate-100 px-2.5 py-1 text-xs font-bold text-slate-700'}>{notice.isPublished ? 'Published' : 'Draft'}</span>
                <Link href={`/admin/notices/${notice.id}/edit`} aria-label={`Edit ${notice.title}`} className="rounded-lg border border-[var(--border)] px-3 py-1.5 text-sm font-bold text-[var(--text-primary)]">Edit</Link>
              </div>
            </div>
          </article>
        ))}
        {notices.length === 0 && <p className="rounded-[var(--radius-lg)] border border-dashed border-[var(--border)] p-6 text-sm text-[var(--text-secondary)]">No notices yet.</p>}
      </div>
    </section>
  )
}
