import { createFreeBoardPost } from '@/app/board/actions'
import { getBoardPosts } from '@/lib/data'

type BoardPageProps = {
  searchParams?: Promise<{
    status?: string
  }>
}

function getStatusMessage(status?: string) {
  if (status === 'posted') {
    return {
      tone: 'success' as const,
      message: '자유게시판 글이 등록됐어요. 아래 목록에서 바로 확인할 수 있습니다.',
    }
  }

  if (status === 'too-short') {
    return {
      tone: 'warning' as const,
      message: '내용을 조금 더 자세히 적어주세요. 최소 8자 이상이면 등록할 수 있어요.',
    }
  }

  if (status === 'error') {
    return {
      tone: 'error' as const,
      message:
        '등록 중 문제가 있었어요. posts 테이블 쓰기 권한이나 DB 연결 상태를 한 번 확인해보면 좋겠습니다.',
    }
  }

  return null
}

export default async function BoardPage({ searchParams }: BoardPageProps) {
  const resolvedSearchParams = (await searchParams) || {}
  const posts = await getBoardPosts('free')
  const statusMessage = getStatusMessage(resolvedSearchParams.status)

  return (
    <div className="min-h-screen bg-[var(--bg-subtle)]">
      <div className="mx-auto max-w-5xl px-4 py-10">
        <section className="ab-card mb-8 overflow-hidden p-8">
          <div className="max-w-3xl">
            <p className="mb-3 text-xs font-bold tracking-[0.2em] text-[var(--primary)]">FREE BOARD</p>
            <h1 className="text-3xl font-black leading-tight text-[var(--text-primary)]">
              질문도 좋고, 오류 제보도 좋고,
              <br />
              막힌 지점을 편하게 남기는 자유게시판입니다.
            </h1>
            <p className="mt-4 text-sm leading-7 text-[var(--text-secondary)]">
              아부배 자유게시판은 공부하다 막힌 부분을 빠르게 풀기 위한 공간입니다. 시험 질문, 자료 의견,
              사이트 오류, 흐름 개선 요청까지 편하게 남기면 됩니다.
            </p>
          </div>
        </section>

        <section className="ab-card p-6">
          <div className="mb-5 flex flex-col gap-2 border-b border-[var(--border)] pb-5">
            <p className="text-lg font-bold text-[var(--text-primary)]">자유게시판</p>
            <p className="text-sm leading-6 text-[var(--text-secondary)]">
              제목은 첫 문장을 기준으로 자동 생성됩니다. 질문이나 제보를 길게 적어도 괜찮게 입력창을 더 넉넉하게
              열어뒀어요.
            </p>
          </div>

          <div className="mb-6 rounded-2xl border border-[var(--border)] bg-white p-4">
            <div className="mb-3">
              <p className="text-sm font-bold text-[var(--text-primary)]">바로 남기기</p>
              <p className="mt-1 text-sm leading-6 text-[var(--text-secondary)]">
                질문이든 오류 제보든 편하게 적으면 됩니다. 처음부터 충분히 적을 수 있게 textarea 높이를 크게
                잡았습니다.
              </p>
            </div>

            {statusMessage && (
              <div
                className={`mb-4 rounded-2xl px-4 py-3 text-sm ${
                  statusMessage.tone === 'success'
                    ? 'bg-green-50 text-green-700'
                    : statusMessage.tone === 'warning'
                      ? 'bg-amber-50 text-amber-700'
                      : 'bg-red-50 text-red-700'
                }`}
              >
                {statusMessage.message}
              </div>
            )}

            <form action={createFreeBoardPost} className="space-y-3">
              <textarea
                name="content"
                required
                minLength={8}
                placeholder={`예시)\n/exam/jeongchogi/questions 에서 2024년 1회 눌렀는데 문제 상세로 안 넘어가요.\n기대한 건 상세 페이지 이동이고, 실제로는 아무 반응이 없었습니다.`}
                className="min-h-[460px] w-full resize-none overflow-hidden rounded-2xl border border-[var(--border)] bg-[var(--bg-subtle)] px-4 py-4 text-sm leading-7 text-[var(--text-primary)] outline-none transition-colors placeholder:text-[var(--text-muted)] focus:border-[var(--primary)]"
              />
              <div className="flex items-center justify-between gap-3">
                <p className="text-xs text-[var(--text-muted)]">
                  최근 글 5개 정도가 보이는 높이로 유지하고, 그 아래 글은 스크롤로 확인할 수 있게 맞춰뒀습니다.
                </p>
                <button type="submit" className="ab-btn ab-btn-primary ab-btn-md shrink-0">
                  등록하기
                </button>
              </div>
            </form>
          </div>

          <div className="space-y-4">
            {posts.length > 0 ? (
              <div className="max-h-[650px] space-y-4 overflow-y-auto pr-2">
                {posts.map((post) => (
                  <article
                    key={post.id}
                    className="rounded-2xl border border-[var(--border)] bg-white px-5 py-4 transition-colors hover:border-[var(--border-strong)]"
                  >
                    <div className="flex items-start justify-between gap-4">
                      <div className="min-w-0 flex-1">
                        <p className="text-base font-semibold leading-7 text-[var(--text-primary)]">
                          {post.title}
                        </p>
                        <p className="mt-2 text-sm leading-6 text-[var(--text-secondary)]">{post.excerpt}</p>
                        <div className="mt-3 flex flex-wrap items-center gap-3 text-xs text-[var(--text-muted)]">
                          <span>{post.meta}</span>
                          <span>조회 {post.viewCount}</span>
                          <span>{post.authorLabel}</span>
                        </div>
                      </div>
                      <span className="ab-badge ab-badge-exam shrink-0">자유</span>
                    </div>
                  </article>
                ))}
              </div>
            ) : (
              <div className="rounded-2xl border border-dashed border-[var(--border-strong)] bg-white px-5 py-10 text-center">
                <p className="text-sm font-semibold text-[var(--text-primary)]">아직 올라온 글이 없습니다.</p>
                <p className="mt-2 text-sm text-[var(--text-secondary)]">
                  첫 질문이나 첫 오류 제보를 남기면 여기서부터 목록이 쌓이기 시작합니다.
                </p>
              </div>
            )}
          </div>
        </section>
      </div>
    </div>
  )
}
