import { BoardValidationError, validateBoardReportInput } from '@/lib/board'
import { BoardNotFoundError, createBoardRepository } from '@/lib/board-repository'
import { createClient } from '@/lib/supabase/server'

function reporterNickname(user: { user_metadata?: { nickname?: unknown }; email?: string }): string {
  const nickname = user.user_metadata?.nickname
  if (typeof nickname === 'string' && nickname.trim()) return nickname.trim()
  return user.email?.split('@')[0] || '학습자'
}

export async function POST(request: Request) {
  try {
    const supabase = await createClient()
    const { data: { user } } = await supabase.auth.getUser()
    if (!user) return Response.json({ error: 'authentication required' }, { status: 401 })

    let body: unknown
    try {
      body = await request.json()
    } catch {
      return Response.json({ error: 'request body must be valid JSON' }, { status: 400 })
    }

    let input
    try {
      input = validateBoardReportInput(body)
    } catch (error) {
      const message = error instanceof Error ? error.message : 'invalid report input'
      return Response.json({ error: message }, { status: 400 })
    }

    const repository = createBoardRepository(supabase)
    const report = await repository.createReport(user.id, reporterNickname(user), input)
    return Response.json(report, { status: 201 })
  } catch (error) {
    if (error instanceof BoardValidationError) {
      return Response.json({ error: error.message }, { status: 400 })
    }
    if (error instanceof BoardNotFoundError) {
      return Response.json({ error: 'reported content not found' }, { status: 404 })
    }
    return Response.json({ error: 'unable to save the report' }, { status: 500 })
  }
}
