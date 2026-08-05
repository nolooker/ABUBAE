'use client'

import { useState } from 'react'

import type { PracticalGradeResult } from '@/lib/practical-exam'

type PracticalRoundQuestion = {
  id: string
  number: number
  subject: string
  content: string
  blankCount: number
}

type Props = { title: string; questions: PracticalRoundQuestion[]; result: PracticalGradeResult; onRetry: () => void; savedNotice?: string }

export default function PracticalRoundResult({ title, questions, result, onRetry, savedNotice }: Props) {
  const [onlyWrong, setOnlyWrong] = useState(false)
  const questionMap = new Map(questions.map((question) => [question.id, question]))
  const visibleResults = onlyWrong ? result.questions.filter((question) => !question.isCorrect) : result.questions

  return (
    <div className="space-y-6">
      <section className="ab-card p-6 text-center sm:p-8">
        <p className="text-sm font-semibold text-[var(--primary)]">{title} 채점 결과</p>
        <h1 className="mt-2 text-4xl font-black">{result.score}점</h1>
        <p className="mt-3 text-[var(--text-secondary)]">총 {result.total}문제 · 정답 {result.correct} · 오답 {result.incorrect} · 미응답 {result.unanswered}</p>
        <p className="mt-3 text-sm font-semibold text-orange-700">{savedNotice ?? '이 결과는 저장되지 않습니다.'}</p>
        <div className="mt-6 flex flex-wrap justify-center gap-2">
          <button type="button" className="ab-btn ab-btn-secondary ab-btn-md" onClick={() => setOnlyWrong((value) => !value)}>{onlyWrong ? '전체 문항 보기' : '오답·미응답만 보기'}</button>
          <button type="button" className="ab-btn ab-btn-primary ab-btn-md" onClick={onRetry}>다시 풀기</button>
        </div>
      </section>

      <section className="space-y-4">
        {visibleResults.map((graded) => {
          const question = questionMap.get(graded.id)
          if (!question) return null
          return (
            <article key={graded.id} className="ab-card p-5 sm:p-6">
              <div className="flex flex-wrap items-center justify-between gap-2">
                <p className="text-sm font-semibold text-[var(--text-secondary)]">{graded.subject}</p>
                <span className={`rounded-full px-3 py-1 text-sm font-bold ${graded.isCorrect ? 'bg-emerald-50 text-emerald-700' : 'bg-red-50 text-red-700'}`}>
                  {graded.isCorrect ? '정답' : graded.isUnanswered ? '미응답' : '오답'}
                </span>
              </div>
              <h3 className="mt-3 whitespace-pre-wrap text-lg font-bold">{question.number}. {question.content}</h3>
              <div role="list" className="mt-4 space-y-2">
                {graded.blanks.map((blank) => (
                  <div
                    key={blank.blankNumber}
                    role="listitem"
                    className={`rounded-lg border p-3 text-sm ${blank.isCorrect ? 'border-emerald-300 bg-emerald-50' : 'border-red-300 bg-red-50'}`}
                  >
                    {graded.blanks.length > 1 && <strong className="mr-2">빈칸 {blank.blankNumber}</strong>}
                    <span>내 답: {blank.userAnswer?.trim() ? blank.userAnswer : '미응답'}</span>
                    {!blank.isCorrect && (
                      <span className="ml-2 font-bold text-emerald-700">정답: {blank.acceptedAnswers.join(' / ')}</span>
                    )}
                  </div>
                ))}
              </div>
              <p className="mt-4 whitespace-pre-wrap rounded-lg bg-slate-50 p-3 text-sm text-[var(--text-secondary)]">
                {graded.explanation.trim() ? graded.explanation : '해설 준비 중'}
              </p>
            </article>
          )
        })}
        {visibleResults.length === 0 && <div className="ab-card p-8 text-center font-semibold">틀린 문제가 없습니다.</div>}
      </section>
    </div>
  )
}
