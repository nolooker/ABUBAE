import { BoardValidationError, validateBoardId, validateBoardPostInput } from '@/lib/board'
import { BoardNotFoundError, createBoardRepository } from '@/lib/board-repository'
import { createClient } from '@/lib/supabase/server'

type Context = {
  params: Promise<{ postId: string }>
}

async function postIdFrom(context: Context): Promise<string> {
  return validateBoardId((await context.params).postId)
}

export async function GET(_request: Request, context: Context) {
  try {
    const postId = await postIdFrom(context)
    const supabase = await createClient()
    const repository = createBoardRepository(supabase)
    const result = await repository.getPost(postId)
    if (!result) return Response.json({ error: 'post not found' }, { status: 404 })
    return Response.json(result)
  } catch (error) {
    if (error instanceof BoardValidationError) {
      return Response.json({ error: error.message }, { status: 400 })
    }
    return Response.json({ error: 'unable to load the post' }, { status: 500 })
  }
}

export async function PATCH(request: Request, context: Context) {
  try {
    const postId = await postIdFrom(context)
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
      input = validateBoardPostInput(body)
    } catch (error) {
      const message = error instanceof Error ? error.message : 'invalid post input'
      return Response.json({ error: message }, { status: 400 })
    }

    const repository = createBoardRepository(supabase)
    return Response.json(await repository.updatePost(postId, input))
  } catch (error) {
    if (error instanceof BoardValidationError) {
      return Response.json({ error: error.message }, { status: 400 })
    }
    if (error instanceof BoardNotFoundError) {
      return Response.json({ error: 'post not found' }, { status: 404 })
    }
    return Response.json({ error: 'unable to save the post' }, { status: 500 })
  }
}

export async function DELETE(_request: Request, context: Context) {
  try {
    const postId = await postIdFrom(context)
    const supabase = await createClient()
    const { data: { user } } = await supabase.auth.getUser()
    if (!user) return Response.json({ error: 'authentication required' }, { status: 401 })

    const repository = createBoardRepository(supabase)
    await repository.deletePost(postId)
    return new Response(null, { status: 204 })
  } catch (error) {
    if (error instanceof BoardValidationError) {
      return Response.json({ error: error.message }, { status: 400 })
    }
    if (error instanceof BoardNotFoundError) {
      return Response.json({ error: 'post not found' }, { status: 404 })
    }
    return Response.json({ error: 'unable to delete the post' }, { status: 500 })
  }
}
