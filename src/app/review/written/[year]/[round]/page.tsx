import Link from 'next/link'
import { notFound } from 'next/navigation'

import WrittenContentReviewer from '@/components/review/WrittenContentReviewer'
import { getReviewRound } from '@/lib/written-review'

type Props = {
  params: Promise<{ year: string; round: string }>
}

export default async function WrittenReviewRoundPage({ params }: Props) {
  if (process.env.NODE_ENV === 'production' && process.env.ENABLE_CONTENT_REVIEW !== 'true') {
    notFound()
  }

  const values = await params
  const year = Number(values.year)
  const roundNumber = Number(values.round)
  const reviewRound = getReviewRound(year, roundNumber)

  if (!reviewRound) notFound()

  return (
    <section className="mx-auto max-w-7xl px-4 py-8">
      <Link href="/review/written" className="mb-5 inline-block text-sm font-semibold text-[var(--primary)]">
        ← 회차 선택으로 돌아가기
      </Link>
      <WrittenContentReviewer title={reviewRound.title} questions={reviewRound.questions} />
    </section>
  )
}
