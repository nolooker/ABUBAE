'use client'

import { useRouter } from 'next/navigation'
import { useState } from 'react'

type UserSuspendButtonProps = {
  userId: string
  suspended: boolean
}

export default function UserSuspendButton({ userId, suspended }: UserSuspendButtonProps) {
  const router = useRouter()
  const [isSaving, setIsSaving] = useState(false)
  const [error, setError] = useState<string | null>(null)

  const toggle = async () => {
    if (isSaving) return
    if (!suspended && !window.confirm('이 계정을 정지하시겠습니까?')) return

    setIsSaving(true)
    setError(null)

    try {
      const response = await fetch(`/api/admin/users/${userId}/suspension`, {
        method: 'PATCH',
        headers: { 'content-type': 'application/json' },
        body: JSON.stringify({ suspended: !suspended }),
      })
      if (!response.ok) {
        setError('처리하지 못했습니다.')
        setIsSaving(false)
        return
      }
      router.refresh()
    } catch {
      setError('처리하지 못했습니다.')
      setIsSaving(false)
    }
  }

  return (
    <div>
      <button
        type="button"
        onClick={toggle}
        disabled={isSaving}
        className={`rounded-lg border px-3 py-1.5 text-sm font-bold disabled:cursor-not-allowed disabled:opacity-60 ${
          suspended
            ? 'border-[var(--border)] text-[var(--text-primary)]'
            : 'border-red-200 text-red-600'
        }`}
      >
        {isSaving ? '처리 중...' : suspended ? '정지 해제' : '정지'}
      </button>
      {error && <p role="alert" className="mt-1 text-xs font-semibold text-red-600">{error}</p>}
    </div>
  )
}
