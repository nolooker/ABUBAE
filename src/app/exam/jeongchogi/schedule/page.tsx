import { createExamScheduleRepository } from '@/lib/exam-schedule-repository'
import { createServiceClient } from '@/lib/supabase/service'

export const dynamic = 'force-dynamic'

export const metadata = {
  title: '정보처리기사 시험일정',
  description: '정보처리기사 회차별 필기·실기 접수·시험·발표 일정을 확인하세요.',
}

const columns: { field: 'writtenApplyStart' | 'writtenApplyEnd' | 'writtenExamDate' | 'writtenResultDate' | 'practicalApplyStart' | 'practicalApplyEnd' | 'practicalExamDate' | 'finalResultDate'; label: string }[] = [
  { field: 'writtenApplyStart', label: '필기 접수 시작' },
  { field: 'writtenApplyEnd', label: '필기 접수 종료' },
  { field: 'writtenExamDate', label: '필기 시험일' },
  { field: 'writtenResultDate', label: '필기 발표일' },
  { field: 'practicalApplyStart', label: '실기 접수 시작' },
  { field: 'practicalApplyEnd', label: '실기 접수 종료' },
  { field: 'practicalExamDate', label: '실기 시험일' },
  { field: 'finalResultDate', label: '최종 발표일' },
]

export default async function ExamSchedulePage() {
  const schedules = await createExamScheduleRepository(createServiceClient()).listByExamSlug('jeongchogi')

  return (
    <section className="mx-auto max-w-6xl px-4 py-12">
      <div className="mb-8">
        <p className="mb-2 text-[13px] font-bold text-[var(--primary)]">정보처리기사</p>
        <h1 className="text-3xl font-bold text-[var(--text-primary)]">시험일정</h1>
        <p className="mt-3 text-[15px] text-[var(--text-secondary)]">
          회차별 필기·실기 접수기간, 시험일, 합격자 발표일입니다.
        </p>
      </div>

      <div className="overflow-x-auto rounded-[var(--radius-lg)] border border-[var(--border)] bg-white">
        <table className="w-full min-w-[1100px] text-left text-sm">
          <thead>
            <tr className="border-b border-[var(--border)] text-xs font-bold text-[var(--text-muted)]">
              <th className="px-4 py-3">회차</th>
              {columns.map(({ label }) => (
                <th key={label} className="px-4 py-3">{label}</th>
              ))}
            </tr>
          </thead>
          <tbody>
            {schedules.map((schedule) => (
              <tr key={schedule.id} className="border-b border-[var(--border)] last:border-0">
                <td className="whitespace-nowrap px-4 py-3 font-semibold text-[var(--text-primary)]">
                  {schedule.year}년 {schedule.round}회
                </td>
                {columns.map(({ field }) => (
                  <td key={field} className="whitespace-nowrap px-4 py-3 text-[var(--text-secondary)]">
                    {schedule[field] ?? '-'}
                  </td>
                ))}
              </tr>
            ))}
            {schedules.length === 0 && (
              <tr>
                <td colSpan={columns.length + 1} className="px-4 py-8 text-center text-sm text-[var(--text-secondary)]">
                  등록된 시험일정이 없습니다.
                </td>
              </tr>
            )}
          </tbody>
        </table>
      </div>
    </section>
  )
}
