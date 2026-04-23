import Link from 'next/link'
import { Download, Lock } from 'lucide-react'
import { exams } from '@/lib/mock-data'

type ResourceCardProps = {
  resource: {
    id: string
    examSlug: string
    title: string
    description: string
    pages: number
    price: number
    type: string
  }
}

export default function ResourceCard({ resource }: ResourceCardProps) {
  // [기능] 자료가 어떤 시험에 속하는지 찾아서 카드 메타 정보에 보여줍니다.
  const exam = exams.find((item) => item.slug === resource.examSlug)

  // [기능] 가격이 0원이면 FREE, 아니면 PRO 배지로 보여줍니다.
  const isFree = resource.price === 0

  return (
    <Link
      href={`/resources/${resource.id}`}
      className="group flex h-full flex-col rounded-[var(--radius-lg)] border border-[var(--border)] bg-white p-4 transition-all hover:border-[var(--primary)] hover:shadow-md"
    >
      {/* [화면] 카드 상단 아이콘 + FREE/PRO 배지 */}
      <div className="mb-3 flex items-start justify-between gap-3">
        <div className={`flex h-10 w-10 items-center justify-center rounded-xl ${isFree ? 'bg-green-50 text-green-700' : 'bg-orange-50 text-orange-700'}`}>
          {isFree ? <Download size={18} /> : <Lock size={18} />}
        </div>
        <span className={`rounded-full px-2 py-0.5 text-[11px] font-bold ${isFree ? 'bg-green-50 text-green-700' : 'bg-orange-50 text-orange-700'}`}>
          {isFree ? 'FREE' : 'PRO'}
        </span>
      </div>

      {/* [화면] 자료 제목/설명 */}
      <p className="mb-1 text-[11px] font-semibold text-[var(--text-muted)]">
        {exam?.shortName} · {resource.type} · {resource.pages}p
      </p>
      <h3 className="text-[15px] font-bold leading-snug text-[var(--text-primary)] transition-colors group-hover:text-[var(--primary)]">
        {resource.title}
      </h3>
      <p className="mt-2 line-clamp-3 text-[12.5px] leading-relaxed text-[var(--text-secondary)]">
        {resource.description}
      </p>

      {/* [화면] 카드 하단 가격/행동 문구 */}
      <div className="mt-auto flex items-center justify-between border-t border-[var(--border)] pt-3">
        <span className="text-[13px] font-bold text-[var(--text-primary)]">
          {isFree ? '무료' : `${resource.price.toLocaleString()}원`}
        </span>
        <span className="text-[12px] font-semibold text-[var(--primary)]">
          {isFree ? '받기' : '보기'}
        </span>
      </div>
    </Link>
  )
}
