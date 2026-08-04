export type PracticalQuestionEditBlank = {
  blankNumber: number
  acceptedAnswers: string[]
}

export type PracticalQuestionEditInput = {
  content: string
  explanation: string
  blanks: PracticalQuestionEditBlank[]
  expectedUpdatedAt: string
}

const MAX_CONTENT_LENGTH = 10_000
const MAX_EXPLANATION_LENGTH = 10_000
const MAX_ANSWER_LENGTH = 2_000
const MAX_BLANKS = 20
const allowedKeys = new Set(['content', 'explanation', 'blanks', 'expectedUpdatedAt'])
const allowedBlankKeys = new Set(['blankNumber', 'acceptedAnswers'])
const isoTimestamp = /^(\d{4})-(\d{2})-(\d{2})T(?:[01]\d|2[0-3]):[0-5]\d:[0-5]\d(?:\.\d{1,9})?(?:Z|[+-](?:0\d|1[0-4]):[0-5]\d)$/

type InputRecord = Record<string, unknown>

function isPlainObject(value: unknown): value is InputRecord {
  return typeof value === 'object'
    && value !== null
    && !Array.isArray(value)
    && Object.getPrototypeOf(value) === Object.prototype
}

function isDenseArray(value: unknown[]): boolean {
  for (let index = 0; index < value.length; index += 1) {
    if (!Object.prototype.hasOwnProperty.call(value, index)) return false
  }
  return true
}

function nonBlankString(value: unknown, field: string, maximumLength: number): string {
  if (typeof value !== 'string') throw new Error(`${field} must be a string`)
  if (!value.trim()) throw new Error(`${field} must not be blank`)
  if (value.length > maximumLength) throw new Error(`${field} is too long`)
  return value
}

function validateIsoTimestamp(value: unknown): string {
  if (typeof value !== 'string' || !isoTimestamp.test(value) || Number.isNaN(Date.parse(value))) {
    throw new Error('expectedUpdatedAt must be a valid ISO timestamp')
  }

  const [, yearText, monthText, dayText] = value.match(isoTimestamp) ?? []
  const year = Number(yearText)
  const month = Number(monthText)
  const day = Number(dayText)
  const date = new Date(Date.UTC(year, month - 1, day))
  if (date.getUTCFullYear() !== year || date.getUTCMonth() !== month - 1 || date.getUTCDate() !== day) {
    throw new Error('expectedUpdatedAt must be a valid ISO timestamp')
  }

  return value
}

function validateBlank(value: unknown, index: number): PracticalQuestionEditBlank {
  if (!isPlainObject(value)) throw new Error(`blank ${index + 1} must be a plain object`)

  const keys = Object.keys(value)
  if (keys.some((key) => !allowedBlankKeys.has(key))) {
    throw new Error(`blank ${index + 1} has an unknown field`)
  }

  if (!Number.isInteger(value.blankNumber) || (value.blankNumber as number) < 1) {
    throw new Error(`blank ${index + 1} blankNumber must be a positive integer`)
  }

  if (!Array.isArray(value.acceptedAnswers) || value.acceptedAnswers.length === 0) {
    throw new Error(`blank ${index + 1} must have at least one accepted answer`)
  }
  if (!isDenseArray(value.acceptedAnswers)) {
    throw new Error(`blank ${index + 1} acceptedAnswers must be dense`)
  }

  const acceptedAnswers = value.acceptedAnswers.map((answer, answerIndex) => nonBlankString(
    answer,
    `blank ${index + 1} accepted answer ${answerIndex + 1}`,
    MAX_ANSWER_LENGTH,
  ))

  return { blankNumber: value.blankNumber as number, acceptedAnswers }
}

export function validatePracticalQuestionEdit(input: unknown): PracticalQuestionEditInput {
  if (!isPlainObject(input)) throw new Error('payload must be a plain object')

  const keys = Object.keys(input)
  if (keys.length !== allowedKeys.size || keys.some((key) => !allowedKeys.has(key))) {
    throw new Error('only content, explanation, blanks, and expectedUpdatedAt are allowed')
  }

  const content = nonBlankString(input.content, 'content', MAX_CONTENT_LENGTH)

  if (typeof input.explanation !== 'string') throw new Error('explanation must be a string')
  if (input.explanation.length > MAX_EXPLANATION_LENGTH) throw new Error('explanation is too long')

  if (!Array.isArray(input.blanks) || input.blanks.length === 0) {
    throw new Error('at least one blank is required')
  }
  if (input.blanks.length > MAX_BLANKS) throw new Error('too many blanks')
  if (!isDenseArray(input.blanks)) throw new Error('blanks must be dense')

  const blanks = input.blanks.map(validateBlank)
  const blankNumbers = blanks.map((blank) => blank.blankNumber)
  if (new Set(blankNumbers).size !== blankNumbers.length) {
    throw new Error('blankNumber values must not contain duplicates')
  }

  return {
    content,
    explanation: input.explanation,
    blanks,
    expectedUpdatedAt: validateIsoTimestamp(input.expectedUpdatedAt),
  }
}
