import Link from 'next/link'
import { notFound } from 'next/navigation'

import WrittenRoundList from '@/components/quiz/WrittenRoundList'
import { getWrittenRoundSummaries } from '@/lib/written-content'

type Props = { params: Promise<{ slug: string }> }

export const metadata = { title: '정보처리기사 필기 기출문제' }

export default async function WrittenRoundListPage({ params }: Props) {
  const { slug } = await params
  if (slug !== 'jeongchogi') notFound()
  const rounds = await getWrittenRoundSummaries()

  return (
    <section className="mx-auto max-w-5xl px-4 py-12">
      <Link href={`/exam/${slug}/questions`} className="text-sm font-semibold text-[var(--primary)]">← 필기·실기 선택으로 돌아가기</Link>
      <p className="mt-8 text-sm font-semibold text-[var(--primary)]">정보처리기사 필기</p>
      <h1 className="mt-2 text-3xl font-bold">연도·회차 선택</h1>
      <p className="mb-8 mt-3 text-[var(--text-secondary)]">원하는 연도와 회차를 선택하면 첫 문제부터 풀 수 있습니다.</p>
      <WrittenRoundList examSlug={slug} rounds={rounds} />
    </section>
  )
}
