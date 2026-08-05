import { createExamAttemptRepository } from '@/lib/exam-attempt-repository'
import { gradePracticalSubmission, PracticalContentUnavailableError } from '@/lib/practical-content'
import type { PracticalAnswers } from '@/lib/practical-exam'
import { createClient } from '@/lib/supabase/server'

type Context = {
  params: Promise<{ year: string; round: string }>
}

function parsePositiveInteger(value: string): number | undefined {
  if (!/^[1-9]\d*$/.test(value)) return undefined
  const parsed = Number(value)
  return Number.isSafeInteger(parsed) ? parsed : undefined
}

function isPracticalAnswers(value: unknown): value is PracticalAnswers {
  if (!value || typeof value !== 'object' || Array.isArray(value)) return false
  return Object.values(value).every((answers) => Array.isArray(answers) && answers.every((answer) => typeof answer === 'string'))
}

export async function POST(request: Request, { params }: Context) {
  try {
    const { year, round } = await params
    const parsedYear = parsePositiveInteger(year)
    const parsedRound = parsePositiveInteger(round)
    if (!parsedYear || !parsedRound) {
      return Response.json({ error: 'year and round must be positive integers' }, { status: 400 })
    }

    const payload = await request.json() as { answers?: unknown }
    if (!isPracticalAnswers(payload.answers)) {
      return Response.json({ error: 'answers must be an object of string arrays' }, { status: 400 })
    }

    const result = await gradePracticalSubmission(parsedYear, parsedRound, payload.answers)
    if (!result) return Response.json({ error: 'round not found' }, { status: 404 })

    try {
      const supabase = await createClient()
      const { data: { user } } = await supabase.auth.getUser()
      if (user) {
        await createExamAttemptRepository(supabase).saveAttempt({
          userId: user.id,
          examSlug: 'jeongchogi',
          examType: 'practical',
          year: parsedYear,
          round: parsedRound,
          result,
        })
      }
    } catch {
      // best-effort: grading still succeeds even if the attempt record fails to save
    }

    return Response.json(result)
  } catch (error) {
    if (error instanceof PracticalContentUnavailableError) {
      return Response.json({ error: 'practical content unavailable' }, { status: 503 })
    }
    const message = error instanceof Error ? error.message : 'invalid submission'
    return Response.json({ error: message }, { status: 400 })
  }
}
