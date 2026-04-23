import Link from 'next/link'
import { ArrowRight, CheckCircle } from 'lucide-react'
import { getDailyQuestion, getExam } from '@/lib/data'

export const metadata = {
  title: '오늘의 문제',
  description: '아부배에서 매일 한 문제씩 풀며 자격증 공부 습관을 만드세요.',
}

export default async function DailyQuizPage() {
  const question = await getDailyQuestion()
  const exam = await getExam(question.examSlug)

  return (
    <section className="max-w-3xl mx-auto px-4 py-12">
      <div className="mb-7">
        <p className="text-[13px] font-semibold text-[var(--primary)] mb-2">오늘의 문제</p>
        <h1 className="text-3xl font-bold text-[var(--text-primary)]">하루 한 문제로 감각 유지하기</h1>
        <p className="text-[15px] text-[var(--text-secondary)] mt-3">
          DB에 등록된 문제가 있으면 실제 문제를 보여주고, 아직 없으면 샘플 문제를 보여줍니다.
        </p>
      </div>

      <article className="bg-white border border-[var(--border)] rounded-[var(--radius-lg)] p-5">
        <div className="flex flex-wrap items-center gap-2 text-[12px] text-[var(--text-muted)] mb-3">
          <span className="font-semibold text-[var(--primary)]">{exam?.name}</span>
          <span>{question.year}년 {question.round}회</span>
          <span>{question.subject}</span>
        </div>
        <h2 className="text-[18px] font-bold text-[var(--text-primary)] leading-relaxed">
          {question.content}
        </h2>

        <div className="space-y-2 mt-5">
          {question.choices.map((choice, index) => {
            const isAnswer = index === question.answer

            return (
              <div
                key={choice}
                className={`flex items-center gap-3 p-3 rounded-xl border text-[14px] ${
                  isAnswer
                    ? 'border-[var(--success)] bg-green-50 text-green-800'
                    : 'border-[var(--border)] text-[var(--text-secondary)]'
                }`}
              >
                <span className={`w-7 h-7 rounded-full flex items-center justify-center text-[12px] font-bold ${
                  isAnswer ? 'bg-[var(--success)] text-white' : 'bg-[var(--bg-muted)]'
                }`}>
                  {index + 1}
                </span>
                <span>{choice}</span>
                {isAnswer && <CheckCircle size={16} className="ml-auto" />}
              </div>
            )
          })}
        </div>

        <div className="mt-5 rounded-xl bg-[var(--bg-subtle)] border border-[var(--border)] p-4">
          <p className="text-[13px] font-bold text-[var(--text-primary)] mb-1">해설</p>
          <p className="text-[13px] text-[var(--text-secondary)]">{question.explanation}</p>
        </div>
      </article>

      <Link href={`/exam/${question.examSlug}/questions/${question.id}`} className="inline-flex items-center gap-1.5 mt-8 text-[14px] font-semibold text-[var(--primary)]">
        상세 풀이 페이지 보기 <ArrowRight size={15} />
      </Link>
    </section>
  )
}
