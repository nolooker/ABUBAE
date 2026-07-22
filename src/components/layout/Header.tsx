'use client'

import Link from 'next/link'
import { useState } from 'react'
import { usePathname } from 'next/navigation'
import { ArrowRight, Menu, Search, Sparkles, X } from 'lucide-react'

// [화면 데이터] 상단 배너 문구입니다.
// enabled를 false로 바꾸면 홈/내부 페이지 모두에서 숨길 수 있습니다.
const announcement = {
  enabled: false,
  message: '정처기 무료 요약노트와 오늘의 문제를 먼저 공개했어요.',
  cta: '바로 보기',
  href: '/resources',
}

// [화면 데이터] 상단 네비게이션 메뉴입니다.
// 아직 없는 페이지는 넣지 않고, 지금 실제로 탐색 가능한 화면만 노출합니다.
const navItems = [
  { label: '정처기', href: '/exam/jeongchogi' },
  { label: 'SQLD', href: '/exam/sqld' },
  { label: '자료실', href: '/resources' },
  { label: '기출문제', href: '/exam/jeongchogi/questions' },
]

export default function Header() {
  const pathname = usePathname()
  const [mobileOpen, setMobileOpen] = useState(false)
  const [bannerOpen, setBannerOpen] = useState(announcement.enabled)

  if (pathname === '/') {
    return null
  }

  return (
    <>
      <header className="sticky top-0 z-50 bg-[var(--bg-subtle)]/95 backdrop-blur">
        {/* [기능] 닫기 가능한 상단 공지 배너 */}
        {bannerOpen && (
          <div className="border-b border-blue-100 bg-blue-50/90">
            <div className="mx-auto flex min-h-10 max-w-6xl items-center justify-between gap-3 px-4 py-2">
              <Link
                href={announcement.href}
                className="flex min-w-0 items-center gap-2 text-[12.5px] font-semibold text-blue-800"
              >
                <span className="flex h-5 w-5 shrink-0 items-center justify-center rounded-full bg-white text-[var(--primary)]">
                  <Sparkles size={12} />
                </span>
                <span className="truncate">{announcement.message}</span>
                <span className="hidden items-center gap-1 text-blue-700 sm:inline-flex">
                  {announcement.cta}
                  <ArrowRight size={12} />
                </span>
              </Link>

              <button
                type="button"
                aria-label="상단 배너 닫기"
                onClick={() => setBannerOpen(false)}
                className="flex h-6 w-6 shrink-0 items-center justify-center rounded-md text-blue-700 transition-colors hover:bg-white"
              >
                <X size={14} />
              </button>
            </div>
          </div>
        )}

        {/* [화면] 디자인 시스템 기준의 카드형 네비게이션 바 */}
        <div className="mx-auto max-w-6xl px-4 py-3">
          <div className="flex min-h-[60px] items-center justify-between gap-4 rounded-[18px] border border-[var(--border)] bg-white px-4 shadow-sm md:px-5">
            <Link href="/" className="flex items-center gap-2 shrink-0">
              <span className="text-[18px] font-extrabold tracking-tight text-[var(--primary)]">
                아부<span className="text-[var(--accent)]">배</span>
              </span>
            </Link>

            <nav className="hidden items-center gap-6 md:flex">
              {navItems.map((item) => {
                const active = pathname === item.href || pathname?.startsWith(`${item.href}/`)

                return (
                  <Link
                    key={item.label}
                    href={item.href}
                    className={`text-[13px] font-medium transition-colors ${
                      active
                        ? 'text-[var(--primary)]'
                        : 'text-[var(--text-secondary)] hover:text-[var(--text-primary)]'
                    }`}
                  >
                    {item.label}
                  </Link>
                )
              })}
            </nav>

            <div className="flex items-center gap-2">
              <button
                type="button"
                aria-label="검색"
                className="hidden h-9 w-9 items-center justify-center rounded-full text-[var(--text-secondary)] transition-colors hover:bg-[var(--bg-subtle)] md:flex"
              >
                <Search size={16} />
              </button>

              <Link
                href="/signup"
                className="hidden rounded-xl border border-[var(--border-strong)] bg-white px-4 py-2 text-[13px] font-semibold text-[var(--text-primary)] transition-colors hover:bg-[var(--bg-subtle)] md:inline-flex"
              >
                무료 시작
              </Link>

              <button
                type="button"
                aria-label="모바일 메뉴 열기"
                onClick={() => setMobileOpen((prev) => !prev)}
                className="flex h-9 w-9 items-center justify-center rounded-full text-[var(--text-primary)] transition-colors hover:bg-[var(--bg-subtle)] md:hidden"
              >
                {mobileOpen ? <X size={18} /> : <Menu size={18} />}
              </button>
            </div>
          </div>
        </div>

        {/* [화면 + 기능] 모바일 전용 메뉴 */}
        {mobileOpen && (
          <div className="mx-auto max-w-6xl px-4 pb-3 md:hidden">
            <div className="rounded-[18px] border border-[var(--border)] bg-white p-3 shadow-sm">
              <div className="flex flex-col gap-1">
                {navItems.map((item) => (
                  <Link
                    key={item.label}
                    href={item.href}
                    onClick={() => setMobileOpen(false)}
                    className="rounded-xl px-3 py-2 text-[14px] font-medium text-[var(--text-secondary)] transition-colors hover:bg-[var(--bg-subtle)] hover:text-[var(--text-primary)]"
                  >
                    {item.label}
                  </Link>
                ))}
              </div>

              <div className="mt-3 flex items-center gap-2 border-t border-[var(--border)] pt-3">
                <Link
                  href="/login"
                  onClick={() => setMobileOpen(false)}
                  className="flex flex-1 items-center justify-center rounded-xl border border-[var(--border)] px-3 py-2 text-[13px] font-medium text-[var(--text-primary)]"
                >
                  로그인
                </Link>
                <Link
                  href="/signup"
                  onClick={() => setMobileOpen(false)}
                  className="flex flex-1 items-center justify-center rounded-xl bg-[var(--primary)] px-3 py-2 text-[13px] font-semibold text-white"
                >
                  무료 시작
                </Link>
              </div>
            </div>
          </div>
        )}
      </header>
    </>
  )
}
