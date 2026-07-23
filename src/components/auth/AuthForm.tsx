'use client'

import Link from 'next/link'
import { useRouter } from 'next/navigation'
import { FormEvent, useMemo, useState } from 'react'
import { ArrowRight, Loader2 } from 'lucide-react'
import { createClient } from '@/lib/supabase/client'

type AuthMode = 'login' | 'signup'

type AuthFormProps = {
  mode: AuthMode
  nextPath?: string
}

function getSafeNextPath(nextPath?: string) {
  if (!nextPath?.startsWith('/') || nextPath.startsWith('//') || nextPath.includes('\\')) {
    return '/mypage'
  }

  try {
    const decodedNextPath = decodeURIComponent(nextPath)

    return decodedNextPath.startsWith('//') || decodedNextPath.includes('\\')
      ? '/mypage'
      : nextPath
  } catch {
    return '/mypage'
  }
}

export default function AuthForm({ mode, nextPath }: AuthFormProps) {
  const router = useRouter()
  const supabase = useMemo(() => createClient(), [])
  const isSignup = mode === 'signup'

  const [email, setEmail] = useState('')
  const [password, setPassword] = useState('')
  const [nickname, setNickname] = useState('')
  const [message, setMessage] = useState('')
  const [error, setError] = useState('')
  const [isSubmitting, setIsSubmitting] = useState(false)

  async function handleSubmit(event: FormEvent<HTMLFormElement>) {
    event.preventDefault()
    setError('')
    setMessage('')
    setIsSubmitting(true)

    const trimmedEmail = email.trim()
    const trimmedNickname = nickname.trim()

    if (!trimmedEmail || !password) {
      setError('이메일과 비밀번호를 입력해 주세요.')
      setIsSubmitting(false)
      return
    }

    if (isSignup && password.length < 6) {
      setError('비밀번호는 6자 이상으로 입력해 주세요.')
      setIsSubmitting(false)
      return
    }

    if (isSignup) {
      const { error: signUpError } = await supabase.auth.signUp({
        email: trimmedEmail,
        password,
        options: {
          data: {
            nickname: trimmedNickname || trimmedEmail.split('@')[0],
          },
        },
      })

      if (signUpError) {
        setError(signUpError.message)
        setIsSubmitting(false)
        return
      }

      setMessage('가입 요청이 완료됐어요. 이메일 확인 설정이 켜져 있다면 메일함을 확인해 주세요.')
      setIsSubmitting(false)
      return
    }

    const { error: signInError } = await supabase.auth.signInWithPassword({
      email: trimmedEmail,
      password,
    })

    if (signInError) {
      setError(signInError.message)
      setIsSubmitting(false)
      return
    }

    router.push(getSafeNextPath(nextPath))
    router.refresh()
  }

  return (
    <form onSubmit={handleSubmit} className="bg-white border border-[var(--border)] rounded-[var(--radius-lg)] p-5 shadow-sm">
      <div className="space-y-4">
        {isSignup && (
          <label className="block">
            <span className="text-[13px] font-semibold text-[var(--text-primary)]">닉네임</span>
            <input
              type="text"
              value={nickname}
              onChange={(event) => setNickname(event.target.value)}
              placeholder="예: 아부배러너"
              className="mt-1.5 w-full h-11 rounded-xl border border-[var(--border)] px-3 text-[14px] outline-none focus:border-[var(--primary)] focus:ring-2 focus:ring-blue-100"
            />
          </label>
        )}

        <label className="block">
          <span className="text-[13px] font-semibold text-[var(--text-primary)]">이메일</span>
          <input
            type="email"
            value={email}
            onChange={(event) => setEmail(event.target.value)}
            placeholder="you@example.com"
            className="mt-1.5 w-full h-11 rounded-xl border border-[var(--border)] px-3 text-[14px] outline-none focus:border-[var(--primary)] focus:ring-2 focus:ring-blue-100"
            autoComplete="email"
          />
        </label>

        <label className="block">
          <span className="text-[13px] font-semibold text-[var(--text-primary)]">비밀번호</span>
          <input
            type="password"
            value={password}
            onChange={(event) => setPassword(event.target.value)}
            placeholder={isSignup ? '6자 이상 입력' : '비밀번호 입력'}
            className="mt-1.5 w-full h-11 rounded-xl border border-[var(--border)] px-3 text-[14px] outline-none focus:border-[var(--primary)] focus:ring-2 focus:ring-blue-100"
            autoComplete={isSignup ? 'new-password' : 'current-password'}
          />
        </label>
      </div>

      {error && (
        <p className="mt-4 rounded-xl border border-red-100 bg-red-50 px-3 py-2 text-[13px] text-red-700">
          {error}
        </p>
      )}

      {message && (
        <p className="mt-4 rounded-xl border border-green-100 bg-green-50 px-3 py-2 text-[13px] text-green-700">
          {message}
        </p>
      )}

      <button
        type="submit"
        disabled={isSubmitting}
        className="mt-5 inline-flex h-11 w-full items-center justify-center gap-1.5 rounded-xl bg-[var(--primary)] text-[14px] font-bold text-white transition-colors hover:bg-[var(--primary-hover)] disabled:cursor-not-allowed disabled:opacity-70"
      >
        {isSubmitting ? <Loader2 size={16} className="animate-spin" /> : null}
        {isSignup ? '무료로 시작하기' : '로그인하기'}
        {!isSubmitting ? <ArrowRight size={15} /> : null}
      </button>

      <p className="mt-4 text-center text-[13px] text-[var(--text-secondary)]">
        {isSignup ? '이미 계정이 있나요?' : '아직 계정이 없나요?'}{' '}
        <Link href={isSignup ? '/login' : '/signup'} className="font-semibold text-[var(--primary)] hover:underline">
          {isSignup ? '로그인' : '회원가입'}
        </Link>
      </p>
    </form>
  )
}
