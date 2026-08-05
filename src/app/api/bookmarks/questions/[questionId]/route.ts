import { createBookmarkRepository } from '@/lib/bookmark-repository'
import { createClient } from '@/lib/supabase/server'

type Context = { params: Promise<{ questionId: string }> }

const uuidPattern = /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/i

async function requireOwner(questionId: string) {
  if (!uuidPattern.test(questionId)) return { error: Response.json({ error: 'invalid question id' }, { status: 400 }) } as const

  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) return { error: Response.json({ error: 'authentication required' }, { status: 401 }) } as const

  return { supabase, userId: user.id } as const
}

export async function POST(_request: Request, { params }: Context) {
  const { questionId } = await params
  const owner = await requireOwner(questionId)
  if ('error' in owner) return owner.error

  try {
    await createBookmarkRepository(owner.supabase).addBookmark(owner.userId, questionId)
    return Response.json({ bookmarked: true })
  } catch {
    return Response.json({ error: 'unable to save the bookmark' }, { status: 500 })
  }
}

export async function DELETE(_request: Request, { params }: Context) {
  const { questionId } = await params
  const owner = await requireOwner(questionId)
  if ('error' in owner) return owner.error

  try {
    await createBookmarkRepository(owner.supabase).removeBookmark(owner.userId, questionId)
    return Response.json({ bookmarked: false })
  } catch {
    return Response.json({ error: 'unable to remove the bookmark' }, { status: 500 })
  }
}
