import Link from 'next/link'
import { ArrowRight } from 'lucide-react'

type SectionHeaderProps = {
  eyebrow?: string
  title: string
  description?: string
  href?: string
  actionLabel?: string
}

export default function SectionHeader({
  eyebrow,
  title,
  description,
  href,
  actionLabel = '전체 보기',
}: SectionHeaderProps) {
  return (
    <div className="flex items-end justify-between gap-4 mb-6">
      <div>
        {eyebrow && (
          <p className="text-[12px] font-bold text-[var(--primary)] mb-1.5">
            {eyebrow}
          </p>
        )}
        <h2 className="text-[21px] font-bold text-[var(--text-primary)] tracking-tight">
          {title}
        </h2>
        {description && (
          <p className="text-[13px] text-[var(--text-secondary)] mt-1 leading-relaxed">
            {description}
          </p>
        )}
      </div>

      {href && (
        <Link
          href={href}
          className="hidden sm:inline-flex items-center gap-1 text-[13px] font-semibold text-[var(--primary)] hover:underline shrink-0"
        >
          {actionLabel} <ArrowRight size={13} />
        </Link>
      )}
    </div>
  )
}
