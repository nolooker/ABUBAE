import Link from 'next/link'
import AuthForm from '@/components/auth/AuthForm'

export const metadata = {
  title: '회원가입',
  description: '아부배에 가입하고 무료 요약 자료와 학습 기능을 이용해 보세요.',
}

export default function SignupPage() {
  return (
    <section className="min-h-[calc(100vh-14rem)] bg-[var(--bg-subtle)] border-b border-[var(--border)]">
      <div className="max-w-6xl mx-auto px-4 py-12 md:py-16">
        <div className="max-w-md mx-auto">
          <div className="text-center mb-6">
            <p className="text-[13px] font-bold text-[var(--primary)] mb-2">무료 회원가입</p>
            <h1 className="text-2xl md:text-3xl font-bold text-[var(--text-primary)] leading-tight">
              오늘 푼 문제를 기록으로 남기세요
            </h1>
            <p className="text-[14px] text-[var(--text-secondary)] mt-3 leading-relaxed">
              먼저 계정을 만들고, 다음 단계에서 즐겨찾기와 무료 PDF 다운로드를 연결합니다.
            </p>
          </div>
          <AuthForm mode="signup" />
          <div className="text-center mt-5">
            <Link href="/resources" className="text-[13px] font-semibold text-[var(--text-secondary)] hover:text-[var(--primary)]">
              가입 전에 무료 자료 먼저 보기
            </Link>
          </div>
        </div>
      </div>
    </section>
  )
}
