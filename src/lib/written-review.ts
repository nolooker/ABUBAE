import round1 from '../../content/written/jeongchogi/2021-1.candidates.json'
import round2 from '../../content/written/jeongchogi/2021-2.candidates.json'
import round3 from '../../content/written/jeongchogi/2021-3.candidates.json'

export type ReviewQuestion = {
  id: string
  subject: string
  number: number
  content: string
  choices: string[]
  answerIndex: number | null
  reviewed: boolean
  published: boolean
}

export type ReviewRound = {
  year: number
  round: number
  title: string
  questions: ReviewQuestion[]
  uncertainAnswerNumbers: number[]
}

const rounds = [round1, round2, round3] as ReviewRound[]

export function getReviewRounds() {
  return rounds.map(({ year, round, title, questions, uncertainAnswerNumbers }) => ({
    year,
    round,
    title,
    questionCount: questions.length,
    uncertainAnswerCount: uncertainAnswerNumbers.length,
  }))
}

export function getReviewRound(year: number, round: number) {
  return rounds.find((candidate) => candidate.year === year && candidate.round === round)
}

