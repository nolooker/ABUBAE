import { notFound } from 'next/navigation'

import ExamTypeSelector from '@/components/exam/ExamTypeSelector'
import { getExam } from '@/lib/data'

type Props = {
  params: Promise<{ slug: string }>
}

export async function generateMetadata({ params }: Props) {
  const { slug } = await params
  const exam = await getExam(slug)
  return {
    title: exam ? `${exam.name} 기출문제` : '기출문제',
    description: exam ? `${exam.name} 필기와 실기 기출문제 유형을 선택하세요.` : '기출문제 유형을 선택하세요.',
  }
}

export default async function QuestionTypePage({ params }: Props) {
  const { slug } = await params
  const exam = await getExam(slug)
  if (!exam) notFound()

  return (
    <section className="mx-auto max-w-6xl px-4 py-10 sm:py-14">
      <div className="mb-8 max-w-2xl">
        <p className="text-sm font-semibold text-[var(--primary)]">{exam.name} 기출문제</p>
        <h1 className="mt-2 text-3xl font-bold sm:text-4xl">어떤 시험을 준비하나요?</h1>
        <p className="mt-4 text-[15px] leading-7 text-[var(--text-secondary)]">
          필기와 실기는 문제 형식과 풀이 방식이 다릅니다. 먼저 준비할 시험 유형을 선택해 주세요.
        </p>
      </div>

      <ExamTypeSelector examSlug={exam.slug} />

      <div className="mt-8 rounded-xl border border-blue-100 bg-[var(--primary-light)] px-5 py-4 text-sm leading-6 text-blue-800">
        정보처리기사 필기·실기 기출문제를 모두 무료로 제공합니다.
      </div>
    </section>
  )
}
