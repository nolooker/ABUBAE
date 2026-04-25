import Link from 'next/link'
import { ArrowRight } from 'lucide-react'
import ResourceCard from '@/components/resources/ResourceCard'
import type { ResourceView } from '@/lib/data'

type PopularResourcesProps = {
  resources: ResourceView[]
}

// [화면 설정] 홈 자료실 섹션의 제목과 설명입니다.
// 홈이 난잡해 보이지 않도록 지금은 카테고리를 여러 개로 쪼개지 않고 한 줄 진열만 씁니다.
const sectionCopy = {
  title: '인기 학습 자료',
  description: '무료 요약노트와 유료 PDF를 한곳에 모아 보여줍니다.',
}

export default function PopularResources({ resources }: PopularResourcesProps) {
  // [기능] 홈에는 자료를 너무 많이 보여주지 않습니다.
  // 더 많은 자료는 /resources 페이지에서 보게 만드는 구조입니다.
  const visibleResources = resources.slice(0, 4)

  return (
    <section className="max-w-6xl mx-auto px-4 pb-12">
      <div className="space-y-6">
        {/* [화면] 자료 섹션 제목 */}
        <div>
          <p className="mb-2 text-[11px] font-semibold tracking-[0.08em] text-[var(--text-muted)] uppercase">
            자료 카드
          </p>
          <h2 className="text-[22px] font-bold text-[var(--text-primary)]">{sectionCopy.title}</h2>
          <p className="mt-1 text-[13px] text-[var(--text-secondary)]">{sectionCopy.description}</p>
        </div>

        {/* [화면 + 기능] resources 데이터가 ResourceCard로 반복 출력됩니다. */}
        <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4">
          {visibleResources.map((resource) => (
            <ResourceCard key={resource.id} resource={resource} />
          ))}
        </div>

        {/* [화면] 전체 자료실로 보내는 보조 CTA */}
        <div className="rounded-[18px] border border-[var(--border)] bg-white p-5 text-center shadow-sm">
          <p className="text-[14px] font-bold text-[var(--text-primary)]">전체 자료를 한 번에 둘러보고 싶나요?</p>
          <Link
            href="/resources"
            className="mt-3 inline-flex items-center gap-1.5 text-[13px] font-bold text-[var(--primary)] hover:underline"
          >
            전체 다운로드/자료실 보기 <ArrowRight size={14} />
          </Link>
        </div>
      </div>
    </section>
  )
}
