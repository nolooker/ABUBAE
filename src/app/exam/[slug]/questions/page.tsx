import Link from 'next/link'
import { notFound } from 'next/navigation'
import { ArrowRight, FileText, Layers3 } from 'lucide-react'
import QuestionRoundTabs from '@/components/exam/QuestionRoundTabs'
import { getExam, getQuestionsByExam } from '@/lib/data'

type PageProps = {
  params: Promise<{ slug: string }>
}

export async function generateMetadata({ params }: PageProps) {
  const { slug } = await params
  const exam = await getExam(slug)

  if (!exam) {
    return {
      title: '기출문제 목록',
      description: '자격증 기출문제 목록 페이지입니다.',
    }
  }

  return {
    title: `${exam.name} 기출문제 목록`,
    description: `${exam.name} 기출문제와 해설을 회차별로 정리한 페이지입니다.`,
  }
}

export default async function QuestionListPage({ params }: PageProps) {
  const { slug } = await params
  const exam = await getExam(slug)

  if (!exam) {
    notFound()
  }

  const questions = await getQuestionsByExam(exam.slug)
  const roundCount = new Set(questions.map((question) => `${question.year}-${question.round}`)).size

  return (
    <section className="mx-auto max-w-5xl px-4 py-12">
      <div className="mb-8 rounded-[var(--radius-lg)] border border-[var(--border)] bg-white p-6 md:p-7">
        <p className="mb-2 text-[13px] font-semibold text-[var(--primary)]">{exam.name}</p>
        <h1 className="text-[30px] font-bold tracking-tight text-[var(--text-primary)]">
          기출문제 목록
        </h1>
        <p className="mt-3 max-w-3xl text-[15px] leading-7 text-[var(--text-secondary)]">
          실제 시험 문제를 회차별로 정리했습니다. 아래에서 필기 기출과 실기 기출을 선택하고,
          선택한 영역 안에서 필요한 데이터만 이어서 볼 수 있습니다.
        </p>

        <div className="mt-5 flex flex-wrap gap-3 text-[13px] text-[var(--text-secondary)]">
          <span className="inline-flex items-center gap-1.5 rounded-full bg-[var(--bg-subtle)] px-3 py-1.5">
            <FileText size={14} />
            총 {questions.length}문제
          </span>
          <span className="inline-flex items-center gap-1.5 rounded-full bg-[var(--bg-subtle)] px-3 py-1.5">
            <Layers3 size={14} />
            총 {roundCount}개 회차
          </span>
        </div>
      </div>

      <QuestionRoundTabs examSlug={exam.slug} questions={questions} />

      <div className="mt-8 flex flex-wrap gap-3">
        <Link
          href={`/exam/${exam.slug}`}
          className="inline-flex items-center gap-1.5 rounded-xl border border-[var(--border)] bg-white px-4 py-2.5 text-[14px] font-semibold text-[var(--text-primary)] hover:bg-[var(--bg-subtle)]"
        >
          시험 허브로 돌아가기
        </Link>
        <Link
          href="/quiz/daily"
          className="inline-flex items-center gap-1.5 rounded-xl bg-[var(--primary)] px-4 py-2.5 text-[14px] font-semibold text-white hover:bg-[var(--primary-hover)]"
        >
          오늘의 문제 풀러가기 <ArrowRight size={15} />
        </Link>
      </div>
    </section>
  )
}
