import { cleanup, render, screen } from '@testing-library/react'
import userEvent from '@testing-library/user-event'
import { afterEach, describe, expect, it, vi } from 'vitest'

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

describe('WrittenQuestionEditDialog', () => {
  afterEach(() => {
    cleanup()
    vi.unstubAllGlobals()
  })

  it('asks before discarding a changed edit', async () => {
    const user = userEvent.setup()
    const onClose = vi.fn()
    render(<WrittenQuestionEditDialog question={question} onClose={onClose} onSaved={vi.fn()} />)

    await user.clear(screen.getByLabelText('Question'))
    await user.type(screen.getByLabelText('Question'), 'Changed question')
    await user.click(screen.getByRole('button', { name: 'Cancel' }))

    expect(screen.getByRole('alertdialog')).toHaveTextContent('Discard changes?')
    expect(onClose).not.toHaveBeenCalled()

    await user.click(screen.getByRole('button', { name: 'Discard changes' }))
    expect(onClose).toHaveBeenCalledOnce()
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
    render(<WrittenQuestionEditDialog question={question} onClose={vi.fn()} onSaved={onSaved} />)

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
  })
})
