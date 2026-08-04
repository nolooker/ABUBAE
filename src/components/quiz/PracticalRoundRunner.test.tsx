import { cleanup, render, screen, waitFor } from '@testing-library/react'
import userEvent from '@testing-library/user-event'
import { afterEach, describe, expect, it, vi } from 'vitest'

import PracticalRoundRunner from './PracticalRoundRunner'

const questions = [
  { id: 'q1', number: 1, subject: '실기', content: '첫 문제', blankCount: 1 },
  { id: 'q2', number: 2, subject: '실기', content: '둘째 문제', blankCount: 2 },
]

describe('PracticalRoundRunner', () => {
  afterEach(() => {
    cleanup()
    vi.unstubAllGlobals()
  })

  it('keeps typed answers while navigating between questions', async () => {
    vi.stubGlobal('scrollTo', vi.fn())
    const user = userEvent.setup()
    render(<PracticalRoundRunner year={2025} round={2} title="2025년 2회" questions={questions} />)

    await user.type(screen.getByLabelText('답안'), 'SSH')
    await user.click(screen.getByRole('button', { name: '다음 문제' }))
    expect(screen.getByText('응답 1')).toBeInTheDocument()

    await user.click(screen.getByRole('button', { name: '1번 문제로 이동' }))
    expect(screen.getByLabelText('답안')).toHaveValue('SSH')
  })

  it('renders one input per blank for a multi-blank question', async () => {
    const user = userEvent.setup()
    render(<PracticalRoundRunner year={2025} round={2} title="2025년 2회" questions={questions} />)

    await user.click(screen.getByRole('button', { name: '다음 문제' }))

    expect(screen.getByLabelText('빈칸 1 답안')).toBeInTheDocument()
    expect(screen.getByLabelText('빈칸 2 답안')).toBeInTheDocument()
  })

  it('moves questions even when the browser cannot perform smooth scrolling', async () => {
    vi.stubGlobal('scrollTo', vi.fn(() => { throw new Error('scroll unavailable') }))
    const user = userEvent.setup()
    render(<PracticalRoundRunner year={2025} round={2} title="2025년 2회" questions={questions} />)

    await user.click(screen.getByRole('button', { name: '다음 문제' }))

    expect(screen.getByRole('heading', { name: '2. 둘째 문제' })).toBeInTheDocument()
  })

  it('warns about unanswered questions before grading and shows the result after confirmation', async () => {
    const fetchMock = vi.fn().mockResolvedValue({
      ok: true,
      json: async () => ({
        total: 2,
        correct: 1,
        incorrect: 1,
        unanswered: 1,
        score: 50,
        subjects: [{ subject: '실기', total: 2, correct: 1, score: 50 }],
        questions: [
          { id: 'q1', number: 1, subject: '실기', explanation: '수정된 해설', isCorrect: true, isUnanswered: false, blanks: [{ blankNumber: 1, userAnswer: 'SSH', acceptedAnswers: ['SSH'], isCorrect: true }] },
          { id: 'q2', number: 2, subject: '실기', explanation: '', isCorrect: false, isUnanswered: true, blanks: [{ blankNumber: 1, userAnswer: null, acceptedAnswers: ['A'], isCorrect: false }, { blankNumber: 2, userAnswer: null, acceptedAnswers: ['B'], isCorrect: false }] },
        ],
      }),
    })
    vi.stubGlobal('fetch', fetchMock)
    vi.stubGlobal('scrollTo', vi.fn())
    const user = userEvent.setup()
    render(<PracticalRoundRunner year={2025} round={2} title="2025년 2회" questions={questions} />)

    await user.type(screen.getByLabelText('답안'), 'SSH')
    await user.click(screen.getByRole('button', { name: '회차 제출' }))

    expect(screen.getByRole('dialog')).toHaveTextContent('미응답 1문제')
    expect(screen.getByRole('dialog')).toHaveTextContent('2번')
    expect(fetchMock).not.toHaveBeenCalled()

    await user.click(screen.getByRole('button', { name: '제출 확정' }))

    await waitFor(() => expect(screen.getByRole('heading', { name: '50점' })).toBeInTheDocument())
    expect(screen.getByText('이 결과는 저장되지 않습니다.')).toBeInTheDocument()
    expect(screen.getByText('수정된 해설')).toBeInTheDocument()
    expect(fetchMock).toHaveBeenCalledWith(
      '/api/exam/jeongchogi/questions/practical/2025/2/grade',
      expect.objectContaining({ method: 'POST' }),
    )
  })
})
