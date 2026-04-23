'use client'

import Link from 'next/link'
import { useState } from 'react'
import { ArrowRight, BookOpen, Menu, Search, Sparkles, X } from 'lucide-react'

// [화면 데이터] 헤더 상단 배너입니다.
// - enabled: false로 바꾸면 배너가 숨겨집니다.
// - href/message/cta만 바꾸면 캠페인 문구를 쉽게 교체할 수 있습니다.
const announcement = {
  enabled: true,
  message: '정처기 무료 요약노트와 오늘의 문제를 먼저 공개했어요.',
  cta: '바로 보기',
  href: '/resources',
}

// [화면 데이터] 상단 메뉴입니다.
// 아직 만들지 않은 페이지(/reviews, /premium 등)는 홈을 복잡하게 만들지 않기 위해 잠시 빼두었습니다.
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
  { label: '오늘의 문제', href: '/quiz/daily' },
  { label: '자료실', href: '/resources' },
]

export default function Header() {
  const [mobileOpen, setMobileOpen] = useState(false)
  const [bannerOpen, setBannerOpen] = useState(announcement.enabled)

  return (
    <header className="sticky top-0 z-50 bg-white border-b border-[var(--border)]">
      {/* [화면 + 기능] 상단 공지 배너. X 버튼을 누르면 현재 화면에서만 숨겨집니다. */}
      {bannerOpen && (
        <div className="border-b border-blue-100 bg-blue-50">
          <div className="max-w-6xl mx-auto flex min-h-9 items-center justify-between gap-3 px-4 py-2">
            <Link
              href={announcement.href}
              className="flex min-w-0 items-center gap-2 text-[12.5px] font-semibold text-blue-800 md:text-[13px]"
            >
              <span className="flex h-5 w-5 shrink-0 items-center justify-center rounded-full bg-white text-[var(--primary)]">
                <Sparkles size={12} />
              </span>
              <span className="truncate">{announcement.message}</span>
              <span className="hidden shrink-0 items-center gap-1 text-blue-700 sm:inline-flex">
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

      <div className="max-w-6xl mx-auto px-4 h-14 flex items-center justify-between gap-4">

        {/* [화면] 로고 */}
        <Link href="/" className="flex items-center gap-2 shrink-0">
          <div className="w-7 h-7 rounded-lg bg-[var(--primary)] flex items-center justify-center">
            <BookOpen size={15} color="white" strokeWidth={2.5} />
          </div>
          <span className="font-bold text-[15px] text-[var(--text-primary)] tracking-tight">
            아부배
          </span>
        </Link>

        {/* [화면] 데스크탑 메뉴 */}
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

        {/* [화면] 우측 검색/로그인/회원가입 버튼 */}
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

          {/* [기능] 모바일 메뉴 열기/닫기 버튼 */}
          <button
            className="md:hidden flex items-center justify-center w-8 h-8 rounded-md hover:bg-[var(--bg-muted)]"
            onClick={() => setMobileOpen(!mobileOpen)}
          >
            {mobileOpen ? <X size={18} /> : <Menu size={18} />}
          </button>
        </div>
      </div>

      {/* [화면 + 기능] 모바일 메뉴. mobileOpen이 true일 때만 보입니다. */}
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
