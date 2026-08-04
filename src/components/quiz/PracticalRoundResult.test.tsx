import { cleanup, render, screen } from '@testing-library/react'
import { afterEach, describe, expect, it } from 'vitest'

import PracticalRoundResult from './PracticalRoundResult'

describe('PracticalRoundResult', () => {
  afterEach(() => cleanup())

  it('shows the accepted answer only for a wrong blank, and marks a multi-blank question incorrect if any blank is wrong', () => {
    render(
      <PracticalRoundResult
        title="2025년 2회"
        onRetry={() => {}}
        questions={[{ id: 'q1', number: 1, subject: '실기', content: '문제', blankCount: 2 }]}
        result={{
          total: 1,
          correct: 0,
          incorrect: 1,
          unanswered: 0,
          score: 0,
          subjects: [{ subject: '실기', total: 1, correct: 0, score: 0 }],
          questions: [{
            id: 'q1',
            number: 1,
            subject: '실기',
            explanation: 'Edited explanation',
            isCorrect: false,
            isUnanswered: false,
            blanks: [
              { blankNumber: 1, userAnswer: 'SRT', acceptedAnswers: ['SRT'], isCorrect: true },
              { blankNumber: 2, userAnswer: '과장', acceptedAnswers: ['부장'], isCorrect: false },
            ],
          }],
        }}
      />,
    )

    expect(screen.getByText('내 답: SRT')).toBeInTheDocument()
    expect(screen.queryByText(/정답: SRT/)).not.toBeInTheDocument()
    expect(screen.getByText('내 답: 과장')).toBeInTheDocument()
    expect(screen.getByText('정답: 부장')).toBeInTheDocument()
    expect(screen.getByText('Edited explanation')).toBeInTheDocument()
  })

  it('shows the safe fallback only when an explanation is blank', () => {
    render(
      <PracticalRoundResult
        title="2025년 2회"
        onRetry={() => {}}
        questions={[{ id: 'q1', number: 1, subject: '실기', content: '문제', blankCount: 1 }]}
        result={{
          total: 1,
          correct: 1,
          incorrect: 0,
          unanswered: 0,
          score: 100,
          subjects: [{ subject: '실기', total: 1, correct: 1, score: 100 }],
          questions: [{
            id: 'q1',
            number: 1,
            subject: '실기',
            explanation: '   ',
            isCorrect: true,
            isUnanswered: false,
            blanks: [{ blankNumber: 1, userAnswer: 'SSH', acceptedAnswers: ['SSH'], isCorrect: true }],
          }],
        }}
      />,
    )

    expect(screen.getByText('해설 준비 중')).toBeInTheDocument()
  })
})
