import { redirect } from 'next/navigation'
import UserMembershipSelect from '@/components/admin/UserMembershipSelect'
import UserSuspendButton from '@/components/admin/UserSuspendButton'
import { getCurrentUserRole } from '@/lib/master-auth'
import { createServiceClient } from '@/lib/supabase/service'
import { createClient } from '@/lib/supabase/server'
import { createUserRepository } from '@/lib/user-repository'

export const metadata = {
  title: '유저 관리',
  description: '회원 목록을 조회하고 멤버십과 정지 상태를 관리합니다.',
}

function formattedDate(timestamp: string) {
  return new Intl.DateTimeFormat('ko-KR', { year: 'numeric', month: 'long', day: 'numeric', timeZone: 'UTC' }).format(
    new Date(timestamp),
  )
}

export default async function AdminUsersPage({
  searchParams,
}: {
  searchParams: Promise<{ q?: string }>
}) {
  const supabase = await createClient()
  if ((await getCurrentUserRole(supabase)) !== 'master') redirect('/login?next=/admin/users')

  const { data: { user: currentUser } } = await supabase.auth.getUser()
  const { q } = await searchParams
  const users = await createUserRepository(createServiceClient()).listUsers(q)

  return (
    <section className="mx-auto max-w-5xl px-4 py-12">
      <div className="mb-8">
        <p className="mb-2 text-[13px] font-bold text-[var(--primary)]">SYSTEM ADMIN</p>
        <h1 className="text-3xl font-bold text-[var(--text-primary)]">유저 관리</h1>
        <p className="mt-3 text-[15px] text-[var(--text-secondary)]">
          회원 목록을 조회하고 멤버십 등급 변경, 계정 정지/해제를 처리합니다.
        </p>
      </div>

      <form className="mb-6" action="/admin/users">
        <input
          type="search"
          name="q"
          defaultValue={q ?? ''}
          placeholder="이메일 또는 닉네임으로 검색"
          className="w-full max-w-sm rounded-xl border border-[var(--border)] px-4 py-2.5 text-sm focus:border-[var(--primary)] focus:outline-none"
        />
      </form>

      <div className="overflow-x-auto rounded-[var(--radius-lg)] border border-[var(--border)] bg-white">
        <table className="w-full min-w-[720px] text-left text-sm">
          <thead>
            <tr className="border-b border-[var(--border)] text-xs font-bold text-[var(--text-muted)]">
              <th className="px-4 py-3">이메일</th>
              <th className="px-4 py-3">닉네임</th>
              <th className="px-4 py-3">가입일</th>
              <th className="px-4 py-3">멤버십</th>
              <th className="px-4 py-3">상태</th>
              <th className="px-4 py-3">정지</th>
            </tr>
          </thead>
          <tbody>
            {users.map((user) => (
              <tr key={user.id} className="border-b border-[var(--border)] last:border-0">
                <td className="px-4 py-3 text-[var(--text-primary)]">{user.email}</td>
                <td className="px-4 py-3 text-[var(--text-secondary)]">{user.nickname ?? '-'}</td>
                <td className="px-4 py-3 text-[var(--text-secondary)]">{formattedDate(user.createdAt)}</td>
                <td className="px-4 py-3">
                  <UserMembershipSelect userId={user.id} membershipType={user.membershipType} />
                </td>
                <td className="px-4 py-3">
                  {user.suspended ? (
                    <span className="rounded-full bg-red-50 px-2.5 py-1 text-xs font-bold text-red-600">정지됨</span>
                  ) : (
                    <span className="rounded-full bg-slate-100 px-2.5 py-1 text-xs font-bold text-slate-700">
                      {user.role === 'master' ? '마스터' : '정상'}
                    </span>
                  )}
                </td>
                <td className="px-4 py-3">
                  {user.id === currentUser?.id ? (
                    <span className="text-xs text-[var(--text-muted)]">본인 계정</span>
                  ) : (
                    <UserSuspendButton userId={user.id} suspended={user.suspended} />
                  )}
                </td>
              </tr>
            ))}
            {users.length === 0 && (
              <tr>
                <td colSpan={6} className="px-4 py-8 text-center text-sm text-[var(--text-secondary)]">
                  조건에 맞는 회원이 없습니다.
                </td>
              </tr>
            )}
          </tbody>
        </table>
      </div>
    </section>
  )
}
