import type { SupabaseClient } from '@supabase/supabase-js'

import type { ExamSchedule, ExamScheduleInput } from './exam-schedule'

const fields = 'id,year,round,written_apply_start,written_apply_end,written_exam_date,written_result_date,practical_apply_start,practical_apply_end,practical_exam_date,final_result_date,created_at,updated_at'

type RecordValue = Record<string, unknown>
type QueryError = { code?: unknown; message?: unknown }

export class ExamScheduleRepositoryError extends Error {
  constructor(message = 'exam schedule data is unavailable') {
    super(message)
    this.name = 'ExamScheduleRepositoryError'
  }
}

export class ExamScheduleNotFoundError extends ExamScheduleRepositoryError {
  constructor() {
    super('exam schedule not found')
    this.name = 'ExamScheduleNotFoundError'
  }
}

export class ExamScheduleDuplicateError extends ExamScheduleRepositoryError {
  constructor() {
    super('a schedule for this year and round already exists')
    this.name = 'ExamScheduleDuplicateError'
  }
}

export class ExamNotFoundError extends ExamScheduleRepositoryError {
  constructor() {
    super('exam not found')
    this.name = 'ExamNotFoundError'
  }
}

function recordValue(value: unknown): RecordValue {
  if (typeof value !== 'object' || value === null || Array.isArray(value)) {
    throw new ExamScheduleRepositoryError()
  }
  return value as RecordValue
}

function stringValue(value: unknown): string {
  if (typeof value !== 'string') throw new ExamScheduleRepositoryError()
  return value
}

function nullableDateValue(value: unknown): string | null {
  if (value === null || value === undefined) return null
  return stringValue(value)
}

function numberValue(value: unknown): number {
  if (typeof value !== 'number') throw new ExamScheduleRepositoryError()
  return value
}

function rows(value: unknown): RecordValue[] {
  if (!Array.isArray(value)) throw new ExamScheduleRepositoryError()
  return value.map(recordValue)
}

function isDuplicate(error: QueryError): boolean {
  return error.code === '23505'
}

function resultError(error: QueryError | null): void {
  if (!error) return
  if (isDuplicate(error)) throw new ExamScheduleDuplicateError()
  throw new ExamScheduleRepositoryError()
}

function examSchedule(row: RecordValue): ExamSchedule {
  return {
    id: stringValue(row.id),
    year: numberValue(row.year),
    round: numberValue(row.round),
    writtenApplyStart: nullableDateValue(row.written_apply_start),
    writtenApplyEnd: nullableDateValue(row.written_apply_end),
    writtenExamDate: nullableDateValue(row.written_exam_date),
    writtenResultDate: nullableDateValue(row.written_result_date),
    practicalApplyStart: nullableDateValue(row.practical_apply_start),
    practicalApplyEnd: nullableDateValue(row.practical_apply_end),
    practicalExamDate: nullableDateValue(row.practical_exam_date),
    finalResultDate: nullableDateValue(row.final_result_date),
    createdAt: stringValue(row.created_at),
    updatedAt: stringValue(row.updated_at),
  }
}

function scheduleColumns(input: ExamScheduleInput) {
  return {
    year: input.year,
    round: input.round,
    written_apply_start: input.writtenApplyStart,
    written_apply_end: input.writtenApplyEnd,
    written_exam_date: input.writtenExamDate,
    written_result_date: input.writtenResultDate,
    practical_apply_start: input.practicalApplyStart,
    practical_apply_end: input.practicalApplyEnd,
    practical_exam_date: input.practicalExamDate,
    final_result_date: input.finalResultDate,
  }
}

export function createExamScheduleRepository(supabase: SupabaseClient) {
  return {
    async listByExamSlug(examSlug: string): Promise<ExamSchedule[]> {
      const { data, error } = await supabase
        .from('exam_schedules')
        .select(`${fields},exams!inner(slug)`)
        .eq('exams.slug', examSlug)
        .order('year', { ascending: false })
        .order('round', { ascending: false })
      resultError(error)
      return rows(data).map(examSchedule)
    },

    async create(examSlug: string, input: ExamScheduleInput): Promise<ExamSchedule> {
      const { data: exam, error: examError } = await supabase
        .from('exams')
        .select('id')
        .eq('slug', examSlug)
        .maybeSingle()
      resultError(examError)
      if (exam === null) throw new ExamNotFoundError()

      const { data, error } = await supabase
        .from('exam_schedules')
        .insert({ ...scheduleColumns(input), exam_id: recordValue(exam).id })
        .select(fields)
        .single()
      resultError(error)
      return examSchedule(recordValue(data))
    },

    async update(id: string, input: ExamScheduleInput): Promise<ExamSchedule> {
      const { data, error } = await supabase
        .from('exam_schedules')
        .update({ ...scheduleColumns(input), updated_at: new Date().toISOString() })
        .eq('id', id)
        .select(fields)
        .maybeSingle()
      resultError(error)
      if (data === null) throw new ExamScheduleNotFoundError()
      return examSchedule(recordValue(data))
    },

    async delete(id: string): Promise<void> {
      const { data, error } = await supabase
        .from('exam_schedules')
        .delete()
        .eq('id', id)
        .select('id')
        .maybeSingle()
      resultError(error)
      if (data === null) throw new ExamScheduleNotFoundError()
    },
  }
}
