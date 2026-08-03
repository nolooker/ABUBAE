'use client'

import Image from 'next/image'
import Link from 'next/link'
import { usePathname, useRouter } from 'next/navigation'
import { useEffect, useMemo, useRef, useState } from 'react'
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
  const menuRef = useRef<HTMLDivElement>(null)
  const supabase = useMemo(() => createClient(), [])
  const router = useRouter()
  const pathname = usePathname()

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
    await supabase.auth.signOut()
    router.push('/')
    router.refresh()
  }

  return (
    <nav className="sticky top-0 z-50 border-b border-[var(--border)] bg-white">
      <div className="relative mx-auto flex h-[82px] max-w-6xl items-center justify-between px-6">
        <Link
          href="/"
          className="flex h-full w-[260px] shrink-0 items-center"
          aria-label="아직 부족해도 괜찮은 배움 홈으로 이동"
        >
          <Image
            src="/images/brand/abubae-logo-horizontal-balanced.png"
            alt="아직 부족해도 괜찮은 배움 로고"
            width={1915}
            height={821}
            className="h-[62px] w-auto object-contain"
            priority
          />
        </Link>

        <div className="absolute left-1/2 flex -translate-x-1/2 items-center gap-10">
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

        {nickname ? (
          <div ref={menuRef} className="relative shrink-0">
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
          <Link href="/login" className="ab-btn ab-btn-secondary ab-btn-md shrink-0">
            로그인
          </Link>
        )}
      </div>
    </nav>
  )
}
