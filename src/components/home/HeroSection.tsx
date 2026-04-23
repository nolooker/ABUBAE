import Link from 'next/link'
import { BookOpen, FileText, Newspaper, Sparkles } from 'lucide-react'

// [화면 데이터] 히어로 아래에 붙는 빠른 이동 버튼입니다.
// label/href/icon만 바꾸면 화면 버튼이 바뀝니다.
const quickLinks = [
  { label: '공지사항', href: '/blog', icon: Newspaper },
  { label: '자료실', href: '/resources', icon: FileText },
  { label: '오늘의 문제', href: '/quiz/daily', icon: Sparkles },
]

export default function HeroSection() {
  return (
    <section className="bg-white border-b border-[var(--border)]">
      <div className="max-w-5xl mx-auto px-4 py-12 text-center">
        {/* [화면] 브랜드 아이콘 */}
        <div className="mx-auto mb-5 flex h-16 w-16 items-center justify-center rounded-2xl bg-[var(--primary-light)] text-[var(--primary)]">
          <BookOpen size={30} />
        </div>

        {/* [화면] 홈에서 가장 먼저 읽히는 문장입니다. 너무 길게 쓰지 않는 게 좋습니다. */}
        <h1 className="text-3xl md:text-4xl font-bold tracking-tight text-[var(--text-primary)]">
          아부배 서재
        </h1>
        <p className="mt-3 text-[15px] md:text-[16px] leading-relaxed text-[var(--text-secondary)]">
          자격증 공부에 필요한 요약노트, 기출문제, 자료를 한곳에서 정리합니다.
        </p>

        {/* [화면] 사용자가 바로 이동할 수 있는 핵심 버튼 3개 */}
        <div className="mt-7 flex flex-wrap justify-center gap-2">
          {quickLinks.map((item) => {
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

        {/* [화면] 보조 이동 링크입니다. Admin은 공개 홈에서 숨겼고 /admin/login 주소로 직접 들어가면 됩니다. */}
        <div className="mt-5 flex justify-center gap-3 text-[13px] font-semibold text-[var(--text-secondary)]">
          <Link href="/exam" className="hover:text-[var(--primary)]">
            시험별 학습
          </Link>
          <span aria-hidden="true">·</span>
          <Link href="/resources" className="hover:text-[var(--primary)]">
            PDF 자료
          </Link>
        </div>
      </div>
    </section>
  )
}
