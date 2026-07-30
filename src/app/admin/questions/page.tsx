import Link from 'next/link'
import { redirect } from 'next/navigation'
import { getCurrentUserRole } from '@/lib/master-auth'
import { getWrittenRoundSummaries } from '@/lib/written-content'

type Props = {
  searchParams?: Promise<{ status?: string }>
}

export default async function AdminQuestionsPage(props: Props) {
  if ((await getCurrentUserRole()) !== 'master') redirect('/login?next=/admin/questions')
  const status = (await props?.searchParams)?.status
  const rounds = await getWrittenRoundSummaries()

  return (
    <section className="mx-auto max-w-4xl px-4 py-12">
      <div className="mb-8 flex flex-col gap-4 sm:flex-row sm:items-start sm:justify-between">
        <div>
          <p className="mb-2 text-[13px] font-bold text-[var(--primary)]">SYSTEM ADMIN</p>
          <h1 className="text-3xl font-bold text-[var(--text-primary)]">기출문제 관리</h1>
          <p className="mt-3 text-[15px] text-[var(--text-secondary)]">
            새 문항을 추가하거나, 회차를 눌러 개별 문항의 검수 상태를 확인하세요.
          </p>
        </div>
        <Link
          href="/admin/questions/new"
          className="rounded-xl bg-[var(--primary)] px-4 py-2 text-center text-sm font-bold text-white"
        >
          새 문제 추가
        </Link>
      </div>

      {status === 'created' && (
        <p role="status" aria-live="polite" className="mb-6 rounded-lg bg-emerald-50 p-4 text-sm font-semibold text-emerald-700">
          문제가 생성되었습니다.
        </p>
      )}

      <div className="space-y-3">
        {rounds.map((round) => (
          <Link
            key={`${round.year}-${round.round}`}
            href={`/admin/questions/${round.year}/${round.round}`}
            className="flex items-center justify-between gap-4 rounded-[var(--radius-lg)] border border-[var(--border)] bg-white p-5 hover:border-[var(--primary)]"
          >
            <span className="text-[15px] font-semibold text-[var(--text-primary)]">{round.year}년 {round.round}회</span>
            <span className="text-[13px] text-[var(--text-secondary)]">{round.questionCount}문항 · {round.subjectCount}과목</span>
          </Link>
        ))}
      </div>
    </section>
  )
}
