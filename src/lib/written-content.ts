import { createServiceClient } from './supabase/service'
import {
  createWrittenQuestionRepository,
  type AdminWrittenQuestionSummary,
  type PublicWrittenQuestion,
  type PublicWrittenRound,
  type PublicWrittenRoundSummary,
  WrittenContentUnavailableError,
} from './written-question-repository'
import type { WrittenAnswers, WrittenGradeResult } from './written-exam'

export type { AdminWrittenQuestionSummary, PublicWrittenQuestion, PublicWrittenRound, PublicWrittenRoundSummary }
export { WrittenContentUnavailableError }

function repository() {
  try {
    return createWrittenQuestionRepository(createServiceClient())
  } catch (error) {
    const message = error instanceof Error ? error.message : 'written content is unavailable'
    throw new WrittenContentUnavailableError(message)
  }
}

export async function getWrittenRoundSummaries(): Promise<PublicWrittenRoundSummary[]> {
  return repository().listPublishedRoundSummaries()
}

export async function listQuestionsForRound(
  year: number,
  round: number,
): Promise<AdminWrittenQuestionSummary[]> {
  return repository().listQuestionsForRound(year, round)
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
