import { cleanup, render, screen } from '@testing-library/react'
import { afterEach, describe, expect, it } from 'vitest'

import WrittenRoundResult from './WrittenRoundResult'

describe('WrittenRoundResult', () => {
  afterEach(() => cleanup())
  it('exposes which choice is newly correct and which selected choice is incorrect', () => {
    render(
      <WrittenRoundResult
        title="2021년 1회"
        onRetry={() => {}}
        questions={[{ id: 'q1', number: 1, subject: '소프트웨어 설계', content: '문제', choices: ['A', 'B', 'C', 'D'] }]}
        result={{
          total: 1,
          correct: 0,
          incorrect: 1,
          unanswered: 0,
          score: 0,
          subjects: [{ subject: '소프트웨어 설계', total: 1, correct: 0, score: 0 }],
          questions: [{ id: 'q1', number: 1, subject: '소프트웨어 설계', selectedAnswerIndex: 0, acceptedAnswerIndexes: [1], explanation: 'Edited explanation', isCorrect: false, isUnanswered: false }],
        }}
      />,
    )

    expect(screen.getByRole('listitem', { name: 'Graded choice 1: your incorrect answer' })).toBeInTheDocument()
    expect(screen.getByRole('listitem', { name: 'Graded choice 2: correct answer' })).toBeInTheDocument()
    expect(screen.getByText('Edited explanation')).toBeInTheDocument()
    expect(screen.queryByText('해설 준비 중')).not.toBeInTheDocument()
  })

  it('shows the safe fallback only when an explanation is blank', () => {
    render(
      <WrittenRoundResult
        title="2021 round 1"
        onRetry={() => {}}
        questions={[{ id: 'q1', number: 1, subject: 'software', content: 'Question', choices: ['A', 'B', 'C', 'D'] }]}
        result={{
          total: 1,
          correct: 1,
          incorrect: 0,
          unanswered: 0,
          score: 100,
          subjects: [{ subject: 'software', total: 1, correct: 1, score: 100 }],
          questions: [{ id: 'q1', number: 1, subject: 'software', selectedAnswerIndex: 0, acceptedAnswerIndexes: [0], explanation: '   ', isCorrect: true, isUnanswered: false }],
        }}
      />,
    )

    expect(screen.getByText('해설 준비 중')).toBeInTheDocument()
  })
})
