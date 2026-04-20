import Link from 'next/link'
import { Search, ArrowRight } from 'lucide-react'

const quickLinks = [
  { label: '정보처리기사', href: '/exam/jeongchogi', color: 'bg-blue-50 text-blue-700 hover:bg-blue-100' },
  { label: 'SQLD', href: '/exam/sqld', color: 'bg-emerald-50 text-emerald-700 hover:bg-emerald-100' },
  { label: '컴퓨터활용능력', href: '/exam/comhwal', color: 'bg-orange-50 text-orange-700 hover:bg-orange-100' },
  { label: '한국사능력검정', href: '/exam/history', color: 'bg-purple-50 text-purple-700 hover:bg-purple-100' },
]

export default function HeroSection() {
  return (
    <section className="bg-[var(--bg-subtle)] border-b border-[var(--border)]">
      <div className="max-w-6xl mx-auto px-4 py-16 md:py-24">
        <div className="max-w-2xl mx-auto text-center">

          {/* 뱃지 */}
          <div className="inline-flex items-center gap-1.5 px-3 py-1 rounded-full bg-[var(--primary-light)] text-[var(--primary)] text-[12px] font-semibold mb-5">
            <span className="w-1.5 h-1.5 rounded-full bg-[var(--primary)] animate-pulse" />
            무료로 시작하는 자격증 합격
          </div>

          {/* 헤드라인 */}
          <h1 className="text-3xl md:text-4xl font-bold text-[var(--text-primary)] leading-tight mb-4 text-balance">
            자격증 합격,<br />
            <span className="text-[var(--primary)]">여기서 시작하세요</span>
          </h1>

          <p className="text-[15px] text-[var(--text-secondary)] mb-8 text-balance">
            기출문제, 요약노트, 합격 후기까지<br className="md:hidden" /> 한 곳에서 무료로 공부하세요
          </p>

          {/* 검색바 */}
          <div className="relative max-w-lg mx-auto mb-6">
            <Search
              size={16}
              className="absolute left-4 top-1/2 -translate-y-1/2 text-[var(--text-muted)]"
            />
            <input
              type="text"
              placeholder="시험 이름 또는 키워드 검색..."
              className="w-full pl-10 pr-32 py-3.5 rounded-xl border border-[var(--border)] bg-white text-[14px] text-[var(--text-primary)] placeholder:text-[var(--text-muted)] focus:outline-none focus:ring-2 focus:ring-[var(--primary)] focus:border-transparent shadow-sm transition-all"
            />
            <button className="absolute right-1.5 top-1/2 -translate-y-1/2 px-4 py-2 bg-[var(--primary)] text-white text-[13px] font-semibold rounded-lg hover:bg-[var(--primary-hover)] transition-colors">
              검색
            </button>
          </div>

          {/* 빠른 이동 */}
          <div className="flex flex-wrap justify-center gap-2">
            {quickLinks.map((item) => (
              <Link
                key={item.label}
                href={item.href}
                className={`px-3.5 py-1.5 rounded-full text-[13px] font-medium transition-colors ${item.color}`}
              >
                {item.label}
              </Link>
            ))}
            <Link
              href="/exam"
              className="flex items-center gap-1 px-3.5 py-1.5 rounded-full text-[13px] font-medium text-[var(--text-secondary)] hover:text-[var(--text-primary)] hover:bg-[var(--bg-muted)] transition-colors"
            >
              전체 보기 <ArrowRight size={12} />
            </Link>
          </div>
        </div>
      </div>
    </section>
  )
}
