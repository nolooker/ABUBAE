import { describe, expect, it } from 'vitest'

import { gradeWrittenRound } from './written-exam'

const questions = [
  { id: 'q1', number: 1, subject: '설계', acceptedAnswerIndexes: [0] },
  { id: 'q2', number: 2, subject: '설계', acceptedAnswerIndexes: [1, 2] },
  { id: 'q3', number: 3, subject: '개발', acceptedAnswerIndexes: [3] },
]

describe('gradeWrittenRound', () => {
  it('accepts any allowed answer and counts unanswered questions as incorrect', () => {
    const result = gradeWrittenRound(questions, { q1: 0, q2: 2 })

    expect(result).toMatchObject({
      total: 3,
      correct: 2,
      incorrect: 1,
      unanswered: 1,
      score: 67,
    })
    expect(result.subjects).toEqual([
      { subject: '설계', total: 2, correct: 2, score: 100 },
      { subject: '개발', total: 1, correct: 0, score: 0 },
    ])
    expect(result.questions[2]).toMatchObject({
      id: 'q3',
      selectedAnswerIndex: null,
      acceptedAnswerIndexes: [3],
      isCorrect: false,
      isUnanswered: true,
    })
  })

  it('rejects a selected answer outside the four choices', () => {
    expect(() => gradeWrittenRound(questions, { q1: 4 })).toThrow('q1 has an invalid selected answer')
  })

  it('rejects an answer for a question outside the loaded round', () => {
    expect(() => gradeWrittenRound(questions, { unknown: 0 })).toThrow(
      'unknown is not part of this written round',
    )
  })
})
