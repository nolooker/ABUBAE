'use client'

import Image from 'next/image'
import Link from 'next/link'
import { usePathname, useRouter } from 'next/navigation'
import { useEffect, useMemo, useRef, useState } from 'react'
import { Menu, X } from 'lucide-react'
import { createClient } from '@/lib/supabase/client'

// [화면 데이터] 상단 네비게이션 메뉴입니다. 홈 화면과 동일한 구성으로 유지합니다.
const navItems = [
  { label: '공지사항', href: '/notices' },
  { label: '기출문제', href: '/exam/jeongchogi/questions' },
  { label: '자료실', href: '/resources' },
  { label: '자유게시판', href: '/board' },
]

export default function Header() {
  const [nickname, setNickname] = useState<string | null>(null)
  const [isMenuOpen, setIsMenuOpen] = useState(false)
  const [mobileMenuState, setMobileMenuState] = useState<{ open: boolean; pathname: string }>({ open: false, pathname: '' })
  const menuRef = useRef<HTMLDivElement>(null)
  const supabase = useMemo(() => createClient(), [])
  const router = useRouter()
  const pathname = usePathname()
  const isMobileMenuOpen = mobileMenuState.open && mobileMenuState.pathname === pathname

  function closeMobileMenu() {
    setMobileMenuState({ open: false, pathname })
  }

  function toggleMobileMenu() {
    setMobileMenuState({ open: !isMobileMenuOpen, pathname })
  }

  function applyUser(user: { user_metadata?: { nickname?: string }; email?: string } | null | undefined) {
    setNickname(user?.user_metadata?.nickname || user?.email?.split('@')[0] || null)
  }

  useEffect(() => {
    const { data: subscription } = supabase.auth.onAuthStateChange((_event, session) => {
      applyUser(session?.user)
    })

    return () => subscription.subscription.unsubscribe()
  }, [supabase])

  useEffect(() => {
    supabase.auth.getUser().then(({ data }) => applyUser(data.user))
  }, [supabase, pathname])

  useEffect(() => {
    if (!isMenuOpen) return

    function handleClickOutside(event: MouseEvent) {
      if (menuRef.current && !menuRef.current.contains(event.target as Node)) {
        setIsMenuOpen(false)
      }
    }

    document.addEventListener('mousedown', handleClickOutside)
    return () => document.removeEventListener('mousedown', handleClickOutside)
  }, [isMenuOpen])

  async function logout() {
    setIsMenuOpen(false)
    closeMobileMenu()
    await supabase.auth.signOut()
    router.push('/')
    router.refresh()
  }

  return (
    <nav className="sticky top-0 z-50 border-b border-[var(--border)] bg-white">
      <div className="relative mx-auto flex h-16 max-w-6xl items-center justify-between px-4 lg:h-[82px] lg:px-6">
        <Link
          href="/"
          className="flex h-full shrink-0 items-center"
          aria-label="아직 부족해도 괜찮은 배움 홈으로 이동"
        >
          <Image
            src="/images/brand/abubae-logo-horizontal-balanced.png"
            alt="아직 부족해도 괜찮은 배움 로고"
            width={145}
            height={62}
            className="h-10 w-auto object-contain lg:h-[62px]"
            priority
          />
        </Link>

        <div className="hidden lg:absolute lg:left-1/2 lg:flex lg:-translate-x-1/2 lg:items-center lg:gap-10">
          {navItems.map((item) => (
            <Link
              key={item.label}
              href={item.href}
              className="text-[15px] font-medium text-[var(--text-secondary)] hover:text-[var(--text-primary)]"
            >
              {item.label}
            </Link>
          ))}
        </div>

        <div className="hidden shrink-0 lg:block">
          {nickname ? (
            <div ref={menuRef} className="relative">
              <button
                type="button"
                onClick={() => setIsMenuOpen((open) => !open)}
                className="ab-btn ab-btn-secondary ab-btn-md"
              >
                {nickname}님
              </button>
              {isMenuOpen && (
                <div className="absolute right-0 top-full mt-2 w-40 overflow-hidden rounded-xl border border-[var(--border)] bg-white shadow-lg">
                  <Link
                    href="/mypage"
                    onClick={() => setIsMenuOpen(false)}
                    className="block px-4 py-2.5 text-[14px] font-medium text-[var(--text-primary)] hover:bg-[var(--bg-muted)]"
                  >
                    마이페이지
                  </Link>
                  <button
                    type="button"
                    onClick={logout}
                    className="block w-full px-4 py-2.5 text-left text-[14px] font-medium text-[var(--text-primary)] hover:bg-[var(--bg-muted)]"
                  >
                    로그아웃
                  </button>
                </div>
              )}
            </div>
          ) : (
            <Link href="/login" className="ab-btn ab-btn-secondary ab-btn-md">
              로그인
            </Link>
          )}
        </div>

        <button
          type="button"
          onClick={toggleMobileMenu}
          aria-label={isMobileMenuOpen ? '메뉴 닫기' : '메뉴 열기'}
          className="shrink-0 rounded-lg p-2 text-[var(--text-primary)] lg:hidden"
        >
          {isMobileMenuOpen ? <X size={24} /> : <Menu size={24} />}
        </button>
      </div>

      {isMobileMenuOpen && (
        <div className="border-t border-[var(--border)] bg-white lg:hidden">
          <div className="flex flex-col gap-1 px-4 py-3">
            {navItems.map((item) => (
              <Link
                key={item.label}
                href={item.href}
                onClick={() => closeMobileMenu()}
                className="rounded-lg px-3 py-2.5 text-[15px] font-medium text-[var(--text-secondary)] hover:bg-[var(--bg-muted)]"
              >
                {item.label}
              </Link>
            ))}
            <div className="mt-2 border-t border-[var(--border)] pt-2">
              {nickname ? (
                <>
                  <Link
                    href="/mypage"
                    onClick={() => closeMobileMenu()}
                    className="block rounded-lg px-3 py-2.5 text-[15px] font-medium text-[var(--text-secondary)] hover:bg-[var(--bg-muted)]"
                  >
                    {nickname}님 · 마이페이지
                  </Link>
                  <button
                    type="button"
                    onClick={logout}
                    className="block w-full rounded-lg px-3 py-2.5 text-left text-[15px] font-medium text-[var(--text-secondary)] hover:bg-[var(--bg-muted)]"
                  >
                    로그아웃
                  </button>
                </>
              ) : (
                <Link
                  href="/login"
                  onClick={() => closeMobileMenu()}
                  className="block rounded-lg px-3 py-2.5 text-[15px] font-bold text-[var(--primary)] hover:bg-[var(--bg-muted)]"
                >
                  로그인
                </Link>
              )}
            </div>
          </div>
        </div>
      )}
    </nav>
  )
}
