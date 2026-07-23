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
      {open && <WrittenQuestionEditDialog question={question} onClose={() => setOpen(false)} onSaved={vi.fn()} />}
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
    render(<WrittenQuestionEditDialog question={question} onClose={onClose} onSaved={vi.fn()} />)

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

  it.each([
    ['a different question id', { ...question, id: 'q2' }],
    ['fewer than four choices', { ...question, choices: ['A', 'B', 'C'] }],
    ['a blank choice', { ...question, choices: ['A', '', 'C', 'D'] }],
    ['a non-positive question number', { ...question, number: 0 }],
  ])('rejects a successful response with %s', async (_description, responseBody) => {
    vi.stubGlobal('fetch', vi.fn().mockResolvedValue({ ok: true, json: async () => responseBody }))
    const onSaved = vi.fn()
    const user = userEvent.setup()
    render(<WrittenQuestionEditDialog question={question} onClose={vi.fn()} onSaved={onSaved} />)

    await user.click(screen.getByRole('button', { name: 'Save' }))

    expect(await screen.findByRole('alert')).toHaveTextContent('Unable to save this question. Please try again.')
    expect(onSaved).not.toHaveBeenCalled()
  })

  it('disables editing while saving and shows a generic error when saving fails', async () => {
    let resolveResponse: ((response: { ok: boolean }) => void) | undefined
    vi.stubGlobal('fetch', vi.fn().mockReturnValue(new Promise((resolve) => { resolveResponse = resolve })))
    const user = userEvent.setup()
    render(<WrittenQuestionEditDialog question={question} onClose={vi.fn()} onSaved={vi.fn()} />)

    await user.click(screen.getByRole('button', { name: 'Save' }))
    expect(screen.getByRole('button', { name: 'Saving…' })).toBeDisabled()
    expect(screen.getByRole('button', { name: 'Cancel' })).toBeDisabled()

    resolveResponse?.({ ok: false })
    expect(await screen.findByRole('alert')).toHaveTextContent('Unable to save this question. Please try again.')
    expect(screen.getByRole('button', { name: 'Save' })).toBeEnabled()
  })
})
