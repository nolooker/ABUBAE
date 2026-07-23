import { cleanup, render, screen, waitFor } from '@testing-library/react'
import userEvent from '@testing-library/user-event'
import { afterEach, describe, expect, it, vi } from 'vitest'

import WrittenRoundRunner from './WrittenRoundRunner'

const questions = [
  { id: 'q1', number: 1, subject: '소프트웨어 설계', content: '첫 문제', choices: ['A', 'B', 'C', 'D'] },
  { id: 'q2', number: 2, subject: '소프트웨어 설계', content: '둘째 문제', choices: ['E', 'F', 'G', 'H'] },
]

describe('WrittenRoundRunner', () => {
  afterEach(() => {
    cleanup()
    vi.unstubAllGlobals()
  })

  it('keeps selected answers while navigating between questions', async () => {
    vi.stubGlobal('scrollTo', vi.fn())
    const user = userEvent.setup()
    render(<WrittenRoundRunner year={2021} round={1} title="2021년 1회" questions={questions} />)

    await user.click(screen.getByLabelText('1번 선택지 ② B'))
    await user.click(screen.getByRole('button', { name: '다음 문제' }))
    expect(screen.getByText('응답 1')).toBeInTheDocument()

    await user.click(screen.getByRole('button', { name: '1번 문제로 이동' }))
    expect(screen.getByLabelText('1번 선택지 ② B')).toBeChecked()
    expect(screen.queryByText(/정답/)).not.toBeInTheDocument()
  })

  it('moves questions even when the browser cannot perform smooth scrolling', async () => {
    vi.stubGlobal('scrollTo', vi.fn(() => { throw new Error('scroll unavailable') }))
    const user = userEvent.setup()
    render(<WrittenRoundRunner year={2021} round={1} title="2021년 1회" questions={questions} />)

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
        subjects: [{ subject: '소프트웨어 설계', total: 2, correct: 1, score: 50 }],
        questions: [
          { id: 'q1', number: 1, subject: '소프트웨어 설계', selectedAnswerIndex: 1, acceptedAnswerIndexes: [1], isCorrect: true, isUnanswered: false },
          { id: 'q2', number: 2, subject: '소프트웨어 설계', selectedAnswerIndex: null, acceptedAnswerIndexes: [2], isCorrect: false, isUnanswered: true },
        ],
      }),
    })
    vi.stubGlobal('fetch', fetchMock)
    vi.stubGlobal('scrollTo', vi.fn())
    const user = userEvent.setup()
    render(<WrittenRoundRunner year={2021} round={1} title="2021년 1회" questions={questions} />)

    await user.click(screen.getByLabelText('1번 선택지 ② B'))
    await user.click(screen.getByRole('button', { name: '최종 제출' }))

    expect(screen.getByRole('dialog')).toHaveTextContent('미응답 1문제')
    expect(screen.getByRole('dialog')).toHaveTextContent('2번')
    expect(fetchMock).not.toHaveBeenCalled()

    await user.click(screen.getByRole('button', { name: '미응답을 오답 처리하고 제출' }))

    await waitFor(() => expect(screen.getByRole('heading', { name: '50점' })).toBeInTheDocument())
    expect(screen.getByText('이 결과는 저장되지 않습니다.')).toBeInTheDocument()
    expect(fetchMock).toHaveBeenCalledWith(
      '/api/exam/jeongchogi/questions/written/2021/1/grade',
      expect.objectContaining({ method: 'POST' }),
    )
  })
})
