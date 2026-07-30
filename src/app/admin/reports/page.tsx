import Link from 'next/link'
import { redirect } from 'next/navigation'
import BoardReportResolveButton from '@/components/admin/BoardReportResolveButton'
import { createBoardRepository } from '@/lib/board-repository'
import { getCurrentUserRole } from '@/lib/master-auth'
import { createClient } from '@/lib/supabase/server'

export const metadata = {
  title: '신고 관리',
  description: '자유게시판에 접수된 신고를 확인하고 처리합니다.',
}

function formattedDate(timestamp: string) {
  return new Intl.DateTimeFormat('ko-KR', { year: 'numeric', month: 'long', day: 'numeric', timeZone: 'UTC' }).format(
    new Date(timestamp),
  )
}

export default async function AdminReportsPage() {
  const supabase = await createClient()
  if ((await getCurrentUserRole(supabase)) !== 'master') redirect('/login?next=/admin/reports')

  const reports = await createBoardRepository(supabase).listPendingReports()

  return (
    <section className="mx-auto max-w-4xl px-4 py-12">
      <div className="mb-8">
        <p className="mb-2 text-[13px] font-bold text-[var(--primary)]">SYSTEM ADMIN</p>
        <h1 className="text-3xl font-bold text-[var(--text-primary)]">신고 관리</h1>
        <p className="mt-3 text-[15px] text-[var(--text-secondary)]">
          자유게시판 글·댓글 신고 중 처리 대기 중인 항목입니다. 처리하면 목록에서 사라집니다.
        </p>
      </div>

      <div className="space-y-3">
        {reports.map((report) => (
          <div key={report.id} className="rounded-[var(--radius-lg)] border border-[var(--border)] bg-white p-5">
            <div className="flex flex-col gap-3 sm:flex-row sm:items-start sm:justify-between">
              <div className="min-w-0">
                <div className="flex items-center gap-2">
                  <span className="rounded-full bg-slate-100 px-2.5 py-1 text-xs font-bold text-slate-700">
                    {report.targetType === 'post' ? '글' : '댓글'}
                  </span>
                  <span className="text-xs text-[var(--text-muted)]">{report.reporterNickname} · {formattedDate(report.createdAt)}</span>
                </div>
                <p className="mt-2 whitespace-pre-wrap text-sm text-[var(--text-primary)]">{report.reason}</p>
                <Link href={`/board/${report.postId}`} className="mt-2 inline-block text-sm font-semibold text-[var(--primary)]">
                  신고된 콘텐츠 보기 →
                </Link>
              </div>
              <BoardReportResolveButton reportId={report.id} />
            </div>
          </div>
        ))}
        {reports.length === 0 && (
          <p className="rounded-[var(--radius-lg)] border border-dashed border-[var(--border)] p-6 text-sm text-[var(--text-secondary)]">
            처리 대기 중인 신고가 없습니다.
          </p>
        )}
      </div>
    </section>
  )
}
