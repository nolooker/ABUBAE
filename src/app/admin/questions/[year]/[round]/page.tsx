import Link from 'next/link'
import { notFound, redirect } from 'next/navigation'
import QuestionDeleteButton from '@/components/admin/QuestionDeleteButton'
import RoundDeleteButton from '@/components/admin/RoundDeleteButton'
import { getCurrentUserRole } from '@/lib/master-auth'
import { listQuestionsForRound } from '@/lib/written-content'

type Props = {
  params: Promise<{ year: string; round: string }>
}

export default async function AdminRoundQuestionsPage({ params }: Props) {
  if ((await getCurrentUserRole()) !== 'master') redirect('/login?next=/admin/questions')
  const { year, round } = await params
  const yearNumber = Number(year)
  const roundNumber = Number(round)
  if (!Number.isInteger(yearNumber) || !Number.isInteger(roundNumber)) notFound()

  const questions = await listQuestionsForRound(yearNumber, roundNumber)
  const reviewedCount = questions.filter((question) => question.reviewed).length

  return (
    <section className="mx-auto max-w-4xl px-4 py-12">
      <Link href="/admin/questions" className="text-sm font-semibold text-[var(--primary)]">← 기출문제 관리로 돌아가기</Link>

      <div className="mt-6 mb-8 flex flex-col gap-4 sm:flex-row sm:items-start sm:justify-between">
        <div>
          <p className="mb-2 text-[13px] font-bold text-[var(--primary)]">SYSTEM ADMIN</p>
          <h1 className="text-3xl font-bold text-[var(--text-primary)]">{yearNumber}년 {roundNumber}회 문항 목록</h1>
          <p className="mt-3 text-[15px] text-[var(--text-secondary)]">
            총 {questions.length}문항 중 {reviewedCount}문항 검수 완료. 개별 문항 수정은 실제 문제풀이 화면에서 합니다.
          </p>
        </div>
        <div className="flex flex-col items-stretch gap-2 sm:flex-row sm:items-start">
          <Link
            href={`/exam/jeongchogi/questions/written/${yearNumber}/${roundNumber}`}
            className="rounded-xl border border-[var(--border)] bg-white px-4 py-2 text-center text-sm font-bold text-[var(--text-primary)] hover:bg-[var(--bg-subtle)]"
          >
            문제풀이 화면에서 수정하기
          </Link>
          <RoundDeleteButton year={yearNumber} round={roundNumber} />
        </div>
      </div>

      {questions.length === 0 && (
        <p className="rounded-[var(--radius-lg)] border border-dashed border-[var(--border)] p-6 text-sm text-[var(--text-secondary)]">
          이 회차에는 아직 문항이 없습니다.
        </p>
      )}

      <div className="space-y-2">
        {questions.map((question) => (
          <div
            key={question.id}
            className="flex items-start justify-between gap-4 rounded-[var(--radius-lg)] border border-[var(--border)] bg-white p-4"
          >
            <div className="min-w-0">
              <p className="text-sm font-semibold text-[var(--text-secondary)]">{question.number}번 · {question.subject}</p>
              <p className="mt-1 truncate text-[15px] text-[var(--text-primary)]">{question.content}</p>
            </div>
            <div className="flex shrink-0 items-center gap-2">
              <span className={question.published ? 'rounded-full bg-emerald-100 px-2.5 py-1 text-xs font-bold text-emerald-700' : 'rounded-full bg-slate-100 px-2.5 py-1 text-xs font-bold text-slate-700'}>
                {question.published ? '공개' : '비공개'}
              </span>
              <span className={question.reviewed ? 'rounded-full bg-blue-100 px-2.5 py-1 text-xs font-bold text-blue-700' : 'rounded-full bg-orange-100 px-2.5 py-1 text-xs font-bold text-orange-700'}>
                {question.reviewed ? '검수 완료' : '검수 대기'}
              </span>
              <QuestionDeleteButton questionId={question.id} />
            </div>
          </div>
        ))}
      </div>
    </section>
  )
}
