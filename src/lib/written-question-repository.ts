import type { SupabaseClient } from '@supabase/supabase-js'

import { gradeWrittenRound, type WrittenAnswers, type WrittenGradeResult } from './written-exam'

export type PublicWrittenQuestion = {
  id: string
  number: number
  subject: string
  content: string
  choices: string[]
  updatedAt: string
}

export type PublicWrittenRound = {
  year: number
  round: number
  title: string
  questions: PublicWrittenQuestion[]
}

export class WrittenContentUnavailableError extends Error {
  constructor(message = 'written content is unavailable') {
    super(message)
    this.name = 'WrittenContentUnavailableError'
  }
}

type RecordValue = Record<string, unknown>

function isRecord(value: unknown): value is RecordValue {
  return typeof value === 'object' && value !== null && !Array.isArray(value)
}

function unavailable(): never {
  throw new WrittenContentUnavailableError()
}

function stringValue(value: unknown): string {
  if (typeof value !== 'string') unavailable()
  return value
}

function positiveIntegerValue(value: unknown): number {
  if (!Number.isInteger(value) || (value as number) < 1) unavailable()
  return value as number
}

function numberedChoiceRows(value: unknown) {
  if (!Array.isArray(value) || value.length !== 4) unavailable()

  const choices = value.map((choice) => {
    if (!isRecord(choice)) unavailable()
    const number = positiveIntegerValue(choice.number)
    if (number > 4) unavailable()
    return { number, choice }
  })

  if (new Set(choices.map((choice) => choice.number)).size !== 4) unavailable()
  return choices
}

function publicChoices(value: unknown) {
  return numberedChoiceRows(value).map(({ number, choice }) => ({
    number,
    content: stringValue(choice.content),
  }))
}

function gradingChoices(value: unknown) {
  const choices = numberedChoiceRows(value).map(({ number, choice }) => {
    if (typeof choice.is_correct !== 'boolean') unavailable()
    return { number, isCorrect: choice.is_correct }
  })

  if (!choices.some((choice) => choice.isCorrect)) unavailable()
  return choices
}

function rows(value: unknown): RecordValue[] {
  if (value === null || value === undefined) return []
  if (!Array.isArray(value) || !value.every(isRecord)) unavailable()
  return value
}

function publicQuestion(row: RecordValue) {
  return {
    id: stringValue(row.id),
    number: positiveIntegerValue(row.number),
    subject: stringValue(row.subject),
    content: stringValue(row.content),
    updatedAt: stringValue(row.updated_at),
    choices: publicChoices(row.choices)
      .sort((a, b) => a.number - b.number)
      .map((choice) => choice.content),
  }
}

function gradeableQuestion(row: RecordValue) {
  return {
    id: stringValue(row.id),
    number: positiveIntegerValue(row.number),
    subject: stringValue(row.subject),
    acceptedAnswerIndexes: gradingChoices(row.choices)
      .filter((choice) => choice.isCorrect)
      .map((choice) => choice.number - 1),
  }
}

export function createWrittenQuestionRepository(supabase: SupabaseClient) {
  return {
    async getPublicWrittenRound(year: number, round: number): Promise<PublicWrittenRound | undefined> {
      const { data, error } = await supabase
        .from('questions')
        .select('id,number,subject,content,updated_at,choices(number,content),exams!inner(slug)')
        .eq('exam_type', 'written')
        .eq('year', year)
        .eq('round', round)
        .eq('published', true)
        .eq('exams.slug', 'jeongchogi')
        .order('number')

      if (error) throw new WrittenContentUnavailableError(error.message)
      const questionRows = rows(data)
      if (!questionRows.length) return undefined

      return {
        year,
        round,
        title: `${year}년 ${round}회 정보처리기사 필기`,
        questions: questionRows.map(publicQuestion),
      }
    },

    async gradeWrittenSubmission(
      year: number,
      round: number,
      answers: WrittenAnswers,
    ): Promise<WrittenGradeResult | undefined> {
      const { data, error } = await supabase
        .from('questions')
        .select('id,number,subject,choices(number,is_correct),exams!inner(slug)')
        .eq('exam_type', 'written')
        .eq('year', year)
        .eq('round', round)
        .eq('published', true)
        .eq('exams.slug', 'jeongchogi')
        .order('number')

      if (error) throw new WrittenContentUnavailableError(error.message)
      const questionRows = rows(data)
      if (!questionRows.length) return undefined

      return gradeWrittenRound(
        questionRows.map(gradeableQuestion),
        answers,
      )
    },
  }
}
