import Link from 'next/link'
import { redirect } from 'next/navigation'
import { BookMarked, Download, History, ShieldCheck, UserRound, XCircle } from 'lucide-react'
import { createClient } from '@/lib/supabase/server'
import { getCurrentUserRole } from '@/lib/master-auth'
import AccountSettingsForm from '@/components/mypage/AccountSettingsForm'

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

  const role = await getCurrentUserRole(supabase)
  const isMaster = role === 'master'

  const nickname = data.user.user_metadata?.nickname || data.user.email?.split('@')[0] || '학습자'

  return (
    <section className="max-w-6xl mx-auto px-4 py-12">
      <div className="mb-8">
        <p className="text-[13px] font-semibold text-[var(--primary)] mb-2">마이페이지</p>
        <h1 className="text-3xl font-bold text-[var(--text-primary)]">{nickname}님, 다시 공부해볼까요?</h1>
        <p className="text-[15px] text-[var(--text-secondary)] mt-3">
          응시 기록, 오답노트, 즐겨찾기에서 지금까지의 학습 현황을 확인하세요.
        </p>
      </div>

      <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
        <div className="bg-white border border-[var(--border)] rounded-[var(--radius-lg)] p-5">
          <UserRound size={20} className="text-[var(--primary)] mb-3" />
          <h2 className="text-[15px] font-bold text-[var(--text-primary)]">계정</h2>
          <p className="text-[13px] text-[var(--text-secondary)] mt-2">{data.user.email}</p>
          <AccountSettingsForm currentNickname={nickname} />
        </div>

        <Link
          href="/mypage/bookmarks"
          className="bg-white border border-[var(--border)] rounded-[var(--radius-lg)] p-5 hover:border-[var(--primary)] transition-colors"
        >
          <BookMarked size={20} className="text-[var(--primary)] mb-3" />
          <h2 className="text-[15px] font-bold text-[var(--text-primary)]">즐겨찾기</h2>
          <p className="text-[13px] text-[var(--text-secondary)] mt-2">다시 보고 싶어 표시해둔 문제를 확인합니다.</p>
        </Link>

        <div className="bg-white border border-[var(--border)] rounded-[var(--radius-lg)] p-5">
          <Download size={20} className="text-[var(--primary)] mb-3" />
          <h2 className="text-[15px] font-bold text-[var(--text-primary)]">다운로드 자료</h2>
          <p className="text-[13px] text-[var(--text-secondary)] mt-2">무료 요약 PDF 연결을 준비 중입니다.</p>
        </div>

        <Link
          href="/mypage/history"
          className="bg-white border border-[var(--border)] rounded-[var(--radius-lg)] p-5 hover:border-[var(--primary)] transition-colors"
        >
          <History size={20} className="text-[var(--primary)] mb-3" />
          <h2 className="text-[15px] font-bold text-[var(--text-primary)]">응시 기록</h2>
          <p className="text-[13px] text-[var(--text-secondary)] mt-2">채점했던 회차와 점수를 다시 확인합니다.</p>
        </Link>

        <Link
          href="/mypage/wrong-answers"
          className="bg-white border border-[var(--border)] rounded-[var(--radius-lg)] p-5 hover:border-[var(--primary)] transition-colors"
        >
          <XCircle size={20} className="text-[var(--primary)] mb-3" />
          <h2 className="text-[15px] font-bold text-[var(--text-primary)]">오답노트</h2>
          <p className="text-[13px] text-[var(--text-secondary)] mt-2">틀리거나 아직 못 맞춘 문제만 모아봅니다.</p>
        </Link>

        {isMaster && (
          <Link
            href="/admin"
            className="bg-white border border-[var(--border)] rounded-[var(--radius-lg)] p-5 hover:border-[var(--primary)] transition-colors"
          >
            <ShieldCheck size={20} className="text-[var(--primary)] mb-3" />
            <h2 className="text-[15px] font-bold text-[var(--text-primary)]">관리자 페이지</h2>
            <p className="text-[13px] text-[var(--text-secondary)] mt-2">문제, 게시판 신고, 유저 관리로 이동합니다.</p>
          </Link>
        )}
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
