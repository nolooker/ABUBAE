import Link from 'next/link'
import { redirect } from 'next/navigation'

import { examTypeLabel } from '@/lib/exam-attempt'
import { createExamAttemptRepository } from '@/lib/exam-attempt-repository'
import { createClient } from '@/lib/supabase/server'

export const dynamic = 'force-dynamic'

export const metadata = {
  title: '응시 기록',
  description: '지금까지 채점한 정처기 필기·실기 회차와 점수를 확인하세요.',
}

function formattedDate(timestamp: string) {
  return new Intl.DateTimeFormat('ko-KR', { year: 'numeric', month: 'long', day: 'numeric', timeZone: 'UTC' }).format(
    new Date(timestamp),
  )
}

export default async function ExamHistoryPage() {
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) redirect('/login?next=/mypage/history')

  const attempts = await createExamAttemptRepository(supabase).listAttempts(user.id).catch(() => [])

  return (
    <section className="mx-auto max-w-3xl px-4 py-12">
      <div className="mb-8">
        <p className="mb-2 text-[13px] font-semibold text-[var(--primary)]">마이페이지</p>
        <h1 className="text-3xl font-bold text-[var(--text-primary)]">응시 기록</h1>
        <p className="mt-3 text-[15px] text-[var(--text-secondary)]">채점을 완료한 회차만 기록됩니다.</p>
      </div>

      {attempts.length > 0 ? (
        <div className="space-y-2">
          {attempts.map((attempt) => (
            <Link
              key={attempt.id}
              href={`/mypage/history/${attempt.id}`}
              className="ab-card flex items-center justify-between gap-4 p-5 transition-colors hover:bg-[var(--bg-subtle)]"
            >
              <div className="min-w-0">
                <p className="truncate text-[15px] font-semibold text-[var(--text-primary)]">
                  {attempt.year}년 {attempt.round}회 · {examTypeLabel(attempt.examType)}
                </p>
                <p className="mt-1 text-[13px] text-[var(--text-secondary)]">
                  {formattedDate(attempt.createdAt)} · 정답 {attempt.correct} · 오답 {attempt.incorrect} · 미응답 {attempt.unanswered}
                </p>
              </div>
              <span className="shrink-0 text-lg font-black text-[var(--primary)]">{attempt.score}점</span>
            </Link>
          ))}
        </div>
      ) : (
        <div className="ab-card p-6 text-center text-sm text-[var(--text-muted)]">아직 채점 기록이 없습니다. 문제를 풀고 채점해보세요!</div>
      )}
    </section>
  )
}
