'use client'

import { useRouter } from 'next/navigation'
import { useState } from 'react'

type BoardPostDeleteButtonProps = {
  postId: string
  label: string
  confirmMessage: string
}

export default function BoardPostDeleteButton({ postId, label, confirmMessage }: BoardPostDeleteButtonProps) {
  const router = useRouter()
  const [isDeleting, setIsDeleting] = useState(false)
  const [error, setError] = useState<string | null>(null)

  const deletePost = async () => {
    if (isDeleting) return
    if (!window.confirm(confirmMessage)) return

    setIsDeleting(true)
    setError(null)

    try {
      const response = await fetch(`/api/board/posts/${postId}`, { method: 'DELETE' })
      if (!response.ok) {
        setError('삭제하지 못했습니다. 다시 시도해 주세요.')
        setIsDeleting(false)
        return
      }
      router.push('/board')
      router.refresh()
    } catch {
      setError('삭제하지 못했습니다. 다시 시도해 주세요.')
      setIsDeleting(false)
    }
  }

  return (
    <div className="shrink-0 text-right">
      <button
        type="button"
        onClick={deletePost}
        disabled={isDeleting}
        className="rounded-lg border border-red-200 px-3 py-1.5 text-sm font-bold text-red-600 disabled:cursor-not-allowed disabled:opacity-60"
      >
        {isDeleting ? '삭제 중...' : label}
      </button>
      {error && <p role="alert" className="mt-1 text-xs font-semibold text-red-600">{error}</p>}
    </div>
  )
}
