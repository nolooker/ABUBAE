import { redirect } from 'next/navigation'
import BoardPostForm from '@/components/board/BoardPostForm'
import { createClient } from '@/lib/supabase/server'

export const metadata = {
  title: '글쓰기',
  description: '자유게시판에 새 글을 작성하세요.',
}

export default async function NewBoardPostPage() {
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) redirect('/login?next=/board/new')

  return (
    <section className="mx-auto max-w-3xl px-4 py-12">
      <p className="mb-2 text-[13px] font-bold text-[var(--primary)]">자유게시판</p>
      <h1 className="text-3xl font-bold text-[var(--text-primary)]">글쓰기</h1>
      <div className="mt-8 rounded-[var(--radius-lg)] border border-[var(--border)] bg-white p-6">
        <BoardPostForm mode="create" />
      </div>
    </section>
  )
}
