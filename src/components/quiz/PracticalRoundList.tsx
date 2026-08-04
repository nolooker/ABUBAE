import Link from 'next/link'
import { ArrowRight, CodeXml } from 'lucide-react'

type RoundSummary = {
  year: number
  round: number
  questionCount: number
  subjectCount: number
}

type Props = {
  examSlug: string
  rounds: RoundSummary[]
}

export default function PracticalRoundList({ examSlug, rounds }: Props) {
  const years = [...new Set(rounds.map((item) => item.year))].sort((a, b) => b - a)

  return (
    <div className="space-y-8">
      {years.map((year) => (
        <section key={year} aria-labelledby={`year-${year}`}>
          <div className="mb-3 flex items-center justify-between">
            <h2 id={`year-${year}`} className="text-xl font-bold">{year}년</h2>
            <span className="text-sm text-[var(--text-secondary)]">
              {rounds.filter((item) => item.year === year).length}개 회차
            </span>
          </div>
          <div className="overflow-hidden rounded-xl border border-[var(--border)] bg-white">
            {rounds.filter((item) => item.year === year).map((item, index, items) => (
              <div
                key={`${item.year}-${item.round}`}
                className={`flex flex-col gap-4 p-5 sm:flex-row sm:items-center sm:justify-between ${index < items.length - 1 ? 'border-b border-[var(--border)]' : ''}`}
              >
                <div className="flex items-center gap-4">
                  <span className="inline-flex h-11 w-11 shrink-0 items-center justify-center rounded-xl bg-[var(--primary-light)] text-[var(--primary)]">
                    <CodeXml size={21} />
                  </span>
                  <div>
                    <h3 className="font-bold">{item.round}회 실기</h3>
                    <p className="mt-1 text-sm text-[var(--text-secondary)]">
                      {item.questionCount}문항
                    </p>
                  </div>
                </div>
                <Link
                  href={`/exam/${examSlug}/questions/practical/${item.year}/${item.round}`}
                  aria-label={`${item.year}년 ${item.round}회 실기 문제 풀기`}
                  className="ab-btn ab-btn-primary ab-btn-md gap-2"
                >
                  문제 풀기 <ArrowRight size={16} />
                </Link>
              </div>
            ))}
          </div>
        </section>
      ))}
    </div>
  )
}
