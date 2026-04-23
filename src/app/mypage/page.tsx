import Link from 'next/link'
import { redirect } from 'next/navigation'
import { BookMarked, Download, UserRound } from 'lucide-react'
import { createClient } from '@/lib/supabase/server'

export const metadata = {
  title: '마이페이지',
  description: '아부배 학습 기록, 즐겨찾기, 다운로드 자료를 확인하세요.',
}

export default async function MyPage() {
  const supabase = await createClient()
  const { data } = await supabase.auth.getUser()

  if (!data.user) {
    redirect('/login')
  }

  const nickname = data.user.user_metadata?.nickname || data.user.email?.split('@')[0] || '학습자'

  return (
    <section className="max-w-6xl mx-auto px-4 py-12">
      <div className="mb-8">
        <p className="text-[13px] font-semibold text-[var(--primary)] mb-2">마이페이지</p>
        <h1 className="text-3xl font-bold text-[var(--text-primary)]">{nickname}님, 다시 공부해볼까요?</h1>
        <p className="text-[15px] text-[var(--text-secondary)] mt-3">
          지금은 계정 연결 확인용 기본 화면입니다. 다음 단계에서 즐겨찾기와 풀이 기록을 실제 DB와 연결합니다.
        </p>
      </div>

      <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
        <div className="bg-white border border-[var(--border)] rounded-[var(--radius-lg)] p-5">
          <UserRound size={20} className="text-[var(--primary)] mb-3" />
          <h2 className="text-[15px] font-bold text-[var(--text-primary)]">계정</h2>
          <p className="text-[13px] text-[var(--text-secondary)] mt-2">{data.user.email}</p>
        </div>

        <div className="bg-white border border-[var(--border)] rounded-[var(--radius-lg)] p-5">
          <BookMarked size={20} className="text-[var(--primary)] mb-3" />
          <h2 className="text-[15px] font-bold text-[var(--text-primary)]">즐겨찾기</h2>
          <p className="text-[13px] text-[var(--text-secondary)] mt-2">아직 저장한 문제가 없습니다.</p>
        </div>

        <div className="bg-white border border-[var(--border)] rounded-[var(--radius-lg)] p-5">
          <Download size={20} className="text-[var(--primary)] mb-3" />
          <h2 className="text-[15px] font-bold text-[var(--text-primary)]">다운로드 자료</h2>
          <p className="text-[13px] text-[var(--text-secondary)] mt-2">무료 요약 PDF 연결을 준비 중입니다.</p>
        </div>
      </div>

      <div className="mt-8">
        <Link
          href="/exam/jeongchogi/questions"
          className="inline-flex items-center justify-center px-5 py-3 rounded-xl bg-[var(--primary)] text-white text-[14px] font-bold hover:bg-[var(--primary-hover)] transition-colors"
        >
          정처기 문제 풀러가기
        </Link>
      </div>
    </section>
  )
}
