'use client'

import { useRouter } from 'next/navigation'
import { useState, type FormEvent } from 'react'
import ExamScheduleDeleteButton from './ExamScheduleDeleteButton'

type ExamSchedule = {
  id: string
  year: number
  round: number
  writtenApplyStart: string | null
  writtenApplyEnd: string | null
  writtenExamDate: string | null
  writtenResultDate: string | null
  practicalApplyStart: string | null
  practicalApplyEnd: string | null
  practicalExamDate: string | null
  finalResultDate: string | null
}

type DateField = Exclude<keyof ExamSchedule, 'id' | 'year' | 'round'>

const dateFields: { field: DateField; label: string }[] = [
  { field: 'writtenApplyStart', label: '필기 접수 시작' },
  { field: 'writtenApplyEnd', label: '필기 접수 종료' },
  { field: 'writtenExamDate', label: '필기 시험일' },
  { field: 'writtenResultDate', label: '필기 발표일' },
  { field: 'practicalApplyStart', label: '실기 접수 시작' },
  { field: 'practicalApplyEnd', label: '실기 접수 종료' },
  { field: 'practicalExamDate', label: '실기 시험일' },
  { field: 'finalResultDate', label: '최종 발표일' },
]

type Draft = { year: string; round: string } & Record<DateField, string>

function toDraft(schedule: ExamSchedule): Draft {
  return {
    year: String(schedule.year),
    round: String(schedule.round),
    writtenApplyStart: schedule.writtenApplyStart ?? '',
    writtenApplyEnd: schedule.writtenApplyEnd ?? '',
    writtenExamDate: schedule.writtenExamDate ?? '',
    writtenResultDate: schedule.writtenResultDate ?? '',
    practicalApplyStart: schedule.practicalApplyStart ?? '',
    practicalApplyEnd: schedule.practicalApplyEnd ?? '',
    practicalExamDate: schedule.practicalExamDate ?? '',
    finalResultDate: schedule.finalResultDate ?? '',
  }
}

function errorMessage(status: number): string {
  if (status === 409) return '해당 연도·회차 일정이 이미 있습니다.'
  if (status === 404) return '이미 삭제된 일정입니다.'
  if (status === 400) return '입력값을 다시 확인해 주세요.'
  return '일정을 저장하지 못했습니다. 다시 시도해 주세요.'
}

export default function ExamScheduleRow({ schedule }: { schedule: ExamSchedule }) {
  const router = useRouter()
  const [isEditing, setIsEditing] = useState(false)
  const [draft, setDraft] = useState<Draft>(toDraft(schedule))
  const [isSaving, setIsSaving] = useState(false)
  const [error, setError] = useState<string | null>(null)

  const updateDraft = <Key extends keyof Draft>(field: Key, value: Draft[Key]) => {
    setDraft((current) => ({ ...current, [field]: value }))
  }

  const startEditing = () => {
    setDraft(toDraft(schedule))
    setError(null)
    setIsEditing(true)
  }

  const submit = async (event: FormEvent<HTMLFormElement>) => {
    event.preventDefault()
    if (isSaving) return
    setIsSaving(true)
    setError(null)

    try {
      const response = await fetch(`/api/admin/exam-schedules/${schedule.id}`, {
        method: 'PATCH',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          year: Number(draft.year),
          round: Number(draft.round),
          ...Object.fromEntries(dateFields.map(({ field }) => [field, draft[field] || null])),
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

      setIsSaving(false)
      setIsEditing(false)
      router.refresh()
    } catch {
      setError('일정을 저장하지 못했습니다. 다시 시도해 주세요.')
      setIsSaving(false)
    }
  }

  if (isEditing) {
    return (
      <tr className="border-b border-[var(--border)] last:border-0">
        <td colSpan={dateFields.length + 3} className="px-4 py-4">
          <form onSubmit={submit}>
            <fieldset disabled={isSaving} className="grid grid-cols-2 gap-4 sm:grid-cols-5">
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
              {dateFields.map(({ field, label }) => (
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
                {isSaving ? '저장 중...' : '저장'}
              </button>
              <button
                type="button"
                onClick={() => { setIsEditing(false); setError(null) }}
                disabled={isSaving}
                className="rounded-xl border border-[var(--border)] px-4 py-2 text-sm font-bold text-[var(--text-primary)] disabled:cursor-not-allowed disabled:opacity-60"
              >
                취소
              </button>
            </div>
          </form>
        </td>
      </tr>
    )
  }

  return (
    <tr className="border-b border-[var(--border)] last:border-0">
      <td className="whitespace-nowrap px-4 py-3 text-[var(--text-primary)]">{schedule.year}년 {schedule.round}회</td>
      {dateFields.map(({ field }) => (
        <td key={field} className="whitespace-nowrap px-4 py-3 text-[var(--text-secondary)]">{schedule[field] ?? '-'}</td>
      ))}
      <td className="whitespace-nowrap px-4 py-3">
        <div className="flex items-center gap-2">
          <button
            type="button"
            onClick={startEditing}
            className="rounded-lg border border-[var(--border)] px-3 py-1.5 text-xs font-bold text-[var(--text-primary)]"
          >
            수정
          </button>
          <ExamScheduleDeleteButton scheduleId={schedule.id} />
        </div>
      </td>
    </tr>
  )
}
