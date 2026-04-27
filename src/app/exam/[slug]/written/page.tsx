import Link from 'next/link'
import { notFound } from 'next/navigation'
import { ArrowRight, BookOpen, FileText } from 'lucide-react'
import { getExam, getQuestionsByExam, getResources } from '@/lib/data'

type PageProps = {
  params: Promise<{ slug: string }>
}

export async function generateMetadata({ params }: PageProps) {
  const { slug } = await params
  const exam = await getExam(slug)

  if (!exam) {
    return { title: '필기 학습' }
  }

  return {
    title: `${exam.name} 필기`,
    description: `${exam.name} 필기 기출문제와 핵심 자료를 모아둔 페이지입니다.`,
  }
}

export default async function ExamWrittenPage({ params }: PageProps) {
  const { slug } = await params
  const exam = await getExam(slug)

  if (!exam) {
    notFound()
  }

  const [questions, resources] = await Promise.all([
    getQuestionsByExam(exam.slug),
    getResources(),
  ])

  const examResources = resources.filter((resource) => resource.examSlug === exam.slug)

  return (
    <section className="mx-auto max-w-5xl px-4 py-12">
      <div className="mb-8 rounded-[var(--radius-lg)] border border-[var(--border)] bg-white p-6 md:p-8">
        <p className="mb-2 text-[13px] font-semibold text-[var(--primary)]">{exam.name} 필기</p>
        <h1 className="text-3xl font-bold tracking-tight text-[var(--text-primary)] md:text-4xl">
          필기 학습 시작
        </h1>
        <p className="mt-4 max-w-3xl text-[15px] leading-7 text-[var(--text-secondary)]">
          객관식 기출문제와 요약자료를 중심으로 필기 준비 흐름을 구성했습니다. 회차별 문제풀이로
          들어가거나, 먼저 핵심 자료를 확인할 수 있습니다.
        </p>
      </div>

      <div className="grid grid-cols-1 gap-5 md:grid-cols-2">
        <Link
          href={`/exam/${exam.slug}/questions`}
          className="rounded-[var(--radius-lg)] border border-[var(--border)] bg-white p-6 shadow-sm transition-colors hover:border-[var(--primary)]"
        >
          <div className="mb-4 flex h-12 w-12 items-center justify-center rounded-2xl bg-[var(--primary-light)] text-[var(--primary)]">
            <BookOpen size={22} />
          </div>
          <h2 className="text-[22px] font-bold text-[var(--text-primary)]">회차별 기출문제</h2>
          <p className="mt-3 text-[14px] leading-7 text-[var(--text-secondary)]">
            현재 등록된 필기 기출문제 {questions.length}문제를 회차별로 정리했습니다.
          </p>
          <span className="mt-5 inline-flex items-center gap-1.5 text-[14px] font-bold text-[var(--primary)]">
            기출문제 보러가기 <ArrowRight size={15} />
          </span>
        </Link>

        <Link
          href="/resources"
          className="rounded-[var(--radius-lg)] border border-[var(--border)] bg-white p-6 shadow-sm transition-colors hover:border-[var(--primary)]"
        >
          <div className="mb-4 flex h-12 w-12 items-center justify-center rounded-2xl bg-[var(--bg-subtle)] text-[var(--text-primary)]">
            <FileText size={22} />
          </div>
          <h2 className="text-[22px] font-bold text-[var(--text-primary)]">필기 요약자료</h2>
          <p className="mt-3 text-[14px] leading-7 text-[var(--text-secondary)]">
            현재 연결된 자료 {examResources.length}개를 확인하고 필요한 PDF를 골라볼 수 있습니다.
          </p>
          <span className="mt-5 inline-flex items-center gap-1.5 text-[14px] font-bold text-[var(--primary)]">
            자료실 보러가기 <ArrowRight size={15} />
          </span>
        </Link>
      </div>
    </section>
  )
}
