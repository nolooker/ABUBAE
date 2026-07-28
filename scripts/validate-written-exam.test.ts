import { describe, expect, it } from 'vitest'

import { auditRound } from './validate-written-exam.mjs'

const round = {
  year: 2021,
  round: 1,
  questions: Array.from({ length: 100 }, (_, index) => ({
    id: `q-${index + 1}`,
    number: index + 1,
    subject: '과목',
    content: '문제',
    choices: ['a', 'b', 'c', 'd'],
    acceptedAnswerIndexes: [0],
    explanation: null,
    reviewed: false,
    published: false,
  })),
}

describe('auditRound', () => {
  it('accepts a complete unpublished candidate round and reports pending review', () => {
    expect(auditRound(round)).toMatchObject({
      questionCount: 100,
      pendingReviewCount: 100,
      multipleAnswerCount: 0,
    })
  })

  it('allows published questions that are pending review', () => {
    const publishedPendingReview = {
      ...round,
      questions: round.questions.map((question) => ({ ...question, published: true })),
    }

    expect(auditRound(publishedPendingReview)).toMatchObject({
      questionCount: 100,
      pendingReviewCount: 100,
    })
  })

  it('rejects non-boolean review flags', () => {
    const invalidFlags = {
      ...round,
      questions: round.questions.map((question, index) => (
        index === 0 ? { ...question, published: 'true' } : question
      )),
    }

    expect(() => auditRound(invalidFlags)).toThrow('must have boolean review flags')
  })

  it('rejects missing numbers and invalid accepted answers', () => {
    const malformed = {
      ...round,
      questions: round.questions.slice(1).map((question, index) => (
        index === 0 ? { ...question, acceptedAnswerIndexes: [] } : question
      )),
    }

    expect(() => auditRound(malformed)).toThrow('must contain question numbers 1 through 100')
  })
})
