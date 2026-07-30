import { BoardValidationError, validateBoardId } from '@/lib/board'
import { BoardNotFoundError, createBoardRepository } from '@/lib/board-repository'
import { createClient } from '@/lib/supabase/server'

type Context = {
  params: Promise<{ commentId: string }>
}

export async function DELETE(_request: Request, context: Context) {
  try {
    const commentId = validateBoardId((await context.params).commentId)
    const supabase = await createClient()
    const { data: { user } } = await supabase.auth.getUser()
    if (!user) return Response.json({ error: 'authentication required' }, { status: 401 })

    const repository = createBoardRepository(supabase)
    await repository.deleteComment(commentId)
    return new Response(null, { status: 204 })
  } catch (error) {
    if (error instanceof BoardValidationError) {
      return Response.json({ error: error.message }, { status: 400 })
    }
    if (error instanceof BoardNotFoundError) {
      return Response.json({ error: 'comment not found' }, { status: 404 })
    }
    return Response.json({ error: 'unable to delete the comment' }, { status: 500 })
  }
}
