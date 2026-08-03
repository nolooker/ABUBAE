'use client'

import { useRouter } from 'next/navigation'
import { useState } from 'react'

type ExamScheduleDeleteButtonProps = {
  scheduleId: string
}

function errorMessage(status: number): string {
  if (status === 404) return '이미 삭제된 일정입니다.'
  return '일정을 삭제하지 못했습니다. 다시 시도해 주세요.'
}

export default function ExamScheduleDeleteButton({ scheduleId }: ExamScheduleDeleteButtonProps) {
  const router = useRouter()
  const [isDeleting, setIsDeleting] = useState(false)
  const [error, setError] = useState<string | null>(null)

  const deleteSchedule = async () => {
    if (isDeleting) return
    if (!window.confirm('이 일정을 삭제할까요? 되돌릴 수 없습니다.')) return

    setIsDeleting(true)
    setError(null)

    try {
      const response = await fetch(`/api/admin/exam-schedules/${scheduleId}`, { method: 'DELETE' })
      if (!response.ok) {
        setError(errorMessage(response.status))
        setIsDeleting(false)
        return
      }
      router.refresh()
    } catch {
      setError('일정을 삭제하지 못했습니다. 다시 시도해 주세요.')
      setIsDeleting(false)
    }
  }

  return (
    <div>
      <button
        type="button"
        onClick={deleteSchedule}
        disabled={isDeleting}
        className="rounded-lg border border-red-200 px-3 py-1.5 text-xs font-bold text-red-600 disabled:cursor-not-allowed disabled:opacity-60"
      >
        {isDeleting ? '삭제 중...' : '삭제'}
      </button>
      {error && <p role="alert" className="mt-1 text-xs font-semibold text-red-600">{error}</p>}
    </div>
  )
}
