import Link from 'next/link'
import AuthForm from '@/components/auth/AuthForm'

export const metadata = {
  title: '로그인',
  description: '아부배에 로그인하고 즐겨찾기와 학습 기록을 이어가세요.',
}

export default function LoginPage() {
  return (
    <section className="min-h-[calc(100vh-14rem)] bg-[var(--bg-subtle)] border-b border-[var(--border)]">
      <div className="max-w-6xl mx-auto px-4 py-12 md:py-16">
        <div className="max-w-md mx-auto">
          <div className="text-center mb-6">
            <p className="text-[13px] font-bold text-[var(--primary)] mb-2">다시 공부 시작하기</p>
            <h1 className="text-2xl md:text-3xl font-bold text-[var(--text-primary)] leading-tight">
              저장한 문제와 자료를 이어보세요
            </h1>
            <p className="text-[14px] text-[var(--text-secondary)] mt-3 leading-relaxed">
              로그인하면 즐겨찾기, 풀이 기록, 다운로드 자료를 계정에 연결할 수 있습니다.
            </p>
          </div>
          <AuthForm mode="login" />
          <div className="text-center mt-5">
            <Link href="/exam" className="text-[13px] font-semibold text-[var(--text-secondary)] hover:text-[var(--primary)]">
              로그인 없이 시험 목록 먼저 보기
            </Link>
          </div>
        </div>
      </div>
    </section>
  )
}
