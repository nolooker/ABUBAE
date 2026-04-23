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
  const exam = exams.find((item) => item.slug === resource.examSlug)
  const isFree = resource.price === 0

  return (
    <Link
      href={`/resources/${resource.id}`}
      className="group flex h-full flex-col rounded-[var(--radius-lg)] border border-[var(--border)] bg-white p-4 transition-all hover:border-[var(--primary)] hover:shadow-md"
    >
      <div className="mb-3 flex items-start justify-between gap-3">
        <div className={`flex h-10 w-10 items-center justify-center rounded-xl ${isFree ? 'bg-green-50 text-green-700' : 'bg-orange-50 text-orange-700'}`}>
          {isFree ? <Download size={18} /> : <Lock size={18} />}
        </div>
        <span className={`rounded-full px-2 py-0.5 text-[11px] font-bold ${isFree ? 'bg-green-50 text-green-700' : 'bg-orange-50 text-orange-700'}`}>
          {isFree ? 'FREE' : 'PRO'}
        </span>
      </div>

      <p className="mb-1 text-[11px] font-semibold text-[var(--text-muted)]">
        {exam?.shortName} · {resource.type} · {resource.pages}p
      </p>
      <h3 className="text-[15px] font-bold leading-snug text-[var(--text-primary)] transition-colors group-hover:text-[var(--primary)]">
        {resource.title}
      </h3>
      <p className="mt-2 line-clamp-3 text-[12.5px] leading-relaxed text-[var(--text-secondary)]">
        {resource.description}
      </p>

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
