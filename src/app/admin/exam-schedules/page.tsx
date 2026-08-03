import { redirect } from 'next/navigation'
import ExamScheduleCreateForm from '@/components/admin/ExamScheduleCreateForm'
import ExamScheduleRow from '@/components/admin/ExamScheduleRow'
import { getCurrentUserRole } from '@/lib/master-auth'
import { createExamScheduleRepository } from '@/lib/exam-schedule-repository'
import { createServiceClient } from '@/lib/supabase/service'
import { createClient } from '@/lib/supabase/server'

export const metadata = {
  title: '시험 일정 관리',
  description: '정보처리기사 회차별 필기·실기 일정을 관리합니다.',
}

const dateColumns = [
  '필기 접수 시작',
  '필기 접수 종료',
  '필기 시험일',
  '필기 발표일',
  '실기 접수 시작',
  '실기 접수 종료',
  '실기 시험일',
  '최종 발표일',
]

export default async function AdminExamSchedulesPage() {
  const supabase = await createClient()
  if ((await getCurrentUserRole(supabase)) !== 'master') redirect('/login?next=/admin/exam-schedules')

  const schedules = await createExamScheduleRepository(createServiceClient()).listByExamSlug('jeongchogi')

  return (
    <section className="mx-auto max-w-6xl px-4 py-12">
      <div className="mb-8">
        <p className="mb-2 text-[13px] font-bold text-[var(--primary)]">SYSTEM ADMIN</p>
        <h1 className="text-3xl font-bold text-[var(--text-primary)]">시험 일정 관리</h1>
        <p className="mt-3 text-[15px] text-[var(--text-secondary)]">
          정보처리기사 회차별 필기·실기 접수·시험·발표 일정을 관리합니다.
        </p>
      </div>

      <div className="mb-6">
        <ExamScheduleCreateForm examSlug="jeongchogi" />
      </div>

      <div className="overflow-x-auto rounded-[var(--radius-lg)] border border-[var(--border)] bg-white">
        <table className="w-full min-w-[1200px] text-left text-sm">
          <thead>
            <tr className="border-b border-[var(--border)] text-xs font-bold text-[var(--text-muted)]">
              <th className="px-4 py-3">회차</th>
              {dateColumns.map((label) => (
                <th key={label} className="px-4 py-3">{label}</th>
              ))}
              <th className="px-4 py-3">관리</th>
            </tr>
          </thead>
          <tbody>
            {schedules.map((schedule) => (
              <ExamScheduleRow key={schedule.id} schedule={schedule} />
            ))}
            {schedules.length === 0 && (
              <tr>
                <td colSpan={dateColumns.length + 2} className="px-4 py-8 text-center text-sm text-[var(--text-secondary)]">
                  등록된 일정이 없습니다.
                </td>
              </tr>
            )}
          </tbody>
        </table>
      </div>
    </section>
  )
}
