'use client'

import { useRouter } from 'next/navigation'
import { useState } from 'react'

type RoundDeleteButtonProps = {
  year: number
  round: number
}

function errorMessage(status: number): string {
  if (status === 404) return '이미 삭제된 회차입니다.'
  return '회차를 삭제하지 못했습니다. 다시 시도해 주세요.'
}

export default function RoundDeleteButton({ year, round }: RoundDeleteButtonProps) {
  const router = useRouter()
  const [isDeleting, setIsDeleting] = useState(false)
  const [error, setError] = useState<string | null>(null)

  const deleteRound = async () => {
    if (isDeleting) return
    if (!window.confirm(`${year}년 ${round}회 전체 문항을 삭제할까요? 되돌릴 수 없습니다.`)) return

    setIsDeleting(true)
    setError(null)

    try {
      const response = await fetch(`/api/admin/written-questions/round/${year}/${round}`, { method: 'DELETE' })
      if (!response.ok) {
        setError(errorMessage(response.status))
        setIsDeleting(false)
        return
      }
      router.push('/admin/questions?status=round-deleted')
    } catch {
      setError('회차를 삭제하지 못했습니다. 다시 시도해 주세요.')
      setIsDeleting(false)
    }
  }

  return (
    <div>
      <button
        type="button"
        onClick={deleteRound}
        disabled={isDeleting}
        className="rounded-xl border border-red-200 bg-white px-4 py-2 text-center text-sm font-bold text-red-600 disabled:cursor-not-allowed disabled:opacity-60"
      >
        {isDeleting ? '삭제 중...' : '회차 전체 삭제'}
      </button>
      {error && <p role="alert" className="mt-1 text-xs font-semibold text-red-600">{error}</p>}
    </div>
  )
}
