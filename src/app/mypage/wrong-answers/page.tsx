import Link from 'next/link'
import { redirect } from 'next/navigation'

import { examTypeLabel, type IncorrectQuestionEntry } from '@/lib/exam-attempt'
import { createExamAttemptRepository } from '@/lib/exam-attempt-repository'
import { createClient } from '@/lib/supabase/server'

export const dynamic = 'force-dynamic'

export const metadata = {
  title: '오답노트',
  description: '지금까지 채점한 회차 중 틀리거나 아직 답을 못 맞춘 문제만 모아봅니다.',
}

export default async function WrongAnswersPage() {
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) redirect('/login?next=/mypage/wrong-answers')

  const entries = await createExamAttemptRepository(supabase).listIncorrectQuestions(user.id).catch(() => [])

  const groups = new Map<string, { examType: IncorrectQuestionEntry['examType']; year: number; round: number; attemptId: string; questions: IncorrectQuestionEntry[] }>()
  for (const entry of entries) {
    const key = `${entry.examType}-${entry.year}-${entry.round}`
    const group = groups.get(key)
    if (group) {
      group.questions.push(entry)
    } else {
      groups.set(key, { examType: entry.examType, year: entry.year, round: entry.round, attemptId: entry.attemptId, questions: [entry] })
    }
  }

  return (
    <section className="mx-auto max-w-3xl px-4 py-12">
      <div className="mb-8">
        <p className="mb-2 text-[13px] font-semibold text-[var(--primary)]">마이페이지</p>
        <h1 className="text-3xl font-bold text-[var(--text-primary)]">오답노트</h1>
        <p className="mt-3 text-[15px] text-[var(--text-secondary)]">
          각 회차의 가장 최근 채점 기준으로, 아직 틀렸거나 답하지 못한 문제를 모았습니다.
        </p>
      </div>

      {groups.size > 0 ? (
        <div className="space-y-4">
          {[...groups.values()].map((group) => (
            <Link
              key={`${group.examType}-${group.year}-${group.round}`}
              href={`/mypage/history/${group.attemptId}`}
              className="ab-card block p-5 transition-colors hover:bg-[var(--bg-subtle)]"
            >
              <p className="text-[15px] font-semibold text-[var(--text-primary)]">
                {group.year}년 {group.round}회 · {examTypeLabel(group.examType)}
              </p>
              <ul className="mt-2 flex flex-wrap gap-2">
                {group.questions.map((question) => (
                  <li key={question.questionId} className="rounded-full bg-red-50 px-3 py-1 text-[13px] font-semibold text-red-700">
                    {question.questionNumber}번 · {question.subject}
                  </li>
                ))}
              </ul>
            </Link>
          ))}
        </div>
      ) : (
        <div className="ab-card p-6 text-center text-sm text-[var(--text-muted)]">아직 오답이 없습니다. 문제를 풀고 채점해보세요!</div>
      )}
    </section>
  )
}
