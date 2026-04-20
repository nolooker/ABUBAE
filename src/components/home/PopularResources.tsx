import Link from 'next/link'
import { Download, Lock, ArrowRight } from 'lucide-react'

// 나중에 Supabase에서 실제 데이터로 교체
const mockResources = [
  {
    id: '1',
    title: '정처기 1과목 핵심 요약',
    desc: '소프트웨어 설계 · 24페이지',
    price: 0,
    exam: '정처기',
    color: 'bg-blue-100 text-blue-600',
    href: '/resources/1',
  },
  {
    id: '2',
    title: '정처기 2과목 핵심 요약',
    desc: '소프트웨어 개발 · 28페이지',
    price: 4900,
    exam: '정처기',
    color: 'bg-blue-100 text-blue-600',
    href: '/resources/2',
  },
  {
    id: '3',
    title: 'SQLD 핵심 개념 정리',
    desc: '데이터 모델링 · 32페이지',
    price: 0,
    exam: 'SQLD',
    color: 'bg-emerald-100 text-emerald-600',
    href: '/resources/3',
  },
  {
    id: '4',
    title: '정처기 실기 완벽 대비',
    desc: '전 범위 핵심 정리 · 56페이지',
    price: 9900,
    exam: '정처기',
    color: 'bg-blue-100 text-blue-600',
    href: '/resources/4',
  },
]

export default function PopularResources() {
  return (
    <section className="max-w-6xl mx-auto px-4 py-14">
      <div className="flex items-center justify-between mb-6">
        <div>
          <h2 className="text-[20px] font-bold text-[var(--text-primary)]">인기 자료</h2>
          <p className="text-[13px] text-[var(--text-secondary)] mt-0.5">많은 분들이 다운받은 자료예요</p>
        </div>
        <Link
          href="/resources"
          className="flex items-center gap-1 text-[13px] font-medium text-[var(--primary)] hover:underline"
        >
          전체 보기 <ArrowRight size={13} />
        </Link>
      </div>

      <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4">
        {mockResources.map((item) => (
          <Link
            key={item.id}
            href={item.href}
            className="group bg-white border border-[var(--border)] rounded-[var(--radius-lg)] p-4 hover:border-[var(--primary)] hover:shadow-md transition-all"
          >
            {/* 아이콘 영역 */}
            <div className={`w-10 h-10 rounded-xl ${item.color} flex items-center justify-center mb-3`}>
              {item.price === 0
                ? <Download size={18} strokeWidth={2} />
                : <Lock size={18} strokeWidth={2} />
              }
            </div>

            {/* 배지 */}
            <div className="flex items-center gap-1.5 mb-2">
              {item.price === 0
                ? <span className="text-[11px] font-semibold px-2 py-0.5 rounded-full bg-green-50 text-green-700">FREE</span>
                : <span className="text-[11px] font-semibold px-2 py-0.5 rounded-full bg-orange-50 text-orange-700">PRO</span>
              }
              <span className="text-[11px] text-[var(--text-muted)]">{item.exam}</span>
            </div>

            <p className="text-[14px] font-semibold text-[var(--text-primary)] leading-snug mb-1 group-hover:text-[var(--primary)] transition-colors">
              {item.title}
            </p>
            <p className="text-[12px] text-[var(--text-secondary)]">{item.desc}</p>

            <div className="mt-3 pt-3 border-t border-[var(--border)] flex items-center justify-between">
              <span className="text-[13px] font-bold text-[var(--text-primary)]">
                {item.price === 0 ? '무료' : `${item.price.toLocaleString()}원`}
              </span>
              <span className="text-[12px] text-[var(--primary)] font-medium opacity-0 group-hover:opacity-100 transition-opacity">
                {item.price === 0 ? '다운로드 →' : '구매하기 →'}
              </span>
            </div>
          </Link>
        ))}
      </div>
    </section>
  )
}
