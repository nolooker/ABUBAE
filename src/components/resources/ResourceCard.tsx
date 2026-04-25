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
      className="group flex h-full flex-col overflow-hidden rounded-[18px] border border-[var(--border)] bg-white shadow-sm transition-all hover:-translate-y-0.5 hover:border-[var(--primary)] hover:shadow-md"
    >
      {/* [화면] 카드 상단 썸네일 영역 */}
      <div
        className={`flex h-[96px] items-center justify-center ${
          isFree ? 'bg-[var(--primary-light)]' : 'bg-[var(--accent-light)]'
        }`}
      >
        <div
          className={`flex h-12 w-12 items-center justify-center rounded-2xl ${
            isFree ? 'bg-white text-[var(--primary)]' : 'bg-white text-[var(--accent)]'
          }`}
        >
          {isFree ? <Download size={20} /> : <Lock size={20} />}
        </div>
      </div>

      <div className="flex h-full flex-col p-4">
        {/* [화면] 카드 배지 */}
        <div className="mb-3 flex flex-wrap gap-1.5">
          <span
            className={`rounded-md px-2 py-0.5 text-[10px] font-bold ${
              isFree ? 'bg-green-50 text-green-700' : 'bg-violet-100 text-violet-700'
            }`}
          >
            {isFree ? 'FREE' : 'PRO'}
          </span>
          {exam?.shortName && (
            <span className="rounded-md bg-[var(--primary-light)] px-2 py-0.5 text-[10px] font-bold text-[var(--primary)]">
              {exam.shortName}
            </span>
          )}
        </div>

        <h3 className="text-[15px] font-bold leading-snug text-[var(--text-primary)] transition-colors group-hover:text-[var(--primary)]">
          {resource.title}
        </h3>

        <p className="mt-2 text-[11px] font-medium text-[var(--text-secondary)]">
          {resource.type} · {resource.pages}페이지
          {!isFree && ` · ${resource.price.toLocaleString()}원`}
        </p>

        <p className="mt-3 line-clamp-3 text-[12.5px] leading-relaxed text-[var(--text-secondary)]">
          {resource.description}
        </p>

        {/* [화면] 카드 하단 CTA */}
        <div className="mt-auto pt-4">
          <span
            className={`inline-flex w-full items-center justify-center rounded-xl px-4 py-2.5 text-[13px] font-semibold ${
              isFree
                ? 'bg-[var(--primary-light)] text-[var(--primary)]'
                : 'bg-[var(--accent)] text-white'
            }`}
          >
            {isFree ? '무료 다운로드' : '구매하기'}
          </span>
        </div>
      </div>
    </Link>
  )
}
