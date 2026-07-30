import Link from 'next/link'
import { createBoardRepository } from '@/lib/board-repository'
import { createClient } from '@/lib/supabase/server'

export const metadata = {
  title: '자유게시판',
  description: '아부배 회원들의 자유로운 이야기 공간입니다.',
}

export const revalidate = 0

function formattedDate(timestamp: string) {
  return new Intl.DateTimeFormat('ko-KR', { year: 'numeric', month: 'long', day: 'numeric', timeZone: 'UTC' }).format(
    new Date(timestamp),
  )
}

export default async function BoardPage() {
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  const posts = await createBoardRepository(supabase).listPosts().catch(() => [])

  return (
    <section className="mx-auto max-w-3xl px-4 py-12">
      <div className="mb-8 flex flex-col gap-4 sm:flex-row sm:items-start sm:justify-between">
        <div>
          <p className="mb-2 text-[13px] font-semibold text-[var(--primary)]">자유게시판</p>
          <h1 className="text-3xl font-bold text-[var(--text-primary)]">회원 이야기 공간</h1>
          <p className="mt-3 text-[15px] text-[var(--text-secondary)]">자유롭게 이야기 나누고, 서로의 질문에 답해보세요.</p>
        </div>
        <Link
          href={user ? '/board/new' : '/login?next=/board/new'}
          className="rounded-xl bg-[var(--primary)] px-4 py-2 text-center text-sm font-bold text-white"
        >
          글쓰기
        </Link>
      </div>

      {posts.length > 0 ? (
        <div className="space-y-2">
          {posts.map((post) => (
            <Link
              key={post.id}
              href={`/board/${post.id}`}
              className="ab-card flex items-center justify-between gap-4 p-5 transition-colors hover:bg-[var(--bg-subtle)]"
            >
              <div className="min-w-0">
                <p className="truncate text-[15px] font-semibold text-[var(--text-primary)]">{post.title}</p>
                <p className="mt-1 text-[13px] text-[var(--text-secondary)]">{post.authorNickname} · {formattedDate(post.createdAt)}</p>
              </div>
              <span className="shrink-0 text-[13px] text-[var(--text-muted)]">댓글 {post.commentCount}</span>
            </Link>
          ))}
        </div>
      ) : (
        <div className="ab-card p-6 text-center text-sm text-[var(--text-muted)]">아직 등록된 글이 없습니다. 첫 글을 남겨보세요!</div>
      )}
    </section>
  )
}
