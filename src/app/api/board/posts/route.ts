import { BoardValidationError, validateBoardPostInput } from '@/lib/board'
import { createBoardRepository } from '@/lib/board-repository'
import { createClient } from '@/lib/supabase/server'

function authorNickname(user: { user_metadata?: { nickname?: unknown }; email?: string }): string {
  const nickname = user.user_metadata?.nickname
  if (typeof nickname === 'string' && nickname.trim()) return nickname.trim()
  return user.email?.split('@')[0] || '학습자'
}

export async function GET() {
  try {
    const supabase = await createClient()
    const repository = createBoardRepository(supabase)
    return Response.json(await repository.listPosts())
  } catch {
    return Response.json({ error: 'unable to load posts' }, { status: 500 })
  }
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
      input = validateBoardPostInput(body)
    } catch (error) {
      const message = error instanceof Error ? error.message : 'invalid post input'
      return Response.json({ error: message }, { status: 400 })
    }

    const repository = createBoardRepository(supabase)
    const post = await repository.createPost(user.id, authorNickname(user), input)
    return Response.json(post, { status: 201 })
  } catch (error) {
    if (error instanceof BoardValidationError) {
      return Response.json({ error: error.message }, { status: 400 })
    }
    return Response.json({ error: 'unable to save the post' }, { status: 500 })
  }
}
