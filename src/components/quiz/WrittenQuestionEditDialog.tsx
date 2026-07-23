'use client'

import { useMemo, useState } from 'react'

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
}

const choiceLabels = ['A', 'B', 'C', 'D']

export default function WrittenQuestionEditDialog({ question, onClose, onSaved }: Props) {
  const [content, setContent] = useState(question.content)
  const [choices, setChoices] = useState(question.choices)
  const [acceptedAnswerIndexes, setAcceptedAnswerIndexes] = useState(question.acceptedAnswerIndexes)
  const [explanation, setExplanation] = useState(question.explanation)
  const [isSaving, setIsSaving] = useState(false)
  const [error, setError] = useState<string | null>(null)
  const [showDiscardConfirmation, setShowDiscardConfirmation] = useState(false)

  const isDirty = useMemo(() => (
    content !== question.content
    || explanation !== question.explanation
    || choices.some((choice, index) => choice !== question.choices[index])
    || acceptedAnswerIndexes.length !== question.acceptedAnswerIndexes.length
    || acceptedAnswerIndexes.some((index) => !question.acceptedAnswerIndexes.includes(index))
  ), [acceptedAnswerIndexes, choices, content, explanation, question])

  const requestClose = () => {
    if (isSaving) return
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
      setError('Enter a question, four choices, and at least one correct choice.')
      return
    }

    setIsSaving(true)
    setError(null)
    try {
      const response = await fetch(`/api/admin/written-questions/${question.id}`, {
        method: 'PATCH',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          content,
          choices,
          acceptedAnswerIndexes,
          explanation,
          expectedUpdatedAt: question.updatedAt,
        }),
      })
      if (!response.ok) throw new Error('save failed')

      const updated: unknown = await response.json()
      if (!isEditedQuestion(updated)) throw new Error('invalid response')
      onSaved({
        ...updated,
        acceptedAnswerIndexes: [...acceptedAnswerIndexes],
        explanation,
      })
    } catch {
      setError('Unable to save this question. Please try again.')
    } finally {
      setIsSaving(false)
    }
  }

  return (
    <div className="fixed inset-0 z-50 flex items-center justify-center bg-slate-950/50 p-4" role="presentation">
      <section role="dialog" aria-modal="true" aria-labelledby="edit-question-title" className="max-h-full w-full max-w-3xl overflow-y-auto rounded-2xl bg-white p-6 shadow-2xl">
        <div className="flex items-start justify-between gap-4">
          <div>
            <p className="text-sm font-semibold text-[var(--primary)]">{question.subject}</p>
            <h2 id="edit-question-title" className="mt-1 text-xl font-bold">Edit question {question.number}</h2>
          </div>
          <button type="button" aria-label="Close edit dialog" className="ab-btn ab-btn-secondary ab-btn-md" onClick={requestClose} disabled={isSaving}>Close</button>
        </div>

        <div className="mt-6 space-y-5">
          <label className="block text-sm font-semibold">Question
            <textarea aria-label="Question" value={content} onChange={(event) => setContent(event.target.value)} disabled={isSaving} rows={4} className="mt-2 w-full rounded-lg border border-[var(--border)] p-3 font-normal" />
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
        <div className="mt-6 flex flex-col-reverse gap-2 sm:flex-row sm:justify-end">
          <button type="button" className="ab-btn ab-btn-secondary ab-btn-md" onClick={requestClose} disabled={isSaving}>Cancel</button>
          <button type="button" className="ab-btn ab-btn-primary ab-btn-md" onClick={save} disabled={isSaving}>{isSaving ? 'Saving…' : 'Save'}</button>
        </div>
      </section>

      {showDiscardConfirmation && (
        <div className="fixed inset-0 z-[60] flex items-center justify-center bg-slate-950/50 p-4">
          <section role="alertdialog" aria-modal="true" aria-labelledby="discard-title" className="w-full max-w-md rounded-2xl bg-white p-6 shadow-2xl">
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

function isEditedQuestion(value: unknown): value is Omit<EditedWrittenQuestion, 'acceptedAnswerIndexes' | 'explanation'> {
  if (typeof value !== 'object' || value === null || Array.isArray(value)) return false
  const question = value as Record<string, unknown>
  return typeof question.id === 'string'
    && typeof question.number === 'number'
    && typeof question.subject === 'string'
    && typeof question.content === 'string'
    && Array.isArray(question.choices)
    && question.choices.every((choice) => typeof choice === 'string')
    && typeof question.updatedAt === 'string'
}
