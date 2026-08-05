import Link from 'next/link'
import { notFound } from 'next/navigation'
import BoardComments from '@/components/board/BoardComments'
import BoardPostDeleteButton from '@/components/board/BoardPostDeleteButton'
import BoardReportButton from '@/components/board/BoardReportButton'
import { boardCategoryLabel, isValidBoardId } from '@/lib/board'
import { createBoardRepository } from '@/lib/board-repository'
import { getCurrentUserRole } from '@/lib/master-auth'
import { createClient } from '@/lib/supabase/server'

type Props = {
  params: Promise<{ postId: string }>
}

function formattedDate(timestamp: string) {
  return new Intl.DateTimeFormat('ko-KR', { year: 'numeric', month: 'long', day: 'numeric', timeZone: 'UTC' }).format(
    new Date(timestamp),
  )
}

export default async function BoardPostPage({ params }: Props) {
  const { postId } = await params
  if (!isValidBoardId(postId)) notFound()

  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  const role = await getCurrentUserRole(supabase)
  const result = await createBoardRepository(supabase).getPost(postId).catch(() => undefined)
  if (!result) notFound()

  const { post, comments } = result
  const isAuthor = user?.id === post.userId
  const isModerator = role === 'master'

  return (
    <section className="mx-auto max-w-3xl px-4 py-12">
      <Link href="/board" className="text-sm font-semibold text-[var(--primary)]">← 자유게시판으로 돌아가기</Link>

      <div className="mt-6 mb-6 flex items-start justify-between gap-4">
        <div>
          <span className="mb-2 inline-block rounded-full bg-[var(--primary-light)] px-2 py-0.5 text-[11px] font-bold text-[var(--primary)]">
            {boardCategoryLabel(post.category)}
          </span>
          <h1 className="text-2xl font-bold text-[var(--text-primary)] sm:text-3xl">{post.title}</h1>
          <p className="mt-3 text-[13px] text-[var(--text-muted)]">{post.authorNickname} · {formattedDate(post.createdAt)}</p>
        </div>
        <div className="flex shrink-0 items-center gap-2">
          {isAuthor && (
            <Link
              href={`/board/${post.id}/edit`}
              className="rounded-lg border border-[var(--border)] px-3 py-1.5 text-sm font-bold text-[var(--text-primary)]"
            >
              수정
            </Link>
          )}
          {isAuthor && (
            <BoardPostDeleteButton postId={post.id} label="삭제" confirmMessage="이 글을 삭제할까요? 되돌릴 수 없습니다." />
          )}
          {isModerator && !isAuthor && (
            <BoardPostDeleteButton postId={post.id} label="관리자 삭제" confirmMessage="관리자 권한으로 이 글을 삭제할까요? 되돌릴 수 없습니다." />
          )}
        </div>
      </div>

      <div className="ab-card whitespace-pre-wrap p-6 text-[15px] leading-7 text-[var(--text-secondary)]">{post.content}</div>

      {user && !isAuthor && (
        <div className="mt-3">
          <BoardReportButton targetType="post" targetId={post.id} />
        </div>
      )}

      <BoardComments postId={post.id} initialComments={comments} currentUserId={user?.id ?? null} canModerate={isModerator} />
    </section>
  )
}
