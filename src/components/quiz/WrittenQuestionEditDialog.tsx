'use client'

import { useEffect, useMemo, useRef, useState, type KeyboardEvent } from 'react'

export type EditableWrittenQuestion = {
  id: string
  number: number
  subject: string
  content: string
  choices: string[]
  updatedAt: string
  acceptedAnswerIndexes: number[]
  explanation: string
}

export type EditedWrittenQuestion = EditableWrittenQuestion

type Props = {
  question: EditableWrittenQuestion
  onClose: () => void
  onSaved: (question: EditedWrittenQuestion) => void
  onRefreshLatest: () => Promise<EditableWrittenQuestion>
}

const choiceLabels = ['A', 'B', 'C', 'D']

export default function WrittenQuestionEditDialog({ question, onClose, onSaved, onRefreshLatest }: Props) {
  const [baselineQuestion, setBaselineQuestion] = useState(question)
  const [content, setContent] = useState(question.content)
  const [choices, setChoices] = useState(question.choices)
  const [acceptedAnswerIndexes, setAcceptedAnswerIndexes] = useState(question.acceptedAnswerIndexes)
  const [explanation, setExplanation] = useState(question.explanation)
  const [isSaving, setIsSaving] = useState(false)
  const [isRefreshing, setIsRefreshing] = useState(false)
  const [error, setError] = useState<string | null>(null)
  const [hasConflict, setHasConflict] = useState(false)
  const [announcement, setAnnouncement] = useState<string | null>(null)
  const [showDiscardConfirmation, setShowDiscardConfirmation] = useState(false)
  const editDialogRef = useRef<HTMLElement | null>(null)
  const discardDialogRef = useRef<HTMLElement | null>(null)
  const questionFieldRef = useRef<HTMLTextAreaElement | null>(null)
  const editRestoreFocusRef = useRef<HTMLElement | null>(null)

  useEffect(() => {
    editRestoreFocusRef.current = document.activeElement instanceof HTMLElement ? document.activeElement : null
    questionFieldRef.current?.focus()

    return () => editRestoreFocusRef.current?.focus()
  }, [])

  useEffect(() => {
    if (!showDiscardConfirmation) return

    const returnFocus = document.activeElement instanceof HTMLElement ? document.activeElement : null
    const firstFocusable = focusableElements(discardDialogRef.current)[0]
    firstFocusable?.focus()

    return () => returnFocus?.focus()
  }, [showDiscardConfirmation])

  const isDirty = useMemo(() => (
    content !== baselineQuestion.content
    || explanation !== baselineQuestion.explanation
    || choices.some((choice, index) => choice !== baselineQuestion.choices[index])
    || acceptedAnswerIndexes.length !== baselineQuestion.acceptedAnswerIndexes.length
    || acceptedAnswerIndexes.some((index) => !baselineQuestion.acceptedAnswerIndexes.includes(index))
  ), [acceptedAnswerIndexes, baselineQuestion, choices, content, explanation])

  const requestClose = () => {
    if (isSaving || isRefreshing) return
    if (isDirty) {
      setShowDiscardConfirmation(true)
      return
    }
    onClose()
  }

  const changeChoice = (index: number, value: string) => {
    setChoices((previous) => previous.map((choice, choiceIndex) => choiceIndex === index ? value : choice))
  }

  const toggleAcceptedAnswer = (index: number) => {
    setAcceptedAnswerIndexes((previous) => previous.includes(index)
      ? previous.filter((answerIndex) => answerIndex !== index)
      : [...previous, index].sort((a, b) => a - b))
  }

  const save = async () => {
    if (!content.trim() || choices.some((choice) => !choice.trim()) || acceptedAnswerIndexes.length === 0) {
      setError('문제, 보기 4개, 정답을 모두 입력해 주세요.')
      return
    }

    setIsSaving(true)
    setError(null)
    setHasConflict(false)
    setAnnouncement(null)
    try {
      const response = await fetch(`/api/admin/written-questions/${question.id}`, {
        method: 'PATCH',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          content,
          choices,
          acceptedAnswerIndexes,
          explanation,
          expectedUpdatedAt: baselineQuestion.updatedAt,
        }),
      })
      if (!response.ok) {
        const apiError = await readRedactedError(response)
        if (response.status === 409 && apiError === 'question was updated by another request') {
          setHasConflict(true)
          setError('다른 수정 사항이 먼저 저장되었습니다. 작성 중인 내용은 유지됩니다. 최신 내용을 불러와 저장 기준을 갱신해 주세요.')
        } else if (response.status === 400 && apiError) {
          setError('입력 내용을 확인해 주세요.')
        } else {
          setError('문제를 저장하지 못했습니다. 잠시 후 다시 시도해 주세요.')
        }
        return
      }

      const updated: unknown = await response.json()
      if (!isEditedQuestion(updated, question.id)) throw new Error('invalid response')
      setHasConflict(false)
      setAnnouncement('문제가 저장되었습니다.')
      onSaved({
        ...updated,
        acceptedAnswerIndexes: [...acceptedAnswerIndexes],
        explanation,
      })
    } catch {
      setError('문제를 저장하지 못했습니다. 잠시 후 다시 시도해 주세요.')
    } finally {
      setIsSaving(false)
    }
  }

  const refreshLatest = async () => {
    setIsRefreshing(true)
    setError(null)
    setAnnouncement(null)
    try {
      const latestQuestion = await onRefreshLatest()
      if (!isEditableQuestion(latestQuestion, question.id)) throw new Error('invalid refresh response')
      setBaselineQuestion(latestQuestion)
      setHasConflict(false)
      setAnnouncement('최신 저장 기준을 불러왔습니다. 작성 중인 내용은 유지했습니다. 내용을 검토한 뒤 다시 저장해 주세요.')
    } catch {
      setError('최신 내용을 불러오지 못했습니다. 잠시 후 다시 시도해 주세요.')
    } finally {
      setIsRefreshing(false)
    }
  }

  const handleKeyDown = (event: KeyboardEvent<HTMLDivElement>) => {
    if (event.key === 'Escape') {
      event.preventDefault()
      if (showDiscardConfirmation) {
        setShowDiscardConfirmation(false)
      } else {
        requestClose()
      }
      return
    }

    if (event.key === 'Tab') {
      trapFocus(event, showDiscardConfirmation ? discardDialogRef.current : editDialogRef.current)
    }
  }

  return (
    <div className="fixed inset-0 z-50 flex items-center justify-center bg-slate-950/50 p-4" role="presentation" onKeyDown={handleKeyDown}>
      <section ref={editDialogRef} role="dialog" aria-modal="true" aria-labelledby="edit-question-title" className="max-h-full w-full max-w-3xl overflow-y-auto rounded-2xl bg-white p-6 shadow-2xl">
        <div className="flex items-start justify-between gap-4">
          <div>
            <p className="text-sm font-semibold text-[var(--primary)]">{question.subject}</p>
            <h2 id="edit-question-title" className="mt-1 text-xl font-bold">Edit question {question.number}</h2>
          </div>
          <button type="button" aria-label="Close edit dialog" className="ab-btn ab-btn-secondary ab-btn-md" onClick={requestClose} disabled={isSaving}>Close</button>
        </div>

        <div className="mt-6 space-y-5">
          <label className="block text-sm font-semibold">Question
            <textarea ref={questionFieldRef} aria-label="Question" value={content} onChange={(event) => setContent(event.target.value)} disabled={isSaving} rows={4} className="mt-2 w-full rounded-lg border border-[var(--border)] p-3 font-normal" />
          </label>

          <fieldset>
            <legend className="text-sm font-semibold">Choices and correct answers</legend>
            <div className="mt-2 space-y-3">
              {choices.map((choice, index) => (
                <div key={index} className="flex items-center gap-3">
                  <input id={`correct-choice-${index}`} aria-label={`Correct choice ${index + 1}`} type="checkbox" checked={acceptedAnswerIndexes.includes(index)} onChange={() => toggleAcceptedAnswer(index)} disabled={isSaving} className="h-4 w-4" />
                  <label htmlFor={`correct-choice-${index}`} className="font-semibold">{choiceLabels[index]}</label>
                  <input aria-label={`Choice ${index + 1}`} value={choice} onChange={(event) => changeChoice(index, event.target.value)} disabled={isSaving} className="min-w-0 flex-1 rounded-lg border border-[var(--border)] p-3 font-normal" />
                </div>
              ))}
            </div>
          </fieldset>

          <label className="block text-sm font-semibold">Explanation
            <textarea aria-label="Explanation" value={explanation} onChange={(event) => setExplanation(event.target.value)} disabled={isSaving} rows={4} className="mt-2 w-full rounded-lg border border-[var(--border)] p-3 font-normal" />
          </label>
        </div>

        {error && <p role="alert" className="mt-4 text-sm font-semibold text-red-600">{error}</p>}
        <p role="status" aria-live="polite" className={announcement ? 'mt-4 text-sm font-semibold text-blue-700' : 'sr-only'}>{announcement ?? ''}</p>
        {hasConflict && (
          <div className="mt-4 rounded-xl bg-orange-50 p-4">
            <button type="button" className="ab-btn ab-btn-secondary ab-btn-md" onClick={refreshLatest} disabled={isSaving || isRefreshing}>
              {isRefreshing ? '불러오는 중...' : '최신 내용 불러오기'}
            </button>
          </div>
        )}
        <div className="mt-6 flex flex-col-reverse gap-2 sm:flex-row sm:justify-end">
          <button type="button" className="ab-btn ab-btn-secondary ab-btn-md" onClick={requestClose} disabled={isSaving || isRefreshing}>Cancel</button>
          <button type="button" className="ab-btn ab-btn-primary ab-btn-md" onClick={save} disabled={isSaving || isRefreshing}>{isSaving ? 'Saving…' : 'Save'}</button>
        </div>
      </section>

      {showDiscardConfirmation && (
        <div className="fixed inset-0 z-[60] flex items-center justify-center bg-slate-950/50 p-4">
          <section ref={discardDialogRef} role="alertdialog" aria-modal="true" aria-labelledby="discard-title" className="w-full max-w-md rounded-2xl bg-white p-6 shadow-2xl">
            <h3 id="discard-title" className="text-lg font-bold">Discard changes?</h3>
            <p className="mt-2 text-sm text-[var(--text-secondary)]">Your unsaved edits will be lost.</p>
            <div className="mt-6 flex flex-col-reverse gap-2 sm:flex-row sm:justify-end">
              <button type="button" className="ab-btn ab-btn-secondary ab-btn-md" onClick={() => setShowDiscardConfirmation(false)}>Keep editing</button>
              <button type="button" className="ab-btn ab-btn-primary ab-btn-md" onClick={onClose}>Discard changes</button>
            </div>
          </section>
        </div>
      )}
    </div>
  )
}

function isEditedQuestion(value: unknown, expectedId: string): value is Omit<EditedWrittenQuestion, 'acceptedAnswerIndexes' | 'explanation'> {
  if (typeof value !== 'object' || value === null || Array.isArray(value)) return false
  const question = value as Record<string, unknown>
  return question.id === expectedId
    && typeof question.number === 'number'
    && Number.isSafeInteger(question.number)
    && question.number > 0
    && typeof question.subject === 'string'
    && typeof question.content === 'string'
    && Array.isArray(question.choices)
    && question.choices.length === 4
    && question.choices.every((choice) => typeof choice === 'string' && choice.trim().length > 0)
    && typeof question.updatedAt === 'string'
}

function isEditableQuestion(value: unknown, expectedId: string): value is EditableWrittenQuestion {
  if (!isEditedQuestion(value, expectedId)) return false
  const question = value as EditableWrittenQuestion
  return Array.isArray(question.acceptedAnswerIndexes)
    && question.acceptedAnswerIndexes.length > 0
    && question.acceptedAnswerIndexes.every((index) => Number.isSafeInteger(index) && index >= 0 && index < 4)
    && typeof question.explanation === 'string'
}

async function readRedactedError(response: Response): Promise<string | undefined> {
  try {
    const value: unknown = await response.json()
    if (typeof value !== 'object' || value === null || Array.isArray(value)) return undefined
    const error = (value as Record<string, unknown>).error
    return typeof error === 'string' ? error : undefined
  } catch {
    return undefined
  }
}

function focusableElements(container: HTMLElement | null): HTMLElement[] {
  if (!container) return []

  return Array.from(container.querySelectorAll<HTMLElement>('button:not([disabled]), input:not([disabled]), textarea:not([disabled]), select:not([disabled]), [href], [tabindex]:not([tabindex="-1"])'))
}

function trapFocus(event: KeyboardEvent<HTMLDivElement>, container: HTMLElement | null) {
  const focusable = focusableElements(container)
  if (focusable.length === 0) return

  const first = focusable[0]
  const last = focusable[focusable.length - 1]
  const activeElement = document.activeElement
  if (event.shiftKey && (activeElement === first || !container?.contains(activeElement))) {
    event.preventDefault()
    last.focus()
  } else if (!event.shiftKey && (activeElement === last || !container?.contains(activeElement))) {
    event.preventDefault()
    first.focus()
  }
}
