'use client'

import Link from 'next/link'
import { useMemo, useState } from 'react'
import { ArrowRight } from 'lucide-react'
import type { QuestionView } from '@/lib/data'

type QuestionRoundTabsProps = {
  examSlug: string
  questions: QuestionView[]
}

type RoundGroup = {
  key: string
  label: string
  year: number
  round: number
  questions: QuestionView[]
}

const practicalMockQuestions = [
  {
    id: 'practical-mock-1',
    year: 2024,
    round: 1,
    subject: '실기',
    number: 1,
    content: '소프트웨어 생명주기 모형 중 폭포수 모형의 특징을 서술하시오.',
    answerText:
      '각 단계가 순차적으로 진행되며, 이전 단계가 완료되어야 다음 단계로 넘어가는 전통적 개발 방식',
    explanation:
      '실기에서는 객관식처럼 하나를 고르는 문제가 아니라, 핵심 키워드를 빠뜨리지 않고 정리하는 답안 구성이 중요합니다.',
  },
  {
    id: 'practical-mock-2',
    year: 2023,
    round: 3,
    subject: '실기',
    number: 2,
    content: 'OSI 7계층 중 전송 계층의 주요 역할을 한두 문장으로 설명하시오.',
    answerText: '종단 간 신뢰성 있는 데이터 전송과 흐름 제어, 오류 제어를 담당한다.',
    explanation:
      '실기형 답안은 너무 길게 쓰기보다, 채점 포인트가 되는 용어를 짧고 분명하게 넣는 쪽이 좋습니다.',
  },
]

export default function QuestionRoundTabs({
  examSlug,
  questions,
}: QuestionRoundTabsProps) {
  const [selectedMode, setSelectedMode] = useState<'written' | 'practical'>('written')

  const roundGroups = useMemo<RoundGroup[]>(() => {
    const grouped = new Map<string, RoundGroup>()

    questions.forEach((question) => {
      const key = `${question.year}-${question.round}`

      if (!grouped.has(key)) {
        grouped.set(key, {
          key,
          label: `${question.year}년 ${question.round}회`,
          year: question.year,
          round: question.round,
          questions: [],
        })
      }

      grouped.get(key)!.questions.push(question)
    })

    return Array.from(grouped.values()).sort((a, b) => {
      if (a.year !== b.year) {
        return b.year - a.year
      }
      return b.round - a.round
    })
  }, [questions])

  const [selectedRoundKey, setSelectedRoundKey] = useState(roundGroups[0]?.key ?? '')

  const selectedRound = roundGroups.find((group) => group.key === selectedRoundKey) ?? roundGroups[0]

  if (!questions.length) {
    return (
      <div className="rounded-[var(--radius-lg)] border border-[var(--border)] bg-white p-6 text-center text-[var(--text-secondary)]">
        아직 등록된 기출문제가 없습니다.
      </div>
    )
  }

  return (
    <div className="space-y-5">
      <div className="inline-flex flex-wrap rounded-xl border border-[var(--border)] bg-[var(--bg-subtle)] p-1">
        <button
          type="button"
          onClick={() => setSelectedMode('written')}
          className={`rounded-lg px-4 py-2 text-[13px] font-semibold transition-colors ${
            selectedMode === 'written'
              ? 'bg-white text-[var(--primary)] shadow-sm'
              : 'text-[var(--text-secondary)] hover:text-[var(--text-primary)]'
          }`}
        >
          필기 기출
        </button>
        <button
          type="button"
          onClick={() => setSelectedMode('practical')}
          className={`rounded-lg px-4 py-2 text-[13px] font-semibold transition-colors ${
            selectedMode === 'practical'
              ? 'bg-white text-[var(--primary)] shadow-sm'
              : 'text-[var(--text-secondary)] hover:text-[var(--text-primary)]'
          }`}
        >
          실기 기출
        </button>
      </div>

      {selectedMode === 'practical' ? (
        <div className="space-y-4">
          <div className="rounded-[var(--radius-lg)] border border-dashed border-[var(--border-strong)] bg-white p-5">
            <h2 className="text-[20px] font-bold text-[var(--text-primary)]">실기 기출 mockup</h2>
            <p className="mt-2 text-[14px] leading-7 text-[var(--text-secondary)]">
              실기는 필기처럼 선택지를 고르는 대신, 문제를 읽고 바로 답안을 써보는 흐름이 더
              자연스럽습니다. 그래서 textarea 중심 입력 화면으로 구성하는 쪽이 맞습니다.
            </p>
          </div>

          {practicalMockQuestions.map((question) => (
            <article
              key={question.id}
              className="rounded-[var(--radius-lg)] border border-[var(--border)] bg-white p-5 shadow-sm"
            >
              <div className="mb-3 flex flex-wrap items-center gap-2 text-[12px] text-[var(--text-muted)]">
                <span className="font-semibold text-[var(--accent)]">{question.subject}</span>
                <span>
                  {question.year}년 {question.round}회
                </span>
                <span>{question.number}번</span>
              </div>

              <h3 className="text-[16px] font-bold leading-relaxed text-[var(--text-primary)]">
                {question.number}. {question.content}
              </h3>

              <div className="mt-4">
                <label
                  htmlFor={question.id}
                  className="mb-2 block text-[13px] font-semibold text-[var(--text-primary)]"
                >
                  답안 작성
                </label>
                <textarea
                  id={question.id}
                  placeholder="여기에 실기 답안을 직접 써보세요."
                  className="min-h-[180px] w-full rounded-xl border border-[var(--border)] bg-[var(--bg-subtle)] px-4 py-3 text-[14px] leading-7 text-[var(--text-primary)] outline-none transition-colors focus:border-[var(--primary)]"
                  defaultValue=""
                />
              </div>

              <div className="mt-4 rounded-xl border border-[var(--border)] bg-[var(--bg-subtle)] p-4">
                <p className="mb-2 text-[12px] font-bold text-[var(--primary)]">모범답안 예시</p>
                <p className="text-[14px] leading-7 text-[var(--text-secondary)]">
                  {question.answerText}
                </p>
              </div>

              <div className="mt-4 rounded-xl border border-[var(--border)] bg-white p-4">
                <p className="mb-2 text-[12px] font-bold text-[var(--text-primary)]">답안 작성 팁</p>
                <p className="text-[14px] leading-7 text-[var(--text-secondary)]">
                  {question.explanation}
                </p>
              </div>
            </article>
          ))}
        </div>
      ) : (
        <>
          <div className="rounded-[var(--radius-lg)] border border-[var(--border)] bg-white p-4">
            <div className="flex flex-wrap gap-2">
              {roundGroups.map((group) => {
                const isActive = group.key === selectedRound?.key

                return (
                  <button
                    key={group.key}
                    type="button"
                    onClick={() => setSelectedRoundKey(group.key)}
                    className={`rounded-full px-4 py-2 text-[13px] font-semibold transition-colors ${
                      isActive
                        ? 'bg-[var(--primary)] text-white'
                        : 'bg-[var(--bg-subtle)] text-[var(--text-secondary)] hover:bg-[var(--primary-light)] hover:text-[var(--primary)]'
                    }`}
                  >
                    {group.label}
                    <span className="ml-1.5 text-[11px] opacity-80">{group.questions.length}문제</span>
                  </button>
                )
              })}
            </div>
          </div>

          <div className="rounded-[var(--radius-lg)] border border-[var(--border)] bg-white p-5">
            <div className="mb-5 flex flex-wrap items-end justify-between gap-3 border-b border-[var(--border)] pb-4">
              <div>
                <p className="text-[12px] font-semibold text-[var(--primary)]">선택한 회차</p>
                <h2 className="mt-1 text-[22px] font-bold text-[var(--text-primary)]">
                  {selectedRound?.label}
                </h2>
              </div>
              <p className="text-[13px] text-[var(--text-secondary)]">
                총 {selectedRound?.questions.length ?? 0}문제
              </p>
            </div>

            <div className="space-y-4">
              {selectedRound?.questions.map((question) => (
                <article
                  key={question.id}
                  className="rounded-[var(--radius-lg)] border border-[var(--border)] bg-white p-5 shadow-sm"
                >
                  <div className="mb-3 flex flex-wrap items-center gap-2 text-[12px] text-[var(--text-muted)]">
                    <span className="font-semibold text-[var(--primary)]">{question.subject}</span>
                    <span>{selectedRound.label}</span>
                    <span>{question.number}번</span>
                    <span>난이도 {question.difficulty}/5</span>
                  </div>

                  <h3 className="text-[16px] font-bold leading-relaxed text-[var(--text-primary)]">
                    {question.number}. {question.content}
                  </h3>

                  <div className="mt-4 grid grid-cols-1 gap-2 sm:grid-cols-2">
                    {question.choices.map((choice, index) => (
                      <div
                        key={`${question.id}-${index}`}
                        className="flex items-center gap-2.5 rounded-lg border border-[var(--border)] p-3 text-[13px] text-[var(--text-secondary)]"
                      >
                        <span className="flex h-6 w-6 items-center justify-center rounded-full bg-[var(--bg-muted)] text-[11px] font-bold">
                          {index + 1}
                        </span>
                        <span className="line-clamp-2">{choice}</span>
                      </div>
                    ))}
                  </div>

                  <Link
                    href={`/exam/${examSlug}/questions/${question.id}`}
                    className="mt-4 inline-flex items-center gap-1.5 text-[13px] font-bold text-[var(--primary)] hover:underline"
                  >
                    정답과 해설 보기 <ArrowRight size={13} />
                  </Link>
                </article>
              ))}
            </div>
          </div>
        </>
      )}
    </div>
  )
}
