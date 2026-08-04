export type GradeablePracticalBlank = {
  blankNumber: number
  acceptedAnswers: string[]
}

export type GradeablePracticalQuestion = {
  id: string
  number: number
  subject: string
  explanation: string
  blanks: GradeablePracticalBlank[]
}

export type PracticalAnswers = Record<string, string[]>

export type PracticalGradeResult = {
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
    explanation: string
    isCorrect: boolean
    isUnanswered: boolean
    blanks: Array<{
      blankNumber: number
      userAnswer: string | null
      acceptedAnswers: string[]
      isCorrect: boolean
    }>
  }>
}

const percentage = (correct: number, total: number) => (total === 0 ? 0 : Math.round((correct / total) * 100))

function normalize(value: string): string {
  return value.trim().toLowerCase().replace(/\s+/g, ' ')
}

function isBlankCorrect(userAnswer: string | null, acceptedAnswers: string[]): boolean {
  if (userAnswer === null || !userAnswer.trim()) return false
  const normalizedAnswer = normalize(userAnswer)
  return acceptedAnswers.some((accepted) => normalize(accepted) === normalizedAnswer)
}

export function gradePracticalRound(
  questions: GradeablePracticalQuestion[],
  answers: PracticalAnswers,
): PracticalGradeResult {
  const questionIds = new Set(questions.map((question) => question.id))
  for (const [questionId, questionAnswers] of Object.entries(answers)) {
    if (!questionIds.has(questionId)) {
      throw new Error(`${questionId} is not part of this practical round`)
    }
    if (!Array.isArray(questionAnswers) || questionAnswers.some((answer) => typeof answer !== 'string')) {
      throw new Error(`${questionId} has an invalid answer list`)
    }
  }

  const questionResults = questions.map((question) => {
    const submittedAnswers = answers[question.id] ?? []
    const blanks = question.blanks
      .slice()
      .sort((a, b) => a.blankNumber - b.blankNumber)
      .map((blank) => {
        const userAnswer = submittedAnswers[blank.blankNumber - 1] ?? null
        return {
          blankNumber: blank.blankNumber,
          userAnswer,
          acceptedAnswers: [...blank.acceptedAnswers],
          isCorrect: isBlankCorrect(userAnswer, blank.acceptedAnswers),
        }
      })

    const isUnanswered = blanks.every((blank) => !blank.userAnswer?.trim())
    const isCorrect = !isUnanswered && blanks.every((blank) => blank.isCorrect)

    return {
      id: question.id,
      number: question.number,
      subject: question.subject,
      explanation: question.explanation,
      isCorrect,
      isUnanswered,
      blanks,
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
