import type { BookmarkedQuestion } from './bookmark'
import type { ExamType } from './exam-attempt'
import { createServiceClient } from './supabase/service'

type RecordValue = Record<string, unknown>

export class BookmarkContentUnavailableError extends Error {
  constructor(message = 'bookmark content is unavailable') {
    super(message)
    this.name = 'BookmarkContentUnavailableError'
  }
}

function repository() {
  try {
    return createServiceClient()
  } catch (error) {
    const message = error instanceof Error ? error.message : 'bookmark content is unavailable'
    throw new BookmarkContentUnavailableError(message)
  }
}

function isRecord(value: unknown): value is RecordValue {
  return typeof value === 'object' && value !== null && !Array.isArray(value)
}

function rows(value: unknown): RecordValue[] {
  if (!Array.isArray(value)) throw new BookmarkContentUnavailableError()
  return value.map((row) => {
    if (!isRecord(row)) throw new BookmarkContentUnavailableError()
    return row
  })
}

function stringValue(value: unknown): string {
  if (typeof value !== 'string') throw new BookmarkContentUnavailableError()
  return value
}

function numberValue(value: unknown): number {
  if (typeof value !== 'number') throw new BookmarkContentUnavailableError()
  return value
}

function examTypeValue(value: unknown): ExamType {
  if (value !== 'written' && value !== 'practical') throw new BookmarkContentUnavailableError()
  return value
}

export async function getBookmarkedQuestions(questionIds: string[]): Promise<BookmarkedQuestion[]> {
  if (questionIds.length === 0) return []

  const { data, error } = await repository()
    .from('questions')
    .select('id,exam_type,year,round,subject,number,content,exams!inner(slug)')
    .in('id', questionIds)
    .eq('published', true)
    .eq('exams.slug', 'jeongchogi')
    .order('year', { ascending: false })
    .order('round', { ascending: false })
    .order('number')

  if (error) throw new BookmarkContentUnavailableError(error.message)

  return rows(data).map((row) => ({
    questionId: stringValue(row.id),
    examType: examTypeValue(row.exam_type),
    year: numberValue(row.year),
    round: numberValue(row.round),
    subject: stringValue(row.subject),
    questionNumber: numberValue(row.number),
    content: stringValue(row.content),
  }))
}
