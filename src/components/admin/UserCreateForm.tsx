'use client'

import { useRouter } from 'next/navigation'
import { useState, type FormEvent } from 'react'

type Draft = {
  email: string
  password: string
  nickname: string
  role: 'user' | 'master'
}

const emptyDraft: Draft = { email: '', password: '', nickname: '', role: 'user' }

function errorMessage(status: number): string {
  if (status === 409) return '이미 가입된 이메일입니다.'
  if (status === 400) return '입력값을 다시 확인해 주세요.'
  return '유저를 만들지 못했습니다. 다시 시도해 주세요.'
}

export default function UserCreateForm() {
  const router = useRouter()
  const [isOpen, setIsOpen] = useState(false)
  const [draft, setDraft] = useState<Draft>(emptyDraft)
  const [isSaving, setIsSaving] = useState(false)
  const [error, setError] = useState<string | null>(null)

  const updateDraft = <Key extends keyof Draft>(field: Key, value: Draft[Key]) => {
    setDraft((current) => ({ ...current, [field]: value }))
  }

  const submit = async (event: FormEvent<HTMLFormElement>) => {
    event.preventDefault()
    if (isSaving) return
    setIsSaving(true)
    setError(null)

    try {
      const response = await fetch('/api/admin/users', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          email: draft.email,
          password: draft.password,
          nickname: draft.nickname || null,
          role: draft.role,
        }),
      })

      if (!response.ok) {
        const payload: unknown = await response.json().catch(() => undefined)
        const serverMessage = payload && typeof payload === 'object' && 'error' in payload && typeof payload.error === 'string'
          ? payload.error
          : undefined
        setError(serverMessage ?? errorMessage(response.status))
        setIsSaving(false)
        return
      }

      setDraft(emptyDraft)
      setIsOpen(false)
      setIsSaving(false)
      router.refresh()
    } catch {
      setError('유저를 만들지 못했습니다. 다시 시도해 주세요.')
      setIsSaving(false)
    }
  }

  if (!isOpen) {
    return (
      <button
        type="button"
        onClick={() => setIsOpen(true)}
        className="rounded-xl bg-[var(--primary)] px-4 py-2.5 text-sm font-bold text-white hover:bg-[var(--primary-hover)]"
      >
        새 유저 추가
      </button>
    )
  }

  return (
    <form onSubmit={submit} className="rounded-[var(--radius-lg)] border border-[var(--border)] bg-white p-5">
      <fieldset disabled={isSaving} className="grid grid-cols-1 gap-4 sm:grid-cols-2">
        <label className="block text-sm font-semibold text-[var(--text-primary)]">
          이메일
          <input
            type="email"
            value={draft.email}
            onChange={(event) => updateDraft('email', event.target.value)}
            required
            className="mt-1.5 w-full rounded-lg border border-[var(--border)] p-2.5 font-normal"
          />
        </label>
        <label className="block text-sm font-semibold text-[var(--text-primary)]">
          비밀번호
          <input
            type="password"
            value={draft.password}
            onChange={(event) => updateDraft('password', event.target.value)}
            required
            minLength={6}
            className="mt-1.5 w-full rounded-lg border border-[var(--border)] p-2.5 font-normal"
          />
        </label>
        <label className="block text-sm font-semibold text-[var(--text-primary)]">
          닉네임 (선택)
          <input
            type="text"
            value={draft.nickname}
            onChange={(event) => updateDraft('nickname', event.target.value)}
            className="mt-1.5 w-full rounded-lg border border-[var(--border)] p-2.5 font-normal"
          />
        </label>
        <label className="block text-sm font-semibold text-[var(--text-primary)]">
          Role
          <select
            value={draft.role}
            onChange={(event) => updateDraft('role', event.target.value as Draft['role'])}
            className="mt-1.5 w-full rounded-lg border border-[var(--border)] p-2.5 font-normal"
          >
            <option value="user">일반 유저</option>
            <option value="master">마스터</option>
          </select>
        </label>
      </fieldset>

      {error && <p role="alert" className="mt-4 text-sm font-semibold text-red-600">{error}</p>}

      <div className="mt-4 flex items-center gap-3">
        <button
          type="submit"
          disabled={isSaving}
          className="rounded-xl bg-[var(--primary)] px-4 py-2 text-sm font-bold text-white disabled:cursor-not-allowed disabled:opacity-60"
        >
          {isSaving ? '만드는 중...' : '유저 생성'}
        </button>
        <button
          type="button"
          onClick={() => { setIsOpen(false); setError(null) }}
          disabled={isSaving}
          className="rounded-xl border border-[var(--border)] px-4 py-2 text-sm font-bold text-[var(--text-primary)] disabled:cursor-not-allowed disabled:opacity-60"
        >
          취소
        </button>
      </div>
    </form>
  )
}
