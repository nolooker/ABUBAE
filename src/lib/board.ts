export type BoardPostSummary = {
  id: string
  title: string
  authorNickname: string
  createdAt: string
  commentCount: number
}

export type BoardPost = {
  id: string
  userId: string
  title: string
  content: string
  authorNickname: string
  createdAt: string
  updatedAt: string
}

export type BoardComment = {
  id: string
  postId: string
  userId: string
  authorNickname: string
  content: string
  createdAt: string
  parentCommentId: string | null
}

export type BoardPostInput = {
  title: string
  content: string
}

export type BoardCommentInput = {
  content: string
  parentCommentId: string | null
}

export class BoardValidationError extends Error {
  readonly name = 'BoardValidationError'
}

type RecordValue = Record<string, unknown>

const uuid = /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/i

const MAX_TITLE_LENGTH = 200
const MAX_POST_CONTENT_LENGTH = 5_000
const MAX_COMMENT_LENGTH = 2_000

export function isValidBoardId(value: unknown): value is string {
  return typeof value === 'string' && uuid.test(value)
}

function recordValue(value: unknown): RecordValue {
  if (typeof value !== 'object' || value === null || Array.isArray(value)) {
    throw new BoardValidationError('payload must be an object')
  }
  return value as RecordValue
}

function stringField(value: unknown, field: string, maximum: number): string {
  if (typeof value !== 'string') throw new BoardValidationError(`${field} must be a string`)
  const normalized = value.trim()
  if (!normalized || normalized.length > maximum) {
    throw new BoardValidationError(`${field} must be between 1 and ${maximum} characters`)
  }
  return normalized
}

export function validateBoardId(value: unknown): string {
  if (!isValidBoardId(value)) {
    throw new BoardValidationError('id must be a UUID')
  }
  return value
}

export function validateBoardPostInput(value: unknown): BoardPostInput {
  const input = recordValue(value)
  const expectedKeys = ['title', 'content']

  for (const key of Object.keys(input)) {
    if (!expectedKeys.includes(key)) throw new BoardValidationError(`unknown field: ${key}`)
  }

  return {
    title: stringField(input.title, 'title', MAX_TITLE_LENGTH),
    content: stringField(input.content, 'content', MAX_POST_CONTENT_LENGTH),
  }
}

export function validateBoardCommentInput(value: unknown): BoardCommentInput {
  const input = recordValue(value)
  const expectedKeys = ['content', 'parentCommentId']

  for (const key of Object.keys(input)) {
    if (!expectedKeys.includes(key)) throw new BoardValidationError(`unknown field: ${key}`)
  }

  let parentCommentId: string | null = null
  if (input.parentCommentId !== undefined && input.parentCommentId !== null) {
    if (!isValidBoardId(input.parentCommentId)) {
      throw new BoardValidationError('parentCommentId must be a UUID')
    }
    parentCommentId = input.parentCommentId
  }

  return {
    content: stringField(input.content, 'content', MAX_COMMENT_LENGTH),
    parentCommentId,
  }
}
