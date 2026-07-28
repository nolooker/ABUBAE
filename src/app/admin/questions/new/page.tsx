import { redirect } from 'next/navigation'
import WrittenQuestionForm from '@/components/admin/WrittenQuestionForm'
import { getCurrentUserRole } from '@/lib/master-auth'

export default async function NewWrittenQuestionPage() {
  if ((await getCurrentUserRole()) !== 'master') redirect('/login?next=/admin/questions/new')

  return (
    <section className="mx-auto max-w-3xl px-4 py-12">
      <p className="mb-2 text-[13px] font-bold text-[var(--primary)]">SYSTEM ADMIN</p>
      <h1 className="text-3xl font-bold text-[var(--text-primary)]">새 문제 추가</h1>
      <p className="mt-3 text-[15px] text-[var(--text-secondary)]">
        연도·회차·과목·문항 번호를 입력하고, 선택지 4개와 정답(복수 가능)을 지정하세요.
      </p>
      <div className="mt-8 rounded-[var(--radius-lg)] border border-[var(--border)] bg-white p-6">
        <WrittenQuestionForm />
      </div>
    </section>
  )
}
