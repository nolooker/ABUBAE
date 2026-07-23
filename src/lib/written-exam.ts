export type GradeableQuestion = {
  id: string
  number: number
  subject: string
  acceptedAnswerIndexes: number[]
  explanation: string
}

export type WrittenAnswers = Record<string, number>

export type WrittenGradeResult = {
  total: number
  correct: number
  incorrect: number
  unanswered: number
  score: number
  subjects: Array<{
    subject: string
    total: number
    correct: number
    score: number
  }>
  questions: Array<{
    id: string
    number: number
    subject: string
    selectedAnswerIndex: number | null
    acceptedAnswerIndexes: number[]
    explanation: string
    isCorrect: boolean
    isUnanswered: boolean
  }>
}

const percentage = (correct: number, total: number) => total === 0 ? 0 : Math.round((correct / total) * 100)

export function gradeWrittenRound(
  questions: GradeableQuestion[],
  answers: WrittenAnswers,
): WrittenGradeResult {
  const questionIds = new Set(questions.map((question) => question.id))
  for (const [questionId, selectedAnswer] of Object.entries(answers)) {
    if (!questionIds.has(questionId)) {
      throw new Error(`${questionId} is not part of this written round`)
    }
    if (!Number.isInteger(selectedAnswer) || selectedAnswer < 0 || selectedAnswer > 3) {
      throw new Error(`${questionId} has an invalid selected answer`)
    }
  }

  const questionResults = questions.map((question) => {
    const selectedAnswerIndex = answers[question.id] ?? null
    const isUnanswered = selectedAnswerIndex === null
    return {
      id: question.id,
      number: question.number,
      subject: question.subject,
      selectedAnswerIndex,
      acceptedAnswerIndexes: [...question.acceptedAnswerIndexes],
      explanation: question.explanation,
      isCorrect: !isUnanswered && question.acceptedAnswerIndexes.includes(selectedAnswerIndex),
      isUnanswered,
    }
  })

  const subjects = [...new Set(questions.map((question) => question.subject))].map((subject) => {
    const subjectQuestions = questionResults.filter((question) => question.subject === subject)
    const correct = subjectQuestions.filter((question) => question.isCorrect).length
    return {
      subject,
      total: subjectQuestions.length,
      correct,
      score: percentage(correct, subjectQuestions.length),
    }
  })

  const correct = questionResults.filter((question) => question.isCorrect).length
  const unanswered = questionResults.filter((question) => question.isUnanswered).length

  return {
    total: questions.length,
    correct,
    incorrect: questions.length - correct,
    unanswered,
    score: percentage(correct, questions.length),
    subjects,
    questions: questionResults,
  }
}
