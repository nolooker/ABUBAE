import Link from 'next/link'
import { notFound } from 'next/navigation'
import { ArrowRight, BookOpen, FilePenLine } from 'lucide-react'
import { getExam } from '@/lib/data'

type PageProps = {
  params: Promise<{ slug: string }>
}

export async function generateMetadata({ params }: PageProps) {
  const { slug } = await params
  const exam = await getExam(slug)

  if (!exam) {
    return { title: '시험 정보' }
  }

  return {
    title: `${exam.name} 학습 허브`,
    description: `${exam.name} 필기와 실기 학습 흐름을 나눠서 안내하는 페이지입니다.`,
  }
}

export default async function ExamDetailPage({ params }: PageProps) {
  const { slug } = await params
  const exam = await getExam(slug)

  if (!exam) {
    notFound()
  }

  return (
    <section className="mx-auto max-w-5xl px-4 py-12">
      <div className="mb-8 rounded-[var(--radius-lg)] border border-[var(--border)] bg-white p-6 md:p-8">
        <p className="mb-2 text-[13px] font-semibold text-[var(--primary)]">{exam.shortName} 학습 허브</p>
        <h1 className="text-3xl font-bold tracking-tight text-[var(--text-primary)] md:text-4xl">
          {exam.name}
        </h1>
        <p className="mt-4 max-w-3xl text-[15px] leading-7 text-[var(--text-secondary)]">
          정처기는 필기와 실기의 공부 방식이 다르기 때문에, 먼저 준비하려는 파트를 고른 뒤 그에
          맞는 문제풀이와 자료로 들어가는 구조가 더 자연스럽습니다.
        </p>
      </div>

      <div className="grid grid-cols-1 gap-5 md:grid-cols-2">
        <Link
          href={`/exam/${exam.slug}/written`}
          className="group rounded-[var(--radius-lg)] border border-[var(--border)] bg-white p-6 shadow-sm transition-colors hover:border-[var(--primary)]"
        >
          <div className="mb-4 flex h-12 w-12 items-center justify-center rounded-2xl bg-[var(--primary-light)] text-[var(--primary)]">
            <BookOpen size={22} />
          </div>
          <h2 className="text-[24px] font-bold text-[var(--text-primary)]">필기</h2>
          <p className="mt-3 text-[14px] leading-7 text-[var(--text-secondary)]">
            객관식 기출문제, 회차별 문제 목록, 과목별 핵심 개념을 중심으로 준비합니다.
          </p>
          <span className="mt-5 inline-flex items-center gap-1.5 text-[14px] font-bold text-[var(--primary)]">
            필기 학습으로 들어가기 <ArrowRight size={15} />
          </span>
        </Link>

        <Link
          href={`/exam/${exam.slug}/practical`}
          className="group rounded-[var(--radius-lg)] border border-[var(--border)] bg-white p-6 shadow-sm transition-colors hover:border-[var(--primary)]"
        >
          <div className="mb-4 flex h-12 w-12 items-center justify-center rounded-2xl bg-[var(--accent-light)] text-[var(--accent)]">
            <FilePenLine size={22} />
          </div>
          <h2 className="text-[24px] font-bold text-[var(--text-primary)]">실기</h2>
          <p className="mt-3 text-[14px] leading-7 text-[var(--text-secondary)]">
            서술형 대비, 실기 핵심 키워드, 답안 예시와 이론 정리를 중심으로 준비합니다.
          </p>
          <span className="mt-5 inline-flex items-center gap-1.5 text-[14px] font-bold text-[var(--primary)]">
            실기 학습으로 들어가기 <ArrowRight size={15} />
          </span>
        </Link>
      </div>
    </section>
  )
}
