'use client'

import Link from 'next/link'
import { useState } from 'react'
import { Search, Menu, X, BookOpen } from 'lucide-react'

const navItems = [
  {
    label: '시험 정보',
    href: '/exam',
    children: [
      { label: '정보처리기사', href: '/exam/jeongchogi' },
      { label: 'SQLD', href: '/exam/sqld' },
      { label: '컴퓨터활용능력 1급', href: '/exam/comhwal' },
    ],
  },
  { label: '문제풀기', href: '/quiz' },
  { label: '자료실', href: '/resources' },
  { label: '합격후기', href: '/reviews' },
  { label: '프리미엄', href: '/premium' },
]

export default function Header() {
  const [mobileOpen, setMobileOpen] = useState(false)

  return (
    <header className="sticky top-0 z-50 bg-white border-b border-[var(--border)]">
      <div className="max-w-6xl mx-auto px-4 h-14 flex items-center justify-between gap-4">

        {/* 로고 */}
        <Link href="/" className="flex items-center gap-2 shrink-0">
          <div className="w-7 h-7 rounded-lg bg-[var(--primary)] flex items-center justify-center">
            <BookOpen size={15} color="white" strokeWidth={2.5} />
          </div>
          <span className="font-bold text-[15px] text-[var(--text-primary)] tracking-tight">
            아부배
          </span>
        </Link>

        {/* 데스크탑 메뉴 */}
        <nav className="hidden md:flex items-center gap-1">
          {navItems.map((item) => (
            <Link
              key={item.label}
              href={item.href}
              className="px-3 py-1.5 text-[13.5px] font-medium text-[var(--text-secondary)] hover:text-[var(--text-primary)] hover:bg-[var(--bg-muted)] rounded-md transition-colors"
            >
              {item.label}
            </Link>
          ))}
        </nav>

        {/* 우측 버튼 */}
        <div className="flex items-center gap-2">
          <button className="hidden md:flex items-center justify-center w-8 h-8 rounded-md hover:bg-[var(--bg-muted)] text-[var(--text-secondary)] transition-colors">
            <Search size={16} />
          </button>
          <Link
            href="/login"
            className="hidden md:block text-[13px] font-medium text-[var(--text-secondary)] hover:text-[var(--text-primary)] transition-colors"
          >
            로그인
          </Link>
          <Link
            href="/signup"
            className="hidden md:block px-3 py-1.5 text-[13px] font-semibold bg-[var(--primary)] text-white rounded-lg hover:bg-[var(--primary-hover)] transition-colors"
          >
            무료 시작
          </Link>

          {/* 모바일 햄버거 */}
          <button
            className="md:hidden flex items-center justify-center w-8 h-8 rounded-md hover:bg-[var(--bg-muted)]"
            onClick={() => setMobileOpen(!mobileOpen)}
          >
            {mobileOpen ? <X size={18} /> : <Menu size={18} />}
          </button>
        </div>
      </div>

      {/* 모바일 메뉴 */}
      {mobileOpen && (
        <div className="md:hidden border-t border-[var(--border)] bg-white px-4 py-3 flex flex-col gap-1">
          {navItems.map((item) => (
            <Link
              key={item.label}
              href={item.href}
              onClick={() => setMobileOpen(false)}
              className="px-3 py-2 text-[14px] font-medium text-[var(--text-secondary)] hover:text-[var(--text-primary)] hover:bg-[var(--bg-muted)] rounded-lg transition-colors"
            >
              {item.label}
            </Link>
          ))}
          <div className="flex gap-2 mt-2 pt-2 border-t border-[var(--border)]">
            <Link href="/login" className="flex-1 py-2 text-center text-[13px] font-medium border border-[var(--border)] rounded-lg">로그인</Link>
            <Link href="/signup" className="flex-1 py-2 text-center text-[13px] font-semibold bg-[var(--primary)] text-white rounded-lg">무료 시작</Link>
          </div>
        </div>
      )}
    </header>
  )
}
