export type WrittenQuestionEditInput = {
  content: string
  choices: [string, string, string, string]
  acceptedAnswerIndexes: number[]
  explanation: string
  expectedUpdatedAt: string
}

const MAX_CONTENT_LENGTH = 10_000
const MAX_CHOICE_LENGTH = 4_000
const MAX_EXPLANATION_LENGTH = 10_000
const allowedKeys = new Set([
  'content',
  'choices',
  'acceptedAnswerIndexes',
  'explanation',
  'expectedUpdatedAt',
])
const isoTimestamp = /^(\d{4})-(\d{2})-(\d{2})T(?:[01]\d|2[0-3]):[0-5]\d:[0-5]\d(?:\.\d{1,9})?(?:Z|[+-](?:0\d|1[0-4]):[0-5]\d)$/

type InputRecord = Record<string, unknown>

function isPlainObject(value: unknown): value is InputRecord {
  return typeof value === 'object'
    && value !== null
    && !Array.isArray(value)
    && Object.getPrototypeOf(value) === Object.prototype
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

export function validateWrittenQuestionEdit(input: unknown): WrittenQuestionEditInput {
  if (!isPlainObject(input)) throw new Error('payload must be a plain object')

  const keys = Object.keys(input)
  if (keys.length !== allowedKeys.size || keys.some((key) => !allowedKeys.has(key))) {
    throw new Error('only content, choices, acceptedAnswerIndexes, explanation, and expectedUpdatedAt are allowed')
  }

  const content = nonBlankString(input.content, 'content', MAX_CONTENT_LENGTH)
  if (!Array.isArray(input.choices) || input.choices.length !== 4) {
    throw new Error('exactly four choices are required')
  }
  const choices = input.choices.map((choice, index) => nonBlankString(
    choice,
    `choice ${index + 1}`,
    MAX_CHOICE_LENGTH,
  )) as [string, string, string, string]

  if (!Array.isArray(input.acceptedAnswerIndexes) || input.acceptedAnswerIndexes.length === 0) {
    throw new Error('at least one accepted answer is required')
  }
  if (!input.acceptedAnswerIndexes.every((index) => Number.isInteger(index) && index >= 0 && index <= 3)) {
    throw new Error('acceptedAnswerIndexes must contain integers from 0 through 3')
  }
  if (new Set(input.acceptedAnswerIndexes).size !== input.acceptedAnswerIndexes.length) {
    throw new Error('acceptedAnswerIndexes must not contain duplicates')
  }

  if (typeof input.explanation !== 'string') throw new Error('explanation must be a string')
  if (input.explanation.length > MAX_EXPLANATION_LENGTH) throw new Error('explanation is too long')

  return {
    content,
    choices,
    acceptedAnswerIndexes: [...input.acceptedAnswerIndexes],
    explanation: input.explanation,
    expectedUpdatedAt: validateIsoTimestamp(input.expectedUpdatedAt),
  }
}
