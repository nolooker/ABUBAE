import Link from 'next/link'
import { notFound } from 'next/navigation'
import { ArrowRight, FilePenLine, NotebookPen } from 'lucide-react'
import { getExam, getResources } from '@/lib/data'

type PageProps = {
  params: Promise<{ slug: string }>
}

export async function generateMetadata({ params }: PageProps) {
  const { slug } = await params
  const exam = await getExam(slug)

  if (!exam) {
    return { title: '실기 학습' }
  }

  return {
    title: `${exam.name} 실기`,
    description: `${exam.name} 실기 대비 자료와 학습 흐름을 모아둔 페이지입니다.`,
  }
}

export default async function ExamPracticalPage({ params }: PageProps) {
  const { slug } = await params
  const exam = await getExam(slug)

  if (!exam) {
    notFound()
  }

  const resources = await getResources()
  const examResources = resources.filter((resource) => resource.examSlug === exam.slug)

  return (
    <section className="mx-auto max-w-5xl px-4 py-12">
      <div className="mb-8 rounded-[var(--radius-lg)] border border-[var(--border)] bg-white p-6 md:p-8">
        <p className="mb-2 text-[13px] font-semibold text-[var(--accent)]">{exam.name} 실기</p>
        <h1 className="text-3xl font-bold tracking-tight text-[var(--text-primary)] md:text-4xl">
          실기 학습 시작
        </h1>
        <p className="mt-4 max-w-3xl text-[15px] leading-7 text-[var(--text-secondary)]">
          실기는 필기와 달리 답안 구조와 핵심 키워드 정리가 중요합니다. 실기 자료, 답안 예시,
          자주 나오는 개념 위주로 흐름을 구성해두는 쪽이 좋습니다.
        </p>
      </div>

      <div className="grid grid-cols-1 gap-5 md:grid-cols-2">
        <div className="rounded-[var(--radius-lg)] border border-[var(--border)] bg-white p-6 shadow-sm">
          <div className="mb-4 flex h-12 w-12 items-center justify-center rounded-2xl bg-[var(--accent-light)] text-[var(--accent)]">
            <FilePenLine size={22} />
          </div>
          <h2 className="text-[22px] font-bold text-[var(--text-primary)]">실기 대비 자료</h2>
          <p className="mt-3 text-[14px] leading-7 text-[var(--text-secondary)]">
            현재 연결된 자료 {examResources.length}개를 바탕으로 실기용 자료실 구조를 이어서 붙일 수
            있습니다.
          </p>
          <Link
            href="/resources"
            className="mt-5 inline-flex items-center gap-1.5 text-[14px] font-bold text-[var(--primary)]"
          >
            자료실 보러가기 <ArrowRight size={15} />
          </Link>
        </div>

        <div className="rounded-[var(--radius-lg)] border border-dashed border-[var(--border-strong)] bg-[var(--bg-subtle)] p-6">
          <div className="mb-4 flex h-12 w-12 items-center justify-center rounded-2xl bg-white text-[var(--text-primary)]">
            <NotebookPen size={22} />
          </div>
          <h2 className="text-[22px] font-bold text-[var(--text-primary)]">실기 문제 구조 준비 중</h2>
          <p className="mt-3 text-[14px] leading-7 text-[var(--text-secondary)]">
            실기는 필기와 데이터 구조가 달라서, `written / practical` 구분 컬럼과 답안 예시 구조를
            먼저 추가한 뒤 본격적으로 연결하는 게 좋습니다.
          </p>
        </div>
      </div>
    </section>
  )
}
