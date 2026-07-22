export type WrittenExplanation = {
  summary: string
  choiceNotes: [string, string, string, string]
  keyPoint: string
  memoryTip?: string
}

export type WrittenQuestionContent = {
  id: string
  subject: string
  number: number
  content: string
  choices: [string, string, string, string]
  acceptedAnswerIndexes: Array<0 | 1 | 2 | 3>
  explanation: WrittenExplanation
  reviewed: boolean
  published: boolean
  asset?: {
    src: string
    alt: string
  }
}

export type WrittenRoundContent = {
  examSlug: 'jeongchogi'
  examType: 'written'
  year: number
  round: number
  title: string
  sourceLabel: string
  questions: WrittenQuestionContent[]
}

function isRecord(value: unknown): value is Record<string, unknown> {
  return typeof value === 'object' && value !== null && !Array.isArray(value)
}

function isNonEmptyString(value: unknown): value is string {
  return typeof value === 'string' && value.trim().length > 0
}

function validateExplanation(value: unknown, number: number) {
  if (!isRecord(value)) {
    throw new Error(`question ${number} must have a complete explanation`)
  }

  const notes = value.choiceNotes
  if (
    !isNonEmptyString(value.summary) ||
    !isNonEmptyString(value.keyPoint) ||
    !Array.isArray(notes) ||
    notes.length !== 4 ||
    !notes.every(isNonEmptyString) ||
    (value.memoryTip !== undefined && !isNonEmptyString(value.memoryTip))
  ) {
    throw new Error(`question ${number} must have a complete explanation`)
  }
}

function validateQuestion(value: unknown): asserts value is WrittenQuestionContent {
  if (!isRecord(value) || !Number.isInteger(value.number) || Number(value.number) < 1) {
    throw new Error('each question must have a positive number')
  }

  const number = Number(value.number)
  if (!isNonEmptyString(value.id) || !isNonEmptyString(value.subject) || !isNonEmptyString(value.content)) {
    throw new Error(`question ${number} must have an id, subject, and content`)
  }

  if (!Array.isArray(value.choices) || value.choices.length !== 4 || !value.choices.every(isNonEmptyString)) {
    throw new Error(`question ${number} must have exactly four choices`)
  }

  const acceptedAnswers = value.acceptedAnswerIndexes
  if (
    !Array.isArray(acceptedAnswers) ||
    acceptedAnswers.length === 0 ||
    new Set(acceptedAnswers).size !== acceptedAnswers.length ||
    !acceptedAnswers.every((answer) => Number.isInteger(answer) && Number(answer) >= 0 && Number(answer) <= 3)
  ) {
    throw new Error(`question ${number} must have unique acceptedAnswerIndexes from 0 to 3`)
  }

  if (typeof value.reviewed !== 'boolean' || typeof value.published !== 'boolean') {
    throw new Error(`question ${number} must declare reviewed and published`)
  }

  if (value.published && !value.reviewed) {
    throw new Error(`question ${number} cannot be published before review`)
  }

  validateExplanation(value.explanation, number)

  if (value.asset !== undefined) {
    if (!isRecord(value.asset) || !isNonEmptyString(value.asset.src) || !isNonEmptyString(value.asset.alt)) {
      throw new Error(`question ${number} asset must have src and alt text`)
    }
  }
}

export function validateWrittenRound(input: unknown): WrittenRoundContent {
  if (!isRecord(input)) {
    throw new Error('written round must be an object')
  }

  if (input.examSlug !== 'jeongchogi' || input.examType !== 'written') {
    throw new Error('written round must target jeongchogi written exam')
  }

  if (!Number.isInteger(input.year) || Number(input.year) < 2000) {
    throw new Error('written round must have a valid year')
  }

  if (!Number.isInteger(input.round) || Number(input.round) < 1) {
    throw new Error('written round must have a positive round')
  }

  if (!isNonEmptyString(input.title) || !isNonEmptyString(input.sourceLabel)) {
    throw new Error('written round must have a title and sourceLabel')
  }

  if (!Array.isArray(input.questions) || input.questions.length === 0) {
    throw new Error('written round must contain questions')
  }

  input.questions.forEach(validateQuestion)
  const numbers = input.questions.map((question) => question.number)
  if (new Set(numbers).size !== numbers.length) {
    throw new Error('question numbers must be unique')
  }

  const sortedNumbers = [...numbers].sort((a, b) => a - b)
  if (sortedNumbers.some((number, index) => number !== index + 1)) {
    throw new Error('question numbers must be sequential from 1')
  }

  return input as WrittenRoundContent
}
