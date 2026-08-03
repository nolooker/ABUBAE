'use client'

import { useRouter } from 'next/navigation'
import { useState, type FormEvent } from 'react'

type Draft = {
  year: string
  round: string
  writtenApplyStart: string
  writtenApplyEnd: string
  writtenExamDate: string
  writtenResultDate: string
  practicalApplyStart: string
  practicalApplyEnd: string
  practicalExamDate: string
  finalResultDate: string
}

const emptyDraft: Draft = {
  year: '',
  round: '',
  writtenApplyStart: '',
  writtenApplyEnd: '',
  writtenExamDate: '',
  writtenResultDate: '',
  practicalApplyStart: '',
  practicalApplyEnd: '',
  practicalExamDate: '',
  finalResultDate: '',
}

const dateFieldLabels: { field: keyof Draft; label: string }[] = [
  { field: 'writtenApplyStart', label: '필기 접수 시작' },
  { field: 'writtenApplyEnd', label: '필기 접수 종료' },
  { field: 'writtenExamDate', label: '필기 시험일' },
  { field: 'writtenResultDate', label: '필기 발표일' },
  { field: 'practicalApplyStart', label: '실기 접수 시작' },
  { field: 'practicalApplyEnd', label: '실기 접수 종료' },
  { field: 'practicalExamDate', label: '실기 시험일' },
  { field: 'finalResultDate', label: '최종 발표일' },
]

function errorMessage(status: number): string {
  if (status === 409) return '해당 연도·회차 일정이 이미 있습니다.'
  if (status === 400) return '입력값을 다시 확인해 주세요.'
  return '일정을 만들지 못했습니다. 다시 시도해 주세요.'
}

type ExamScheduleCreateFormProps = {
  examSlug: string
}

export default function ExamScheduleCreateForm({ examSlug }: ExamScheduleCreateFormProps) {
  const router = useRouter()
  const [isOpen, setIsOpen] = useState(false)
  const [draft, setDraft] = useState<Draft>(emptyDraft)
  const [isSaving, setIsSaving] = useState(false)
  const [error, setError] = useState<string | null>(null)

  const updateDraft = <Key extends keyof Draft>(field: Key, value: Draft[Key]) => {
    setDraft((current) => ({ ...current, [field]: value }))
  }

  const submit = async (event: FormEvent<HTMLFormElement>) => {
    event.preventDefault()
    if (isSaving) return
    setIsSaving(true)
    setError(null)

    try {
      const response = await fetch('/api/admin/exam-schedules', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          examSlug,
          year: Number(draft.year),
          round: Number(draft.round),
          ...Object.fromEntries(dateFieldLabels.map(({ field }) => [field, draft[field] || null])),
        }),
      })

      if (!response.ok) {
        const payload: unknown = await response.json().catch(() => undefined)
        const serverMessage = payload && typeof payload === 'object' && 'error' in payload && typeof payload.error === 'string'
          ? payload.error
          : undefined
        setError(serverMessage ?? errorMessage(response.status))
        setIsSaving(false)
        return
      }

      setDraft(emptyDraft)
      setIsOpen(false)
      setIsSaving(false)
      router.refresh()
    } catch {
      setError('일정을 만들지 못했습니다. 다시 시도해 주세요.')
      setIsSaving(false)
    }
  }

  if (!isOpen) {
    return (
      <button
        type="button"
        onClick={() => setIsOpen(true)}
        className="rounded-xl bg-[var(--primary)] px-4 py-2.5 text-sm font-bold text-white hover:bg-[var(--primary-hover)]"
      >
        새 일정 추가
      </button>
    )
  }

  return (
    <form onSubmit={submit} className="rounded-[var(--radius-lg)] border border-[var(--border)] bg-white p-5">
      <fieldset disabled={isSaving} className="grid grid-cols-2 gap-4 sm:grid-cols-4">
        <label className="block text-sm font-semibold text-[var(--text-primary)]">
          연도
          <input
            type="number"
            value={draft.year}
            onChange={(event) => updateDraft('year', event.target.value)}
            required
            className="mt-1.5 w-full rounded-lg border border-[var(--border)] p-2.5 font-normal"
          />
        </label>
        <label className="block text-sm font-semibold text-[var(--text-primary)]">
          회차
          <input
            type="number"
            value={draft.round}
            onChange={(event) => updateDraft('round', event.target.value)}
            required
            className="mt-1.5 w-full rounded-lg border border-[var(--border)] p-2.5 font-normal"
          />
        </label>
        {dateFieldLabels.map(({ field, label }) => (
          <label key={field} className="block text-sm font-semibold text-[var(--text-primary)]">
            {label}
            <input
              type="date"
              value={draft[field]}
              onChange={(event) => updateDraft(field, event.target.value)}
              className="mt-1.5 w-full rounded-lg border border-[var(--border)] p-2.5 font-normal"
            />
          </label>
        ))}
      </fieldset>

      {error && <p role="alert" className="mt-4 text-sm font-semibold text-red-600">{error}</p>}

      <div className="mt-4 flex items-center gap-3">
        <button
          type="submit"
          disabled={isSaving}
          className="rounded-xl bg-[var(--primary)] px-4 py-2 text-sm font-bold text-white disabled:cursor-not-allowed disabled:opacity-60"
        >
          {isSaving ? '만드는 중...' : '일정 생성'}
        </button>
        <button
          type="button"
          onClick={() => { setIsOpen(false); setError(null) }}
          disabled={isSaving}
          className="rounded-xl border border-[var(--border)] px-4 py-2 text-sm font-bold text-[var(--text-primary)] disabled:cursor-not-allowed disabled:opacity-60"
        >
          취소
        </button>
      </div>
    </form>
  )
}
