import { gradeWrittenSubmission } from '@/lib/written-content'
import type { WrittenAnswers } from '@/lib/written-exam'

type Context = {
  params: Promise<{ year: string; round: string }>
}

export async function POST(request: Request, { params }: Context) {
  try {
    const { year, round } = await params
    const payload = await request.json() as { answers?: unknown }
    if (!payload.answers || typeof payload.answers !== 'object' || Array.isArray(payload.answers)) {
      return Response.json({ error: 'answers must be an object' }, { status: 400 })
    }

    const result = gradeWrittenSubmission(Number(year), Number(round), payload.answers as WrittenAnswers)
    if (!result) return Response.json({ error: 'round not found' }, { status: 404 })
    return Response.json(result)
  } catch (error) {
    const message = error instanceof Error ? error.message : 'invalid submission'
    return Response.json({ error: message }, { status: 400 })
  }
}
