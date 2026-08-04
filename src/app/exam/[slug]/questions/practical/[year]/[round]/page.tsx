import Link from 'next/link'
import { notFound } from 'next/navigation'

import PracticalRoundRunner from '@/components/quiz/PracticalRoundRunner'
import { getPublicPracticalRound } from '@/lib/practical-content'

type Props = { params: Promise<{ slug: string; year: string; round: string }> }

export const dynamic = 'force-dynamic'

export default async function PracticalRoundPage({ params }: Props) {
  const { slug, year, round } = await params
  if (slug !== 'jeongchogi') notFound()
  const content = await getPublicPracticalRound(Number(year), Number(round))
  if (!content) notFound()

  return (
    <section className="mx-auto max-w-7xl px-4 py-8">
      <Link href={`/exam/${slug}/questions/practical`} className="mb-5 inline-block text-sm font-semibold text-[var(--primary)]">← 회차 선택으로 돌아가기</Link>
      <PracticalRoundRunner
        year={Number(year)}
        round={Number(round)}
        title={content.title}
        questions={content.questions}
      />
    </section>
  )
}
