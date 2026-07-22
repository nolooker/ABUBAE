'use client'

import { useState } from 'react'
import { ChevronLeft, ChevronRight } from 'lucide-react'

import type { PublicWrittenQuestion } from '@/lib/written-content'

type Props = {
  title: string
  questions: PublicWrittenQuestion[]
}

const choiceLabels = ['①', '②', '③', '④']

export default function WrittenRoundRunner({ title, questions }: Props) {
  const [currentIndex, setCurrentIndex] = useState(0)
  const [answers, setAnswers] = useState<Record<string, number>>({})
  const current = questions[currentIndex]
  const answeredCount = Object.keys(answers).length

  const moveTo = (index: number) => {
    setCurrentIndex(index)
    try {
      window.scrollTo({ top: 0, behavior: 'smooth' })
    } catch {
      // Embedded browsers can reject smooth scrolling; navigation must still work.
    }
  }

  return (
    <div className="grid gap-6 lg:grid-cols-[minmax(0,1fr)_320px]">
      <section className="ab-card p-5 sm:p-8">
        <div className="flex flex-wrap items-end justify-between gap-3 border-b border-[var(--border)] pb-5">
          <div>
            <p className="text-sm font-semibold text-[var(--primary)]">{title}</p>
            <p className="mt-1 text-sm text-[var(--text-secondary)]">{currentIndex + 1} / {questions.length}문항</p>
          </div>
          <div className="flex gap-2 text-sm font-semibold">
            <span className="rounded-full bg-[var(--primary-light)] px-3 py-1 text-[var(--primary)]">답변 {answeredCount}</span>
            <span className="rounded-full bg-slate-100 px-3 py-1 text-slate-600">미응답 {questions.length - answeredCount}</span>
          </div>
        </div>

        <p className="mt-7 text-sm font-semibold text-[var(--text-secondary)]">{current.subject}</p>
        <h1 className="mt-2 whitespace-pre-wrap text-xl font-bold leading-8">
          {current.number}. {current.content}
        </h1>

        <fieldset className="mt-7 space-y-3">
          <legend className="sr-only">{current.number}번 답안 선택</legend>
          {current.choices.map((choice, index) => (
            <label
              key={`${current.id}-${index}`}
              className={`flex cursor-pointer items-start gap-3 rounded-xl border p-4 text-[15px] leading-7 transition-colors ${
                answers[current.id] === index
                  ? 'border-[var(--primary)] bg-[var(--primary-light)] text-blue-900'
                  : 'border-[var(--border)] bg-white hover:border-[var(--primary)]'
              }`}
            >
              <input
                type="radio"
                name={current.id}
                checked={answers[current.id] === index}
                onChange={() => setAnswers((previous) => ({ ...previous, [current.id]: index }))}
                aria-label={`${current.number}번 선택지 ${choiceLabels[index]} ${choice}`}
                className="mt-1 h-5 w-5 accent-[var(--primary)]"
              />
              <span><strong className="mr-2">{choiceLabels[index]}</strong>{choice}</span>
            </label>
          ))}
        </fieldset>

        <div className="mt-7 flex items-center justify-between gap-3">
          <button type="button" disabled={currentIndex === 0} onClick={() => moveTo(currentIndex - 1)} className="ab-btn ab-btn-secondary ab-btn-md disabled:opacity-40">
            <ChevronLeft size={17} /> 이전 문제
          </button>
          <button type="button" disabled={currentIndex === questions.length - 1} onClick={() => moveTo(currentIndex + 1)} className="ab-btn ab-btn-primary ab-btn-md disabled:opacity-40">
            다음 문제 <ChevronRight size={17} />
          </button>
        </div>
      </section>

      <aside className="ab-card h-fit p-5 lg:sticky lg:top-24">
        <h2 className="font-bold">문항 바로가기</h2>
        <div className="mt-4 grid grid-cols-5 gap-2">
          {questions.map((question, index) => (
            <button
              type="button"
              key={question.id}
              aria-label={`${question.number}번 문제로 이동`}
              onClick={() => moveTo(index)}
              className={`h-10 rounded-lg border text-sm font-semibold ${
                index === currentIndex
                  ? 'border-[var(--primary)] bg-[var(--primary)] text-white'
                  : answers[question.id] !== undefined
                    ? 'border-blue-200 bg-[var(--primary-light)] text-[var(--primary)]'
                    : 'border-[var(--border)] bg-white'
              }`}
            >
              {question.number}
            </button>
          ))}
        </div>
        <button type="button" className="ab-btn ab-btn-orange ab-btn-lg mt-6 w-full" disabled>
          최종 제출 (다음 단계)
        </button>
      </aside>
    </div>
  )
}
