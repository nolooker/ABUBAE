'use client'

import { useMemo, useState, type ReactNode } from 'react'
import { createClient } from '@/lib/supabase/client'

type Provider = 'google' | 'kakao'

function GoogleIcon() {
  return (
    <svg width="18" height="18" viewBox="0 0 18 18" aria-hidden="true">
      <path fill="#4285F4" d="M17.64 9.2c0-.637-.057-1.251-.164-1.84H9v3.481h4.844a4.14 4.14 0 0 1-1.796 2.716v2.259h2.908c1.702-1.567 2.684-3.875 2.684-6.615z" />
      <path fill="#34A853" d="M9 18c2.43 0 4.467-.806 5.956-2.184l-2.908-2.259c-.806.54-1.837.86-3.048.86-2.344 0-4.328-1.584-5.036-3.711H.957v2.332A8.997 8.997 0 0 0 9 18z" />
      <path fill="#FBBC05" d="M3.964 10.706A5.41 5.41 0 0 1 3.682 9c0-.593.102-1.17.282-1.706V4.962H.957A8.996 8.996 0 0 0 0 9c0 1.452.348 2.827.957 4.038l3.007-2.332z" />
      <path fill="#EA4335" d="M9 3.58c1.321 0 2.508.454 3.44 1.345l2.582-2.58C13.463.891 11.426 0 9 0A8.997 8.997 0 0 0 .957 4.962L3.964 7.294C4.672 5.167 6.656 3.58 9 3.58z" />
    </svg>
  )
}

function KakaoIcon() {
  return (
    <svg width="18" height="18" viewBox="0 0 24 24" aria-hidden="true">
      <path
        fill="#191600"
        d="M12 3C6.477 3 2 6.463 2 10.714c0 2.703 1.808 5.079 4.53 6.44-.2.732-.727 2.657-.833 3.07-.132.51.187.504.394.367.163-.11 2.59-1.742 3.64-2.455.735.106 1.49.163 2.269.163 5.523 0 10-3.463 10-7.585C22 6.463 17.523 3 12 3z"
      />
    </svg>
  )
}

// 카카오는 "카카오계정(이메일)" 동의항목에 비즈니스 인증이 필요해 배포 후로 보류 — 인증 완료되면 true로 전환
const KAKAO_ENABLED = false

const providers: { id: Provider; label: string; className: string; icon: () => ReactNode }[] = [
  {
    id: 'google',
    label: '구글로 계속하기',
    className: 'border border-[var(--border)] bg-white text-[var(--text-primary)] hover:bg-[var(--bg-muted)]',
    icon: GoogleIcon,
  },
  ...(KAKAO_ENABLED ? [{
    id: 'kakao' as const,
    label: '카카오로 계속하기',
    className: 'bg-[#FEE500] text-[#191600] hover:brightness-95',
    icon: KakaoIcon,
  }] : []),
]

type SocialLoginButtonsProps = {
  nextPath?: string
}

export default function SocialLoginButtons({ nextPath }: SocialLoginButtonsProps) {
  const supabase = useMemo(() => createClient(), [])
  const [pendingProvider, setPendingProvider] = useState<Provider | null>(null)
  const [error, setError] = useState('')

  async function signInWith(provider: Provider) {
    setError('')
    setPendingProvider(provider)

    const redirectTo = new URL('/auth/callback', window.location.origin)
    if (nextPath) redirectTo.searchParams.set('next', nextPath)

    const { error: oauthError } = await supabase.auth.signInWithOAuth({
      provider,
      options: {
        redirectTo: redirectTo.toString(),
        ...(provider === 'kakao' ? { scopes: 'profile_nickname' } : {}),
      },
    })

    if (oauthError) {
      setError('소셜 로그인을 시작하지 못했습니다. 잠시 후 다시 시도해 주세요.')
      setPendingProvider(null)
    }
  }

  return (
    <div className="mt-4">
      <div className="flex items-center gap-3">
        <span className="h-px flex-1 bg-[var(--border)]" />
        <span className="text-[12px] font-semibold text-[var(--text-muted)]">또는</span>
        <span className="h-px flex-1 bg-[var(--border)]" />
      </div>

      <div className="mt-4 space-y-2">
        {providers.map((provider) => {
          const Icon = provider.icon
          return (
            <button
              key={provider.id}
              type="button"
              onClick={() => signInWith(provider.id)}
              disabled={pendingProvider !== null}
              className={`flex h-11 w-full items-center justify-center gap-2 rounded-xl text-[14px] font-bold transition-colors disabled:cursor-not-allowed disabled:opacity-70 ${provider.className}`}
            >
              <Icon />
              {pendingProvider === provider.id ? '이동 중...' : provider.label}
            </button>
          )
        })}
      </div>

      {error && (
        <p className="mt-3 rounded-xl border border-red-100 bg-red-50 px-3 py-2 text-[13px] text-red-700">
          {error}
        </p>
      )}
    </div>
  )
}
