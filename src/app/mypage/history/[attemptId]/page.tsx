import Link from 'next/link'
import { notFound, redirect } from 'next/navigation'

import ExamAttemptResultView from '@/components/mypage/ExamAttemptResultView'
import { createExamAttemptRepository } from '@/lib/exam-attempt-repository'
import { getPublicPracticalRound } from '@/lib/practical-content'
import { createClient } from '@/lib/supabase/server'
import { getPublicWrittenRound } from '@/lib/written-content'

type Props = { params: Promise<{ attemptId: string }> }

export const dynamic = 'force-dynamic'

export const metadata = {
  title: '응시 기록 상세',
}

export default async function ExamHistoryDetailPage({ params }: Props) {
  const { attemptId } = await params
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) redirect(`/login?next=/mypage/history/${attemptId}`)

  const attempt = await createExamAttemptRepository(supabase).getAttempt(user.id, attemptId).catch(() => undefined)
  if (!attempt) notFound()

  const content = attempt.examType === 'practical'
    ? await getPublicPracticalRound(attempt.year, attempt.round).catch(() => undefined)
    : await getPublicWrittenRound(attempt.year, attempt.round).catch(() => undefined)

  return (
    <section className="mx-auto max-w-4xl px-4 py-8">
      <Link href="/mypage/history" className="mb-5 inline-block text-sm font-semibold text-[var(--primary)]">← 응시 기록으로 돌아가기</Link>
      {content ? (
        <ExamAttemptResultView
          slug="jeongchogi"
          title={content.title}
          attempt={attempt}
          questions={content.questions}
        />
      ) : (
        <div className="ab-card p-8 text-center text-sm text-[var(--text-muted)]">
          이 회차의 문제 원문을 더 이상 불러올 수 없습니다. 점수: {attempt.score}점 (정답 {attempt.correct} · 오답 {attempt.incorrect} · 미응답 {attempt.unanswered})
        </div>
      )}
    </section>
  )
}
