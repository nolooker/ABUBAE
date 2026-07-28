'use client'

import Image from 'next/image'
import Link from 'next/link'
import { useEffect, useMemo, useState } from 'react'
import { createClient } from '@/lib/supabase/client'

// [화면 데이터] 상단 네비게이션 메뉴입니다. 홈 화면과 동일한 구성으로 유지합니다.
const navItems = [
  { label: '공지사항', href: '/notices' },
  { label: '기출문제', href: '/exam/jeongchogi/questions' },
  { label: '자료실', href: '/resources' },
  { label: '합격후기', href: '/resources' },
]

export default function Header() {
  const [nickname, setNickname] = useState<string | null>(null)
  const supabase = useMemo(() => createClient(), [])

  useEffect(() => {
    function applyUser(user: { user_metadata?: { nickname?: string }; email?: string } | null | undefined) {
      setNickname(user?.user_metadata?.nickname || user?.email?.split('@')[0] || null)
    }

    supabase.auth.getUser().then(({ data }) => applyUser(data.user))

    const { data: subscription } = supabase.auth.onAuthStateChange((_event, session) => {
      applyUser(session?.user)
    })

    return () => subscription.subscription.unsubscribe()
  }, [supabase])

  return (
    <nav className="sticky top-0 z-50 border-b border-[var(--border)] bg-white">
      <div className="relative mx-auto flex h-[82px] max-w-6xl items-center justify-between overflow-hidden px-6">
        <Link
          href="/"
          className="flex h-full w-[260px] shrink-0 items-center"
          aria-label="아직 부족해도 괜찮은 배움 홈으로 이동"
        >
          <Image
            src="/images/brand/abubae-logo-primary.png"
            alt="아직 부족해도 괜찮은 배움 로고"
            width={180}
            height={180}
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
          <Link href="/mypage" className="ab-btn ab-btn-secondary ab-btn-md shrink-0">
            {nickname}님
          </Link>
        ) : (
          <Link href="/signup" className="ab-btn ab-btn-secondary ab-btn-md shrink-0">
            무료 시작
          </Link>
        )}
      </div>
    </nav>
  )
}
