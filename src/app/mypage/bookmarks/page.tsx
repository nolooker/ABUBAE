import Link from 'next/link'
import { redirect } from 'next/navigation'

import { getBookmarkedQuestions } from '@/lib/bookmark-content'
import { createBookmarkRepository } from '@/lib/bookmark-repository'
import { examTypeLabel } from '@/lib/exam-attempt'
import BookmarkRemoveButton from '@/components/mypage/BookmarkRemoveButton'
import { createClient } from '@/lib/supabase/server'

export const dynamic = 'force-dynamic'

export const metadata = {
  title: '즐겨찾기',
  description: '다시 보고 싶은 정처기 문제만 모아봅니다.',
}

export default async function BookmarksPage() {
  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  if (!user) redirect('/login?next=/mypage/bookmarks')

  const questionIds = await createBookmarkRepository(supabase).listBookmarkedQuestionIds(user.id).catch(() => [])
  const questions = await getBookmarkedQuestions(questionIds).catch(() => [])

  return (
    <section className="mx-auto max-w-3xl px-4 py-12">
      <div className="mb-8">
        <p className="mb-2 text-[13px] font-semibold text-[var(--primary)]">마이페이지</p>
        <h1 className="text-3xl font-bold text-[var(--text-primary)]">즐겨찾기</h1>
        <p className="mt-3 text-[15px] text-[var(--text-secondary)]">다시 풀어보고 싶어 표시해둔 문제들입니다.</p>
      </div>

      {questions.length > 0 ? (
        <div className="space-y-2">
          {questions.map((question) => (
            <div key={question.questionId} className="ab-card flex items-center justify-between gap-4 p-5">
              <Link
                href={`/exam/jeongchogi/questions/${question.examType}/${question.year}/${question.round}`}
                className="min-w-0 flex-1 hover:opacity-80"
              >
                <p className="truncate text-[15px] font-semibold text-[var(--text-primary)]">
                  {question.year}년 {question.round}회 · {examTypeLabel(question.examType)} · {question.questionNumber}번
                </p>
                <p className="mt-1 truncate text-[13px] text-[var(--text-secondary)]">{question.subject} · {question.content}</p>
              </Link>
              <BookmarkRemoveButton questionId={question.questionId} />
            </div>
          ))}
        </div>
      ) : (
        <div className="ab-card p-6 text-center text-sm text-[var(--text-muted)]">아직 즐겨찾기한 문제가 없습니다. 문제를 풀며 별표를 눌러보세요!</div>
      )}
    </section>
  )
}
