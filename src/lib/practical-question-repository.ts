import type { SupabaseClient } from '@supabase/supabase-js'

import { gradePracticalRound, type PracticalAnswers, type PracticalGradeResult } from './practical-exam'

export type PublicPracticalQuestion = {
  id: string
  number: number
  subject: string
  content: string
  blankCount: number
  updatedAt: string
}

export type PublicPracticalRound = {
  year: number
  round: number
  title: string
  questions: PublicPracticalQuestion[]
}

export type PublicPracticalRoundSummary = {
  year: number
  round: number
  questionCount: number
  subjectCount: number
}

export class PracticalContentUnavailableError extends Error {
  constructor(message = 'practical content is unavailable') {
    super(message)
    this.name = 'PracticalContentUnavailableError'
  }
}

type RecordValue = Record<string, unknown>

function isRecord(value: unknown): value is RecordValue {
  return typeof value === 'object' && value !== null && !Array.isArray(value)
}

function unavailable(): never {
  throw new PracticalContentUnavailableError()
}

function stringValue(value: unknown): string {
  if (typeof value !== 'string') unavailable()
  return value
}

function nullableStringValue(value: unknown): string {
  if (value === null) return ''
  return stringValue(value)
}

function positiveIntegerValue(value: unknown): number {
  if (!Number.isInteger(value) || (value as number) < 1) unavailable()
  return value as number
}

function rows(value: unknown): RecordValue[] {
  if (value === null || value === undefined) return []
  if (!Array.isArray(value) || !value.every(isRecord)) unavailable()
  return value
}

function blankRows(value: unknown): RecordValue[] {
  if (!Array.isArray(value) || !value.every(isRecord) || value.length < 1) unavailable()
  return value
}

function summaryRow(row: RecordValue) {
  return {
    year: positiveIntegerValue(row.year),
    round: positiveIntegerValue(row.round),
    subject: stringValue(row.subject),
  }
}

function publicQuestion(row: RecordValue): PublicPracticalQuestion {
  return {
    id: stringValue(row.id),
    number: positiveIntegerValue(row.number),
    subject: stringValue(row.subject),
    content: stringValue(row.content),
    updatedAt: stringValue(row.updated_at),
    blankCount: blankRows(row.practical_answers).length,
  }
}

function gradeableQuestion(row: RecordValue) {
  return {
    id: stringValue(row.id),
    number: positiveIntegerValue(row.number),
    subject: stringValue(row.subject),
    explanation: nullableStringValue(row.explanation),
    blanks: blankRows(row.practical_answers).map((blank) => {
      const acceptedAnswers = blank.accepted_answers
      if (!Array.isArray(acceptedAnswers) || !acceptedAnswers.every((answer) => typeof answer === 'string') || acceptedAnswers.length < 1) {
        unavailable()
      }
      return {
        blankNumber: positiveIntegerValue(blank.blank_number),
        acceptedAnswers: acceptedAnswers as string[],
      }
    }),
  }
}

export function createPracticalQuestionRepository(supabase: SupabaseClient) {
  return {
    async listPublishedRoundSummaries(): Promise<PublicPracticalRoundSummary[]> {
      const pageSize = 1000
      const grouped = new Map<string, { year: number; round: number; subjects: Set<string>; questionCount: number }>()

      for (let from = 0; ; from += pageSize) {
        const { data, error } = await supabase
          .from('questions')
          .select('year,round,subject,exams!inner(slug)')
          .eq('exam_type', 'practical')
          .eq('published', true)
          .eq('exams.slug', 'jeongchogi')
          .range(from, from + pageSize - 1)

        if (error) throw new PracticalContentUnavailableError(error.message)

        const page = rows(data).map(summaryRow)
        for (const row of page) {
          const key = `${row.year}-${row.round}`
          const entry = grouped.get(key) ?? { year: row.year, round: row.round, subjects: new Set<string>(), questionCount: 0 }
          entry.subjects.add(row.subject)
          entry.questionCount += 1
          grouped.set(key, entry)
        }

        if (page.length < pageSize) break
      }

      return [...grouped.values()]
        .map(({ year, round, subjects, questionCount }) => ({ year, round, questionCount, subjectCount: subjects.size }))
        .sort((a, b) => (a.year - b.year) || (a.round - b.round))
    },

    async getPublicPracticalRound(year: number, round: number): Promise<PublicPracticalRound | undefined> {
      const { data, error } = await supabase
        .from('questions')
        .select('id,number,subject,content,updated_at,practical_answers(blank_number),exams!inner(slug)')
        .eq('exam_type', 'practical')
        .eq('year', year)
        .eq('round', round)
        .eq('published', true)
        .eq('exams.slug', 'jeongchogi')
        .order('number')

      if (error) throw new PracticalContentUnavailableError(error.message)
      const questionRows = rows(data)
      if (!questionRows.length) return undefined

      return {
        year,
        round,
        title: `${year}년 ${round}회 정보처리기사 실기`,
        questions: questionRows.map(publicQuestion),
      }
    },

    async gradePracticalSubmission(
      year: number,
      round: number,
      answers: PracticalAnswers,
    ): Promise<PracticalGradeResult | undefined> {
      const { data, error } = await supabase
        .from('questions')
        .select('id,number,subject,explanation,practical_answers(blank_number,accepted_answers),exams!inner(slug)')
        .eq('exam_type', 'practical')
        .eq('year', year)
        .eq('round', round)
        .eq('published', true)
        .eq('exams.slug', 'jeongchogi')
        .order('number')

      if (error) throw new PracticalContentUnavailableError(error.message)
      const questionRows = rows(data)
      if (!questionRows.length) return undefined

      return gradePracticalRound(
        questionRows.map(gradeableQuestion),
        answers,
      )
    },
  }
}
