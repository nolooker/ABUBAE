import type { SupabaseClient } from '@supabase/supabase-js'

import type {
  BoardComment,
  BoardCommentInput,
  BoardPost,
  BoardPostInput,
  BoardPostSummary,
} from './board'

export class BoardRepositoryError extends Error {
  constructor(message = 'board data is unavailable') {
    super(message)
    this.name = 'BoardRepositoryError'
  }
}

export class BoardNotFoundError extends BoardRepositoryError {
  constructor() {
    super('not found')
    this.name = 'BoardNotFoundError'
  }
}

type RecordValue = Record<string, unknown>

function isRecord(value: unknown): value is RecordValue {
  return typeof value === 'object' && value !== null && !Array.isArray(value)
}

function recordValue(value: unknown): RecordValue {
  if (!isRecord(value)) throw new BoardRepositoryError()
  return value
}

function stringValue(value: unknown): string {
  if (typeof value !== 'string') throw new BoardRepositoryError()
  return value
}

function nullableStringValue(value: unknown): string | null {
  if (value === null) return null
  return stringValue(value)
}

function rows(value: unknown): RecordValue[] {
  if (value === null || value === undefined) return []
  if (!Array.isArray(value) || !value.every(isRecord)) throw new BoardRepositoryError()
  return value
}

function postRow(row: RecordValue): BoardPost {
  return {
    id: stringValue(row.id),
    userId: stringValue(row.user_id),
    title: stringValue(row.title),
    content: stringValue(row.content),
    authorNickname: stringValue(row.author_nickname),
    createdAt: stringValue(row.created_at),
    updatedAt: stringValue(row.updated_at),
  }
}

function commentRow(row: RecordValue): BoardComment {
  return {
    id: stringValue(row.id),
    postId: stringValue(row.post_id),
    userId: stringValue(row.user_id),
    authorNickname: stringValue(row.author_nickname),
    content: stringValue(row.content),
    createdAt: stringValue(row.created_at),
    parentCommentId: nullableStringValue(row.parent_comment_id),
  }
}

function summaryRow(row: RecordValue, commentCounts: Map<string, number>): BoardPostSummary {
  const id = stringValue(row.id)
  return {
    id,
    title: stringValue(row.title),
    authorNickname: stringValue(row.author_nickname),
    createdAt: stringValue(row.created_at),
    commentCount: commentCounts.get(id) ?? 0,
  }
}

const postFields = 'id,user_id,title,content,author_nickname,created_at,updated_at'
const commentFields = 'id,post_id,user_id,author_nickname,content,created_at,parent_comment_id'

export function createBoardRepository(supabase: SupabaseClient) {
  return {
    async listPosts(): Promise<BoardPostSummary[]> {
      const { data: posts, error: postsError } = await supabase
        .from('board_posts')
        .select('id,title,author_nickname,created_at')
        .order('created_at', { ascending: false })
      if (postsError) throw new BoardRepositoryError(postsError.message)

      const { data: comments, error: commentsError } = await supabase
        .from('board_comments')
        .select('post_id')
      if (commentsError) throw new BoardRepositoryError(commentsError.message)

      const commentCounts = new Map<string, number>()
      for (const row of rows(comments)) {
        const postId = stringValue(row.post_id)
        commentCounts.set(postId, (commentCounts.get(postId) ?? 0) + 1)
      }

      return rows(posts).map((row) => summaryRow(row, commentCounts))
    },

    async getPost(id: string): Promise<{ post: BoardPost; comments: BoardComment[] } | undefined> {
      const { data, error } = await supabase
        .from('board_posts')
        .select(postFields)
        .eq('id', id)
        .maybeSingle()
      if (error) throw new BoardRepositoryError(error.message)
      if (data === null) return undefined

      const { data: commentRows, error: commentsError } = await supabase
        .from('board_comments')
        .select(commentFields)
        .eq('post_id', id)
        .order('created_at', { ascending: true })
      if (commentsError) throw new BoardRepositoryError(commentsError.message)

      return {
        post: postRow(recordValue(data)),
        comments: rows(commentRows).map(commentRow),
      }
    },

    async createPost(userId: string, authorNickname: string, input: BoardPostInput): Promise<BoardPost> {
      const { data, error } = await supabase
        .from('board_posts')
        .insert({ user_id: userId, author_nickname: authorNickname, title: input.title, content: input.content })
        .select(postFields)
        .single()
      if (error) throw new BoardRepositoryError(error.message)
      return postRow(recordValue(data))
    },

    async updatePost(id: string, input: BoardPostInput): Promise<BoardPost> {
      const { data, error } = await supabase
        .from('board_posts')
        .update({ title: input.title, content: input.content, updated_at: new Date().toISOString() })
        .eq('id', id)
        .select(postFields)
        .maybeSingle()
      if (error) throw new BoardRepositoryError(error.message)
      if (data === null) throw new BoardNotFoundError()
      return postRow(recordValue(data))
    },

    async deletePost(id: string): Promise<void> {
      const { data, error } = await supabase
        .from('board_posts')
        .delete()
        .eq('id', id)
        .select('id')
        .maybeSingle()
      if (error) throw new BoardRepositoryError(error.message)
      if (data === null) throw new BoardNotFoundError()
    },

    async createComment(
      postId: string,
      userId: string,
      authorNickname: string,
      input: BoardCommentInput,
    ): Promise<BoardComment> {
      if (input.parentCommentId) {
        const { data: parent, error: parentError } = await supabase
          .from('board_comments')
          .select('post_id,parent_comment_id')
          .eq('id', input.parentCommentId)
          .maybeSingle()
        if (parentError) throw new BoardRepositoryError(parentError.message)
        const parentRow = parent === null ? null : recordValue(parent)
        if (parentRow === null || parentRow.post_id !== postId || parentRow.parent_comment_id !== null) {
          throw new BoardNotFoundError()
        }
      }

      const { data, error } = await supabase
        .from('board_comments')
        .insert({
          post_id: postId,
          user_id: userId,
          author_nickname: authorNickname,
          content: input.content,
          parent_comment_id: input.parentCommentId,
        })
        .select(commentFields)
        .single()
      if (error) {
        if (error.code === '23503') throw new BoardNotFoundError()
        throw new BoardRepositoryError(error.message)
      }
      return commentRow(recordValue(data))
    },

    async deleteComment(id: string): Promise<void> {
      const { data, error } = await supabase
        .from('board_comments')
        .delete()
        .eq('id', id)
        .select('id')
        .maybeSingle()
      if (error) throw new BoardRepositoryError(error.message)
      if (data === null) throw new BoardNotFoundError()
    },
  }
}
