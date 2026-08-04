import { describe, expect, it } from 'vitest'

import { validatePracticalQuestionEdit } from './practical-question-edit'

const valid = {
  content: 'Fill in the blank.',
  explanation: 'Because it is correct.',
  blanks: [
    { blankNumber: 1, acceptedAnswers: ['색인', 'Index'] },
    { blankNumber: 2, acceptedAnswers: ['SSH'] },
  ],
  expectedUpdatedAt: '2026-07-23T00:00:00Z',
}

describe('validatePracticalQuestionEdit', () => {
  it('returns a typed, valid edit payload', () => {
    expect(validatePracticalQuestionEdit(valid)).toEqual(valid)
  })

  it('rejects blank content, empty blanks, and blanks with no accepted answers', () => {
    expect(() => validatePracticalQuestionEdit({ ...valid, content: '   ' })).toThrow('content')
    expect(() => validatePracticalQuestionEdit({ ...valid, blanks: [] })).toThrow('at least one blank is required')
    expect(() => validatePracticalQuestionEdit({ ...valid, blanks: [{ blankNumber: 1, acceptedAnswers: [] }] }))
      .toThrow('blank 1 must have at least one accepted answer')
  })

  it('rejects sparse blanks and sparse accepted-answer arrays', () => {
    const sparseBlanks = [{ blankNumber: 1, acceptedAnswers: ['A'] }, , { blankNumber: 2, acceptedAnswers: ['B'] }]
    const sparseAnswers = [{ blankNumber: 1, acceptedAnswers: ['A', , 'C'] }]

    expect(() => validatePracticalQuestionEdit({ ...valid, blanks: sparseBlanks })).toThrow('blanks must be dense')
    expect(() => validatePracticalQuestionEdit({ ...valid, blanks: sparseAnswers }))
      .toThrow('blank 1 acceptedAnswers must be dense')
  })

  it.each([
    [{ ...valid, extra: true }, 'only content, explanation, blanks, and expectedUpdatedAt are allowed'],
    [Object.assign(Object.create(null), valid), 'payload must be a plain object'],
    [{ ...valid, blanks: [{ blankNumber: 1, acceptedAnswers: ['A'], extra: true }] }, 'blank 1 has an unknown field'],
    [{ ...valid, blanks: [{ blankNumber: 0, acceptedAnswers: ['A'] }] }, 'blank 1 blankNumber must be a positive integer'],
    [{ ...valid, blanks: [{ blankNumber: 1.5, acceptedAnswers: ['A'] }] }, 'blank 1 blankNumber must be a positive integer'],
    [{ ...valid, blanks: [{ blankNumber: 1, acceptedAnswers: ['A', ''] }] }, 'blank 1 accepted answer 2 must not be blank'],
    [{ ...valid, blanks: [{ blankNumber: 1, acceptedAnswers: ['A'] }, { blankNumber: 1, acceptedAnswers: ['B'] }] }, 'blankNumber values must not contain duplicates'],
    [{ ...valid, expectedUpdatedAt: '2026-02-30T00:00:00Z' }, 'expectedUpdatedAt must be a valid ISO timestamp'],
    [{ ...valid, content: 'x'.repeat(10_001) }, 'content is too long'],
    [{ ...valid, explanation: 'x'.repeat(10_001) }, 'explanation is too long'],
    [{ ...valid, blanks: [{ blankNumber: 1, acceptedAnswers: ['x'.repeat(2_001)] }] }, 'blank 1 accepted answer 1 is too long'],
    [{ ...valid, blanks: Array.from({ length: 21 }, (_, i) => ({ blankNumber: i + 1, acceptedAnswers: ['A'] })) }, 'too many blanks'],
  ])('rejects unsafe or invalid input: %s', (input, message) => {
    expect(() => validatePracticalQuestionEdit(input)).toThrow(message)
  })
})
