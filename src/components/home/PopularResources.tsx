import Link from 'next/link'
import { ArrowRight } from 'lucide-react'
import ResourceCard from '@/components/resources/ResourceCard'
import type { ResourceView } from '@/lib/data'

type PopularResourcesProps = {
  resources: ResourceView[]
}

const categoryRules = [
  {
    title: '취업 BEST 자격증',
    description: '처음 방문한 수험생이 가장 빠르게 고를 수 있는 대표 자료입니다.',
    slugs: ['jeongchogi', 'sqld', 'comhwal'],
  },
  {
    title: '데이터/SW 자격증',
    description: '정보처리기사, SQLD처럼 검색 유입과 자료 판매 가능성이 높은 카테고리입니다.',
    slugs: ['jeongchogi', 'sqld'],
  },
]

export default function PopularResources({ resources }: PopularResourcesProps) {
  return (
    <section className="max-w-6xl mx-auto px-4 py-12">
      <div className="space-y-12">
        {categoryRules.map((category) => {
          const items = resources.filter((resource) => category.slugs.includes(resource.examSlug))

          if (!items.length) {
            return null
          }

          return (
            <div key={category.title}>
              <div className="mb-5">
                <h2 className="text-[22px] font-bold text-[var(--text-primary)]">{category.title}</h2>
                <p className="mt-1 text-[13px] text-[var(--text-secondary)]">{category.description}</p>
              </div>
              <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4">
                {items.map((resource) => (
                  <ResourceCard key={resource.id} resource={resource} />
                ))}
              </div>
            </div>
          )
        })}

        <div className="rounded-[var(--radius-lg)] border border-[var(--border)] bg-[var(--bg-subtle)] p-5 text-center">
          <p className="text-[14px] font-bold text-[var(--text-primary)]">전체 자료를 한 번에 둘러보고 싶나요?</p>
          <Link href="/resources" className="mt-3 inline-flex items-center gap-1.5 text-[13px] font-bold text-[var(--primary)] hover:underline">
            전체 다운로드/자료실 보기 <ArrowRight size={14} />
          </Link>
        </div>
      </div>
    </section>
  )
}
