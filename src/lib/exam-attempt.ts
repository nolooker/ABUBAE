import type { WrittenGradeResult } from './written-exam'
import type { PracticalGradeResult } from './practical-exam'

export type ExamType = 'written' | 'practical'

export type ExamAttemptSummary = {
  id: string
  examType: ExamType
  year: number
  round: number
  total: number
  correct: number
  incorrect: number
  unanswered: number
  score: number
  createdAt: string
}

export type ExamAttempt =
  | (ExamAttemptSummary & { examType: 'written'; result: WrittenGradeResult })
  | (ExamAttemptSummary & { examType: 'practical'; result: PracticalGradeResult })

export type IncorrectQuestionEntry = {
  attemptId: string
  examType: ExamType
  year: number
  round: number
  createdAt: string
  questionId: string
  questionNumber: number
  subject: string
}

export type SaveExamAttemptInput = {
  userId: string
  examSlug: string
  examType: ExamType
  year: number
  round: number
  result: WrittenGradeResult | PracticalGradeResult
}

export function examTypeLabel(examType: ExamType): string {
  return examType === 'written' ? '필기' : '실기'
}
