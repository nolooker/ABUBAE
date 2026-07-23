import Link from 'next/link'
import { LockKeyhole } from 'lucide-react'
import AuthForm from '@/components/auth/AuthForm'

export const metadata = {
  title: 'Admin Login',
  description: 'Sign in with your Supabase account to access the admin area.',
}

export default function AdminLoginPage() {
  return (
    <section className="min-h-[calc(100vh-14rem)] bg-[var(--bg-subtle)] border-b border-[var(--border)]">
      <div className="max-w-6xl mx-auto px-4 py-12 md:py-16">
        <div className="max-w-md mx-auto">
          <div className="text-center mb-6">
            <div className="mx-auto mb-4 flex h-12 w-12 items-center justify-center rounded-xl bg-[var(--primary-light)] text-[var(--primary)]">
              <LockKeyhole size={22} />
            </div>
            <p className="text-[13px] font-bold text-[var(--primary)] mb-2">SYSTEM ADMIN</p>
            <h1 className="text-2xl md:text-3xl font-bold text-[var(--text-primary)]">Sign in to continue</h1>
            <p className="text-[14px] text-[var(--text-secondary)] mt-3 leading-relaxed">
              Admin access is granted only to accounts with the Master role.
            </p>
          </div>
          <AuthForm mode="login" nextPath="/admin" />
          <div className="text-center mt-5">
            <Link href="/" className="text-[13px] font-semibold text-[var(--text-secondary)] hover:text-[var(--primary)]">
              Back to home
            </Link>
          </div>
        </div>
      </div>
    </section>
  )
}
