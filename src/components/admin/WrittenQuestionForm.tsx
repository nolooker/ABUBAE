'use client'

import { useRef, useState, type FormEvent } from 'react'
import { useRouter } from 'next/navigation'

type Draft = {
  examSlug: string
  year: string
  round: string
  subject: string
  number: string
  content: string
  choices: [string, string, string, string]
  acceptedAnswerIndexes: number[]
  explanation: string
}

const emptyDraft: Draft = {
  examSlug: 'jeongchogi',
  year: '',
  round: '',
  subject: '',
  number: '',
  content: '',
  choices: ['', '', '', ''],
  acceptedAnswerIndexes: [],
  explanation: '',
}

function errorMessage(status: number, serverMessage?: string): string {
  if (status === 400) return serverMessage || '입력값을 다시 확인해 주세요.'
  if (status === 404) return '해당 시험(examSlug)을 찾을 수 없습니다.'
  if (status === 409) return '같은 연도·회차·문항 번호의 문제가 이미 존재합니다.'
  return '문제를 저장하지 못했습니다. 다시 시도해 주세요.'
}

export default function WrittenQuestionForm() {
  const router = useRouter()
  const [draft, setDraft] = useState<Draft>(emptyDraft)
  const [isSaving, setIsSaving] = useState(false)
  const [error, setError] = useState<string | null>(null)
  const savingRef = useRef(false)

  const updateDraft = <Key extends keyof Draft>(field: Key, value: Draft[Key]) => {
    setDraft((current) => ({ ...current, [field]: value }))
  }

  const updateChoice = (index: number, value: string) => {
    setDraft((current) => {
      const choices = [...current.choices] as Draft['choices']
      choices[index] = value
      return { ...current, choices }
    })
  }

  const toggleAnswer = (index: number, checked: boolean) => {
    setDraft((current) => ({
      ...current,
      acceptedAnswerIndexes: checked
        ? [...current.acceptedAnswerIndexes, index].sort()
        : current.acceptedAnswerIndexes.filter((value) => value !== index),
    }))
  }

  const submit = async (event: FormEvent<HTMLFormElement>) => {
    event.preventDefault()
    if (savingRef.current) return
    savingRef.current = true
    setIsSaving(true)
    setError(null)

    const payload = {
      examSlug: draft.examSlug.trim(),
      year: Number(draft.year),
      round: Number(draft.round),
      subject: draft.subject.trim(),
      number: Number(draft.number),
      content: draft.content,
      choices: draft.choices,
      acceptedAnswerIndexes: draft.acceptedAnswerIndexes,
      explanation: draft.explanation,
    }

    try {
      const response = await fetch('/api/admin/written-questions', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(payload),
      })

      if (!response.ok) {
        const body: unknown = await response.json().catch(() => undefined)
        const serverMessage = body && typeof body === 'object' && 'error' in body && typeof body.error === 'string'
          ? body.error
          : undefined
        setError(errorMessage(response.status, serverMessage))
        savingRef.current = false
        setIsSaving(false)
        return
      }

      router.push('/admin/questions?status=created')
      router.refresh()
    } catch {
      setError('문제를 저장하지 못했습니다. 다시 시도해 주세요.')
      savingRef.current = false
      setIsSaving(false)
    }
  }

  return (
    <form onSubmit={submit} className="space-y-5" noValidate>
      <fieldset disabled={isSaving} className="space-y-5">
        <div className="grid grid-cols-2 gap-4 sm:grid-cols-4">
          <label className="block text-sm font-semibold text-[var(--text-primary)]">
            시험(examSlug)
            <input
              aria-label="examSlug"
              value={draft.examSlug}
              onChange={(event) => updateDraft('examSlug', event.target.value)}
              className="mt-2 w-full rounded-lg border border-[var(--border)] p-3 font-normal"
            />
          </label>
          <label className="block text-sm font-semibold text-[var(--text-primary)]">
            연도
            <input
              aria-label="연도"
              type="number"
              value={draft.year}
              onChange={(event) => updateDraft('year', event.target.value)}
              className="mt-2 w-full rounded-lg border border-[var(--border)] p-3 font-normal"
            />
          </label>
          <label className="block text-sm font-semibold text-[var(--text-primary)]">
            회차
            <input
              aria-label="회차"
              type="number"
              value={draft.round}
              onChange={(event) => updateDraft('round', event.target.value)}
              className="mt-2 w-full rounded-lg border border-[var(--border)] p-3 font-normal"
            />
          </label>
          <label className="block text-sm font-semibold text-[var(--text-primary)]">
            문항 번호
            <input
              aria-label="문항 번호"
              type="number"
              value={draft.number}
              onChange={(event) => updateDraft('number', event.target.value)}
              className="mt-2 w-full rounded-lg border border-[var(--border)] p-3 font-normal"
            />
          </label>
        </div>

        <label className="block text-sm font-semibold text-[var(--text-primary)]">
          과목
          <input
            aria-label="과목"
            value={draft.subject}
            onChange={(event) => updateDraft('subject', event.target.value)}
            className="mt-2 w-full rounded-lg border border-[var(--border)] p-3 font-normal"
          />
        </label>

        <label className="block text-sm font-semibold text-[var(--text-primary)]">
          문제 본문
          <textarea
            aria-label="문제 본문"
            value={draft.content}
            onChange={(event) => updateDraft('content', event.target.value)}
            rows={4}
            className="mt-2 w-full rounded-lg border border-[var(--border)] p-3 font-normal"
          />
        </label>

        <div className="space-y-2">
          <p className="text-sm font-semibold text-[var(--text-primary)]">선택지 · 정답(복수 선택 가능)</p>
          {draft.choices.map((choice, index) => (
            <div key={index} className="flex items-center gap-3">
              <input
                aria-label={`정답 ${index + 1}`}
                type="checkbox"
                checked={draft.acceptedAnswerIndexes.includes(index)}
                onChange={(event) => toggleAnswer(index, event.target.checked)}
              />
              <input
                aria-label={`선택지 ${index + 1}`}
                value={choice}
                onChange={(event) => updateChoice(index, event.target.value)}
                placeholder={`선택지 ${index + 1}`}
                className="flex-1 rounded-lg border border-[var(--border)] p-3 font-normal"
              />
            </div>
          ))}
        </div>

        <label className="block text-sm font-semibold text-[var(--text-primary)]">
          해설
          <textarea
            aria-label="해설"
            value={draft.explanation}
            onChange={(event) => updateDraft('explanation', event.target.value)}
            rows={4}
            className="mt-2 w-full rounded-lg border border-[var(--border)] p-3 font-normal"
          />
        </label>
      </fieldset>

      {error && <p role="alert" className="text-sm font-semibold text-red-600">{error}</p>}

      <button
        type="submit"
        disabled={isSaving}
        className="rounded-xl bg-[var(--primary)] px-4 py-2 text-sm font-bold text-white disabled:cursor-not-allowed disabled:opacity-60"
      >
        {isSaving ? '저장 중...' : '문제 생성'}
      </button>
    </form>
  )
}
