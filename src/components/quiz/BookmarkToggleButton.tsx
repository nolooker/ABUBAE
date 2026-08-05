'use client'

import { useState } from 'react'
import { useRouter } from 'next/navigation'
import { Bookmark, BookmarkCheck } from 'lucide-react'

type Props = {
  questionId: string
  initiallyBookmarked: boolean
  isLoggedIn: boolean
  loginRedirectPath: string
}

export default function BookmarkToggleButton({ questionId, initiallyBookmarked, isLoggedIn, loginRedirectPath }: Props) {
  const router = useRouter()
  const [bookmarked, setBookmarked] = useState(initiallyBookmarked)
  const [isSaving, setIsSaving] = useState(false)

  const toggle = async () => {
    if (!isLoggedIn) {
      router.push(`/login?next=${encodeURIComponent(loginRedirectPath)}`)
      return
    }

    const next = !bookmarked
    setBookmarked(next)
    setIsSaving(true)
    try {
      const response = await fetch(`/api/bookmarks/questions/${questionId}`, { method: next ? 'POST' : 'DELETE' })
      if (!response.ok) throw new Error('bookmark request failed')
    } catch {
      setBookmarked(!next)
    } finally {
      setIsSaving(false)
    }
  }

  return (
    <button
      type="button"
      onClick={toggle}
      disabled={isSaving}
      aria-pressed={bookmarked}
      className={`ab-btn ab-btn-md inline-flex items-center gap-1.5 ${bookmarked ? 'ab-btn-primary' : 'ab-btn-secondary'}`}
    >
      {bookmarked ? <BookmarkCheck size={17} /> : <Bookmark size={17} />}
      {bookmarked ? '즐겨찾기됨' : '즐겨찾기'}
    </button>
  )
}
