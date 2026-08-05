import { describe, expect, it, vi } from 'vitest'

const { createServiceClient } = vi.hoisted(() => ({ createServiceClient: vi.fn() }))

vi.mock('./supabase/service', () => ({ createServiceClient }))

import { BookmarkContentUnavailableError, getBookmarkedQuestions } from './bookmark-content'

function stubClient(result: { data: unknown; error: { message?: string } | null }) {
  const calls: Array<[string, unknown[]]> = []
  const query = {
    select: vi.fn((...args: unknown[]) => { calls.push(['select', args]); return query }),
    in: vi.fn((...args: unknown[]) => { calls.push(['in', args]); return query }),
    eq: vi.fn((...args: unknown[]) => { calls.push(['eq', args]); return query }),
    order: vi.fn((...args: unknown[]) => { calls.push(['order', args]); return query }),
    then: (resolve: (value: typeof result) => unknown) => resolve(result),
  }
  return { client: { from: vi.fn(() => query) }, calls }
}

describe('getBookmarkedQuestions', () => {
  it('returns an empty list without querying when there are no ids', async () => {
    createServiceClient.mockReturnValue(stubClient({ data: [], error: null }).client)

    await expect(getBookmarkedQuestions([])).resolves.toEqual([])
    expect(createServiceClient).not.toHaveBeenCalled()
  })

  it('resolves bookmarked question metadata restricted to published jeongchogi questions', async () => {
    const { client, calls } = stubClient({
      data: [
        { id: 'q1', exam_type: 'written', year: 2021, round: 1, subject: '소프트웨어 설계', number: 3, content: '문제 내용' },
      ],
      error: null,
    })
    createServiceClient.mockReturnValue(client)

    await expect(getBookmarkedQuestions(['q1'])).resolves.toEqual([
      { questionId: 'q1', examType: 'written', year: 2021, round: 1, subject: '소프트웨어 설계', questionNumber: 3, content: '문제 내용' },
    ])
    expect(calls).toContainEqual(['in', ['id', ['q1']]])
    expect(calls).toContainEqual(['eq', ['published', true]])
    expect(calls).toContainEqual(['eq', ['exams.slug', 'jeongchogi']])
  })

  it('reports database failures as unavailable', async () => {
    createServiceClient.mockReturnValue(stubClient({ data: null, error: { message: 'connection failed' } }).client)

    await expect(getBookmarkedQuestions(['q1'])).rejects.toBeInstanceOf(BookmarkContentUnavailableError)
  })

  it('wraps a service client construction failure', async () => {
    createServiceClient.mockImplementation(() => { throw new Error('missing env vars') })

    await expect(getBookmarkedQuestions(['q1'])).rejects.toBeInstanceOf(BookmarkContentUnavailableError)
  })
})
