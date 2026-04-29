'use client'

import Image from 'next/image'
import Link from 'next/link'
import { useState } from 'react'
import { usePathname } from 'next/navigation'
import { Menu, Search, X } from 'lucide-react'

const navItems = [
  { label: '정처기', href: '/exam/jeongchogi' },
  { label: '기출문제', href: '/exam/jeongchogi/questions' },
  { label: '오늘의 문제', href: '/quiz/daily' },
  { label: '자료실', href: '/resources' },
  { label: '블로그', href: '/blog' },
  { label: '합격후기', href: '/reviews' },
  { label: '자유게시판', href: '/board' },
]

export default function Header() {
  const pathname = usePathname()
  const [mobileOpen, setMobileOpen] = useState(false)

  if (pathname === '/') {
    return null
  }

  return (
    <header className="sticky top-0 z-50 bg-[var(--bg-subtle)]/95 backdrop-blur">
      <div className="mx-auto max-w-6xl px-4 py-3">
        <div className="flex min-h-[60px] items-center justify-between gap-4 rounded-[18px] border border-[var(--border)] bg-white px-4 shadow-sm md:px-5">
          <Link href="/" className="flex h-full shrink-0 items-center" aria-label="홈으로 이동">
            <Image
              src="/images/brand/archive/abubae-logo-08.png"
              alt="아부배 로고"
              width={180}
              height={180}
              className="h-[44px] w-auto object-contain"
              priority
            />
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
            <Link
              href="/admin/questions"
              className="hidden rounded-xl border border-[var(--border)] bg-[var(--bg-subtle)] px-3 py-2 text-[12px] font-semibold text-[var(--text-secondary)] transition-colors hover:border-[var(--border-strong)] hover:text-[var(--text-primary)] lg:inline-flex"
            >
              Admin
            </Link>

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

            <div className="mt-3 flex flex-col gap-2 border-t border-[var(--border)] pt-3">
              <Link
                href="/admin/questions"
                onClick={() => setMobileOpen(false)}
                className="flex items-center justify-center rounded-xl border border-[var(--border)] px-3 py-2 text-[13px] font-medium text-[var(--text-primary)]"
              >
                Admin
              </Link>
              <div className="flex items-center gap-2">
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
        </div>
      )}
    </header>
  )
}
