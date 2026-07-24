import type { SupabaseClient } from '@supabase/supabase-js'

import type {
  AdminNotice,
  NoticeInput,
  PublicNoticeDetail,
  PublicNoticeSummary,
} from './notice'

const publicFields = 'id,title,slug,content,created_at,updated_at'
const adminFields = 'id,title,slug,content,is_published,created_at,updated_at'

type RecordValue = Record<string, unknown>
type QueryError = { code?: unknown; message?: unknown }

export class NoticeRepositoryError extends Error {
  constructor(message = 'notice data is unavailable') {
    super(message)
    this.name = 'NoticeRepositoryError'
  }
}

export class NoticeNotFoundError extends NoticeRepositoryError {
  constructor() {
    super('notice not found')
    this.name = 'NoticeNotFoundError'
  }
}

export class NoticeConflictError extends NoticeRepositoryError {
  constructor(message = 'notice conflicts with an existing record') {
    super(message)
    this.name = 'NoticeConflictError'
  }
}

function recordValue(value: unknown): RecordValue {
  if (typeof value !== 'object' || value === null || Array.isArray(value)) {
    throw new NoticeRepositoryError()
  }
  return value as RecordValue
}

function stringValue(value: unknown): string {
  if (typeof value !== 'string') throw new NoticeRepositoryError()
  return value
}

function booleanValue(value: unknown): boolean {
  if (typeof value !== 'boolean') throw new NoticeRepositoryError()
  return value
}

function rows(value: unknown): RecordValue[] {
  if (value === null || value === undefined) return []
  if (!Array.isArray(value)) throw new NoticeRepositoryError()
  return value.map(recordValue)
}

function isDuplicateSlug(error: QueryError): boolean {
  return error.code === '23505'
}

function resultError(error: QueryError | null): void {
  if (!error) return
  if (isDuplicateSlug(error)) throw new NoticeConflictError('notice slug already exists')
  throw new NoticeRepositoryError()
}

function publicSummary(row: RecordValue): PublicNoticeSummary {
  return {
    id: stringValue(row.id),
    title: stringValue(row.title),
    slug: stringValue(row.slug),
    createdAt: stringValue(row.created_at),
  }
}

function publicDetail(row: RecordValue): PublicNoticeDetail {
  return {
    ...publicSummary(row),
    content: stringValue(row.content),
    updatedAt: stringValue(row.updated_at),
  }
}

function adminNotice(row: RecordValue): AdminNotice {
  return {
    ...publicDetail(row),
    isPublished: booleanValue(row.is_published),
  }
}

export function createNoticeRepository(supabase: SupabaseClient) {
  return {
    async listPublishedNotices(limit: number): Promise<PublicNoticeSummary[]> {
      if (!Number.isSafeInteger(limit) || limit < 1) {
        throw new NoticeRepositoryError('notice limit must be a positive integer')
      }

      const { data, error } = await supabase
        .from('posts')
        .select(publicFields)
        .eq('type', 'notice')
        .eq('is_published', true)
        .order('created_at', { ascending: false })
        .limit(limit)
      resultError(error)
      return rows(data).map(publicSummary)
    },

    async getPublishedNoticeBySlug(slug: string): Promise<PublicNoticeDetail | undefined> {
      const { data, error } = await supabase
        .from('posts')
        .select(publicFields)
        .eq('type', 'notice')
        .eq('is_published', true)
        .eq('slug', slug)
        .maybeSingle()
      if (error?.code === 'PGRST116') return undefined
      resultError(error)
      return data === null ? undefined : publicDetail(recordValue(data))
    },

    async listAdminNotices(): Promise<AdminNotice[]> {
      const { data, error } = await supabase
        .from('posts')
        .select(adminFields)
        .eq('type', 'notice')
        .eq('is_premium', false)
        .order('updated_at', { ascending: false })
      resultError(error)
      return rows(data).map(adminNotice)
    },

    async getAdminNotice(id: string): Promise<AdminNotice | undefined> {
      const { data, error } = await supabase
        .from('posts')
        .select(adminFields)
        .eq('type', 'notice')
        .eq('is_premium', false)
        .eq('id', id)
        .maybeSingle()
      if (error?.code === 'PGRST116') return undefined
      resultError(error)
      return data === null ? undefined : adminNotice(recordValue(data))
    },

    async createNotice(input: NoticeInput): Promise<AdminNotice> {
      const { data, error } = await supabase
        .from('posts')
        .insert({
          title: input.title,
          slug: input.slug,
          content: input.content,
          is_published: input.isPublished,
          type: 'notice',
          is_premium: false,
        })
        .select(adminFields)
        .single()
      resultError(error)
      return adminNotice(recordValue(data))
    },

    async updateNotice(
      id: string,
      input: NoticeInput,
      expectedUpdatedAt: string,
    ): Promise<AdminNotice> {
      const { data, error } = await supabase
        .from('posts')
        .update({
          title: input.title,
          slug: input.slug,
          content: input.content,
          is_published: input.isPublished,
        })
        .eq('id', id)
        .eq('updated_at', expectedUpdatedAt)
        .eq('type', 'notice')
        .eq('is_premium', false)
        .select(adminFields)
        .maybeSingle()
      resultError(error)
      if (data !== null) return adminNotice(recordValue(data))

      if (await this.getAdminNotice(id)) throw new NoticeConflictError('notice was updated by another request')
      throw new NoticeNotFoundError()
    },
  }
}

async function serviceRepository() {
  const { createServiceClient } = await import('./supabase/service')
  return createNoticeRepository(createServiceClient())
}

export async function listPublishedNotices(limit: number) {
  return (await serviceRepository()).listPublishedNotices(limit)
}

export async function getPublishedNoticeBySlug(slug: string) {
  return (await serviceRepository()).getPublishedNoticeBySlug(slug)
}

export async function listAdminNotices() {
  return (await serviceRepository()).listAdminNotices()
}

export async function getAdminNotice(id: string) {
  return (await serviceRepository()).getAdminNotice(id)
}

export async function createNotice(input: NoticeInput) {
  return (await serviceRepository()).createNotice(input)
}

export async function updateNotice(id: string, input: NoticeInput, expectedUpdatedAt: string) {
  return (await serviceRepository()).updateNotice(id, input, expectedUpdatedAt)
}
