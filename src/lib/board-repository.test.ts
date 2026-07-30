import { describe, expect, it, vi } from 'vitest'

import { BoardNotFoundError, BoardRepositoryError, createBoardRepository } from './board-repository'

type Result = { data: unknown; error: { code?: string; message?: string } | null }

function client(results: Result[]) {
  const calls: Array<[string, unknown[]]> = []
  let resultIndex = 0
  const query = {
    select: vi.fn((...args: unknown[]) => { calls.push(['select', args]); return query }),
    eq: vi.fn((...args: unknown[]) => { calls.push(['eq', args]); return query }),
    order: vi.fn((...args: unknown[]) => { calls.push(['order', args]); return query }),
    insert: vi.fn((...args: unknown[]) => { calls.push(['insert', args]); return query }),
    update: vi.fn((...args: unknown[]) => { calls.push(['update', args]); return query }),
    delete: vi.fn((...args: unknown[]) => { calls.push(['delete', args]); return query }),
    single: vi.fn(() => { calls.push(['single', []]); return Promise.resolve(results[resultIndex++]) }),
    maybeSingle: vi.fn(() => { calls.push(['maybeSingle', []]); return Promise.resolve(results[resultIndex++]) }),
    then: (resolve: (value: Result) => unknown) => resolve(results[resultIndex++]),
  }
  return {
    supabase: { from: vi.fn(() => query) },
    calls,
  }
}

const post = {
  id: 'd7d68087-a5a8-4b6e-a0aa-550a4f5937a1',
  user_id: 'a1111111-a5a8-4b6e-a0aa-550a4f5937a1',
  title: 'Title',
  content: 'Content',
  author_nickname: '아부배러너',
  created_at: '2026-07-24T00:00:00Z',
  updated_at: '2026-07-24T00:00:00Z',
}

const comment = {
  id: 'c1111111-a5a8-4b6e-a0aa-550a4f5937a1',
  post_id: post.id,
  user_id: post.user_id,
  author_nickname: '아부배러너',
  content: 'Comment',
  created_at: '2026-07-24T00:01:00Z',
  parent_comment_id: null,
}

describe('board repository', () => {
  it('lists posts newest-first with computed comment counts', async () => {
    const { supabase } = client([
      { data: [post, { ...post, id: 'e1111111-a5a8-4b6e-a0aa-550a4f5937a1' }], error: null },
      { data: [{ post_id: post.id }, { post_id: post.id }], error: null },
    ])

    await expect(createBoardRepository(supabase as never).listPosts()).resolves.toEqual([
      { id: post.id, title: post.title, authorNickname: post.author_nickname, createdAt: post.created_at, commentCount: 2 },
      { id: 'e1111111-a5a8-4b6e-a0aa-550a4f5937a1', title: post.title, authorNickname: post.author_nickname, createdAt: post.created_at, commentCount: 0 },
    ])
  })

  it('reports a database failure while listing as unavailable', async () => {
    const { supabase } = client([{ data: null, error: { message: 'connection failed' } }])

    await expect(createBoardRepository(supabase as never).listPosts()).rejects.toBeInstanceOf(BoardRepositoryError)
  })

  it('gets a post with its comments', async () => {
    const { supabase, calls } = client([
      { data: post, error: null },
      { data: [comment], error: null },
    ])

    await expect(createBoardRepository(supabase as never).getPost(post.id)).resolves.toEqual({
      post: {
        id: post.id,
        userId: post.user_id,
        title: post.title,
        content: post.content,
        authorNickname: post.author_nickname,
        createdAt: post.created_at,
        updatedAt: post.updated_at,
      },
      comments: [{
        id: comment.id,
        postId: comment.post_id,
        userId: comment.user_id,
        authorNickname: comment.author_nickname,
        content: comment.content,
        createdAt: comment.created_at,
        parentCommentId: null,
      }],
    })
    expect(calls).toContainEqual(['eq', ['id', post.id]])
    expect(calls).toContainEqual(['eq', ['post_id', post.id]])
  })

  it('returns undefined for a missing post', async () => {
    const { supabase } = client([{ data: null, error: null }])

    await expect(createBoardRepository(supabase as never).getPost(post.id)).resolves.toBeUndefined()
  })

  it('creates a post scoped to the authenticated author', async () => {
    const { supabase, calls } = client([{ data: post, error: null }])

    await expect(createBoardRepository(supabase as never).createPost(post.user_id, post.author_nickname, {
      title: post.title,
      content: post.content,
    })).resolves.toMatchObject({ id: post.id, authorNickname: post.author_nickname })
    expect(calls).toContainEqual(['insert', [{
      user_id: post.user_id,
      author_nickname: post.author_nickname,
      title: post.title,
      content: post.content,
    }]])
  })

  it('updates a post and reports RLS-filtered writes as not found', async () => {
    const found = client([{ data: { ...post, title: 'Updated' }, error: null }])
    await expect(createBoardRepository(found.supabase as never).updatePost(post.id, { title: 'Updated', content: post.content }))
      .resolves.toMatchObject({ title: 'Updated' })

    const notOwned = client([{ data: null, error: null }])
    await expect(createBoardRepository(notOwned.supabase as never).updatePost(post.id, { title: 'Updated', content: post.content }))
      .rejects.toBeInstanceOf(BoardNotFoundError)
  })

  it('deletes a post and reports RLS-filtered deletes as not found', async () => {
    const found = client([{ data: { id: post.id }, error: null }])
    await expect(createBoardRepository(found.supabase as never).deletePost(post.id)).resolves.toBeUndefined()

    const notOwned = client([{ data: null, error: null }])
    await expect(createBoardRepository(notOwned.supabase as never).deletePost(post.id)).rejects.toBeInstanceOf(BoardNotFoundError)
  })

  it('creates a top-level comment scoped to the authenticated author', async () => {
    const { supabase, calls } = client([{ data: comment, error: null }])

    await expect(createBoardRepository(supabase as never).createComment(post.id, comment.user_id, comment.author_nickname, {
      content: comment.content,
      parentCommentId: null,
    })).resolves.toMatchObject({ id: comment.id, postId: post.id, parentCommentId: null })
    expect(calls).toContainEqual(['insert', [{
      post_id: post.id,
      user_id: comment.user_id,
      author_nickname: comment.author_nickname,
      content: comment.content,
      parent_comment_id: null,
    }]])
  })

  it('reports commenting on a missing post as not found', async () => {
    const { supabase } = client([{ data: null, error: { code: '23503', message: 'violates foreign key constraint' } }])

    await expect(createBoardRepository(supabase as never).createComment(post.id, comment.user_id, comment.author_nickname, {
      content: comment.content,
      parentCommentId: null,
    })).rejects.toBeInstanceOf(BoardNotFoundError)
  })

  it('creates a reply to a top-level comment on the same post', async () => {
    const { supabase, calls } = client([
      { data: { post_id: post.id, parent_comment_id: null }, error: null },
      { data: { ...comment, id: 'r1111111-a5a8-4b6e-a0aa-550a4f5937a1', parent_comment_id: comment.id }, error: null },
    ])

    await expect(createBoardRepository(supabase as never).createComment(post.id, comment.user_id, comment.author_nickname, {
      content: 'reply',
      parentCommentId: comment.id,
    })).resolves.toMatchObject({ parentCommentId: comment.id })
    expect(calls).toContainEqual(['eq', ['id', comment.id]])
    expect(calls).toContainEqual(['insert', [{
      post_id: post.id,
      user_id: comment.user_id,
      author_nickname: comment.author_nickname,
      content: 'reply',
      parent_comment_id: comment.id,
    }]])
  })

  it('rejects a reply whose parent belongs to a different post', async () => {
    const { supabase } = client([{ data: { post_id: 'other-post', parent_comment_id: null }, error: null }])

    await expect(createBoardRepository(supabase as never).createComment(post.id, comment.user_id, comment.author_nickname, {
      content: 'reply',
      parentCommentId: comment.id,
    })).rejects.toBeInstanceOf(BoardNotFoundError)
  })

  it('rejects a reply-to-a-reply to enforce a single level of nesting', async () => {
    const { supabase } = client([{ data: { post_id: post.id, parent_comment_id: 'top-level-id' }, error: null }])

    await expect(createBoardRepository(supabase as never).createComment(post.id, comment.user_id, comment.author_nickname, {
      content: 'reply',
      parentCommentId: comment.id,
    })).rejects.toBeInstanceOf(BoardNotFoundError)
  })

  it('rejects a reply to a nonexistent parent comment', async () => {
    const { supabase } = client([{ data: null, error: null }])

    await expect(createBoardRepository(supabase as never).createComment(post.id, comment.user_id, comment.author_nickname, {
      content: 'reply',
      parentCommentId: comment.id,
    })).rejects.toBeInstanceOf(BoardNotFoundError)
  })

  it('deletes a comment and reports RLS-filtered deletes as not found', async () => {
    const found = client([{ data: { id: comment.id }, error: null }])
    await expect(createBoardRepository(found.supabase as never).deleteComment(comment.id)).resolves.toBeUndefined()

    const notOwned = client([{ data: null, error: null }])
    await expect(createBoardRepository(notOwned.supabase as never).deleteComment(comment.id)).rejects.toBeInstanceOf(BoardNotFoundError)
  })
})
