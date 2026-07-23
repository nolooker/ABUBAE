import Link from 'next/link'
import { notFound } from 'next/navigation'

import WrittenRoundRunner from '@/components/quiz/WrittenRoundRunner'
import { getPublicWrittenRound } from '@/lib/written-content'

type Props = { params: Promise<{ slug: string; year: string; round: string }> }

export const dynamic = 'force-dynamic'

export default async function WrittenRoundPage({ params }: Props) {
  const { slug, year, round } = await params
  if (slug !== 'jeongchogi') notFound()
  const content = await getPublicWrittenRound(Number(year), Number(round))
  if (!content) notFound()

  return (
    <section className="mx-auto max-w-7xl px-4 py-8">
      <Link href={`/exam/${slug}/questions/written`} className="mb-5 inline-block text-sm font-semibold text-[var(--primary)]">← 회차 선택으로 돌아가기</Link>
      <WrittenRoundRunner year={Number(year)} round={Number(round)} title={content.title} questions={content.questions} />
    </section>
  )
}
