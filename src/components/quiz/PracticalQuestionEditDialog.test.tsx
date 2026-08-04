import { cleanup, render, screen } from '@testing-library/react'
import userEvent from '@testing-library/user-event'
import { afterEach, describe, expect, it, vi } from 'vitest'

import PracticalQuestionEditDialog from './PracticalQuestionEditDialog'

const question = {
  id: 'q1',
  number: 3,
  subject: '실기',
  content: 'Original question',
  blankCount: 1,
  updatedAt: '2026-07-23T00:00:00.000Z',
  blanks: [{ blankNumber: 1, acceptedAnswers: ['106.00'] }],
  explanation: 'Original explanation',
}

describe('PracticalQuestionEditDialog', () => {
  afterEach(() => {
    cleanup()
    vi.unstubAllGlobals()
  })

  it('asks before discarding a changed edit', async () => {
    const user = userEvent.setup()
    const onClose = vi.fn()
    render(<PracticalQuestionEditDialog question={question} onClose={onClose} onSaved={vi.fn()} onRefreshLatest={vi.fn()} />)

    await user.clear(screen.getByLabelText('문제'))
    await user.type(screen.getByLabelText('문제'), 'Changed question')
    await user.click(screen.getByRole('button', { name: '취소' }))

    expect(screen.getByRole('alertdialog')).toHaveTextContent('변경사항을 버릴까요?')
    expect(onClose).not.toHaveBeenCalled()

    await user.click(screen.getByRole('button', { name: '변경사항 버리기' }))
    expect(onClose).toHaveBeenCalledOnce()
  })

  it('saves the question, splitting comma-separated answers per blank', async () => {
    const fetchMock = vi.fn().mockResolvedValue({
      ok: true,
      json: async () => ({
        ...question,
        content: 'Updated question',
        updatedAt: '2026-07-23T00:01:00.000Z',
      }),
    })
    vi.stubGlobal('fetch', fetchMock)
    const onSaved = vi.fn()
    const user = userEvent.setup()
    render(<PracticalQuestionEditDialog question={question} onClose={vi.fn()} onSaved={onSaved} onRefreshLatest={vi.fn()} />)

    await user.clear(screen.getByLabelText('문제'))
    await user.type(screen.getByLabelText('문제'), 'Updated question')
    await user.clear(screen.getByLabelText('빈칸 1 정답'))
    await user.type(screen.getByLabelText('빈칸 1 정답'), '106.00, 106')
    await user.click(screen.getByRole('button', { name: '저장' }))

    expect(fetchMock).toHaveBeenCalledWith(
      '/api/admin/practical-questions/q1',
      expect.objectContaining({ method: 'PATCH' }),
    )
    const body = JSON.parse(fetchMock.mock.calls[0][1].body as string)
    expect(body.blanks).toEqual([{ blankNumber: 1, acceptedAnswers: ['106.00', '106'] }])
    expect(onSaved).toHaveBeenCalledWith(expect.objectContaining({
      content: 'Updated question',
      updatedAt: '2026-07-23T00:01:00.000Z',
    }))
  })

  it('adds and removes blanks, renumbering sequentially', async () => {
    const user = userEvent.setup()
    render(<PracticalQuestionEditDialog question={question} onClose={vi.fn()} onSaved={vi.fn()} onRefreshLatest={vi.fn()} />)

    await user.click(screen.getByRole('button', { name: '빈칸 추가' }))
    expect(screen.getByLabelText('빈칸 2 정답')).toBeInTheDocument()

    await user.click(screen.getByRole('button', { name: '빈칸 1 삭제' }))
    expect(screen.queryByLabelText('빈칸 2 정답')).not.toBeInTheDocument()
    expect(screen.getByLabelText('빈칸 1 정답')).toBeInTheDocument()
  })

  it('disables removing the last remaining blank', () => {
    render(<PracticalQuestionEditDialog question={question} onClose={vi.fn()} onSaved={vi.fn()} onRefreshLatest={vi.fn()} />)

    expect(screen.getByRole('button', { name: '빈칸 1 삭제' })).toBeDisabled()
  })

  it('preserves the draft after a conflict and retries with the latest timestamp', async () => {
    const latestQuestion = { ...question, content: 'Another master update', updatedAt: '2026-07-23T00:02:00.000Z' }
    const fetchMock = vi.fn()
      .mockResolvedValueOnce({ ok: false, status: 409, json: async () => ({ error: 'question was updated by another request' }) })
      .mockResolvedValueOnce({ ok: true, status: 200, json: async () => ({ ...latestQuestion, content: 'My draft', updatedAt: '2026-07-23T00:03:00.000Z' }) })
    vi.stubGlobal('fetch', fetchMock)
    const onRefreshLatest = vi.fn().mockResolvedValue(latestQuestion)
    const user = userEvent.setup()
    render(<PracticalQuestionEditDialog question={question} onClose={vi.fn()} onSaved={vi.fn()} onRefreshLatest={onRefreshLatest} />)

    await user.clear(screen.getByLabelText('문제'))
    await user.type(screen.getByLabelText('문제'), 'My draft')
    await user.click(screen.getByRole('button', { name: '저장' }))

    expect(await screen.findByRole('alert')).toHaveTextContent('다른 수정 사항이 먼저 저장되었습니다.')
    expect(screen.getByLabelText('문제')).toHaveValue('My draft')

    await user.click(screen.getByRole('button', { name: '최신 내용 불러오기' }))
    expect(onRefreshLatest).toHaveBeenCalledOnce()
    expect(screen.getByLabelText('문제')).toHaveValue('My draft')

    await user.click(screen.getByRole('button', { name: '저장' }))
    const retryBody = JSON.parse(fetchMock.mock.calls[1][1].body as string)
    expect(retryBody.expectedUpdatedAt).toBe(latestQuestion.updatedAt)
    expect(retryBody.content).toBe('My draft')
  })

  it('shows a Korean validation message before sending a blank answer', async () => {
    const fetchMock = vi.fn()
    vi.stubGlobal('fetch', fetchMock)
    const user = userEvent.setup()
    render(<PracticalQuestionEditDialog question={question} onClose={vi.fn()} onSaved={vi.fn()} onRefreshLatest={vi.fn()} />)

    await user.clear(screen.getByLabelText('빈칸 1 정답'))
    await user.click(screen.getByRole('button', { name: '저장' }))

    expect(screen.getByRole('alert')).toHaveTextContent('문제와 각 빈칸의 정답을 모두 입력해 주세요.')
    expect(fetchMock).not.toHaveBeenCalled()
  })

  it.each([
    [400, { error: 'blank 1 must have at least one accepted answer' }, '입력 내용을 확인해 주세요.'],
    [500, { error: 'unable to update question' }, '문제를 저장하지 못했습니다. 잠시 후 다시 시도해 주세요.'],
  ])('shows a safe error for status %s', async (status, responseBody, expectedMessage) => {
    vi.stubGlobal('fetch', vi.fn().mockResolvedValue({ ok: false, status, json: async () => responseBody }))
    const user = userEvent.setup()
    render(<PracticalQuestionEditDialog question={question} onClose={vi.fn()} onSaved={vi.fn()} onRefreshLatest={vi.fn()} />)

    await user.click(screen.getByRole('button', { name: '저장' }))

    expect(await screen.findByRole('alert')).toHaveTextContent(expectedMessage)
  })
})
