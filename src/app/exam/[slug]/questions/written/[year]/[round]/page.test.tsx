import { beforeEach, describe, expect, it, vi } from 'vitest'

const mocks = vi.hoisted(() => ({
  createClient: vi.fn(),
  getCurrentUserRole: vi.fn(),
  getPublicWrittenRound: vi.fn(),
  notFound: vi.fn(),
}))

vi.mock('next/link', () => ({ default: () => null }))
vi.mock('next/navigation', () => ({ notFound: mocks.notFound }))
vi.mock('@/components/quiz/WrittenRoundRunner', () => ({ default: () => null }))
vi.mock('@/lib/master-auth', () => ({ getCurrentUserRole: mocks.getCurrentUserRole }))
vi.mock('@/lib/supabase/server', () => ({ createClient: mocks.createClient }))
vi.mock('@/lib/written-content', () => ({ getPublicWrittenRound: mocks.getPublicWrittenRound }))

import WrittenRoundPage from './page'

const publicRound = {
  title: '2021 round 1',
  questions: [{ id: 'q1', number: 1, subject: 'Software design', content: 'Question', choices: ['A', 'B', 'C', 'D'], updatedAt: '2026-07-23T00:00:00.000Z' }],
}

describe('WrittenRoundPage editing boundary', () => {
  beforeEach(() => {
    mocks.createClient.mockReset()
    mocks.getCurrentUserRole.mockReset()
    mocks.getPublicWrittenRound.mockReset()
    mocks.notFound.mockReset()
    mocks.getPublicWrittenRound.mockResolvedValue(publicRound)
  })

  it('does not pass an edit action or editable details to non-master visitors', async () => {
    mocks.getCurrentUserRole.mockResolvedValue('user')

    const page = await WrittenRoundPage({ params: Promise.resolve({ slug: 'jeongchogi', year: '2021', round: '1' }) })
    const runnerProps = (page.props.children as Array<{ props: Record<string, unknown> }>)[1].props

    expect(runnerProps).toEqual(expect.objectContaining({ canEdit: false }))
    expect(runnerProps).not.toHaveProperty('editableQuestions')
    expect(runnerProps.loadEditableQuestion).toBeUndefined()
    expect(mocks.createClient).not.toHaveBeenCalled()
  })

  it('passes a lazy master-only action that uses the authenticated RPC only when invoked', async () => {
    const rpc = vi.fn().mockResolvedValue({
      error: null,
      data: {
        question: { id: 'q1', number: 1, subject: 'Software design', content: 'Question', explanation: 'Explanation', updated_at: '2026-07-23T00:00:00.000Z' },
        choices: [
          { number: 1, content: 'A', is_correct: false },
          { number: 2, content: 'B', is_correct: true },
          { number: 3, content: 'C', is_correct: false },
          { number: 4, content: 'D', is_correct: false },
        ],
      },
    })
    mocks.getCurrentUserRole.mockResolvedValue('master')
    mocks.createClient.mockResolvedValue({ rpc })

    const page = await WrittenRoundPage({ params: Promise.resolve({ slug: 'jeongchogi', year: '2021', round: '1' }) })
    const runnerProps = (page.props.children as Array<{ props: Record<string, unknown> }>)[1].props

    expect(runnerProps).toEqual(expect.objectContaining({ canEdit: true }))
    expect(rpc).not.toHaveBeenCalled()

    const loadEditableQuestion = runnerProps.loadEditableQuestion as (questionId: string) => Promise<unknown>
    await expect(loadEditableQuestion('q1')).resolves.toMatchObject({
      id: 'q1',
      acceptedAnswerIndexes: [1],
      explanation: 'Explanation',
    })
    expect(rpc).toHaveBeenCalledWith('get_written_question_for_edit', { p_question_id: 'q1' })
  })
})
