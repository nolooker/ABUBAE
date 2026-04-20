import Link from 'next/link'
import { BookOpen } from 'lucide-react'

export default function Footer() {
  return (
    <footer className="border-t border-[var(--border)] bg-[var(--bg-subtle)] mt-20">
      <div className="max-w-6xl mx-auto px-4 py-10">
        <div className="flex flex-col md:flex-row justify-between gap-8">
          {/* 브랜드 */}
          <div>
            <Link href="/" className="flex items-center gap-2 mb-3">
              <div className="w-6 h-6 rounded-md bg-[var(--primary)] flex items-center justify-center">
                <BookOpen size={13} color="white" strokeWidth={2.5} />
              </div>
              <span className="font-bold text-[14px]">아부배</span>
            </Link>
            <p className="text-[13px] text-[var(--text-secondary)] max-w-xs leading-relaxed">
              자격증을 준비하는 모든 분을 위한<br />학습 콘텐츠 플랫폼
            </p>
          </div>

          {/* 링크 */}
          <div className="flex gap-12 text-[13px]">
            <div>
              <p className="font-semibold text-[var(--text-primary)] mb-2">시험</p>
              <div className="flex flex-col gap-1.5 text-[var(--text-secondary)]">
                <Link href="/exam/jeongchogi" className="hover:text-[var(--primary)]">정보처리기사</Link>
                <Link href="/exam/sqld" className="hover:text-[var(--primary)]">SQLD</Link>
                <Link href="/exam/comhwal" className="hover:text-[var(--primary)]">컴퓨터활용능력</Link>
              </div>
            </div>
            <div>
              <p className="font-semibold text-[var(--text-primary)] mb-2">서비스</p>
              <div className="flex flex-col gap-1.5 text-[var(--text-secondary)]">
                <Link href="/quiz" className="hover:text-[var(--primary)]">문제풀기</Link>
                <Link href="/resources" className="hover:text-[var(--primary)]">자료실</Link>
                <Link href="/reviews" className="hover:text-[var(--primary)]">합격후기</Link>
                <Link href="/premium" className="hover:text-[var(--primary)]">프리미엄</Link>
              </div>
            </div>
          </div>
        </div>

        <div className="mt-8 pt-6 border-t border-[var(--border)] flex flex-col md:flex-row justify-between items-center gap-2 text-[12px] text-[var(--text-muted)]">
          <p>© 2025 아부배. All rights reserved.</p>
          <div className="flex gap-4">
            <Link href="/terms" className="hover:text-[var(--text-secondary)]">이용약관</Link>
            <Link href="/privacy" className="hover:text-[var(--text-secondary)]">개인정보처리방침</Link>
          </div>
        </div>
      </div>
    </footer>
  )
}
