import { cleanup, render, screen, waitFor } from '@testing-library/react'
import userEvent from '@testing-library/user-event'
import { afterEach, describe, expect, it, vi } from 'vitest'

import WrittenRoundRunner from './WrittenRoundRunner'

const questions = [
  { id: 'q1', number: 1, subject: '소프트웨어 설계', content: '첫 문제', choices: ['A', 'B', 'C', 'D'] },
  { id: 'q2', number: 2, subject: '소프트웨어 설계', content: '둘째 문제', choices: ['E', 'F', 'G', 'H'] },
].map((question) => ({ ...question, updatedAt: '2026-07-23T00:00:00.000Z' }))

describe('WrittenRoundRunner', () => {
  afterEach(() => {
    cleanup()
    vi.unstubAllGlobals()
  })

  it('shows editing only to master and replaces the current question after saving', async () => {
    const fetchMock = vi.fn().mockResolvedValue({
      ok: true,
      json: async () => ({
        id: 'q1',
        number: 1,
        subject: 'Software design',
        content: 'Updated question',
        choices: ['A', 'B', 'C', 'D'],
        updatedAt: '2026-07-23T00:01:00.000Z',
      }),
    })
    vi.stubGlobal('fetch', fetchMock)
    const user = userEvent.setup()
    render(
      <WrittenRoundRunner
        canEdit
        editableQuestions={{
          q1: {
            id: 'q1',
            number: 1,
            subject: 'Software design',
            content: 'Original question',
            choices: ['A', 'B', 'C', 'D'],
            updatedAt: '2026-07-23T00:00:00.000Z',
            acceptedAnswerIndexes: [1],
            explanation: 'Explanation',
          },
        }}
        year={2021}
        round={1}
        title="2021 round 1"
        questions={[{ id: 'q1', number: 1, subject: 'Software design', content: 'Original question', choices: ['A', 'B', 'C', 'D'], updatedAt: '2026-07-23T00:00:00.000Z' }]}
      />,
    )

    await user.click(screen.getByRole('button', { name: '문제 수정' }))
    await user.clear(screen.getByLabelText('문제'))
    await user.type(screen.getByLabelText('문제'), 'Updated question')
    await user.click(screen.getByRole('button', { name: '저장' }))

    expect(await screen.findByRole('heading', { name: '1. Updated question' })).toBeInTheDocument()
    expect(screen.queryByRole('dialog', { name: '1번 문제 수정' })).not.toBeInTheDocument()
    expect(screen.getByRole('status')).toHaveTextContent('문제가 저장되었습니다.')
  })

  it('does not render editing for normal users', () => {
    render(<WrittenRoundRunner canEdit={false} year={2021} round={1} title="2021 round 1" questions={questions} />)

    expect(screen.queryByRole('button', { name: '문제 수정' })).not.toBeInTheDocument()
  })

  it('lazily loads editable details only after a master opens the current question editor', async () => {
    const loadEditableQuestion = vi.fn().mockResolvedValue({
      id: 'q1',
      number: 1,
      subject: 'Software design',
      content: 'Original question',
      choices: ['A', 'B', 'C', 'D'],
      updatedAt: '2026-07-23T00:00:00.000Z',
      acceptedAnswerIndexes: [1],
      explanation: 'Explanation',
    })
    const user = userEvent.setup()
    render(
      <WrittenRoundRunner
        canEdit
        loadEditableQuestion={loadEditableQuestion}
        year={2021}
        round={1}
        title="2021 round 1"
        questions={[{ id: 'q1', number: 1, subject: 'Software design', content: 'Original question', choices: ['A', 'B', 'C', 'D'], updatedAt: '2026-07-23T00:00:00.000Z' }]}
      />,
    )

    expect(loadEditableQuestion).not.toHaveBeenCalled()
    await user.click(screen.getByRole('button', { name: '문제 수정' }))

    expect(await screen.findByLabelText('해설')).toHaveValue('Explanation')
    expect(loadEditableQuestion).toHaveBeenCalledOnce()
    expect(loadEditableQuestion).toHaveBeenCalledWith('q1')
  })

  it('refreshes a conflicted edit without losing the draft and reopens from the refreshed cache', async () => {
    const original = {
      id: 'q1',
      number: 1,
      subject: 'Software design',
      content: 'Original question',
      choices: ['A', 'B', 'C', 'D'],
      updatedAt: '2026-07-23T00:00:00.000Z',
      acceptedAnswerIndexes: [1],
      explanation: 'Original explanation',
    }
    const latest = {
      ...original,
      content: 'Latest server question',
      updatedAt: '2026-07-23T00:02:00.000Z',
    }
    const loadEditableQuestion = vi.fn()
      .mockResolvedValueOnce(original)
      .mockResolvedValueOnce(latest)
    vi.stubGlobal('fetch', vi.fn().mockResolvedValue({
      ok: false,
      status: 409,
      json: async () => ({ error: 'question was updated by another request' }),
    }))
    const user = userEvent.setup()
    render(
      <WrittenRoundRunner
        canEdit
        loadEditableQuestion={loadEditableQuestion}
        year={2021}
        round={1}
        title="2021 round 1"
        questions={[{ id: 'q1', number: 1, subject: 'Software design', content: 'Original question', choices: ['A', 'B', 'C', 'D'], updatedAt: original.updatedAt }]}
      />,
    )

    await user.click(screen.getByRole('button', { name: '문제 수정' }))
    await user.clear(await screen.findByLabelText('문제'))
    await user.type(screen.getByLabelText('문제'), 'My preserved draft')
    await user.click(screen.getByRole('button', { name: '저장' }))
    await user.click(await screen.findByRole('button', { name: '최신 내용 불러오기' }))

    expect(screen.getByLabelText('문제')).toHaveValue('My preserved draft')
    expect(loadEditableQuestion).toHaveBeenCalledTimes(2)

    await user.click(screen.getByRole('button', { name: '취소' }))
    await user.click(screen.getByRole('button', { name: '변경사항 버리기' }))
    await user.click(screen.getByRole('button', { name: '문제 수정' }))

    expect(screen.getByLabelText('문제')).toHaveValue('Latest server question')
    expect(loadEditableQuestion).toHaveBeenCalledTimes(2)
  })

  it('keeps selected answers while navigating between questions', async () => {
    vi.stubGlobal('scrollTo', vi.fn())
    const user = userEvent.setup()
    render(<WrittenRoundRunner year={2021} round={1} title="2021년 1회" questions={questions} />)

    await user.click(screen.getByRole('radio', { name: '선택지 2' }))
    await user.click(screen.getByRole('button', { name: '다음 문제' }))
    expect(screen.getByText('응답 1')).toBeInTheDocument()

    await user.click(screen.getByRole('button', { name: '1번 문제로 이동' }))
    expect(screen.getByRole('radio', { name: '선택지 2' })).toBeChecked()
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
          { id: 'q1', number: 1, subject: '소프트웨어 설계', selectedAnswerIndex: 1, acceptedAnswerIndexes: [1], explanation: '수정된 해설', isCorrect: true, isUnanswered: false },
          { id: 'q2', number: 2, subject: '소프트웨어 설계', selectedAnswerIndex: null, acceptedAnswerIndexes: [2], explanation: '', isCorrect: false, isUnanswered: true },
        ],
      }),
    })
    vi.stubGlobal('fetch', fetchMock)
    vi.stubGlobal('scrollTo', vi.fn())
    const user = userEvent.setup()
    render(<WrittenRoundRunner year={2021} round={1} title="2021년 1회" questions={questions} />)

    await user.click(screen.getByRole('radio', { name: '선택지 2' }))
    await user.click(screen.getByRole('button', { name: '회차 제출' }))

    expect(screen.getByRole('dialog')).toHaveTextContent('미응답 1문제')
    expect(screen.getByRole('dialog')).toHaveTextContent('2번')
    expect(fetchMock).not.toHaveBeenCalled()

    await user.click(screen.getByRole('button', { name: '제출 확정' }))

    await waitFor(() => expect(screen.getByRole('heading', { name: '50점' })).toBeInTheDocument())
    expect(screen.getByText('이 결과는 저장되지 않습니다.')).toBeInTheDocument()
    expect(screen.getByText('수정된 해설')).toBeInTheDocument()
    expect(fetchMock).toHaveBeenCalledWith(
      '/api/exam/jeongchogi/questions/written/2021/1/grade',
      expect.objectContaining({ method: 'POST' }),
    )
  })

  it('exposes stable labels for answer selection and submission', async () => {
    const user = userEvent.setup()
    render(<WrittenRoundRunner year={2021} round={1} title="2021년 1회" questions={questions} />)

    await user.click(screen.getByRole('radio', { name: '선택지 2' }))
    await user.click(screen.getByRole('button', { name: '회차 제출' }))

    expect(screen.getByRole('button', { name: '제출 확정' })).toBeInTheDocument()
  })
})
