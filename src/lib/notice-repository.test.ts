import { describe, expect, it, vi } from 'vitest'

import {
  NoticeConflictError,
  NoticeNotFoundError,
  createNoticeRepository,
} from './notice-repository'

type Result = { data: unknown; error: { code?: string; message?: string } | null }

function client(results: Result[]) {
  const calls: Array<[string, unknown[]]> = []
  let resultIndex = 0
  const query = {
    select: vi.fn((...args: unknown[]) => { calls.push(['select', args]); return query }),
    eq: vi.fn((...args: unknown[]) => { calls.push(['eq', args]); return query }),
    order: vi.fn((...args: unknown[]) => { calls.push(['order', args]); return query }),
    limit: vi.fn((...args: unknown[]) => { calls.push(['limit', args]); return query }),
    insert: vi.fn((...args: unknown[]) => { calls.push(['insert', args]); return query }),
    update: vi.fn((...args: unknown[]) => { calls.push(['update', args]); return query }),
    single: vi.fn(() => { calls.push(['single', []]); return Promise.resolve(results[resultIndex++]) }),
    maybeSingle: vi.fn(() => { calls.push(['maybeSingle', []]); return Promise.resolve(results[resultIndex++]) }),
    then: (resolve: (value: Result) => unknown) => resolve(results[resultIndex++]),
  }
  return {
    supabase: { from: vi.fn(() => query) },
    calls,
  }
}

const row = {
  id: 'd7d68087-a5a8-4b6e-a0aa-550a4f5937a1',
  title: 'Notice',
  slug: 'first-notice',
  content: 'Content',
  is_published: true,
  created_at: '2026-07-24T00:00:00Z',
  updated_at: '2026-07-24T00:00:00Z',
}

describe('notice repository', () => {
  it('selects only the public notice fields and published notice rows', async () => {
    const { supabase, calls } = client([{ data: [row], error: null }])

    await expect(createNoticeRepository(supabase as never).listPublishedNotices(3)).resolves.toEqual([{
      id: row.id,
      title: row.title,
      slug: row.slug,
      createdAt: row.created_at,
    }])
    expect(calls).toContainEqual(['select', ['id,title,slug,content,created_at,updated_at']])
    expect(calls).toContainEqual(['eq', ['type', 'notice']])
    expect(calls).toContainEqual(['eq', ['is_published', true]])
    expect(calls).toContainEqual(['limit', [3]])
  })

  it('gets a published public notice by slug without exposing admin fields', async () => {
    const { supabase, calls } = client([{ data: row, error: null }])

    await expect(createNoticeRepository(supabase as never).getPublishedNoticeBySlug(row.slug)).resolves.toEqual({
      id: row.id,
      title: row.title,
      slug: row.slug,
      content: row.content,
      createdAt: row.created_at,
      updatedAt: row.updated_at,
    })
    expect(calls).toContainEqual(['eq', ['slug', row.slug]])
    expect(calls).toContainEqual(['eq', ['type', 'notice']])
    expect(calls).toContainEqual(['eq', ['is_published', true]])
  })

  it('creates an admin notice with its type and premium flag fixed server-side', async () => {
    const { supabase, calls } = client([{ data: row, error: null }])

    await expect(createNoticeRepository(supabase as never).createNotice({
      title: row.title,
      slug: row.slug,
      content: row.content,
      isPublished: true,
    })).resolves.toMatchObject({ id: row.id, isPublished: true })
    expect(calls).toContainEqual(['insert', [{
      title: row.title,
      slug: row.slug,
      content: row.content,
      is_published: true,
      type: 'notice',
      is_premium: false,
    }]])
  })

  it('maps duplicate slugs to a typed conflict', async () => {
    const { supabase } = client([{ data: null, error: { code: '23505', message: 'duplicate key value violates unique constraint' } }])

    await expect(createNoticeRepository(supabase as never).createNotice({
      title: row.title,
      slug: row.slug,
      content: row.content,
      isPublished: true,
    })).rejects.toBeInstanceOf(NoticeConflictError)
  })

  it('updates only an existing notice with the expected updated_at timestamp', async () => {
    const { supabase, calls } = client([{ data: { ...row, updated_at: '2026-07-24T01:00:00Z' }, error: null }])

    await expect(createNoticeRepository(supabase as never).updateNotice(
      row.id,
      { title: 'Updated', slug: row.slug, content: 'Updated content', isPublished: false },
      row.updated_at,
    )).resolves.toMatchObject({ title: row.title, isPublished: true })
    expect(calls).toContainEqual(['eq', ['id', row.id]])
    expect(calls).toContainEqual(['eq', ['updated_at', row.updated_at]])
    expect(calls).toContainEqual(['eq', ['type', 'notice']])
    expect(calls).toContainEqual(['eq', ['is_premium', false]])
  })

  it('distinguishes a missing notice from a stale update', async () => {
    const stale = client([
      { data: null, error: null },
      { data: row, error: null },
    ])
    await expect(createNoticeRepository(stale.supabase as never).updateNotice(
      row.id,
      { title: 'Updated', slug: row.slug, content: 'Updated content', isPublished: false },
      row.updated_at,
    )).rejects.toBeInstanceOf(NoticeConflictError)

    const missing = client([
      { data: null, error: null },
      { data: null, error: null },
    ])
    await expect(createNoticeRepository(missing.supabase as never).updateNotice(
      row.id,
      { title: 'Updated', slug: row.slug, content: 'Updated content', isPublished: false },
      row.updated_at,
    )).rejects.toBeInstanceOf(NoticeNotFoundError)
  })
})
