import Image from 'next/image'
import Link from 'next/link'
import { listPublishedNotices } from '@/lib/notice-repository'

function noticeDate(timestamp: string) {
  return new Intl.DateTimeFormat('ko-KR', { month: 'long', day: 'numeric', timeZone: 'UTC' }).format(new Date(timestamp))
}

const products = {
  jeongchogi: [
    {
      id: 1,
      title: '1과목 핵심 요약 샘플',
      pages: 12,
      price: 0,
      badge: 'FREE',
      color: '#3B6EE8',
      bg: '#EEF3FD',
      emoji: '📄',
    },
    {
      id: 2,
      title: '필기 핵심 요약노트 PDF',
      pages: 96,
      price: 4900,
      badge: '인기',
      color: '#4F46E5',
      bg: '#F0F4FF',
      emoji: '📚',
    },
    {
      id: 3,
      title: '실기 코드 해설 기출풀이집',
      pages: 64,
      price: 7900,
      badge: 'NEW',
      color: '#F97316',
      bg: '#FFF3EA',
      emoji: '💻',
    },
    {
      id: 4,
      title: '전과목 번들 완전정복 세트',
      pages: 180,
      price: 12900,
      badge: 'PRO',
      color: '#22C55E',
      bg: '#EDFAF4',
      emoji: '🎯',
    },
  ],
  data: [
    {
      id: 5,
      title: 'SQLD 핵심 요약 샘플',
      pages: 8,
      price: 0,
      badge: 'FREE',
      color: '#EAB308',
      bg: '#FEFCE8',
      emoji: '📊',
    },
    {
      id: 6,
      title: 'SQLD 요약노트 PDF',
      pages: 72,
      price: 4900,
      badge: '인기',
      color: '#CA8A04',
      bg: '#FEFCE8',
      emoji: '📈',
    },
    {
      id: 7,
      title: 'ADsP 요약노트 PDF',
      pages: 58,
      price: 4900,
      badge: null,
      color: '#EF4444',
      bg: '#FEF2F2',
      emoji: '🔬',
    },
  ],
}

const reviews = [
  {
    name: '김**님',
    exam: '정처기 · 2024년 1회 합격',
    text: '코드 해설이 진짜 달랐어요. 비전공자인데 처음으로 코드 문제 이해하고 풀었어요.',
    initial: '김',
  },
  {
    name: '이**님',
    exam: '정처기 · 2023년 3회 합격',
    text: '직장 다니면서 2달 만에 합격했어요. 요약노트 하나로 핵심만 빠르게 정리됐습니다.',
    initial: '이',
  },
  {
    name: '박**님',
    exam: 'SQLD · 2024년 합격',
    text: '다른 자료들이랑 비교가 안 돼요. 설명이 너무 친절해서 혼자 공부해도 막히는 게 없었어요.',
    initial: '박',
  },
]

const stats = [
  { num: '12,400', label: '공부 중인 수험생' },
  { num: '1,240', label: '기출문제' },
  { num: '38', label: '학습 자료' },
  { num: '94%', label: '자료 만족도' },
]

function badgeStyle(badge: string | null) {
  switch (badge) {
    case 'FREE':
      return 'ab-badge ab-badge-free'
    case '인기':
      return 'ab-badge ab-badge-hot'
    case 'NEW':
      return 'ab-badge ab-badge-new'
    case 'PRO':
      return 'ab-badge ab-badge-pro'
    default:
      return ''
  }
}

function ProductCard({
  product,
}: {
  product: (typeof products.jeongchogi)[number] | (typeof products.data)[number]
}) {
  return (
    <Link href={`/resources/${product.id}`}>
      <div className="ab-card cursor-pointer overflow-hidden transition-all duration-150 hover:-translate-y-1 hover:shadow-lg">
        <div className="relative flex h-32 items-center justify-center" style={{ background: product.bg }}>
          <div
            className="flex h-24 w-20 items-center justify-center rounded-xl text-3xl shadow-md"
            style={{ background: product.color }}
          >
            {product.emoji}
          </div>
          {product.badge && (
            <span
              className={`absolute left-2 top-2 ${badgeStyle(product.badge)}`}
            >
              {product.badge}
            </span>
          )}
        </div>

        <div className="p-3">
          <p className="mb-1 text-xs font-semibold leading-snug text-[var(--text-primary)]">{product.title}</p>
          <p className="mb-2 text-[11px] text-[var(--text-muted)]">PDF · {product.pages}페이지</p>
          <p
            className={`text-sm font-bold ${
              product.price === 0 ? 'text-green-600' : 'text-[var(--accent)]'
            }`}
          >
            {product.price === 0 ? '무료' : `${product.price.toLocaleString()}원`}
          </p>
        </div>
      </div>
    </Link>
  )
}

export default async function HomePage() {
  const notices = await listPublishedNotices(3).catch(() => [])

  return (
    <div className="min-h-screen bg-[var(--bg-subtle)]">
      <div className="mx-auto max-w-4xl px-4 py-6">
        {/* [화면] 디자인 파일 기준 메인 히어로 */}
        <section className="ab-card relative mb-6 overflow-hidden p-8 text-center">
          <div className="absolute -right-12 -top-16 h-48 w-48 rounded-full bg-[var(--primary-light)] opacity-60" />
          <div className="absolute -bottom-8 -left-6 h-28 w-28 rounded-full bg-[var(--accent-light)] opacity-60" />

          <div className="relative">
            <span className="mb-4 inline-block rounded-full bg-[var(--primary-light)] px-4 py-1.5 text-xs font-bold tracking-wide text-[var(--primary)]">
              정보처리기사 전문 학습 플랫폼
            </span>

            <h1 className="mb-2 text-2xl font-black leading-snug text-[var(--text-primary)]">
              방문하신 모든 수험생 여러분의
              <br />
              <span className="text-[var(--text-primary)]">합격을 기원합니다</span> 🎉
            </h1>

            <p className="mb-6 text-sm text-[var(--text-secondary)]">
              코드 한 줄씩 — 비전공자도 이해하는 기출 해설
            </p>

            <div className="flex justify-center gap-6">
              {[
                { icon: '📢', label: '시험안내', href: '/exam/jeongchogi' },
                { icon: '🏆', label: '자료실', href: '/resources' },
                { icon: '🎁', label: '마이페이지', href: '/mypage' },
                { icon: '📝', label: '기출문제', href: '/exam/jeongchogi/questions' },
              ].map((item) => (
                <Link key={item.label} href={item.href} className="group flex flex-col items-center gap-1.5">
                  <div className="flex h-14 w-14 items-center justify-center rounded-2xl border border-[var(--border)] bg-white text-2xl transition-all group-hover:border-[var(--border-strong)] group-hover:bg-[var(--bg-subtle)]">
                    {item.icon}
                  </div>
                  <span className="text-xs font-medium text-[var(--text-secondary)]">{item.label}</span>
                </Link>
              ))}
            </div>
          </div>
        </section>

        {/* [화면] 신뢰 지표 */}
        <section className="mb-8 grid grid-cols-2 gap-3 md:grid-cols-4">
          {stats.map((stat) => (
            <div key={stat.label} className="ab-card p-4 text-center">
              <p className="text-xl font-black text-[var(--text-primary)]">{stat.num}</p>
              <p className="mt-0.5 text-[11px] text-[var(--text-muted)]">{stat.label}</p>
            </div>
          ))}
        </section>

        {/* [화면] 최신 공지 */}
        <section className="mb-8">
          <div className="mb-4 flex items-center gap-2">
            <span className="text-base">📢</span>
            <h2 className="text-base font-bold text-[var(--text-primary)]">공지사항</h2>
            <Link href="/notices" className="ml-auto text-xs text-[var(--text-muted)] hover:text-[var(--text-secondary)]">
              전체보기
            </Link>
          </div>
          {notices.length > 0 ? (
            <div className="space-y-2">
              {notices.map((notice) => (
                <Link
                  key={notice.id}
                  href={`/notices/${notice.slug}`}
                  className="ab-card flex items-center justify-between gap-4 p-4 transition-colors hover:bg-[var(--bg-subtle)]"
                >
                  <span className="truncate text-sm font-semibold text-[var(--text-primary)]">{notice.title}</span>
                  <span className="shrink-0 text-xs text-[var(--text-muted)]">{noticeDate(notice.createdAt)}</span>
                </Link>
              ))}
            </div>
          ) : (
            <div className="ab-card p-4 text-center text-sm text-[var(--text-muted)]">등록된 공지가 없습니다.</div>
          )}
        </section>

        {/* [화면] 정처기 자료 */}
        <section className="mb-8">
          <div className="mb-4 flex items-center gap-2">
            <span className="text-base">💙</span>
            <h2 className="text-base font-bold text-[var(--text-primary)]">정보처리기사</h2>
            <span className="ml-auto text-xs text-[var(--text-muted)]">가장 인기있는 자격증</span>
          </div>
          <div className="grid grid-cols-2 gap-3 sm:grid-cols-4">
            {products.jeongchogi.map((product) => (
              <ProductCard key={product.id} product={product} />
            ))}
          </div>
        </section>

        {/* [화면] 데이터 자격증 자료 */}
        <section className="mb-8">
          <div className="mb-4 flex items-center gap-2">
            <span className="text-base">💛</span>
            <h2 className="text-base font-bold text-[var(--text-primary)]">SQLD · ADsP</h2>
            <span className="ml-auto text-xs text-[var(--text-muted)]">데이터 자격증</span>
          </div>
          <div className="grid grid-cols-2 gap-3 sm:grid-cols-4">
            {products.data.map((product) => (
              <ProductCard key={product.id} product={product} />
            ))}
          </div>
        </section>

        {/* [화면] 합격 후기 */}
        <section className="mb-8">
          <div className="mb-4 flex items-center gap-2">
            <span className="text-base">🏆</span>
            <h2 className="text-base font-bold text-[var(--text-primary)]">합격후기</h2>
            <span className="ml-auto text-xs text-[var(--text-muted)]">실제 합격자들의 이야기</span>
          </div>
          <div className="grid grid-cols-1 gap-3 sm:grid-cols-3">
            {reviews.map((review) => (
              <div key={review.name} className="ab-card p-4">
                <div className="mb-2 flex items-center gap-2">
                  <div className="flex h-8 w-8 items-center justify-center rounded-full bg-[var(--primary-light)] text-xs font-bold text-[var(--primary)]">
                    {review.initial}
                  </div>
                  <div>
                    <p className="text-xs font-semibold text-[var(--text-primary)]">{review.name}</p>
                    <p className="text-[11px] text-[var(--text-muted)]">{review.exam}</p>
                  </div>
                </div>
                <p className="mb-1 text-xs text-[var(--accent)]">★★★★★</p>
                <p className="text-xs leading-relaxed text-[var(--text-secondary)]">{review.text}</p>
              </div>
            ))}
          </div>
        </section>
      </div>

      {/* [화면] 홈 전용 푸터 */}
      <footer className="mt-4 border-t border-[var(--border)] bg-white">
        <div className="mx-auto max-w-4xl px-4 py-6 text-center">
          <div className="mb-3 flex justify-center">
            <Image
              src="/images/brand/abubae-logo-horizontal-balanced.png"
              alt="아직 부족해도 괜찮은 배움 로고"
              width={300}
              height={129}
              className="h-auto w-full max-w-[300px]"
            />
          </div>
          <div className="mb-2 flex justify-center gap-4">
            {[
              { label: '공지사항', href: '/notices' },
              { label: '합격후기', href: '#' },
              { label: '이용약관', href: '/terms' },
              { label: '개인정보처리방침', href: '/privacy' },
            ].map(({ label, href }) => (
              <Link key={label} href={href} className="text-xs text-[var(--text-muted)] hover:text-[var(--text-secondary)]">
                {label}
              </Link>
            ))}
          </div>
          <p className="text-[11px] text-[var(--text-muted)]">© 2025 아부배. All rights reserved.</p>
        </div>
      </footer>

      {/* [화면] 홈 전용 모바일 탭바 */}
      <div className="fixed bottom-0 left-0 right-0 z-50 flex justify-around border-t border-[var(--border)] bg-white py-2 md:hidden">
        {[
          { icon: '🏠', label: '홈', href: '/', active: true },
          { icon: '📝', label: '문제풀기', href: '/exam/jeongchogi/questions', active: false },
          { icon: '📄', label: '자료', href: '/resources', active: false },
          { icon: '⭐', label: '즐겨찾기', href: '/mypage/bookmarks', active: false },
          { icon: '👤', label: '마이', href: '/mypage', active: false },
        ].map((tab) => (
          <Link key={tab.label} href={tab.href} className="flex flex-col items-center gap-0.5">
            <span className="text-xl">{tab.icon}</span>
            <span
              className={`text-[10px] font-medium ${
                tab.active ? 'text-[var(--primary)]' : 'text-[var(--text-muted)]'
              }`}
            >
              {tab.label}
            </span>
          </Link>
        ))}
      </div>
    </div>
  )
}
