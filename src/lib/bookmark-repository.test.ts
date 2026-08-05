import { describe, expect, it, vi } from 'vitest'

import { BookmarkRepositoryError, createBookmarkRepository } from './bookmark-repository'

type Result = { data: unknown; error: { code?: string; message?: string } | null }

function client(result: Result) {
  const calls: Array<[string, unknown[]]> = []
  const query = {
    select: vi.fn((...args: unknown[]) => { calls.push(['select', args]); return query }),
    insert: vi.fn((...args: unknown[]) => { calls.push(['insert', args]); return Promise.resolve(result) }),
    delete: vi.fn((...args: unknown[]) => { calls.push(['delete', args]); return query }),
    eq: vi.fn((...args: unknown[]) => { calls.push(['eq', args]); return query }),
    then: (resolve: (value: Result) => unknown) => resolve(result),
  }
  const from = vi.fn(() => query)
  return { supabase: { from }, calls }
}

describe('bookmark repository', () => {
  it('lists bookmarked question ids for a user', async () => {
    const { supabase, calls } = client({ data: [{ target_id: 'q1' }, { target_id: 'q2' }], error: null })

    await expect(createBookmarkRepository(supabase as never).listBookmarkedQuestionIds('user-1')).resolves.toEqual(['q1', 'q2'])
    expect(calls).toContainEqual(['eq', ['user_id', 'user-1']])
    expect(calls).toContainEqual(['eq', ['target_type', 'question']])
  })

  it('reports database failures as unavailable when listing', async () => {
    const { supabase } = client({ data: null, error: { message: 'connection failed' } })

    await expect(createBookmarkRepository(supabase as never).listBookmarkedQuestionIds('user-1')).rejects.toBeInstanceOf(BookmarkRepositoryError)
  })

  it('adds a bookmark', async () => {
    const { supabase, calls } = client({ data: null, error: null })

    await createBookmarkRepository(supabase as never).addBookmark('user-1', 'q1')

    expect(calls).toContainEqual(['insert', [{ user_id: 'user-1', target_type: 'question', target_id: 'q1' }]])
  })

  it('treats a duplicate bookmark insert as a no-op success', async () => {
    const { supabase } = client({ data: null, error: { code: '23505' } })

    await expect(createBookmarkRepository(supabase as never).addBookmark('user-1', 'q1')).resolves.toBeUndefined()
  })

  it('surfaces a non-duplicate insert failure', async () => {
    const { supabase } = client({ data: null, error: { code: '500', message: 'boom' } })

    await expect(createBookmarkRepository(supabase as never).addBookmark('user-1', 'q1')).rejects.toBeInstanceOf(BookmarkRepositoryError)
  })

  it('removes a bookmark', async () => {
    const { supabase, calls } = client({ data: null, error: null })

    await createBookmarkRepository(supabase as never).removeBookmark('user-1', 'q1')

    expect(calls).toContainEqual(['delete', []])
    expect(calls).toContainEqual(['eq', ['user_id', 'user-1']])
    expect(calls).toContainEqual(['eq', ['target_type', 'question']])
    expect(calls).toContainEqual(['eq', ['target_id', 'q1']])
  })

  it('reports database failures when removing', async () => {
    const { supabase } = client({ data: null, error: { message: 'connection failed' } })

    await expect(createBookmarkRepository(supabase as never).removeBookmark('user-1', 'q1')).rejects.toBeInstanceOf(BookmarkRepositoryError)
  })
})
