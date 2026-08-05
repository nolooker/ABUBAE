import type { SupabaseClient } from '@supabase/supabase-js'

import type {
  BoardCategory,
  BoardComment,
  BoardCommentEditInput,
  BoardCommentInput,
  BoardPost,
  BoardPostInput,
  BoardPostSummary,
  BoardReport,
  BoardReportInput,
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

function categoryValue(value: unknown): BoardCategory {
  if (value !== 'free' && value !== 'review') throw new BoardRepositoryError()
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
    category: categoryValue(row.category),
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
    updatedAt: nullableStringValue(row.updated_at),
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
    category: categoryValue(row.category),
  }
}

function reportRow(row: RecordValue): BoardReport {
  const targetType = row.target_type
  if (targetType !== 'post' && targetType !== 'comment') throw new BoardRepositoryError()
  const status = row.status
  if (status !== 'pending' && status !== 'resolved') throw new BoardRepositoryError()

  return {
    id: stringValue(row.id),
    targetType,
    targetId: stringValue(row.target_id),
    postId: stringValue(row.post_id),
    reporterUserId: stringValue(row.reporter_user_id),
    reporterNickname: stringValue(row.reporter_nickname),
    reason: stringValue(row.reason),
    status,
    createdAt: stringValue(row.created_at),
  }
}

const postFields = 'id,user_id,title,content,author_nickname,created_at,updated_at,category'
const postSummaryFields = 'id,title,author_nickname,created_at,category'
const commentFields = 'id,post_id,user_id,author_nickname,content,created_at,updated_at,parent_comment_id'
const reportFields = 'id,target_type,target_id,post_id,reporter_user_id,reporter_nickname,reason,status,created_at'

export function createBoardRepository(supabase: SupabaseClient) {
  return {
    async listPosts(category?: BoardCategory): Promise<BoardPostSummary[]> {
      let query = supabase
        .from('board_posts')
        .select(postSummaryFields)
        .order('created_at', { ascending: false })
      if (category) query = query.eq('category', category)
      const { data: posts, error: postsError } = await query
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
        .insert({ user_id: userId, author_nickname: authorNickname, title: input.title, content: input.content, category: input.category })
        .select(postFields)
        .single()
      if (error) throw new BoardRepositoryError(error.message)
      return postRow(recordValue(data))
    },

    async updatePost(id: string, input: BoardPostInput): Promise<BoardPost> {
      const { data, error } = await supabase
        .from('board_posts')
        .update({ title: input.title, content: input.content, category: input.category, updated_at: new Date().toISOString() })
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

    async updateComment(id: string, input: BoardCommentEditInput): Promise<BoardComment> {
      const { data, error } = await supabase
        .from('board_comments')
        .update({ content: input.content, updated_at: new Date().toISOString() })
        .eq('id', id)
        .select(commentFields)
        .maybeSingle()
      if (error) throw new BoardRepositoryError(error.message)
      if (data === null) throw new BoardNotFoundError()
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

    async createReport(
      reporterUserId: string,
      reporterNickname: string,
      input: BoardReportInput,
    ): Promise<BoardReport> {
      let postId = input.targetId
      if (input.targetType === 'comment') {
        const { data: comment, error: commentError } = await supabase
          .from('board_comments')
          .select('post_id')
          .eq('id', input.targetId)
          .maybeSingle()
        if (commentError) throw new BoardRepositoryError(commentError.message)
        if (comment === null) throw new BoardNotFoundError()
        postId = stringValue(recordValue(comment).post_id)
      }

      const { data, error } = await supabase
        .from('board_reports')
        .insert({
          target_type: input.targetType,
          target_id: input.targetId,
          post_id: postId,
          reporter_user_id: reporterUserId,
          reporter_nickname: reporterNickname,
          reason: input.reason,
        })
        .select(reportFields)
        .single()
      if (error) {
        if (error.code === '23503') throw new BoardNotFoundError()
        throw new BoardRepositoryError(error.message)
      }
      return reportRow(recordValue(data))
    },

    async listPendingReports(): Promise<BoardReport[]> {
      const { data, error } = await supabase
        .from('board_reports')
        .select(reportFields)
        .eq('status', 'pending')
        .order('created_at', { ascending: true })
      if (error) throw new BoardRepositoryError(error.message)
      return rows(data).map(reportRow)
    },

    async resolveReport(id: string): Promise<BoardReport> {
      const { data, error } = await supabase
        .from('board_reports')
        .update({ status: 'resolved' })
        .eq('id', id)
        .select(reportFields)
        .maybeSingle()
      if (error) throw new BoardRepositoryError(error.message)
      if (data === null) throw new BoardNotFoundError()
      return reportRow(recordValue(data))
    },
  }
}
