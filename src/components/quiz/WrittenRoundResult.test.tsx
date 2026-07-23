import { render, screen } from '@testing-library/react'
import { describe, expect, it } from 'vitest'

import WrittenRoundResult from './WrittenRoundResult'

describe('WrittenRoundResult', () => {
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
          questions: [{ id: 'q1', number: 1, subject: '소프트웨어 설계', selectedAnswerIndex: 0, acceptedAnswerIndexes: [1], isCorrect: false, isUnanswered: false }],
        }}
      />,
    )

    expect(screen.getByRole('listitem', { name: 'Graded choice 1: your incorrect answer' })).toBeInTheDocument()
    expect(screen.getByRole('listitem', { name: 'Graded choice 2: correct answer' })).toBeInTheDocument()
  })
})
