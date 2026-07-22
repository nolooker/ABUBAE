import { readFileSync, readdirSync } from 'node:fs'
import { join, resolve } from 'node:path'
import { fileURLToPath } from 'node:url'

const isText = (value) => typeof value === 'string' && value.trim().length > 0

export function auditRound(round) {
  if (!round || !Number.isInteger(round.year) || !Number.isInteger(round.round) || !Array.isArray(round.questions)) {
    throw new Error('round identity and questions are required')
  }

  const label = `${round.year}-${round.round}`
  const numbers = round.questions.map((question) => question.number).sort((a, b) => a - b)
  if (numbers.length !== 100 || numbers.some((number, index) => number !== index + 1)) {
    throw new Error(`${label} must contain question numbers 1 through 100`)
  }

  const ids = new Set()
  let pendingReviewCount = 0
  let multipleAnswerCount = 0

  for (const question of round.questions) {
    if (!isText(question.id) || ids.has(question.id)) throw new Error(`${label} has a missing or duplicate question id`)
    ids.add(question.id)

    if (!isText(question.subject) || !isText(question.content)) {
      throw new Error(`${label} question ${question.number} is missing subject or content`)
    }
    if (!Array.isArray(question.choices) || question.choices.length !== 4 || !question.choices.every(isText)) {
      throw new Error(`${label} question ${question.number} must have four choices`)
    }

    const answers = question.acceptedAnswerIndexes
    if (
      !Array.isArray(answers) || answers.length === 0 ||
      new Set(answers).size !== answers.length ||
      !answers.every((answer) => Number.isInteger(answer) && answer >= 0 && answer <= 3)
    ) {
      throw new Error(`${label} question ${question.number} has invalid accepted answers`)
    }
    if (answers.length > 1) multipleAnswerCount += 1
    if (!question.reviewed) pendingReviewCount += 1
    if (question.published && !question.reviewed) {
      throw new Error(`${label} question ${question.number} cannot be published before review`)
    }
  }

  return {
    label,
    questionCount: round.questions.length,
    pendingReviewCount,
    multipleAnswerCount,
  }
}

function main() {
  const contentDirectory = resolve('content/written/jeongchogi')
  const files = readdirSync(contentDirectory)
    .filter((file) => file.endsWith('.candidates.json') || /^\d{4}-\d+\.json$/.test(file))
    .sort()

  if (files.length === 0) throw new Error('no written exam content files found')

  let total = 0
  for (const file of files) {
    const round = JSON.parse(readFileSync(join(contentDirectory, file), 'utf8'))
    const result = auditRound(round)
    total += result.questionCount
    console.log(
      `${file}: ${result.questionCount} questions, ` +
      `${result.multipleAnswerCount} multiple answers, ${result.pendingReviewCount} pending review`,
    )
  }
  console.log(`validated ${total} written exam candidates`)
}

const currentFile = fileURLToPath(import.meta.url)
if (process.argv[1] && resolve(process.argv[1]) === currentFile) main()
