import { createServiceClient } from './supabase/service'
import {
  createPracticalQuestionRepository,
  type PublicPracticalRound,
  type PublicPracticalRoundSummary,
  PracticalContentUnavailableError,
} from './practical-question-repository'
import type { PracticalAnswers, PracticalGradeResult } from './practical-exam'

export type { PublicPracticalRound, PublicPracticalRoundSummary }
export { PracticalContentUnavailableError }

function repository() {
  try {
    return createPracticalQuestionRepository(createServiceClient())
  } catch (error) {
    const message = error instanceof Error ? error.message : 'practical content is unavailable'
    throw new PracticalContentUnavailableError(message)
  }
}

export async function getPracticalRoundSummaries(): Promise<PublicPracticalRoundSummary[]> {
  return repository().listPublishedRoundSummaries()
}

export async function getPublicPracticalRound(
  year: number,
  round: number,
): Promise<PublicPracticalRound | undefined> {
  return repository().getPublicPracticalRound(year, round)
}

export async function gradePracticalSubmission(
  year: number,
  round: number,
  answers: PracticalAnswers,
): Promise<PracticalGradeResult | undefined> {
  return repository().gradePracticalSubmission(year, round, answers)
}
