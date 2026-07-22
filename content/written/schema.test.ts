import { describe, expect, it } from 'vitest'
import { validateWrittenRound } from './schema'

const validQuestion = {
  id: 'jeongchogi-written-2021-1-001',
  subject: '소프트웨어 설계',
  number: 1,
  content: '미들웨어에 대한 설명으로 옳은 것은?',
  choices: ['보기 A', '보기 B', '보기 C', '보기 D'],
  acceptedAnswerIndexes: [0],
  explanation: {
    summary: '정답인 이유를 설명합니다.',
    choiceNotes: ['정답입니다.', '오답입니다.', '오답입니다.', '오답입니다.'],
    keyPoint: '핵심 포인트입니다.',
  },
  reviewed: true,
  published: true,
}

const validRound = {
  examSlug: 'jeongchogi',
  examType: 'written',
  year: 2021,
  round: 1,
  title: '2021년 1회 정보처리기사 필기',
  sourceLabel: 'licensed-pdf-2021-1',
  questions: [validQuestion],
}

describe('validateWrittenRound', () => {
  it('accepts a complete written round', () => {
    expect(validateWrittenRound(validRound)).toEqual(validRound)
  })

  it('rejects a question without exactly four choices', () => {
    expect(() => validateWrittenRound({
      ...validRound,
      questions: [{ ...validQuestion, choices: ['a', 'b', 'c'] }],
    })).toThrow('question 1 must have exactly four choices')
  })

  it('rejects duplicate question numbers', () => {
    expect(() => validateWrittenRound({
      ...validRound,
      questions: [validQuestion, { ...validQuestion, id: 'duplicate' }],
    })).toThrow('question numbers must be unique')
  })

  it('rejects a published question without a complete explanation', () => {
    expect(() => validateWrittenRound({
      ...validRound,
      questions: [{
        ...validQuestion,
        explanation: { ...validQuestion.explanation, keyPoint: '' },
      }],
    })).toThrow('question 1 must have a complete explanation')
  })

  it('accepts multiple allowed answers without requiring multiple selection', () => {
    const round = {
      ...validRound,
      questions: [{ ...validQuestion, acceptedAnswerIndexes: [1, 2] }],
    }

    expect(validateWrittenRound(round).questions[0].acceptedAnswerIndexes).toEqual([1, 2])
  })

  it('rejects duplicate or out-of-range allowed answers', () => {
    expect(() => validateWrittenRound({
      ...validRound,
      questions: [{ ...validQuestion, acceptedAnswerIndexes: [0, 0, 4] }],
    })).toThrow('question 1 must have unique acceptedAnswerIndexes from 0 to 3')
  })
})
