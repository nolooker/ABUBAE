import round1 from '../../content/written/jeongchogi/2021-1.candidates.json'
import round2 from '../../content/written/jeongchogi/2021-2.candidates.json'
import round3 from '../../content/written/jeongchogi/2021-3.candidates.json'
import { gradeWrittenRound, type WrittenAnswers } from './written-exam'

export type PublicWrittenQuestion = {
  id: string
  number: number
  subject: string
  content: string
  choices: string[]
}

const candidates = [round1, round2, round3]

export function getWrittenRoundSummaries() {
  return candidates.map((candidate) => ({
    year: candidate.year,
    round: candidate.round,
    questionCount: candidate.questions.length,
    subjectCount: new Set(candidate.questions.map((question) => question.subject)).size,
  }))
}

export function getPublicWrittenRound(year: number, round: number) {
  const candidate = candidates.find((item) => item.year === year && item.round === round)
  if (!candidate) return undefined

  return {
    year: candidate.year,
    round: candidate.round,
    title: candidate.title,
    questions: candidate.questions.map(({ id, number, subject, content, choices }) => ({
      id,
      number,
      subject,
      content,
      choices,
    })) satisfies PublicWrittenQuestion[],
  }
}

export function gradeWrittenSubmission(year: number, round: number, answers: WrittenAnswers) {
  const candidate = candidates.find((item) => item.year === year && item.round === round)
  if (!candidate) return undefined

  return gradeWrittenRound(
    candidate.questions.map(({ id, number, subject, acceptedAnswerIndexes }) => ({
      id,
      number,
      subject,
      acceptedAnswerIndexes,
    })),
    answers,
  )
}

