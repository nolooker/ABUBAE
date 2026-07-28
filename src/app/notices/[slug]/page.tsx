import Link from 'next/link'
import { notFound } from 'next/navigation'
import { ArrowLeft } from 'lucide-react'
import { getPublishedNoticeBySlug } from '@/lib/notice-repository'

type Props = {
  params: Promise<{ slug: string }>
}

function formattedDate(timestamp: string) {
  return new Intl.DateTimeFormat('ko-KR', { year: 'numeric', month: 'long', day: 'numeric', timeZone: 'UTC' }).format(
    new Date(timestamp),
  )
}

export async function generateMetadata({ params }: Props) {
  const { slug } = await params
  const notice = await getPublishedNoticeBySlug(slug).catch(() => undefined)
  return {
    title: notice ? `${notice.title} | 아부배 공지사항` : '공지사항',
    description: notice?.content.slice(0, 120),
  }
}

export default async function NoticeDetailPage({ params }: Props) {
  const { slug } = await params
  const notice = await getPublishedNoticeBySlug(slug).catch(() => undefined)
  if (!notice) notFound()

  return (
    <section className="mx-auto max-w-3xl px-4 py-12">
      <Link
        href="/"
        className="mb-6 inline-flex items-center gap-1.5 text-sm font-medium text-[var(--text-secondary)] hover:text-[var(--text-primary)]"
      >
        <ArrowLeft size={15} />
        홈으로 돌아가기
      </Link>

      <p className="mb-2 text-[13px] font-bold text-[var(--primary)]">공지사항</p>
      <h1 className="text-2xl font-bold text-[var(--text-primary)] sm:text-3xl">{notice.title}</h1>
      <p className="mt-3 text-[13px] text-[var(--text-muted)]">{formattedDate(notice.createdAt)}</p>

      <div className="ab-card mt-8 whitespace-pre-wrap p-6 text-[15px] leading-7 text-[var(--text-secondary)]">
        {notice.content}
      </div>
    </section>
  )
}
