import { beforeEach, describe, expect, it, vi } from 'vitest'

const { getWrittenRoundSummaries, getPracticalRoundSummaries } = vi.hoisted(() => ({
  getWrittenRoundSummaries: vi.fn(),
  getPracticalRoundSummaries: vi.fn(),
}))

vi.mock('./written-content', () => ({ getWrittenRoundSummaries }))
vi.mock('./practical-content', () => ({ getPracticalRoundSummaries }))

import { getJeongchogiContentStats } from './exam-content-stats'

describe('getJeongchogiContentStats', () => {
  beforeEach(() => {
    getWrittenRoundSummaries.mockReset()
    getPracticalRoundSummaries.mockReset()
  })

  it('sums question counts across written and practical rounds and picks the latest of each', async () => {
    getWrittenRoundSummaries.mockResolvedValue([
      { year: 2021, round: 1, questionCount: 20, subjectCount: 5 },
      { year: 2026, round: 1, questionCount: 20, subjectCount: 5 },
      { year: 2025, round: 3, questionCount: 20, subjectCount: 5 },
    ])
    getPracticalRoundSummaries.mockResolvedValue([
      { year: 2025, round: 2, questionCount: 11, subjectCount: 4 },
      { year: 2025, round: 3, questionCount: 11, subjectCount: 4 },
    ])

    await expect(getJeongchogiContentStats()).resolves.toEqual({
      questionCount: 60 + 22,
      latestWrittenRound: { year: 2026, round: 1, questionCount: 20 },
      latestPracticalRound: { year: 2025, round: 3, questionCount: 11 },
    })
  })

  it('returns zero and no latest round when nothing is published yet', async () => {
    getWrittenRoundSummaries.mockResolvedValue([])
    getPracticalRoundSummaries.mockResolvedValue([])

    await expect(getJeongchogiContentStats()).resolves.toEqual({
      questionCount: 0,
      latestWrittenRound: undefined,
      latestPracticalRound: undefined,
    })
  })

  it('breaks ties within the same year by the higher round number', async () => {
    getWrittenRoundSummaries.mockResolvedValue([
      { year: 2025, round: 1, questionCount: 20, subjectCount: 5 },
      { year: 2025, round: 3, questionCount: 20, subjectCount: 5 },
      { year: 2025, round: 2, questionCount: 20, subjectCount: 5 },
    ])
    getPracticalRoundSummaries.mockResolvedValue([])

    const stats = await getJeongchogiContentStats()

    expect(stats.latestWrittenRound).toEqual({ year: 2025, round: 3, questionCount: 20 })
  })
})
