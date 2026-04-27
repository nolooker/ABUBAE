import Link from 'next/link'
import { redirect } from 'next/navigation'
import { BarChart3, FileText, Library, MessageSquareText, Settings } from 'lucide-react'
import { isAdminSession } from '@/lib/admin-auth'
import { logoutAdmin } from './login/actions'

export const metadata = {
  title: 'System Admin',
  description: '아부배 운영 관리 페이지입니다.',
}

const adminCards = [
  {
    title: '시험/카테고리 관리',
    description: '자격증과 과목 구조를 정리하고 시험 허브 구성을 다듬는 영역입니다.',
    href: '/admin',
    icon: Library,
    status: '준비 중',
  },
  {
    title: '기출문제 등록',
    description: '필기 기출문제를 입력하고 보기, 정답, 해설까지 한 번에 저장합니다.',
    href: '/admin/questions',
    icon: FileText,
    status: '지금 사용',
  },
  {
    title: '자료/PDF 관리',
    description: '무료 샘플, 유료 자료, 미리보기 파일 흐름을 관리할 자리입니다.',
    href: '/admin',
    icon: Settings,
    status: '준비 중',
  },
  {
    title: '블로그/공지 관리',
    description: 'SEO 글, 공지, 합격 후기를 운영 화면으로 확장할 예정입니다.',
    href: '/admin',
    icon: MessageSquareText,
    status: '준비 중',
  },
  {
    title: '조회/전환 지표',
    description: '다운로드, 구매, 유입 경로 같은 운영 지표를 차후 연결할 예정입니다.',
    href: '/admin',
    icon: BarChart3,
    status: '후순위',
  },
]

export default async function AdminPage() {
  if (!(await isAdminSession())) {
    redirect('/admin/login')
  }

  return (
    <section className="mx-auto max-w-6xl px-4 py-12">
      <div className="mb-8 flex flex-col gap-4 md:flex-row md:items-start md:justify-between">
        <div>
          <p className="mb-2 text-[13px] font-bold text-[var(--primary)]">SYSTEM ADMIN</p>
          <h1 className="text-3xl font-bold text-[var(--text-primary)]">운영 관리 대시보드</h1>
          <p className="mt-3 max-w-3xl text-[15px] leading-7 text-[var(--text-secondary)]">
            지금은 문제 등록 흐름부터 먼저 붙였습니다. 초반에는 Supabase Studio와 이 운영 화면을 함께
            쓰다가, 반복 작업이 생기는 영역부터 차근차근 전용 관리 기능으로 넓혀가면 됩니다.
          </p>
        </div>

        <div className="flex flex-wrap gap-2">
          <Link
            href="/admin/questions"
            className="inline-flex items-center justify-center rounded-xl bg-[var(--primary)] px-4 py-2 text-[13px] font-bold text-white hover:bg-[var(--primary-hover)]"
          >
            문제 등록하러 가기
          </Link>
          <form action={logoutAdmin}>
            <button
              type="submit"
              className="rounded-xl border border-[var(--border)] bg-white px-4 py-2 text-[13px] font-bold text-[var(--text-secondary)] hover:bg-[var(--bg-muted)]"
            >
              Admin 로그아웃
            </button>
          </form>
        </div>
      </div>

      <div className="grid grid-cols-1 gap-4 md:grid-cols-2 lg:grid-cols-3">
        {adminCards.map((card) => {
          const Icon = card.icon

          return (
            <Link
              key={card.title}
              href={card.href}
              className="rounded-[var(--radius-lg)] border border-[var(--border)] bg-white p-5 transition-transform hover:-translate-y-0.5 hover:shadow-md"
            >
              <div className="mb-4 flex items-start justify-between gap-3">
                <div className="flex h-10 w-10 items-center justify-center rounded-xl bg-[var(--primary-light)] text-[var(--primary)]">
                  <Icon size={18} />
                </div>
                <span className="rounded-full bg-[var(--bg-subtle)] px-2.5 py-1 text-[11px] font-bold text-[var(--text-secondary)]">
                  {card.status}
                </span>
              </div>
              <h2 className="text-[16px] font-bold text-[var(--text-primary)]">{card.title}</h2>
              <p className="mt-2 text-[13px] leading-relaxed text-[var(--text-secondary)]">{card.description}</p>
            </Link>
          )
        })}
      </div>
    </section>
  )
}
