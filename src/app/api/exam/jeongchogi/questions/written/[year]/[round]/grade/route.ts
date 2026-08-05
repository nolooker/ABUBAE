import { createExamAttemptRepository } from '@/lib/exam-attempt-repository'
import { gradeWrittenSubmission, WrittenContentUnavailableError } from '@/lib/written-content'
import type { WrittenAnswers } from '@/lib/written-exam'
import { createClient } from '@/lib/supabase/server'

type Context = {
  params: Promise<{ year: string; round: string }>
}

function parsePositiveInteger(value: string): number | undefined {
  if (!/^[1-9]\d*$/.test(value)) return undefined
  const parsed = Number(value)
  return Number.isSafeInteger(parsed) ? parsed : undefined
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
    if (!payload.answers || typeof payload.answers !== 'object' || Array.isArray(payload.answers)) {
      return Response.json({ error: 'answers must be an object' }, { status: 400 })
    }

    const result = await gradeWrittenSubmission(parsedYear, parsedRound, payload.answers as WrittenAnswers)
    if (!result) return Response.json({ error: 'round not found' }, { status: 404 })

    try {
      const supabase = await createClient()
      const { data: { user } } = await supabase.auth.getUser()
      if (user) {
        await createExamAttemptRepository(supabase).saveAttempt({
          userId: user.id,
          examSlug: 'jeongchogi',
          examType: 'written',
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
    if (error instanceof WrittenContentUnavailableError) {
      return Response.json({ error: 'written content unavailable' }, { status: 503 })
    }
    const message = error instanceof Error ? error.message : 'invalid submission'
    return Response.json({ error: message }, { status: 400 })
  }
}
