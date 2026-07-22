import Link from 'next/link'
import { notFound } from 'next/navigation'

import { getReviewRounds } from '@/lib/written-review'

export const metadata = { title: '필기 콘텐츠 검수' }

export default function WrittenReviewIndexPage() {
  if (process.env.NODE_ENV === 'production' && process.env.ENABLE_CONTENT_REVIEW !== 'true') {
    notFound()
  }

  const rounds = getReviewRounds()

  return (
    <section className="mx-auto max-w-5xl px-4 py-12">
      <p className="text-sm font-semibold text-[var(--primary)]">내부 콘텐츠 검수</p>
      <h1 className="mt-2 text-3xl font-bold">정보처리기사 필기 회차 선택</h1>
      <p className="mt-3 text-[var(--text-secondary)]">
        이 화면은 추출 후보를 확인하기 위한 로컬 전용 화면이며 운영 문제에는 공개되지 않습니다.
      </p>

      <div className="mt-8 grid gap-4 sm:grid-cols-3">
        {rounds.map((item) => (
          <Link
            key={`${item.year}-${item.round}`}
            href={`/review/written/${item.year}/${item.round}`}
            className="ab-card p-5 transition-transform hover:-translate-y-0.5 hover:border-[var(--primary)]"
          >
            <h2 className="text-lg font-bold">{item.year}년 {item.round}회</h2>
            <p className="mt-3 text-sm text-[var(--text-secondary)]">{item.questionCount}문항</p>
            <p className="mt-1 text-sm font-semibold text-amber-700">
              정답 검수 필요 {item.uncertainAnswerCount}문항
            </p>
          </Link>
        ))}
      </div>
    </section>
  )
}

