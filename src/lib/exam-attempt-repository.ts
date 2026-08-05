import type { SupabaseClient } from '@supabase/supabase-js'

import type {
  ExamAttempt,
  ExamAttemptSummary,
  ExamType,
  IncorrectQuestionEntry,
  SaveExamAttemptInput,
} from './exam-attempt'

const summaryFields = 'id,exam_type,year,round,total,correct,incorrect,unanswered,score,created_at'
const fullFields = `${summaryFields},result`

type RecordValue = Record<string, unknown>

export class ExamAttemptRepositoryError extends Error {
  constructor(message = 'exam attempt data is unavailable') {
    super(message)
    this.name = 'ExamAttemptRepositoryError'
  }
}

export class ExamNotFoundError extends ExamAttemptRepositoryError {
  constructor() {
    super('exam not found')
    this.name = 'ExamNotFoundError'
  }
}

function isRecord(value: unknown): value is RecordValue {
  return typeof value === 'object' && value !== null && !Array.isArray(value)
}

function recordValue(value: unknown): RecordValue {
  if (!isRecord(value)) throw new ExamAttemptRepositoryError()
  return value
}

function stringValue(value: unknown): string {
  if (typeof value !== 'string') throw new ExamAttemptRepositoryError()
  return value
}

function numberValue(value: unknown): number {
  if (typeof value !== 'number') throw new ExamAttemptRepositoryError()
  return value
}

function examTypeValue(value: unknown): ExamType {
  if (value !== 'written' && value !== 'practical') throw new ExamAttemptRepositoryError()
  return value
}

function rows(value: unknown): RecordValue[] {
  if (!Array.isArray(value)) throw new ExamAttemptRepositoryError()
  return value.map(recordValue)
}

function summaryRow(row: RecordValue): ExamAttemptSummary {
  return {
    id: stringValue(row.id),
    examType: examTypeValue(row.exam_type),
    year: numberValue(row.year),
    round: numberValue(row.round),
    total: numberValue(row.total),
    correct: numberValue(row.correct),
    incorrect: numberValue(row.incorrect),
    unanswered: numberValue(row.unanswered),
    score: numberValue(row.score),
    createdAt: stringValue(row.created_at),
  }
}

function resultQuestions(result: unknown): RecordValue[] {
  const record = recordValue(result)
  if (!Array.isArray(record.questions)) throw new ExamAttemptRepositoryError()
  return record.questions.map((question) => {
    const row = recordValue(question)
    stringValue(row.id)
    numberValue(row.number)
    stringValue(row.subject)
    if (typeof row.isCorrect !== 'boolean') throw new ExamAttemptRepositoryError()
    return row
  })
}

function fullRow(row: RecordValue): ExamAttempt {
  const summary = summaryRow(row)
  resultQuestions(row.result)
  return { ...summary, result: row.result } as ExamAttempt
}

export function createExamAttemptRepository(supabase: SupabaseClient) {
  return {
    async saveAttempt(input: SaveExamAttemptInput): Promise<ExamAttemptSummary> {
      const { data: exam, error: examError } = await supabase
        .from('exams')
        .select('id')
        .eq('slug', input.examSlug)
        .maybeSingle()
      if (examError) throw new ExamAttemptRepositoryError(examError.message)
      if (exam === null) throw new ExamNotFoundError()

      const { data, error } = await supabase
        .from('exam_attempts')
        .insert({
          user_id: input.userId,
          exam_id: recordValue(exam).id,
          exam_type: input.examType,
          year: input.year,
          round: input.round,
          total: input.result.total,
          correct: input.result.correct,
          incorrect: input.result.incorrect,
          unanswered: input.result.unanswered,
          score: input.result.score,
          result: input.result,
        })
        .select(summaryFields)
        .single()
      if (error) throw new ExamAttemptRepositoryError(error.message)
      return summaryRow(recordValue(data))
    },

    async listAttempts(userId: string): Promise<ExamAttemptSummary[]> {
      const { data, error } = await supabase
        .from('exam_attempts')
        .select(summaryFields)
        .eq('user_id', userId)
        .order('created_at', { ascending: false })
      if (error) throw new ExamAttemptRepositoryError(error.message)
      return rows(data).map(summaryRow)
    },

    async getAttempt(userId: string, attemptId: string): Promise<ExamAttempt | undefined> {
      const { data, error } = await supabase
        .from('exam_attempts')
        .select(fullFields)
        .eq('user_id', userId)
        .eq('id', attemptId)
        .maybeSingle()
      if (error) throw new ExamAttemptRepositoryError(error.message)
      return data === null ? undefined : fullRow(recordValue(data))
    },

    async listIncorrectQuestions(userId: string): Promise<IncorrectQuestionEntry[]> {
      const { data, error } = await supabase
        .from('exam_attempts')
        .select(fullFields)
        .eq('user_id', userId)
        .order('created_at', { ascending: false })
      if (error) throw new ExamAttemptRepositoryError(error.message)

      const attempts = rows(data).map(fullRow)
      const byQuestion = new Map<string, IncorrectQuestionEntry>()
      for (const attempt of attempts) {
        for (const question of attempt.result.questions) {
          if (question.isCorrect || byQuestion.has(question.id)) continue
          byQuestion.set(question.id, {
            attemptId: attempt.id,
            examType: attempt.examType,
            year: attempt.year,
            round: attempt.round,
            createdAt: attempt.createdAt,
            questionId: question.id,
            questionNumber: question.number,
            subject: question.subject,
          })
        }
      }
      return [...byQuestion.values()]
    },
  }
}
