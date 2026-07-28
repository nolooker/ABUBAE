export type WrittenQuestionCreateInput = {
  examSlug: string
  year: number
  round: number
  subject: string
  number: number
  content: string
  choices: [string, string, string, string]
  acceptedAnswerIndexes: number[]
  explanation: string
}

const MAX_SUBJECT_LENGTH = 200
const MAX_CONTENT_LENGTH = 10_000
const MAX_CHOICE_LENGTH = 4_000
const MAX_EXPLANATION_LENGTH = 10_000
const MIN_YEAR = 2000
const MAX_YEAR = 2100
const allowedKeys = new Set([
  'examSlug',
  'year',
  'round',
  'subject',
  'number',
  'content',
  'choices',
  'acceptedAnswerIndexes',
  'explanation',
])
const examSlugPattern = /^[a-z0-9]+(?:-[a-z0-9]+)*$/

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
  const trimmed = value.trim()
  if (!trimmed) throw new Error(`${field} must not be blank`)
  if (value.length > maximumLength) throw new Error(`${field} is too long`)
  return value
}

function positiveInteger(value: unknown, field: string, minimum: number, maximum: number): number {
  if (!Number.isInteger(value) || (value as number) < minimum || (value as number) > maximum) {
    throw new Error(`${field} must be an integer between ${minimum} and ${maximum}`)
  }
  return value as number
}

export function validateWrittenQuestionCreate(input: unknown): WrittenQuestionCreateInput {
  if (!isPlainObject(input)) throw new Error('payload must be a plain object')

  const keys = Object.keys(input)
  if (keys.length !== allowedKeys.size || keys.some((key) => !allowedKeys.has(key))) {
    throw new Error(
      'only examSlug, year, round, subject, number, content, choices, acceptedAnswerIndexes, and explanation are allowed',
    )
  }

  const examSlug = nonBlankString(input.examSlug, 'examSlug', 120)
  if (!examSlugPattern.test(examSlug)) {
    throw new Error('examSlug must contain lowercase letters, numbers, and single hyphens only')
  }

  const year = positiveInteger(input.year, 'year', MIN_YEAR, MAX_YEAR)
  const round = positiveInteger(input.round, 'round', 1, 20)
  const number = positiveInteger(input.number, 'number', 1, 999)

  const subject = nonBlankString(input.subject, 'subject', MAX_SUBJECT_LENGTH).trim()
  const content = nonBlankString(input.content, 'content', MAX_CONTENT_LENGTH)

  if (!Array.isArray(input.choices) || input.choices.length !== 4) {
    throw new Error('exactly four choices are required')
  }
  if (!isDenseArray(input.choices)) throw new Error('choices must be dense')
  const choices = input.choices.map((choice, index) => nonBlankString(
    choice,
    `choice ${index + 1}`,
    MAX_CHOICE_LENGTH,
  )) as [string, string, string, string]

  if (!Array.isArray(input.acceptedAnswerIndexes) || input.acceptedAnswerIndexes.length === 0) {
    throw new Error('at least one accepted answer is required')
  }
  if (!isDenseArray(input.acceptedAnswerIndexes)) {
    throw new Error('acceptedAnswerIndexes must be dense')
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
    examSlug,
    year,
    round,
    subject,
    number,
    content,
    choices,
    acceptedAnswerIndexes: [...input.acceptedAnswerIndexes],
    explanation: input.explanation,
  }
}
