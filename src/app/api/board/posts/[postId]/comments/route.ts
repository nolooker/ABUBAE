import { BoardValidationError, validateBoardCommentInput, validateBoardId } from '@/lib/board'
import { BoardNotFoundError, createBoardRepository } from '@/lib/board-repository'
import { createClient } from '@/lib/supabase/server'

type Context = {
  params: Promise<{ postId: string }>
}

function authorNickname(user: { user_metadata?: { nickname?: unknown }; email?: string }): string {
  const nickname = user.user_metadata?.nickname
  if (typeof nickname === 'string' && nickname.trim()) return nickname.trim()
  return user.email?.split('@')[0] || '학습자'
}

export async function POST(request: Request, context: Context) {
  try {
    const postId = validateBoardId((await context.params).postId)
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
      input = validateBoardCommentInput(body)
    } catch (error) {
      const message = error instanceof Error ? error.message : 'invalid comment input'
      return Response.json({ error: message }, { status: 400 })
    }

    const repository = createBoardRepository(supabase)
    const comment = await repository.createComment(postId, user.id, authorNickname(user), input)
    return Response.json(comment, { status: 201 })
  } catch (error) {
    if (error instanceof BoardValidationError) {
      return Response.json({ error: error.message }, { status: 400 })
    }
    if (error instanceof BoardNotFoundError) {
      return Response.json({ error: 'post not found' }, { status: 404 })
    }
    return Response.json({ error: 'unable to save the comment' }, { status: 500 })
  }
}
