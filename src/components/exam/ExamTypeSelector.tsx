import Link from 'next/link'
import { ArrowRight, BookOpenCheck, CodeXml, FileQuestion, LockKeyhole } from 'lucide-react'

type Props = {
  examSlug: string
}

export default function ExamTypeSelector({ examSlug }: Props) {
  return (
    <div className="grid gap-5 md:grid-cols-2">
      <Link
        href={`/exam/${examSlug}/questions/written`}
        aria-label="필기 기출문제 보러 가기"
        className="group ab-card relative overflow-hidden p-6 transition-all hover:-translate-y-1 hover:border-[var(--primary)] hover:shadow-[var(--shadow-md)] sm:p-8"
      >
        <div className="absolute right-0 top-0 h-28 w-28 rounded-bl-[72px] bg-[var(--primary-light)]" />
        <div className="relative">
          <span className="inline-flex h-12 w-12 items-center justify-center rounded-xl bg-[var(--primary)] text-white">
            <BookOpenCheck size={25} />
          </span>
          <div className="mt-6 flex items-center gap-2">
            <span className="ab-badge ab-badge-free">무료</span>
            <span className="ab-badge ab-badge-exam">이용 가능</span>
          </div>
          <h2 className="mt-4 text-2xl font-bold">필기 기출문제</h2>
          <p className="mt-3 min-h-14 text-[15px] leading-7 text-[var(--text-secondary)]">
            연도와 회차를 선택해 객관식 기출문제를 풀고, 제출 후 점수와 해설을 확인하세요.
          </p>
          <div className="mt-7 flex items-center justify-between border-t border-[var(--border)] pt-5">
            <span className="text-sm font-semibold text-[var(--primary)]">2021년 3개 회차 준비 중</span>
            <span className="inline-flex items-center gap-1 text-sm font-bold text-[var(--primary)]">
              회차 보기 <ArrowRight className="transition-transform group-hover:translate-x-1" size={17} />
            </span>
          </div>
        </div>
      </Link>

      <section
        aria-labelledby="practical-exam-title"
        className="ab-card relative overflow-hidden border-dashed p-6 opacity-80 sm:p-8"
      >
        <div className="absolute right-0 top-0 h-28 w-28 rounded-bl-[72px] bg-[var(--bg-muted)]" />
        <div className="relative">
          <span className="inline-flex h-12 w-12 items-center justify-center rounded-xl bg-slate-600 text-white">
            <CodeXml size={25} />
          </span>
          <div className="mt-6 flex items-center gap-2">
            <span className="ab-badge bg-slate-100 text-slate-600">준비 중</span>
          </div>
          <h2 id="practical-exam-title" className="mt-4 text-2xl font-bold">실기 기출문제</h2>
          <p className="mt-3 min-h-14 text-[15px] leading-7 text-[var(--text-secondary)]">
            단답형, SQL, 프로그래밍 문제에 맞는 별도 풀이 방식을 준비하고 있습니다.
          </p>
          <div className="mt-7 flex items-center justify-between border-t border-[var(--border)] pt-5">
            <span className="inline-flex items-center gap-1.5 text-sm font-semibold text-slate-500">
              <FileQuestion size={16} /> 필기 MVP 이후 제공
            </span>
            <span className="inline-flex items-center gap-1.5 text-sm font-semibold text-slate-500">
              <LockKeyhole size={16} /> 준비 중
            </span>
          </div>
        </div>
      </section>
    </div>
  )
}

