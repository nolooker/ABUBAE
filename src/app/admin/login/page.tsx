import Link from 'next/link'
import { LockKeyhole } from 'lucide-react'
import { loginAdmin } from './actions'

export const metadata = {
  title: 'Admin Login',
  description: '아부배 운영자 마스터 코드 로그인입니다.',
}

type PageProps = {
  searchParams: Promise<{ error?: string }>
}

export default async function AdminLoginPage({ searchParams }: PageProps) {
  const { error } = await searchParams

  return (
    <section className="min-h-[calc(100vh-14rem)] bg-[var(--bg-subtle)] border-b border-[var(--border)]">
      <div className="max-w-6xl mx-auto px-4 py-12 md:py-16">
        <div className="max-w-md mx-auto">
          <div className="text-center mb-6">
            <div className="mx-auto mb-4 flex h-12 w-12 items-center justify-center rounded-xl bg-[var(--primary-light)] text-[var(--primary)]">
              <LockKeyhole size={22} />
            </div>
            <p className="text-[13px] font-bold text-[var(--primary)] mb-2">SYSTEM ADMIN</p>
            <h1 className="text-2xl md:text-3xl font-bold text-[var(--text-primary)]">
              운영자 코드로 입장
            </h1>
            <p className="text-[14px] text-[var(--text-secondary)] mt-3 leading-relaxed">
              기본 마스터 코드는 master입니다. 실제 배포 전에는 환경변수로 더 긴 코드로 바꾸세요.
            </p>
          </div>

          <form action={loginAdmin} className="bg-white border border-[var(--border)] rounded-[var(--radius-lg)] p-5 shadow-sm">
            <label className="block">
              <span className="text-[13px] font-semibold text-[var(--text-primary)]">마스터 코드</span>
              <input
                type="password"
                name="code"
                placeholder="master"
                className="mt-1.5 w-full h-11 rounded-xl border border-[var(--border)] px-3 text-[14px] outline-none focus:border-[var(--primary)] focus:ring-2 focus:ring-blue-100"
              />
            </label>

            {error === 'invalid' && (
              <p className="mt-4 rounded-xl border border-red-100 bg-red-50 px-3 py-2 text-[13px] text-red-700">
                마스터 코드가 올바르지 않습니다.
              </p>
            )}

            <button
              type="submit"
              className="mt-5 inline-flex h-11 w-full items-center justify-center rounded-xl bg-[var(--primary)] text-[14px] font-bold text-white transition-colors hover:bg-[var(--primary-hover)]"
            >
              Admin 입장
            </button>
          </form>

          <div className="text-center mt-5">
            <Link href="/" className="text-[13px] font-semibold text-[var(--text-secondary)] hover:text-[var(--primary)]">
              홈으로 돌아가기
            </Link>
          </div>
        </div>
      </div>
    </section>
  )
}
