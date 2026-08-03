'use client'

import Image from 'next/image'
import Link from 'next/link'
import { usePathname } from 'next/navigation'
import { useEffect, useMemo, useState } from 'react'
import { createClient } from '@/lib/supabase/client'

export default function Footer() {
  const pathname = usePathname()
  const [isMaster, setIsMaster] = useState(false)
  const supabase = useMemo(() => createClient(), [])

  useEffect(() => {
    let active = true

    async function checkRole() {
      const { data: { user } } = await supabase.auth.getUser()
      if (!user) {
        if (active) setIsMaster(false)
        return
      }

      const { data } = await supabase.from('users').select('role').eq('id', user.id).single()
      if (active) setIsMaster(data?.role === 'master')
    }

    checkRole()

    const { data: subscription } = supabase.auth.onAuthStateChange(() => checkRole())
    return () => {
      active = false
      subscription.subscription.unsubscribe()
    }
  }, [supabase])

  if (pathname === '/') {
    return null
  }

  return (
    <footer className="mt-20 border-t border-[var(--border)] bg-[var(--bg-subtle)]">
      <div className="mx-auto max-w-6xl px-4 py-10">
        <div className="grid grid-cols-2 gap-8 md:grid-cols-[minmax(0,1.4fr)_repeat(3,minmax(0,1fr))]">
          <div className="col-span-2 md:col-span-1">
            <Link href="/" className="mb-3 flex items-center">
              <Image
                src="/images/brand/abubae-logo-horizontal-balanced.png"
                alt="아부배 로고"
                width={1915}
                height={821}
                className="h-auto w-full max-w-[180px] object-contain"
              />
            </Link>
            <p className="max-w-xs text-[13px] leading-relaxed text-[var(--text-secondary)]">
              자격증을 준비하는 모든 분을 위한
              <br />
              학습 콘텐츠 플랫폼
            </p>
          </div>

          <div className="text-[13px]">
            <p className="mb-2 font-semibold text-[var(--text-primary)]">시험</p>
            <div className="flex flex-col gap-1.5 text-[var(--text-secondary)]">
              <Link href="/exam/jeongchogi" className="hover:text-[var(--primary)]">
                정보처리기사
              </Link>
              <Link href="/exam/jeongchogi/schedule" className="hover:text-[var(--primary)]">
                시험일정
              </Link>
            </div>
          </div>

          <div className="text-[13px]">
            <p className="mb-2 font-semibold text-[var(--text-primary)]">바로가기</p>
            <div className="flex flex-col gap-1.5 text-[var(--text-secondary)]">
              <Link href="/notices" className="hover:text-[var(--primary)]">
                공지사항
              </Link>
              <Link href="/board" className="hover:text-[var(--primary)]">
                자유게시판
              </Link>
              <Link href="/resources" className="hover:text-[var(--primary)]">
                자료실
              </Link>
              <Link href="/mypage" className="hover:text-[var(--primary)]">
                마이페이지
              </Link>
              {isMaster && (
                <Link href="/admin" className="hover:text-[var(--primary)]">
                  관리자
                </Link>
              )}
            </div>
          </div>

          <div className="text-[13px]">
            <p className="mb-2 font-semibold text-[var(--text-primary)]">약관</p>
            <div className="flex flex-col gap-1.5 text-[var(--text-secondary)]">
              <Link href="/terms" className="hover:text-[var(--primary)]">
                이용약관
              </Link>
              <Link href="/privacy" className="hover:text-[var(--primary)]">
                개인정보처리방침
              </Link>
            </div>
          </div>
        </div>

        <div className="mt-8 border-t border-[var(--border)] pt-6 text-center text-[12px] text-[var(--text-muted)]">
          <p>© 2025 아부배. All rights reserved.</p>
        </div>
      </div>
    </footer>
  )
}
