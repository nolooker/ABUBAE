import { notFound, redirect } from 'next/navigation'
import BoardPostForm from '@/components/board/BoardPostForm'
import { isValidBoardId } from '@/lib/board'
import { createBoardRepository } from '@/lib/board-repository'
import { createClient } from '@/lib/supabase/server'

type Props = {
  params: Promise<{ postId: string }>
}

export default async function EditBoardPostPage({ params }: Props) {
  const { postId } = await params
  if (!isValidBoardId(postId)) notFound()

  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) redirect(`/login?next=/board/${postId}/edit`)

  const result = await createBoardRepository(supabase).getPost(postId).catch(() => undefined)
  if (!result || result.post.userId !== user.id) notFound()

  return (
    <section className="mx-auto max-w-3xl px-4 py-12">
      <p className="mb-2 text-[13px] font-bold text-[var(--primary)]">자유게시판</p>
      <h1 className="text-3xl font-bold text-[var(--text-primary)]">글 수정</h1>
      <div className="mt-8 rounded-[var(--radius-lg)] border border-[var(--border)] bg-white p-6">
        <BoardPostForm mode="edit" postId={postId} initialDraft={{ title: result.post.title, content: result.post.content, category: result.post.category }} />
      </div>
    </section>
  )
}
