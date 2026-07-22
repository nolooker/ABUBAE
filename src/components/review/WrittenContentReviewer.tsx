'use client'

import { useState } from 'react'
import { AlertTriangle, Check, ChevronLeft, ChevronRight, Eye, EyeOff } from 'lucide-react'

import type { ReviewQuestion } from '@/lib/written-review'

type Props = {
  title: string
  questions: ReviewQuestion[]
}

const answerLabels = ['①', '②', '③', '④']

export default function WrittenContentReviewer({ title, questions }: Props) {
  const [currentIndex, setCurrentIndex] = useState(0)
  const [showAnswer, setShowAnswer] = useState(false)
  const current = questions[currentIndex]

  const moveTo = (index: number) => {
    setCurrentIndex(index)
    setShowAnswer(false)
    window.scrollTo({ top: 0, behavior: 'smooth' })
  }

  return (
    <div className="grid gap-6 lg:grid-cols-[minmax(0,1fr)_320px]">
      <section className="ab-card p-5 sm:p-8">
        <div className="mb-7 flex flex-wrap items-center justify-between gap-3 border-b border-[var(--border)] pb-5">
          <div>
            <p className="text-sm font-semibold text-[var(--primary)]">{title} · 콘텐츠 검수</p>
            <p className="mt-1 text-sm text-[var(--text-secondary)]">
              {currentIndex + 1} / {questions.length}문항
            </p>
          </div>
          <span className="inline-flex items-center gap-1.5 rounded-full bg-[var(--warning-light)] px-3 py-1.5 text-xs font-semibold text-amber-700">
            <AlertTriangle size={14} /> 미공개 후보 데이터
          </span>
        </div>

        <p className="mb-3 text-sm font-semibold text-[var(--text-secondary)]">{current.subject}</p>
        <h1 className="whitespace-pre-wrap text-xl font-bold leading-8 text-[var(--text-primary)]">
          {current.number}. {current.content}
        </h1>

        <ol className="mt-7 space-y-3">
          {current.choices.map((choice, index) => {
            const isAnswer = showAnswer && current.answerIndex === index
            return (
              <li
                key={`${current.id}-${index}`}
                className={`rounded-xl border p-4 text-[15px] leading-7 ${
                  isAnswer
                    ? 'border-[var(--success)] bg-[var(--success-light)] text-green-800'
                    : 'border-[var(--border)] bg-white'
                }`}
              >
                <span className="mr-2 font-semibold">{answerLabels[index]}</span>
                <span className="whitespace-pre-wrap">{choice}</span>
                {isAnswer && <Check className="ml-2 inline" size={17} aria-label="정답" />}
              </li>
            )
          })}
        </ol>

        <div className="mt-7 rounded-xl bg-[var(--bg-subtle)] p-4">
          {current.answerIndex === null ? (
            <p className="font-semibold text-amber-700">정답 수동 검수 필요</p>
          ) : showAnswer ? (
            <p className="font-semibold text-green-700">추출 정답: {answerLabels[current.answerIndex]}</p>
          ) : (
            <p className="text-sm text-[var(--text-secondary)]">정답은 버튼을 눌러 별도로 확인하세요.</p>
          )}
        </div>

        <div className="mt-6 flex flex-wrap items-center justify-between gap-3">
          <button
            type="button"
            className="ab-btn ab-btn-secondary ab-btn-md disabled:cursor-not-allowed disabled:opacity-40"
            disabled={currentIndex === 0}
            onClick={() => moveTo(currentIndex - 1)}
          >
            <ChevronLeft size={17} /> 이전 문제
          </button>
          {current.answerIndex !== null && (
            <button
              type="button"
              className="ab-btn ab-btn-ghost ab-btn-md gap-2"
              onClick={() => setShowAnswer((visible) => !visible)}
            >
              {showAnswer ? <EyeOff size={17} /> : <Eye size={17} />}
              {showAnswer ? '정답 숨기기' : '정답 표시'}
            </button>
          )}
          <button
            type="button"
            className="ab-btn ab-btn-primary ab-btn-md disabled:cursor-not-allowed disabled:opacity-40"
            disabled={currentIndex === questions.length - 1}
            onClick={() => moveTo(currentIndex + 1)}
          >
            다음 문제 <ChevronRight size={17} />
          </button>
        </div>
      </section>

      <aside className="ab-card h-fit p-5 lg:sticky lg:top-24">
        <h2 className="font-bold">문항 바로가기</h2>
        <p className="mt-1 text-xs text-[var(--text-secondary)]">주황색은 정답 수동 검수 대상입니다.</p>
        <div className="mt-4 grid grid-cols-5 gap-2">
          {questions.map((question, index) => (
            <button
              type="button"
              key={question.id}
              aria-label={`${question.number}번 문제로 이동`}
              onClick={() => moveTo(index)}
              className={`h-10 rounded-lg border text-sm font-semibold transition-colors ${
                index === currentIndex
                  ? 'border-[var(--primary)] bg-[var(--primary)] text-white'
                  : question.answerIndex === null
                    ? 'border-orange-300 bg-orange-50 text-orange-700'
                    : 'border-[var(--border)] bg-white hover:border-[var(--primary)]'
              }`}
            >
              {question.number}
            </button>
          ))}
        </div>
      </aside>
    </div>
  )
}

