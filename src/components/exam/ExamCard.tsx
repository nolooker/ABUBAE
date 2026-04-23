import Link from 'next/link'
import { ArrowRight, BookOpen, FileText } from 'lucide-react'

type ExamCardProps = {
  exam: {
    slug: string
    name: string
    shortName: string
    description: string
    questionCount: number
    resourceCount: number
  }
}

export default function ExamCard({ exam }: ExamCardProps) {
  return (
    <Link
      href={`/exam/${exam.slug}`}
      className="group flex h-full flex-col rounded-[var(--radius-lg)] border border-[var(--border)] bg-white p-5 transition-all hover:border-[var(--primary)] hover:shadow-md"
    >
      {/* [화면] 시험 아이콘 + 짧은 이름 배지 */}
      <div className="mb-4 flex items-center justify-between gap-3">
        <div className="flex h-10 w-10 items-center justify-center rounded-xl bg-[var(--primary-light)] text-[var(--primary)]">
          <BookOpen size={18} />
        </div>
        <span className="rounded-full bg-[var(--bg-subtle)] px-2.5 py-1 text-[11px] font-semibold text-[var(--text-secondary)]">
          {exam.shortName}
        </span>
      </div>

      {/* [화면] 시험명과 설명 */}
      <h3 className="text-[17px] font-bold text-[var(--text-primary)] transition-colors group-hover:text-[var(--primary)]">
        {exam.name}
      </h3>
      <p className="mt-2 line-clamp-3 text-[13px] leading-relaxed text-[var(--text-secondary)]">
        {exam.description}
      </p>

      {/* [화면] 문제 수/자료 수 같은 신뢰 지표 */}
      <div className="mt-5 flex flex-wrap gap-2 text-[12px] text-[var(--text-muted)]">
        <span className="inline-flex items-center gap-1 rounded-full bg-[var(--bg-subtle)] px-2.5 py-1">
          <FileText size={12} /> 기출 {exam.questionCount}문제
        </span>
        <span className="rounded-full bg-[var(--bg-subtle)] px-2.5 py-1">
          자료 {exam.resourceCount}개
        </span>
      </div>

      {/* [화면] 시험 상세 페이지로 이동하는 CTA */}
      <div className="mt-auto pt-5">
        <span className="inline-flex items-center gap-1 text-[13px] font-bold text-[var(--primary)]">
          학습 허브 보기 <ArrowRight size={13} />
        </span>
      </div>
    </Link>
  )
}
