import Link from 'next/link'
import { getCurrentUserRole } from '@/lib/master-auth'
import { logout } from './actions'

const navItems = [
  { label: '관리자 홈', href: '/admin' },
  { label: '공지 관리', href: '/admin/notices' },
  { label: '기출문제 관리', href: '/admin/questions' },
  { label: '신고 관리', href: '/admin/reports' },
  { label: '유저 관리', href: '/admin/users' },
  { label: '시험 일정 관리', href: '/admin/exam-schedules' },
]

export default async function AdminLayout({ children }: { children: React.ReactNode }) {
  const role = await getCurrentUserRole()
  if (role !== 'master') return <>{children}</>

  return (
    <div>
      <nav className="border-b border-[var(--border)] bg-white">
        <div className="mx-auto flex max-w-6xl items-center justify-between gap-4 px-4 py-3">
          <div className="flex items-center gap-5">
            {navItems.map((item) => (
              <Link
                key={item.href}
                href={item.href}
                className="text-[13px] font-semibold text-[var(--text-secondary)] hover:text-[var(--text-primary)]"
              >
                {item.label}
              </Link>
            ))}
          </div>
          <form action={logout}>
            <button
              type="submit"
              className="rounded-xl border border-[var(--border)] bg-white px-4 py-2 text-[13px] font-bold text-[var(--text-secondary)] hover:bg-[var(--bg-muted)]"
            >
              로그아웃
            </button>
          </form>
        </div>
      </nav>
      {children}
    </div>
  )
}
