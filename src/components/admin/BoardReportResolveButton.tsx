'use client'

import { useRouter } from 'next/navigation'
import { useState } from 'react'

type BoardReportResolveButtonProps = {
  reportId: string
}

export default function BoardReportResolveButton({ reportId }: BoardReportResolveButtonProps) {
  const router = useRouter()
  const [isResolving, setIsResolving] = useState(false)
  const [error, setError] = useState<string | null>(null)

  const resolve = async () => {
    if (isResolving) return
    setIsResolving(true)
    setError(null)

    try {
      const response = await fetch(`/api/admin/board-reports/${reportId}`, { method: 'PATCH' })
      if (!response.ok) {
        setError('처리하지 못했습니다. 다시 시도해 주세요.')
        setIsResolving(false)
        return
      }
      router.refresh()
    } catch {
      setError('처리하지 못했습니다. 다시 시도해 주세요.')
      setIsResolving(false)
    }
  }

  return (
    <div className="shrink-0 text-right">
      <button
        type="button"
        onClick={resolve}
        disabled={isResolving}
        className="rounded-lg border border-[var(--border)] px-3 py-1.5 text-sm font-bold text-[var(--text-primary)] disabled:cursor-not-allowed disabled:opacity-60"
      >
        {isResolving ? '처리 중...' : '처리 완료'}
      </button>
      {error && <p role="alert" className="mt-1 text-xs font-semibold text-red-600">{error}</p>}
    </div>
  )
}
