import Link from 'next/link'
import { notFound } from 'next/navigation'
import { ArrowRight, Download, Lock } from 'lucide-react'
import { getExams, getResource } from '@/lib/data'

type PageProps = {
  params: Promise<{ id: string }>
}

export async function generateMetadata({ params }: PageProps) {
  const { id } = await params
  const resource = await getResource(id)

  return {
    title: resource ? resource.title : '자료 상세',
  }
}

export default async function ResourceDetailPage({ params }: PageProps) {
  const { id } = await params
  const [resource, exams] = await Promise.all([
    getResource(id),
    getExams(),
  ])

  if (!resource) {
    notFound()
  }

  const exam = exams.find((item) => item.slug === resource.examSlug)
  const isFree = resource.price === 0

  return (
    <section className="max-w-4xl mx-auto px-4 py-12">
      <div className="grid grid-cols-1 md:grid-cols-[1fr_0.7fr] gap-8">
        <div>
          <p className="text-[13px] font-semibold text-[var(--primary)] mb-2">{exam?.name || '학습'} 자료</p>
          <h1 className="text-3xl font-bold text-[var(--text-primary)]">{resource.title}</h1>
          <p className="text-[15px] text-[var(--text-secondary)] mt-4 leading-relaxed">{resource.description}</p>

          <div className="mt-7 rounded-[var(--radius-lg)] border border-[var(--border)] bg-[var(--bg-subtle)] p-5">
            <h2 className="text-[16px] font-bold text-[var(--text-primary)] mb-3">포함 내용</h2>
            <ul className="space-y-2 text-[13px] text-[var(--text-secondary)]">
              <li>핵심 개념 압축 정리</li>
              <li>시험 전 빠르게 보는 체크포인트</li>
              <li>기출 선택지 기반 오답 방지 메모</li>
            </ul>
          </div>
        </div>

        <aside className="bg-white border border-[var(--border)] rounded-[var(--radius-lg)] p-5 h-fit">
          <div className={`w-12 h-12 rounded-xl ${isFree ? 'bg-green-50 text-green-700' : 'bg-orange-50 text-orange-700'} flex items-center justify-center mb-4`}>
            {isFree ? <Download size={22} /> : <Lock size={22} />}
          </div>
          <p className="text-[13px] text-[var(--text-muted)]">{resource.type} · {resource.pages || '준비 중'}페이지</p>
          <p className="text-2xl font-bold text-[var(--text-primary)] mt-1">
            {isFree ? '무료' : `${resource.price.toLocaleString()}원`}
          </p>
          <Link
            href={isFree ? '/signup' : '/resources'}
            className="mt-5 inline-flex w-full items-center justify-center gap-1.5 px-5 py-3 bg-[var(--primary)] text-white text-[14px] font-bold rounded-xl hover:bg-[var(--primary-hover)] transition-colors"
          >
            {isFree ? '무료로 받기' : '구매 준비 중'} <ArrowRight size={15} />
          </Link>
        </aside>
      </div>
    </section>
  )
}
