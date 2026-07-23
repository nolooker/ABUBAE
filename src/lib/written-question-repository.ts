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

export function createWrittenQuestionRepository(supabase: SupabaseClient) {
  return {
    async getPublicWrittenRound(year: number, round: number): Promise<PublicWrittenRound | undefined> {
      const { data, error } = await supabase
        .from('questions')
        .select('id,number,subject,content,updated_at,choices(number,content)')
        .eq('exam_type', 'written')
        .eq('year', year)
        .eq('round', round)
        .eq('published', true)
        .order('number')

      if (error) throw new WrittenContentUnavailableError(error.message)
      if (!data?.length) return undefined

      return {
        year,
        round,
        title: `${year}년 ${round}회 정보처리기사 필기`,
        questions: data.map((row) => ({
          id: row.id,
          number: row.number,
          subject: row.subject,
          content: row.content,
          updatedAt: row.updated_at,
          choices: [...row.choices].sort((a, b) => a.number - b.number).map((choice) => choice.content),
        })),
      }
    },

    async gradeWrittenSubmission(
      year: number,
      round: number,
      answers: WrittenAnswers,
    ): Promise<WrittenGradeResult | undefined> {
      const { data, error } = await supabase
        .from('questions')
        .select('id,number,subject,choices(number,is_correct)')
        .eq('exam_type', 'written')
        .eq('year', year)
        .eq('round', round)
        .eq('published', true)
        .order('number')

      if (error) throw new WrittenContentUnavailableError(error.message)
      if (!data?.length) return undefined

      return gradeWrittenRound(
        data.map((row) => ({
          id: row.id,
          number: row.number,
          subject: row.subject,
          acceptedAnswerIndexes: row.choices
            .filter((choice) => choice.is_correct)
            .map((choice) => choice.number - 1),
        })),
        answers,
      )
    },
  }
}
