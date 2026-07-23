import { describe, expect, it } from 'vitest'

import { validateWrittenQuestionEdit } from './written-question-edit'

const valid = {
  content: 'Which statement is correct?',
  choices: ['A', 'B', 'C', 'D'],
  acceptedAnswerIndexes: [1, 3],
  explanation: 'Because it is correct.',
  expectedUpdatedAt: '2026-07-23T00:00:00Z',
}

describe('validateWrittenQuestionEdit', () => {
  it('returns a typed, valid edit payload', () => {
    expect(validateWrittenQuestionEdit(valid)).toEqual(valid)
  })

  it('rejects blank content, non-four choices, and no accepted answers', () => {
    expect(() => validateWrittenQuestionEdit({ ...valid, content: '   ' })).toThrow('content')
    expect(() => validateWrittenQuestionEdit({ ...valid, choices: ['A'] })).toThrow('exactly four choices')
    expect(() => validateWrittenQuestionEdit({ ...valid, acceptedAnswerIndexes: [] })).toThrow('accepted answer')
  })

  it('rejects sparse choices and sparse accepted-answer arrays', () => {
    const sparseChoices = ['A', , 'C', 'D']
    const sparseAnswers = [1, , 3]

    expect(() => validateWrittenQuestionEdit({ ...valid, choices: sparseChoices })).toThrow('choices must be dense')
    expect(() => validateWrittenQuestionEdit({ ...valid, acceptedAnswerIndexes: sparseAnswers }))
      .toThrow('acceptedAnswerIndexes must be dense')
  })

  it.each([
    [{ ...valid, extra: true }, 'only content, choices, acceptedAnswerIndexes, explanation, and expectedUpdatedAt are allowed'],
    [Object.assign(Object.create(null), valid), 'payload must be a plain object'],
    [{ ...valid, choices: ['A', 'B', '', 'D'] }, 'choice 3 must not be blank'],
    [{ ...valid, acceptedAnswerIndexes: [1, 1] }, 'acceptedAnswerIndexes must not contain duplicates'],
    [{ ...valid, acceptedAnswerIndexes: [4] }, 'acceptedAnswerIndexes must contain integers from 0 through 3'],
    [{ ...valid, acceptedAnswerIndexes: [1.5] }, 'acceptedAnswerIndexes must contain integers from 0 through 3'],
    [{ ...valid, expectedUpdatedAt: '2026-02-30T00:00:00Z' }, 'expectedUpdatedAt must be a valid ISO timestamp'],
    [{ ...valid, content: 'x'.repeat(10_001) }, 'content is too long'],
    [{ ...valid, choices: ['x'.repeat(4_001), 'B', 'C', 'D'] }, 'choice 1 is too long'],
    [{ ...valid, explanation: 'x'.repeat(10_001) }, 'explanation is too long'],
  ])('rejects unsafe or invalid input: %s', (input, message) => {
    expect(() => validateWrittenQuestionEdit(input)).toThrow(message)
  })
})
