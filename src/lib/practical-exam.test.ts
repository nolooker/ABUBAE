import { describe, expect, it } from 'vitest'

import { gradePracticalRound } from './practical-exam'

const questions = [
  { id: 'q1', number: 1, subject: '실기', explanation: '색인 순차 파일 해설', blanks: [{ blankNumber: 1, acceptedAnswers: ['색인', 'Index'] }] },
  {
    id: 'q2',
    number: 2,
    subject: '실기',
    explanation: '',
    blanks: [
      { blankNumber: 1, acceptedAnswers: ['SRT'] },
      { blankNumber: 2, acceptedAnswers: ['부장'] },
    ],
  },
  { id: 'q3', number: 3, subject: '실기', explanation: '', blanks: [{ blankNumber: 1, acceptedAnswers: ['DAC'] }] },
]

describe('gradePracticalRound', () => {
  it('grades case-insensitively and trims whitespace, treating unanswered as incorrect', () => {
    const result = gradePracticalRound(questions, {
      q1: ['  index  '],
      q2: ['srt', '과장'],
    })

    expect(result).toMatchObject({ total: 3, correct: 1, incorrect: 2, unanswered: 1, score: 33 })
    expect(result.questions[0]).toMatchObject({ isCorrect: true, isUnanswered: false })
    expect(result.questions[1]).toMatchObject({ isCorrect: false, isUnanswered: false })
    expect(result.questions[1].blanks).toEqual([
      { blankNumber: 1, userAnswer: 'srt', acceptedAnswers: ['SRT'], isCorrect: true },
      { blankNumber: 2, userAnswer: '과장', acceptedAnswers: ['부장'], isCorrect: false },
    ])
    expect(result.questions[2]).toMatchObject({ isCorrect: false, isUnanswered: true })
    expect(result.questions[2].blanks[0]).toMatchObject({ userAnswer: null, isCorrect: false })
  })

  it('requires every blank correct for a multi-blank question to count as correct', () => {
    const result = gradePracticalRound(questions, { q2: ['SRT', '부장'] })

    expect(result.questions[1]).toMatchObject({ isCorrect: true, isUnanswered: false })
  })

  it('treats an empty string answer the same as unanswered', () => {
    const result = gradePracticalRound(questions, { q1: [''] })

    expect(result.questions[0]).toMatchObject({ isCorrect: false, isUnanswered: true })
  })

  it('rejects a malformed answer list', () => {
    expect(() => gradePracticalRound(questions, { q1: ['ok', 42] as unknown as string[] }))
      .toThrow('q1 has an invalid answer list')
  })

  it('rejects an answer for a question outside the loaded round', () => {
    expect(() => gradePracticalRound(questions, { unknown: ['x'] }))
      .toThrow('unknown is not part of this practical round')
  })
})
