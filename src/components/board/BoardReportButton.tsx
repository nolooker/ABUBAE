'use client'

import { useRef, useState, type FormEvent } from 'react'

type BoardReportButtonProps = {
  targetType: 'post' | 'comment'
  targetId: string
}

export default function BoardReportButton({ targetType, targetId }: BoardReportButtonProps) {
  const [isOpen, setIsOpen] = useState(false)
  const [reason, setReason] = useState('')
  const [isSaving, setIsSaving] = useState(false)
  const [error, setError] = useState<string | null>(null)
  const [isSubmitted, setIsSubmitted] = useState(false)
  const savingRef = useRef(false)

  if (isSubmitted) {
    return <p className="text-xs font-semibold text-[var(--text-muted)]">신고가 접수되었습니다.</p>
  }

  const toggle = () => {
    setError(null)
    setIsOpen((current) => !current)
  }

  const submit = async (event: FormEvent<HTMLFormElement>) => {
    event.preventDefault()
    if (savingRef.current) return
    savingRef.current = true
    setIsSaving(true)
    setError(null)

    try {
      const response = await fetch('/api/board/reports', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ targetType, targetId, reason }),
      })
      if (!response.ok) {
        setError('신고를 접수하지 못했습니다. 다시 시도해 주세요.')
        return
      }
      setIsSubmitted(true)
    } catch {
      setError('신고를 접수하지 못했습니다. 다시 시도해 주세요.')
    } finally {
      savingRef.current = false
      setIsSaving(false)
    }
  }

  return (
    <div>
      <button type="button" onClick={toggle} className="text-xs font-semibold text-[var(--text-muted)] hover:text-red-600">
        {isOpen ? '신고 취소' : '신고'}
      </button>
      {isOpen && (
        <form onSubmit={submit} className="mt-2 space-y-2">
          <textarea
            aria-label="신고 사유"
            value={reason}
            onChange={(event) => setReason(event.target.value)}
            rows={2}
            disabled={isSaving}
            placeholder="신고 사유를 입력하세요"
            className="w-full rounded-lg border border-[var(--border)] p-2 text-sm"
          />
          {error && <p role="alert" className="text-xs font-semibold text-red-600">{error}</p>}
          <button type="submit" disabled={isSaving} className="rounded-lg border border-red-200 px-3 py-1.5 text-xs font-bold text-red-600 disabled:cursor-not-allowed disabled:opacity-60">
            {isSaving ? '접수 중...' : '신고 제출'}
          </button>
        </form>
      )}
    </div>
  )
}
