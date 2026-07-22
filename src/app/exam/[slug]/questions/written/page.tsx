import Link from 'next/link'
import { notFound } from 'next/navigation'

type Props = {
  params: Promise<{ slug: string }>
}

export const metadata = { title: '정보처리기사 필기 기출문제' }

export default async function WrittenRoundListPage({ params }: Props) {
  const { slug } = await params
  if (slug !== 'jeongchogi') notFound()

  return (
    <section className="mx-auto max-w-5xl px-4 py-12">
      <Link href={`/exam/${slug}/questions`} className="text-sm font-semibold text-[var(--primary)]">
        ← 필기·실기 선택으로 돌아가기
      </Link>
      <p className="mt-8 text-sm font-semibold text-[var(--primary)]">정보처리기사 필기</p>
      <h1 className="mt-2 text-3xl font-bold">연도·회차 선택</h1>
      <p className="mt-3 text-[var(--text-secondary)]">
        2021년 1·2·3회 총 300문항을 검수하고 있습니다. 검수가 완료된 회차부터 무료로 공개됩니다.
      </p>

      <div className="mt-8 grid gap-4 sm:grid-cols-3">
        {[1, 2, 3].map((round) => (
          <section key={round} className="ab-card p-5">
            <span className="ab-badge bg-amber-50 text-amber-700">콘텐츠 검수 중</span>
            <h2 className="mt-4 text-lg font-bold">2021년 {round}회</h2>
            <p className="mt-2 text-sm text-[var(--text-secondary)]">100문항 · 5과목</p>
            <button type="button" disabled className="ab-btn ab-btn-md mt-5 w-full cursor-not-allowed bg-slate-100 text-slate-400">
              공개 준비 중
            </button>
          </section>
        ))}
      </div>
    </section>
  )
}
