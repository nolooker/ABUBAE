import type { ExamType } from './exam-attempt'

export type BookmarkedQuestion = {
  questionId: string
  examType: ExamType
  year: number
  round: number
  subject: string
  questionNumber: number
  content: string
}
