import { describe, expect, it } from 'vitest'

import { validateWrittenQuestionCreate } from './written-question-create'

const valid = {
  examSlug: 'jeongchogi',
  year: 2021,
  round: 1,
  subject: '소프트웨어 설계',
  number: 101,
  content: 'Which statement is correct?',
  choices: ['A', 'B', 'C', 'D'],
  acceptedAnswerIndexes: [1, 3],
  explanation: 'Because it is correct.',
}

describe('validateWrittenQuestionCreate', () => {
  it('returns a typed, valid create payload', () => {
    expect(validateWrittenQuestionCreate(valid)).toEqual(valid)
  })

  it('rejects blank content, non-four choices, and no accepted answers', () => {
    expect(() => validateWrittenQuestionCreate({ ...valid, content: '   ' })).toThrow('content')
    expect(() => validateWrittenQuestionCreate({ ...valid, choices: ['A'] })).toThrow('exactly four choices')
    expect(() => validateWrittenQuestionCreate({ ...valid, acceptedAnswerIndexes: [] })).toThrow('accepted answer')
  })

  it('rejects sparse choices and sparse accepted-answer arrays', () => {
    const sparseChoices = ['A', , 'C', 'D']
    const sparseAnswers = [1, , 3]

    expect(() => validateWrittenQuestionCreate({ ...valid, choices: sparseChoices })).toThrow('choices must be dense')
    expect(() => validateWrittenQuestionCreate({ ...valid, acceptedAnswerIndexes: sparseAnswers }))
      .toThrow('acceptedAnswerIndexes must be dense')
  })

  it.each([
    [{ ...valid, extra: true }, 'only examSlug, year, round, subject, number, content, choices, acceptedAnswerIndexes, and explanation are allowed'],
    [Object.assign(Object.create(null), valid), 'payload must be a plain object'],
    [{ ...valid, examSlug: 'Jeongchogi' }, 'examSlug must contain lowercase letters, numbers, and single hyphens only'],
    [{ ...valid, examSlug: '정처기' }, 'examSlug must contain lowercase letters, numbers, and single hyphens only'],
    [{ ...valid, year: 1999 }, 'year must be an integer between 2000 and 2100'],
    [{ ...valid, year: 2021.5 }, 'year must be an integer between 2000 and 2100'],
    [{ ...valid, round: 0 }, 'round must be an integer between 1 and 20'],
    [{ ...valid, number: 0 }, 'number must be an integer between 1 and 999'],
    [{ ...valid, subject: '   ' }, 'subject must not be blank'],
    [{ ...valid, choices: ['A', 'B', '', 'D'] }, 'choice 3 must not be blank'],
    [{ ...valid, acceptedAnswerIndexes: [1, 1] }, 'acceptedAnswerIndexes must not contain duplicates'],
    [{ ...valid, acceptedAnswerIndexes: [4] }, 'acceptedAnswerIndexes must contain integers from 0 through 3'],
    [{ ...valid, content: 'x'.repeat(10_001) }, 'content is too long'],
    [{ ...valid, choices: ['x'.repeat(4_001), 'B', 'C', 'D'] }, 'choice 1 is too long'],
    [{ ...valid, explanation: 'x'.repeat(10_001) }, 'explanation is too long'],
  ])('rejects unsafe or invalid input: %s', (input, message) => {
    expect(() => validateWrittenQuestionCreate(input)).toThrow(message)
  })
})
