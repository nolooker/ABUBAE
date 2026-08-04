import Link from 'next/link'
import { notFound } from 'next/navigation'

import PracticalRoundList from '@/components/quiz/PracticalRoundList'
import { getPracticalRoundSummaries } from '@/lib/practical-content'

type Props = { params: Promise<{ slug: string }> }

export const metadata = { title: '정보처리기사 실기 기출문제' }

export default async function PracticalRoundListPage({ params }: Props) {
  const { slug } = await params
  if (slug !== 'jeongchogi') notFound()
  const rounds = await getPracticalRoundSummaries()

  return (
    <section className="mx-auto max-w-5xl px-4 py-12">
      <Link href={`/exam/${slug}/questions`} className="text-sm font-semibold text-[var(--primary)]">← 필기·실기 선택으로 돌아가기</Link>
      <p className="mt-8 text-sm font-semibold text-[var(--primary)]">정보처리기사 실기</p>
      <h1 className="mt-2 text-3xl font-bold">연도·회차 선택</h1>
      <p className="mb-8 mt-3 text-[var(--text-secondary)]">원하는 연도와 회차를 선택하면 첫 문제부터 풀 수 있습니다.</p>
      <PracticalRoundList examSlug={slug} rounds={rounds} />
      {rounds.length === 0 && (
        <p className="mt-8 rounded-xl border border-dashed border-[var(--border)] p-6 text-sm text-[var(--text-secondary)]">
          아직 공개된 실기 회차가 없습니다.
        </p>
      )}
    </section>
  )
}
