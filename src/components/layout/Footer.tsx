'use client'

import Link from 'next/link'
import { usePathname } from 'next/navigation'
import { useEffect, useMemo, useState } from 'react'
import { BookOpen } from 'lucide-react'
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
        <div className="flex flex-col justify-between gap-8 md:flex-row">
          <div>
            <Link href="/" className="mb-3 flex items-center gap-2">
              <div className="flex h-6 w-6 items-center justify-center rounded-md bg-[var(--primary)]">
                <BookOpen size={13} color="white" strokeWidth={2.5} />
              </div>
              <span className="text-[14px] font-bold">아부배</span>
            </Link>
            <p className="max-w-xs text-[13px] leading-relaxed text-[var(--text-secondary)]">
              자격증을 준비하는 모든 분을 위한
              <br />
              학습 콘텐츠 플랫폼
            </p>
          </div>

          <div className="flex gap-12 text-[13px]">
            <div>
              <p className="mb-2 font-semibold text-[var(--text-primary)]">시험</p>
              <div className="flex flex-col gap-1.5 text-[var(--text-secondary)]">
                <Link href="/exam/jeongchogi" className="hover:text-[var(--primary)]">
                  정보처리기사
                </Link>
                <Link href="/exam/sqld" className="hover:text-[var(--primary)]">
                  SQLD
                </Link>
                <Link href="/exam/comhwal" className="hover:text-[var(--primary)]">
                  컴퓨터활용능력
                </Link>
              </div>
            </div>
            <div>
              <p className="mb-2 font-semibold text-[var(--text-primary)]">서비스</p>
              <div className="flex flex-col gap-1.5 text-[var(--text-secondary)]">
                <Link href="/quiz/daily" className="hover:text-[var(--primary)]">
                  문제풀기
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
          </div>
        </div>

        <div className="mt-8 flex flex-col items-center justify-between gap-2 border-t border-[var(--border)] pt-6 text-[12px] text-[var(--text-muted)] md:flex-row">
          <p>© 2025 아부배. All rights reserved.</p>
          <div className="flex gap-4">
            <Link href="/terms" className="hover:text-[var(--text-secondary)]">
              이용약관
            </Link>
            <Link href="/privacy" className="hover:text-[var(--text-secondary)]">
              개인정보처리방침
            </Link>
          </div>
        </div>
      </div>
    </footer>
  )
}
