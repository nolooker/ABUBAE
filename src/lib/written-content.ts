import round1 from '../../content/written/jeongchogi/2021-1.candidates.json'
import round2 from '../../content/written/jeongchogi/2021-2.candidates.json'
import round3 from '../../content/written/jeongchogi/2021-3.candidates.json'
import { createServiceClient } from './supabase/service'
import {
  createWrittenQuestionRepository,
  type PublicWrittenQuestion,
  type PublicWrittenRound,
  WrittenContentUnavailableError,
} from './written-question-repository'
import type { WrittenAnswers, WrittenGradeResult } from './written-exam'

export type { PublicWrittenQuestion, PublicWrittenRound }
export { WrittenContentUnavailableError }

const candidates = [round1, round2, round3]

export function getWrittenRoundSummaries() {
  return candidates.map((candidate) => ({
    year: candidate.year,
    round: candidate.round,
    questionCount: candidate.questions.length,
    subjectCount: new Set(candidate.questions.map((question) => question.subject)).size,
  }))
}

function repository() {
  try {
    return createWrittenQuestionRepository(createServiceClient())
  } catch (error) {
    const message = error instanceof Error ? error.message : 'written content is unavailable'
    throw new WrittenContentUnavailableError(message)
  }
}

export async function getPublicWrittenRound(
  year: number,
  round: number,
): Promise<PublicWrittenRound | undefined> {
  return repository().getPublicWrittenRound(year, round)
}

export async function gradeWrittenSubmission(
  year: number,
  round: number,
  answers: WrittenAnswers,
): Promise<WrittenGradeResult | undefined> {
  return repository().gradeWrittenSubmission(year, round, answers)
}

