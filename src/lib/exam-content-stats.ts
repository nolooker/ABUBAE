import { getPracticalRoundSummaries } from './practical-content'
import { getWrittenRoundSummaries } from './written-content'

export type LatestRound = { year: number; round: number; questionCount: number }

export type JeongchogiContentStats = {
  questionCount: number
  latestWrittenRound?: LatestRound
  latestPracticalRound?: LatestRound
}

function latestOf(rounds: { year: number; round: number; questionCount: number }[]): LatestRound | undefined {
  const latest = rounds.reduce<{ year: number; round: number; questionCount: number } | undefined>((current, round) => {
    if (!current) return round
    if (round.year !== current.year) return round.year > current.year ? round : current
    return round.round > current.round ? round : current
  }, undefined)
  return latest ? { year: latest.year, round: latest.round, questionCount: latest.questionCount } : undefined
}

export async function getJeongchogiContentStats(): Promise<JeongchogiContentStats> {
  const [written, practical] = await Promise.all([
    getWrittenRoundSummaries(),
    getPracticalRoundSummaries(),
  ])

  const questionCount = written.reduce((sum, round) => sum + round.questionCount, 0)
    + practical.reduce((sum, round) => sum + round.questionCount, 0)

  return {
    questionCount,
    latestWrittenRound: latestOf(written),
    latestPracticalRound: latestOf(practical),
  }
}
