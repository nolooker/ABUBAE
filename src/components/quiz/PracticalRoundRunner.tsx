'use client'

import { useState } from 'react'
import { ChevronLeft, ChevronRight } from 'lucide-react'

import type { PracticalGradeResult } from '@/lib/practical-exam'
import PracticalRoundResult from './PracticalRoundResult'
import PracticalQuestionEditDialog, { type EditablePracticalQuestion, type EditedPracticalQuestion } from './PracticalQuestionEditDialog'

type PracticalRoundQuestion = {
  id: string
  number: number
  subject: string
  content: string
  blankCount: number
}

type Props = {
  year: number
  round: number
  title: string
  questions: PracticalRoundQuestion[]
  canEdit?: boolean
  editableQuestions?: Record<string, EditablePracticalQuestion>
  loadEditableQuestion?: (questionId: string) => Promise<EditablePracticalQuestion>
}

function isAnswered(blanks: string[] | undefined): boolean {
  return Boolean(blanks?.some((blank) => blank.trim()))
}

export default function PracticalRoundRunner({ year, round, title, questions, canEdit = false, editableQuestions, loadEditableQuestion }: Props) {
  const [roundQuestions, setRoundQuestions] = useState(questions)
  const [currentIndex, setCurrentIndex] = useState(0)
  const [answers, setAnswers] = useState<Record<string, string[]>>({})
  const [showSubmitDialog, setShowSubmitDialog] = useState(false)
  const [isSubmitting, setIsSubmitting] = useState(false)
  const [submitError, setSubmitError] = useState<string | null>(null)
  const [result, setResult] = useState<PracticalGradeResult | null>(null)
  const [showEditDialog, setShowEditDialog] = useState(false)
  const [isLoadingEdit, setIsLoadingEdit] = useState(false)
  const [editError, setEditError] = useState<string | null>(null)
  const [editAnnouncement, setEditAnnouncement] = useState<string | null>(null)
  const [editingQuestion, setEditingQuestion] = useState<EditablePracticalQuestion | null>(null)
  const [editableQuestionCache, setEditableQuestionCache] = useState<Record<string, EditablePracticalQuestion>>({})
  const current = roundQuestions[currentIndex]
  const answeredCount = roundQuestions.filter((question) => isAnswered(answers[question.id])).length
  const unansweredNumbers = roundQuestions.filter((question) => !isAnswered(answers[question.id])).map((question) => question.number)

  const moveTo = (index: number) => {
    setCurrentIndex(index)
    try {
      window.scrollTo({ top: 0, behavior: 'smooth' })
    } catch {
      // Embedded browsers can reject smooth scrolling; navigation must still work.
    }
  }

  const updateBlank = (questionId: string, blankIndex: number, value: string) => {
    setAnswers((previous) => {
      const blanks = [...(previous[questionId] ?? [])]
      blanks[blankIndex] = value
      return { ...previous, [questionId]: blanks }
    })
  }

  const submitRound = async () => {
    setIsSubmitting(true)
    setSubmitError(null)
    try {
      const response = await fetch(`/api/exam/jeongchogi/questions/practical/${year}/${round}/grade`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ answers }),
      })
      if (!response.ok) throw new Error('채점 요청에 실패했습니다.')
      setResult(await response.json())
      setShowSubmitDialog(false)
      window.scrollTo({ top: 0, behavior: 'smooth' })
    } catch (error) {
      setSubmitError(error instanceof Error ? error.message : '채점 중 오류가 발생했습니다.')
    } finally {
      setIsSubmitting(false)
    }
  }

  const resetRound = () => {
    setAnswers({})
    setResult(null)
    setCurrentIndex(0)
    setSubmitError(null)
    window.scrollTo({ top: 0, behavior: 'smooth' })
  }

  const openEditDialog = async () => {
    if (!canEdit) return

    setEditAnnouncement(null)
    setShowEditDialog(true)
    setEditError(null)
    const cachedQuestion = editableQuestionCache[current.id] ?? editableQuestions?.[current.id]
    if (cachedQuestion) {
      setEditingQuestion(cachedQuestion)
      return
    }
    if (!loadEditableQuestion) {
      setEditError('이 문항의 편집 정보를 불러오지 못했습니다.')
      return
    }

    setIsLoadingEdit(true)
    try {
      const editableQuestion = await loadEditableQuestion(current.id)
      setEditableQuestionCache((previous) => ({ ...previous, [editableQuestion.id]: editableQuestion }))
      setEditingQuestion(editableQuestion)
    } catch {
      setEditError('이 문항의 편집 정보를 불러오지 못했습니다.')
    } finally {
      setIsLoadingEdit(false)
    }
  }

  const closeEditDialog = () => {
    if (isLoadingEdit) return
    setShowEditDialog(false)
    setEditError(null)
    setEditingQuestion(null)
  }

  const refreshEditingQuestion = async () => {
    if (!canEdit || !loadEditableQuestion || !editingQuestion) {
      throw new Error('Unable to refresh editing details for this question.')
    }

    const editableQuestion = await loadEditableQuestion(editingQuestion.id)
    setEditableQuestionCache((previous) => ({ ...previous, [editableQuestion.id]: editableQuestion }))
    setEditingQuestion(editableQuestion)
    return editableQuestion
  }

  const replaceCurrentQuestion = (updated: EditedPracticalQuestion) => {
    const publicQuestion: PracticalRoundQuestion = {
      id: updated.id,
      number: updated.number,
      subject: updated.subject,
      content: updated.content,
      blankCount: updated.blanks.length,
    }
    setRoundQuestions((previous) => previous.map((question) => question.id === updated.id ? publicQuestion : question))
    setEditableQuestionCache((previous) => ({ ...previous, [updated.id]: updated }))
    setEditAnnouncement('문제가 저장되었습니다.')
    setShowEditDialog(false)
    setEditingQuestion(null)
  }

  if (result) {
    return <PracticalRoundResult title={title} questions={roundQuestions} result={result} onRetry={resetRound} />
  }

  return (
    <>
      <p role="status" aria-live="polite" className={editAnnouncement ? 'mb-4 text-sm font-semibold text-blue-700' : 'sr-only'}>
        {editAnnouncement ?? ''}
      </p>
      <div className="grid gap-6 lg:grid-cols-[minmax(0,1fr)_320px]">
        <section className="ab-card p-5 sm:p-8">
          <div className="flex flex-wrap items-end justify-between gap-3 border-b border-[var(--border)] pb-5">
            <div>
              <p className="text-sm font-semibold text-[var(--primary)]">{title}</p>
              <p className="mt-1 text-sm text-[var(--text-secondary)]">{currentIndex + 1} / {questions.length}문항</p>
            </div>
            <div className="flex gap-2 text-sm font-semibold">
              <span className="rounded-full bg-[var(--primary-light)] px-3 py-1 text-[var(--primary)]">응답 {answeredCount}</span>
              <span className="rounded-full bg-slate-100 px-3 py-1 text-slate-600">미응답 {questions.length - answeredCount}</span>
            </div>
          </div>

          <p className="mt-7 text-sm font-semibold text-[var(--text-secondary)]">{current.subject}</p>
          <h1 className="mt-2 whitespace-pre-wrap text-xl font-bold leading-8">{current.number}. {current.content}</h1>

          {canEdit && <div className="mt-5"><button type="button" className="ab-btn ab-btn-secondary ab-btn-md" onClick={openEditDialog}>문제 수정</button></div>}

          <fieldset className="mt-7 space-y-3">
            <legend className="sr-only">{current.number}번 답안 입력</legend>
            {Array.from({ length: current.blankCount }, (_, blankIndex) => (
              <label key={`${current.id}-${blankIndex}`} className="block text-sm font-semibold text-[var(--text-primary)]">
                {current.blankCount > 1 ? `빈칸 ${blankIndex + 1}` : '답안'}
                <input
                  type="text"
                  value={answers[current.id]?.[blankIndex] ?? ''}
                  onChange={(event) => updateBlank(current.id, blankIndex, event.target.value)}
                  className="mt-1.5 w-full rounded-xl border border-[var(--border)] p-3 text-[15px] font-normal focus:border-[var(--primary)] focus:outline-none"
                  aria-label={current.blankCount > 1 ? `빈칸 ${blankIndex + 1} 답안` : '답안'}
                />
              </label>
            ))}
          </fieldset>

          <div className="mt-7 flex items-center justify-between gap-3">
            <button type="button" disabled={currentIndex === 0} onClick={() => moveTo(currentIndex - 1)} className="ab-btn ab-btn-secondary ab-btn-md disabled:opacity-40"><ChevronLeft size={17} /> 이전 문제</button>
            <button type="button" disabled={currentIndex === questions.length - 1} onClick={() => moveTo(currentIndex + 1)} className="ab-btn ab-btn-primary ab-btn-md disabled:opacity-40">다음 문제 <ChevronRight size={17} /></button>
          </div>
        </section>

        <aside className="ab-card h-fit p-5 lg:sticky lg:top-24">
          <h2 className="font-bold">문항 바로가기</h2>
          <div className="mt-4 grid grid-cols-5 gap-2">
            {roundQuestions.map((question, index) => (
              <button type="button" key={question.id} aria-label={`${question.number}번 문제로 이동`} onClick={() => moveTo(index)} className={`h-10 rounded-lg border text-sm font-semibold ${index === currentIndex ? 'border-[var(--primary)] bg-[var(--primary)] text-white' : isAnswered(answers[question.id]) ? 'border-blue-200 bg-[var(--primary-light)] text-[var(--primary)]' : 'border-[var(--border)] bg-white'}`}>{question.number}</button>
            ))}
          </div>
          <button type="button" aria-label="회차 제출" className="ab-btn ab-btn-orange ab-btn-lg mt-6 w-full" onClick={() => setShowSubmitDialog(true)}>최종 제출</button>
        </aside>
      </div>

      {showSubmitDialog && (
        <div className="fixed inset-0 z-50 flex items-center justify-center bg-slate-950/50 p-4" role="presentation" onMouseDown={(event) => { if (event.currentTarget === event.target) setShowSubmitDialog(false) }}>
          <section role="dialog" aria-modal="true" aria-labelledby="submit-title" className="w-full max-w-md rounded-2xl bg-white p-6 shadow-2xl">
            <h2 id="submit-title" className="text-xl font-bold">답안을 최종 제출할까요?</h2>
            {unansweredNumbers.length > 0 ? (
              <div className="mt-4 rounded-xl bg-orange-50 p-4 text-sm text-orange-900">
                <p className="font-bold">미응답 {unansweredNumbers.length}문제</p>
                <p className="mt-1 break-words">{unansweredNumbers.map((number) => `${number}번`).join(', ')}</p>
                <p className="mt-2">미응답 문항은 오답으로 처리됩니다.</p>
              </div>
            ) : <p className="mt-4 text-sm text-[var(--text-secondary)]">제출 후 전체 문항을 일괄 채점합니다.</p>}
            {submitError && <p role="alert" className="mt-4 text-sm font-semibold text-red-600">{submitError}</p>}
            <div className="mt-6 flex flex-col-reverse gap-2 sm:flex-row sm:justify-end">
              <button type="button" className="ab-btn ab-btn-secondary ab-btn-md" onClick={() => setShowSubmitDialog(false)} disabled={isSubmitting}>계속 풀기</button>
              <button type="button" aria-label="제출 확정" className="ab-btn ab-btn-orange ab-btn-md" onClick={submitRound} disabled={isSubmitting}>{isSubmitting ? '채점 중...' : unansweredNumbers.length > 0 ? '미응답을 오답 처리하고 제출' : '제출하고 채점하기'}</button>
            </div>
          </section>
        </div>
      )}

      {showEditDialog && (isLoadingEdit || editError || editingQuestion) && (
        isLoadingEdit || editError || !editingQuestion ? (
          <div className="fixed inset-0 z-50 flex items-center justify-center bg-slate-950/50 p-4" role="presentation">
            <section role="dialog" aria-modal="true" aria-labelledby="edit-loading-title" className="w-full max-w-md rounded-2xl bg-white p-6 shadow-2xl">
              <h2 id="edit-loading-title" className="text-xl font-bold">문제 수정</h2>
              {isLoadingEdit ? <p className="mt-4 text-sm text-[var(--text-secondary)]">편집 정보를 불러오는 중…</p> : <p role="alert" className="mt-4 text-sm font-semibold text-red-600">{editError}</p>}
              {!isLoadingEdit && <div className="mt-6 flex justify-end"><button type="button" className="ab-btn ab-btn-secondary ab-btn-md" onClick={closeEditDialog}>닫기</button></div>}
            </section>
          </div>
        ) : <PracticalQuestionEditDialog question={editingQuestion} onClose={closeEditDialog} onSaved={replaceCurrentQuestion} onRefreshLatest={refreshEditingQuestion} />
      )}
    </>
  )
}
