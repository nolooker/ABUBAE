'use client'

import { useRouter } from 'next/navigation'
import { useState } from 'react'

type MembershipType = 'free' | 'standard' | 'premium'

const options: { value: MembershipType; label: string }[] = [
  { value: 'free', label: '무료' },
  { value: 'standard', label: '스탠다드' },
  { value: 'premium', label: '프리미엄' },
]

type UserMembershipSelectProps = {
  userId: string
  membershipType: MembershipType
}

export default function UserMembershipSelect({ userId, membershipType }: UserMembershipSelectProps) {
  const router = useRouter()
  const [isSaving, setIsSaving] = useState(false)
  const [error, setError] = useState<string | null>(null)

  const onChange = async (event: React.ChangeEvent<HTMLSelectElement>) => {
    const nextValue = event.target.value as MembershipType
    setIsSaving(true)
    setError(null)

    try {
      const response = await fetch(`/api/admin/users/${userId}/membership`, {
        method: 'PATCH',
        headers: { 'content-type': 'application/json' },
        body: JSON.stringify({ membershipType: nextValue }),
      })
      if (!response.ok) {
        setError('변경하지 못했습니다.')
        setIsSaving(false)
        return
      }
      router.refresh()
    } catch {
      setError('변경하지 못했습니다.')
      setIsSaving(false)
    }
  }

  return (
    <div>
      <select
        defaultValue={membershipType}
        onChange={onChange}
        disabled={isSaving}
        className="rounded-lg border border-[var(--border)] px-2.5 py-1.5 text-sm font-semibold text-[var(--text-primary)] disabled:cursor-not-allowed disabled:opacity-60"
      >
        {options.map((option) => (
          <option key={option.value} value={option.value}>
            {option.label}
          </option>
        ))}
      </select>
      {error && <p role="alert" className="mt-1 text-xs font-semibold text-red-600">{error}</p>}
    </div>
  )
}
