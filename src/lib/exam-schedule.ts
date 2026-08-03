export type ExamSchedule = {
  id: string
  year: number
  round: number
  writtenApplyStart: string | null
  writtenApplyEnd: string | null
  writtenExamDate: string | null
  writtenResultDate: string | null
  practicalApplyStart: string | null
  practicalApplyEnd: string | null
  practicalExamDate: string | null
  finalResultDate: string | null
  createdAt: string
  updatedAt: string
}

const dateFields = [
  'writtenApplyStart',
  'writtenApplyEnd',
  'writtenExamDate',
  'writtenResultDate',
  'practicalApplyStart',
  'practicalApplyEnd',
  'practicalExamDate',
  'finalResultDate',
] as const

export type ExamScheduleDateField = (typeof dateFields)[number]

export type ExamScheduleInput = {
  year: number
  round: number
} & Record<ExamScheduleDateField, string | null>

export class ExamScheduleValidationError extends Error {
  readonly name = 'ExamScheduleValidationError'
}

type RecordValue = Record<string, unknown>

const uuid = /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/i
const isoDate = /^\d{4}-\d{2}-\d{2}$/

export function isValidExamScheduleDate(value: unknown): value is string {
  if (typeof value !== 'string' || !isoDate.test(value)) return false

  const [year, month, day] = value.split('-').map(Number)
  const calendarDate = new Date(Date.UTC(year, month - 1, day))
  return calendarDate.getUTCFullYear() === year
    && calendarDate.getUTCMonth() === month - 1
    && calendarDate.getUTCDate() === day
}

export function isValidExamScheduleId(value: unknown): value is string {
  return typeof value === 'string' && uuid.test(value)
}

export function validateExamScheduleId(value: unknown): string {
  if (!isValidExamScheduleId(value)) {
    throw new ExamScheduleValidationError('scheduleId must be a UUID')
  }
  return value
}

function recordValue(value: unknown): RecordValue {
  if (typeof value !== 'object' || value === null || Array.isArray(value)) {
    throw new ExamScheduleValidationError('exam schedule input must be an object')
  }
  return value as RecordValue
}

function integerField(value: unknown, field: 'year' | 'round', minimum: number, maximum: number): number {
  if (typeof value !== 'number' || !Number.isInteger(value) || value < minimum || value > maximum) {
    throw new ExamScheduleValidationError(`${field} must be an integer between ${minimum} and ${maximum}`)
  }
  return value
}

function dateField(value: unknown, field: ExamScheduleDateField): string | null {
  if (value === null || value === undefined) return null
  if (!isValidExamScheduleDate(value)) {
    throw new ExamScheduleValidationError(`${field} must be a valid date (YYYY-MM-DD) or null`)
  }
  return value
}

export function validateExamScheduleInput(value: unknown): ExamScheduleInput {
  const input = recordValue(value)
  const expectedKeys = ['year', 'round', ...dateFields]

  for (const key of Object.keys(input)) {
    if (!expectedKeys.includes(key)) throw new ExamScheduleValidationError(`unknown field: ${key}`)
  }

  const year = integerField(input.year, 'year', 2000, 2100)
  const round = integerField(input.round, 'round', 1, 12)

  const dates = Object.fromEntries(
    dateFields.map((field) => [field, dateField(input[field], field)]),
  ) as Record<ExamScheduleDateField, string | null>

  return { year, round, ...dates }
}
