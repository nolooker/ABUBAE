import Link from 'next/link'
import { listPublishedNotices } from '@/lib/notice-repository'

export const metadata = {
  title: '공지사항',
  description: '아부배의 새로운 소식과 업데이트를 확인하세요.',
}

export const revalidate = 0

function formattedDate(timestamp: string) {
  return new Intl.DateTimeFormat('ko-KR', { year: 'numeric', month: 'long', day: 'numeric', timeZone: 'UTC' }).format(
    new Date(timestamp),
  )
}

export default async function NoticesPage() {
  const notices = await listPublishedNotices(200).catch(() => [])

  return (
    <section className="mx-auto max-w-3xl px-4 py-12">
      <div className="mb-8">
        <p className="mb-2 text-[13px] font-semibold text-[var(--primary)]">공지사항</p>
        <h1 className="text-3xl font-bold text-[var(--text-primary)]">아부배 소식</h1>
        <p className="mt-3 text-[15px] text-[var(--text-secondary)]">새로운 기능과 콘텐츠 업데이트를 가장 먼저 알려드립니다.</p>
      </div>

      {notices.length > 0 ? (
        <div className="space-y-2">
          {notices.map((notice) => (
            <Link
              key={notice.id}
              href={`/notices/${notice.slug}`}
              className="ab-card flex items-center justify-between gap-4 p-5 transition-colors hover:bg-[var(--bg-subtle)]"
            >
              <span className="truncate text-[15px] font-semibold text-[var(--text-primary)]">{notice.title}</span>
              <span className="shrink-0 text-[13px] text-[var(--text-muted)]">{formattedDate(notice.createdAt)}</span>
            </Link>
          ))}
        </div>
      ) : (
        <div className="ab-card p-6 text-center text-sm text-[var(--text-muted)]">등록된 공지가 없습니다.</div>
      )}
    </section>
  )
}
