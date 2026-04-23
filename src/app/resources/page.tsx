import { getResources } from '@/lib/data'
import ResourceCard from '@/components/resources/ResourceCard'

export const metadata = {
  title: '자료실',
  description: '아부배의 무료 요약 PDF와 프리미엄 학습 자료를 확인하세요.',
}

export default async function ResourcesPage() {
  const resources = await getResources()

  return (
    <section className="max-w-6xl mx-auto px-4 py-12">
      <div className="mb-8">
        <p className="text-[13px] font-semibold text-[var(--primary)] mb-2">자료실</p>
        <h1 className="text-3xl font-bold text-[var(--text-primary)]">요약 PDF와 학습 자료</h1>
        <p className="text-[15px] text-[var(--text-secondary)] mt-3">
          무료 샘플로 먼저 확인하고, 필요한 과목만 가볍게 구매할 수 있게 구성합니다.
        </p>
      </div>

      <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4">
        {resources.map((resource) => (
          <ResourceCard key={resource.id} resource={resource} />
        ))}
      </div>
    </section>
  )
}
