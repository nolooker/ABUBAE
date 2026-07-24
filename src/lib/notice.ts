export type PublicNoticeSummary = {
  id: string
  title: string
  slug: string
  createdAt: string
}

export type PublicNoticeDetail = PublicNoticeSummary & {
  content: string
  updatedAt: string
}

export type AdminNotice = PublicNoticeDetail & {
  isPublished: boolean
}

export type NoticeInput = {
  title: string
  slug: string
  content: string
  isPublished: boolean
}

export type NoticeUpdateInput = NoticeInput & {
  expectedUpdatedAt: string
}

export class NoticeValidationError extends Error {
  readonly name = 'NoticeValidationError'
}

type RecordValue = Record<string, unknown>

const uuid = /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/i
const slug = /^[a-z0-9]+(?:-[a-z0-9]+)*$/
const isoTimestamp = /^\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}(?:\.\d{1,3})?(?:Z|[+-]\d{2}:\d{2})$/

function recordValue(value: unknown): RecordValue {
  if (typeof value !== 'object' || value === null || Array.isArray(value)) {
    throw new NoticeValidationError('notice input must be an object')
  }
  return value as RecordValue
}

function stringField(value: unknown, field: 'title' | 'slug' | 'content', maximum: number): string {
  if (typeof value !== 'string') throw new NoticeValidationError(`${field} must be a string`)
  const normalized = value.trim()
  if (!normalized || normalized.length > maximum) {
    throw new NoticeValidationError(`${field} must be between 1 and ${maximum} characters`)
  }
  return normalized
}

function timestamp(value: unknown): string {
  if (typeof value !== 'string' || !isoTimestamp.test(value) || !Number.isFinite(Date.parse(value))) {
    throw new NoticeValidationError('expectedUpdatedAt must be an ISO timestamp')
  }
  return value
}

export function validateNoticeId(value: unknown): string {
  if (typeof value !== 'string' || !uuid.test(value)) {
    throw new NoticeValidationError('noticeId must be a UUID')
  }
  return value
}

export function validateNoticeInput(
  value: unknown,
): NoticeInput
export function validateNoticeInput(
  value: unknown,
  options: { expectedUpdatedAt: true },
): NoticeUpdateInput
export function validateNoticeInput(
  value: unknown,
  options?: { expectedUpdatedAt?: boolean },
): NoticeInput | NoticeUpdateInput {
  const input = recordValue(value)
  const expectedKeys = options?.expectedUpdatedAt
    ? ['title', 'slug', 'content', 'isPublished', 'expectedUpdatedAt']
    : ['title', 'slug', 'content', 'isPublished']

  for (const key of Object.keys(input)) {
    if (!expectedKeys.includes(key)) throw new NoticeValidationError(`unknown field: ${key}`)
  }

  const title = stringField(input.title, 'title', 120)
  const noticeSlug = stringField(input.slug, 'slug', 120)
  if (!slug.test(noticeSlug)) {
    throw new NoticeValidationError('slug must contain lowercase letters, numbers, and single hyphens only')
  }
  const content = stringField(input.content, 'content', 20_000)
  if (typeof input.isPublished !== 'boolean') {
    throw new NoticeValidationError('isPublished must be a boolean')
  }

  const notice = { title, slug: noticeSlug, content, isPublished: input.isPublished }
  if (!options?.expectedUpdatedAt) return notice

  return { ...notice, expectedUpdatedAt: timestamp(input.expectedUpdatedAt) }
}
