import { cleanup, render, screen } from '@testing-library/react'
import userEvent from '@testing-library/user-event'
import { afterEach, describe, expect, it, vi } from 'vitest'
import { useState } from 'react'

import WrittenQuestionEditDialog from './WrittenQuestionEditDialog'

const question = {
  id: 'q1',
  number: 1,
  subject: 'Software design',
  content: 'Original question',
  choices: ['A', 'B', 'C', 'D'],
  updatedAt: '2026-07-23T00:00:00.000Z',
  acceptedAnswerIndexes: [1],
  explanation: 'Original explanation',
}

function DialogHarness() {
  const [open, setOpen] = useState(false)

  return (
    <>
      <button type="button" onClick={() => setOpen(true)}>Open edit</button>
      {open && <WrittenQuestionEditDialog question={question} onClose={() => setOpen(false)} onSaved={vi.fn()} onRefreshLatest={vi.fn()} />}
    </>
  )
}

describe('WrittenQuestionEditDialog', () => {
  afterEach(() => {
    cleanup()
    vi.unstubAllGlobals()
  })

  it('asks before discarding a changed edit', async () => {
    const user = userEvent.setup()
    const onClose = vi.fn()
    render(<WrittenQuestionEditDialog question={question} onClose={onClose} onSaved={vi.fn()} onRefreshLatest={vi.fn()} />)

    await user.clear(screen.getByLabelText('Question'))
    await user.type(screen.getByLabelText('Question'), 'Changed question')
    await user.click(screen.getByRole('button', { name: 'Cancel' }))

    expect(screen.getByRole('alertdialog')).toHaveTextContent('Discard changes?')
    expect(onClose).not.toHaveBeenCalled()

    await user.click(screen.getByRole('button', { name: 'Discard changes' }))
    expect(onClose).toHaveBeenCalledOnce()
  })

  it('keeps focus in the dialog, restores it on close, and handles Escape without losing dirty changes', async () => {
    const user = userEvent.setup()
    render(<DialogHarness />)

    await user.click(screen.getByRole('button', { name: 'Open edit' }))
    expect(screen.getByLabelText('Question')).toHaveFocus()

    screen.getByRole('button', { name: 'Save' }).focus()
    await user.tab()
    expect(screen.getByRole('button', { name: 'Close edit dialog' })).toHaveFocus()
    await user.tab({ shift: true })
    expect(screen.getByRole('button', { name: 'Save' })).toHaveFocus()

    await user.clear(screen.getByLabelText('Question'))
    await user.type(screen.getByLabelText('Question'), 'Changed question')
    await user.keyboard('{Escape}')
    expect(screen.getByRole('alertdialog')).toHaveTextContent('Discard changes?')

    await user.keyboard('{Escape}')
    expect(screen.queryByRole('alertdialog')).not.toBeInTheDocument()
    expect(screen.getByLabelText('Question')).toHaveFocus()

    await user.click(screen.getByRole('button', { name: 'Cancel' }))
    await user.click(screen.getByRole('button', { name: 'Discard changes' }))
    expect(screen.getByRole('button', { name: 'Open edit' })).toHaveFocus()
  })

  it('saves the question and returns the updated public question immediately', async () => {
    const fetchMock = vi.fn().mockResolvedValue({
      ok: true,
      json: async () => ({
        ...question,
        content: 'Updated question',
        choices: ['A1', 'B', 'C', 'D'],
        updatedAt: '2026-07-23T00:01:00.000Z',
      }),
    })
    vi.stubGlobal('fetch', fetchMock)
    const onSaved = vi.fn()
    const user = userEvent.setup()
    render(<WrittenQuestionEditDialog question={question} onClose={vi.fn()} onSaved={onSaved} onRefreshLatest={vi.fn()} />)

    await user.clear(screen.getByLabelText('Question'))
    await user.type(screen.getByLabelText('Question'), 'Updated question')
    await user.clear(screen.getByLabelText('Choice 1'))
    await user.type(screen.getByLabelText('Choice 1'), 'A1')
    await user.click(screen.getByLabelText('Correct choice 1'))
    await user.click(screen.getByRole('button', { name: 'Save' }))

    expect(fetchMock).toHaveBeenCalledWith(
      '/api/admin/written-questions/q1',
      expect.objectContaining({ method: 'PATCH' }),
    )
    expect(onSaved).toHaveBeenCalledWith(expect.objectContaining({
      content: 'Updated question',
      choices: ['A1', 'B', 'C', 'D'],
      acceptedAnswerIndexes: [0, 1],
      updatedAt: '2026-07-23T00:01:00.000Z',
    }))
    expect(screen.getByRole('status')).toBeEmptyDOMElement()
  })

  it('preserves the draft after a conflict, refreshes the baseline, and retries with the latest timestamp', async () => {
    const latestQuestion = {
      ...question,
      content: 'Another master update',
      updatedAt: '2026-07-23T00:02:00.000Z',
    }
    const fetchMock = vi.fn()
      .mockResolvedValueOnce({
        ok: false,
        status: 409,
        json: async () => ({ error: 'question was updated by another request' }),
      })
      .mockResolvedValueOnce({
        ok: true,
        status: 200,
        json: async () => ({
          ...latestQuestion,
          content: 'My draft',
          updatedAt: '2026-07-23T00:03:00.000Z',
        }),
      })
    vi.stubGlobal('fetch', fetchMock)
    const onRefreshLatest = vi.fn().mockResolvedValue(latestQuestion)
    const user = userEvent.setup()
    render(<WrittenQuestionEditDialog question={question} onClose={vi.fn()} onSaved={vi.fn()} onRefreshLatest={onRefreshLatest} />)

    await user.clear(screen.getByLabelText('Question'))
    await user.type(screen.getByLabelText('Question'), 'My draft')
    await user.click(screen.getByRole('button', { name: 'Save' }))

    expect(await screen.findByRole('alert')).toHaveTextContent('다른 수정 사항이 먼저 저장되었습니다.')
    expect(screen.getByLabelText('Question')).toHaveValue('My draft')

    await user.click(screen.getByRole('button', { name: '최신 내용 불러오기' }))

    expect(onRefreshLatest).toHaveBeenCalledOnce()
    expect(screen.getByLabelText('Question')).toHaveValue('My draft')
    expect(screen.getByRole('status')).toHaveTextContent('최신 저장 기준을 불러왔습니다. 작성 중인 내용은 유지했습니다.')

    await user.click(screen.getByRole('button', { name: 'Save' }))
    const retryBody = JSON.parse(fetchMock.mock.calls[1][1].body as string)
    expect(retryBody.expectedUpdatedAt).toBe(latestQuestion.updatedAt)
    expect(retryBody.content).toBe('My draft')
  })

  it.each([
    [400, { error: 'choices must contain exactly four items' }, '입력 내용을 확인해 주세요.'],
    [409, { unexpected: true }, '문제를 저장하지 못했습니다. 잠시 후 다시 시도해 주세요.'],
    [500, { error: 'unable to update question' }, '문제를 저장하지 못했습니다. 잠시 후 다시 시도해 주세요.'],
    [500, 'not-json', '문제를 저장하지 못했습니다. 잠시 후 다시 시도해 주세요.'],
  ])('shows a safe error for status %s', async (status, responseBody, expectedMessage) => {
    vi.stubGlobal('fetch', vi.fn().mockResolvedValue({
      ok: false,
      status,
      json: async () => {
        if (responseBody === 'not-json') throw new Error('malformed')
        return responseBody
      },
    }))
    const user = userEvent.setup()
    render(<WrittenQuestionEditDialog question={question} onClose={vi.fn()} onSaved={vi.fn()} onRefreshLatest={vi.fn()} />)

    await user.click(screen.getByRole('button', { name: 'Save' }))

    expect(await screen.findByRole('alert')).toHaveTextContent(expectedMessage)
  })

  it('shows a Korean validation message before sending an incomplete draft', async () => {
    const fetchMock = vi.fn()
    vi.stubGlobal('fetch', fetchMock)
    const user = userEvent.setup()
    render(<WrittenQuestionEditDialog question={question} onClose={vi.fn()} onSaved={vi.fn()} onRefreshLatest={vi.fn()} />)

    await user.clear(screen.getByLabelText('Question'))
    await user.click(screen.getByRole('button', { name: 'Save' }))

    expect(screen.getByRole('alert')).toHaveTextContent('문제, 보기 4개, 정답을 모두 입력해 주세요.')
    expect(fetchMock).not.toHaveBeenCalled()
  })

  it.each([
    ['a different question id', { ...question, id: 'q2' }],
    ['fewer than four choices', { ...question, choices: ['A', 'B', 'C'] }],
    ['a blank choice', { ...question, choices: ['A', '', 'C', 'D'] }],
    ['a non-positive question number', { ...question, number: 0 }],
  ])('rejects a successful response with %s', async (_description, responseBody) => {
    vi.stubGlobal('fetch', vi.fn().mockResolvedValue({ ok: true, json: async () => responseBody }))
    const onSaved = vi.fn()
    const user = userEvent.setup()
    render(<WrittenQuestionEditDialog question={question} onClose={vi.fn()} onSaved={onSaved} onRefreshLatest={vi.fn()} />)

    await user.click(screen.getByRole('button', { name: 'Save' }))

    expect(await screen.findByRole('alert')).toHaveTextContent('문제를 저장하지 못했습니다. 잠시 후 다시 시도해 주세요.')
    expect(onSaved).not.toHaveBeenCalled()
  })

  it('disables editing while saving and shows a generic error when saving fails', async () => {
    let resolveResponse: ((response: { ok: boolean }) => void) | undefined
    vi.stubGlobal('fetch', vi.fn().mockReturnValue(new Promise((resolve) => { resolveResponse = resolve })))
    const user = userEvent.setup()
    render(<WrittenQuestionEditDialog question={question} onClose={vi.fn()} onSaved={vi.fn()} onRefreshLatest={vi.fn()} />)

    await user.click(screen.getByRole('button', { name: 'Save' }))
    expect(screen.getByRole('button', { name: 'Saving…' })).toBeDisabled()
    expect(screen.getByRole('button', { name: 'Cancel' })).toBeDisabled()

    resolveResponse?.({ ok: false })
    expect(await screen.findByRole('alert')).toHaveTextContent('문제를 저장하지 못했습니다. 잠시 후 다시 시도해 주세요.')
    expect(screen.getByRole('button', { name: 'Save' })).toBeEnabled()
  })
})
