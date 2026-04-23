import Link from 'next/link'
import { BookOpen, MessageCircle, Newspaper, PenLine } from 'lucide-react'

const noticeLinks = [
  { label: '공지사항', href: '/blog', icon: Newspaper },
  { label: '합격후기', href: '/reviews', icon: MessageCircle },
  { label: '나눔소식', href: '/resources', icon: PenLine },
]

export default function HeroSection() {
  return (
    <section className="bg-white border-b border-[var(--border)]">
      <div className="max-w-5xl mx-auto px-4 py-12 text-center">
        <div className="mx-auto mb-5 flex h-16 w-16 items-center justify-center rounded-2xl bg-[var(--primary-light)] text-[var(--primary)]">
          <BookOpen size={30} />
        </div>

        <h1 className="text-3xl md:text-4xl font-bold tracking-tight text-[var(--text-primary)]">
          아부배 서재
        </h1>
        <p className="mt-3 text-[15px] md:text-[16px] leading-relaxed text-[var(--text-secondary)]">
          방문하신 모든 수험생 여러분들의 합격을 기원합니다.
        </p>

        <div className="mt-7 flex flex-wrap justify-center gap-2">
          {noticeLinks.map((item) => {
            const Icon = item.icon

            return (
              <Link
                key={item.label}
                href={item.href}
                className="inline-flex items-center gap-1.5 rounded-full border border-[var(--border)] bg-white px-4 py-2 text-[13px] font-bold text-[var(--text-primary)] transition-colors hover:border-[var(--primary)] hover:text-[var(--primary)]"
              >
                <Icon size={14} />
                {item.label}
              </Link>
            )
          })}
        </div>

        <div className="mt-5 flex justify-center gap-3 text-[13px] font-semibold text-[var(--text-secondary)]">
          <Link href="/exam" className="hover:text-[var(--primary)]">시험별 학습</Link>
          <span>·</span>
          <Link href="/quiz/daily" className="hover:text-[var(--primary)]">오늘의 문제</Link>
          <span>·</span>
          <Link href="/admin/login" className="hover:text-[var(--primary)]">Admin</Link>
        </div>
      </div>
    </section>
  )
}
