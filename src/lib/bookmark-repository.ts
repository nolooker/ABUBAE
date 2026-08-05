import type { SupabaseClient } from '@supabase/supabase-js'

type RecordValue = Record<string, unknown>

export class BookmarkRepositoryError extends Error {
  constructor(message = 'bookmark data is unavailable') {
    super(message)
    this.name = 'BookmarkRepositoryError'
  }
}

function isRecord(value: unknown): value is RecordValue {
  return typeof value === 'object' && value !== null && !Array.isArray(value)
}

function rows(value: unknown): RecordValue[] {
  if (!Array.isArray(value)) throw new BookmarkRepositoryError()
  return value.map((row) => {
    if (!isRecord(row)) throw new BookmarkRepositoryError()
    return row
  })
}

function isDuplicate(error: { code?: string } | null): boolean {
  return error?.code === '23505'
}

export function createBookmarkRepository(supabase: SupabaseClient) {
  return {
    async listBookmarkedQuestionIds(userId: string): Promise<string[]> {
      const { data, error } = await supabase
        .from('bookmarks')
        .select('target_id')
        .eq('user_id', userId)
        .eq('target_type', 'question')
      if (error) throw new BookmarkRepositoryError(error.message)
      return rows(data).map((row) => {
        if (typeof row.target_id !== 'string') throw new BookmarkRepositoryError()
        return row.target_id
      })
    },

    async addBookmark(userId: string, questionId: string): Promise<void> {
      const { error } = await supabase
        .from('bookmarks')
        .insert({ user_id: userId, target_type: 'question', target_id: questionId })
      if (error && !isDuplicate(error)) throw new BookmarkRepositoryError(error.message)
    },

    async removeBookmark(userId: string, questionId: string): Promise<void> {
      const { error } = await supabase
        .from('bookmarks')
        .delete()
        .eq('user_id', userId)
        .eq('target_type', 'question')
        .eq('target_id', questionId)
      if (error) throw new BookmarkRepositoryError(error.message)
    },
  }
}
