'use client'

import { useRouter } from 'next/navigation'
import { useState } from 'react'

type Props = { questionId: string }

export default function BookmarkRemoveButton({ questionId }: Props) {
  const router = useRouter()
  const [isRemoving, setIsRemoving] = useState(false)

  const remove = async () => {
    if (isRemoving) return
    setIsRemoving(true)
    try {
      const response = await fetch(`/api/bookmarks/questions/${questionId}`, { method: 'DELETE' })
      if (response.ok) router.refresh()
    } finally {
      setIsRemoving(false)
    }
  }

  return (
    <button
      type="button"
      onClick={remove}
      disabled={isRemoving}
      className="shrink-0 rounded-lg border border-[var(--border)] px-3 py-1.5 text-xs font-bold text-[var(--text-secondary)] hover:border-red-300 hover:text-red-600 disabled:cursor-not-allowed disabled:opacity-60"
    >
      {isRemoving ? '삭제 중...' : '제거'}
    </button>
  )
}
