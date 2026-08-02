'use client'

import { useRouter } from 'next/navigation'
import { useMemo, useState, type FormEvent } from 'react'
import { createClient } from '@/lib/supabase/client'

type AccountSettingsFormProps = {
  currentNickname: string
}

export default function AccountSettingsForm({ currentNickname }: AccountSettingsFormProps) {
  const router = useRouter()
  const supabase = useMemo(() => createClient(), [])

  const [isEditingNickname, setIsEditingNickname] = useState(false)
  const [nickname, setNickname] = useState(currentNickname)
  const [isSavingNickname, setIsSavingNickname] = useState(false)
  const [nicknameError, setNicknameError] = useState('')

  const [isChangingPassword, setIsChangingPassword] = useState(false)
  const [newPassword, setNewPassword] = useState('')
  const [confirmPassword, setConfirmPassword] = useState('')
  const [isSavingPassword, setIsSavingPassword] = useState(false)
  const [passwordError, setPasswordError] = useState('')
  const [passwordMessage, setPasswordMessage] = useState('')

  async function submitNickname(event: FormEvent<HTMLFormElement>) {
    event.preventDefault()
    const trimmed = nickname.trim()

    if (!trimmed) {
      setNicknameError('닉네임을 입력해 주세요.')
      return
    }

    setIsSavingNickname(true)
    setNicknameError('')

    const { error } = await supabase.auth.updateUser({ data: { nickname: trimmed } })

    setIsSavingNickname(false)

    if (error) {
      setNicknameError('닉네임을 변경하지 못했습니다. 다시 시도해 주세요.')
      return
    }

    setIsEditingNickname(false)
    router.refresh()
  }

  async function submitPassword(event: FormEvent<HTMLFormElement>) {
    event.preventDefault()
    setPasswordMessage('')

    if (newPassword.length < 6) {
      setPasswordError('비밀번호는 6자 이상으로 입력해 주세요.')
      return
    }

    if (newPassword !== confirmPassword) {
      setPasswordError('비밀번호가 일치하지 않습니다.')
      return
    }

    setIsSavingPassword(true)
    setPasswordError('')

    const { error } = await supabase.auth.updateUser({ password: newPassword })

    setIsSavingPassword(false)

    if (error) {
      setPasswordError('비밀번호를 변경하지 못했습니다. 다시 시도해 주세요.')
      return
    }

    setNewPassword('')
    setConfirmPassword('')
    setIsChangingPassword(false)
    setPasswordMessage('비밀번호가 변경됐습니다.')
  }

  return (
    <div className="mt-4 space-y-3">
      {isEditingNickname ? (
        <form onSubmit={submitNickname} className="space-y-2">
          <input
            type="text"
            value={nickname}
            onChange={(event) => setNickname(event.target.value)}
            disabled={isSavingNickname}
            autoFocus
            className="w-full h-9 rounded-lg border border-[var(--border)] px-2.5 text-[13px] outline-none focus:border-[var(--primary)]"
          />
          {nicknameError && <p role="alert" className="text-[12px] font-semibold text-red-600">{nicknameError}</p>}
          <div className="flex gap-2">
            <button
              type="submit"
              disabled={isSavingNickname}
              className="rounded-lg bg-[var(--primary)] px-3 py-1.5 text-[12px] font-bold text-white disabled:cursor-not-allowed disabled:opacity-60"
            >
              {isSavingNickname ? '저장 중...' : '저장'}
            </button>
            <button
              type="button"
              onClick={() => {
                setIsEditingNickname(false)
                setNickname(currentNickname)
                setNicknameError('')
              }}
              disabled={isSavingNickname}
              className="rounded-lg border border-[var(--border)] px-3 py-1.5 text-[12px] font-bold text-[var(--text-primary)]"
            >
              취소
            </button>
          </div>
        </form>
      ) : (
        <button
          type="button"
          onClick={() => setIsEditingNickname(true)}
          className="text-[13px] font-semibold text-[var(--primary)] hover:underline"
        >
          닉네임 변경
        </button>
      )}

      {isChangingPassword ? (
        <form onSubmit={submitPassword} className="space-y-2">
          <input
            type="password"
            value={newPassword}
            onChange={(event) => setNewPassword(event.target.value)}
            placeholder="새 비밀번호 (6자 이상)"
            autoComplete="new-password"
            disabled={isSavingPassword}
            className="w-full h-9 rounded-lg border border-[var(--border)] px-2.5 text-[13px] outline-none focus:border-[var(--primary)]"
          />
          <input
            type="password"
            value={confirmPassword}
            onChange={(event) => setConfirmPassword(event.target.value)}
            placeholder="새 비밀번호 확인"
            autoComplete="new-password"
            disabled={isSavingPassword}
            className="w-full h-9 rounded-lg border border-[var(--border)] px-2.5 text-[13px] outline-none focus:border-[var(--primary)]"
          />
          {passwordError && <p role="alert" className="text-[12px] font-semibold text-red-600">{passwordError}</p>}
          <div className="flex gap-2">
            <button
              type="submit"
              disabled={isSavingPassword}
              className="rounded-lg bg-[var(--primary)] px-3 py-1.5 text-[12px] font-bold text-white disabled:cursor-not-allowed disabled:opacity-60"
            >
              {isSavingPassword ? '저장 중...' : '저장'}
            </button>
            <button
              type="button"
              onClick={() => {
                setIsChangingPassword(false)
                setNewPassword('')
                setConfirmPassword('')
                setPasswordError('')
              }}
              disabled={isSavingPassword}
              className="rounded-lg border border-[var(--border)] px-3 py-1.5 text-[12px] font-bold text-[var(--text-primary)]"
            >
              취소
            </button>
          </div>
        </form>
      ) : (
        <button
          type="button"
          onClick={() => {
            setIsChangingPassword(true)
            setPasswordMessage('')
          }}
          className="block text-[13px] font-semibold text-[var(--primary)] hover:underline"
        >
          비밀번호 변경
        </button>
      )}

      {passwordMessage && <p className="text-[12px] font-semibold text-green-600">{passwordMessage}</p>}
    </div>
  )
}
