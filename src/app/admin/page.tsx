import Link from 'next/link'
import { redirect } from 'next/navigation'
import { BarChart3, FileText, Flag, Library, MessageSquareText, Settings } from 'lucide-react'
import { getCurrentUserRole } from '@/lib/master-auth'

export const metadata = {
  title: '관리자',
  description: '아부배 운영자 관리 페이지입니다.',
}

const adminCards = [
  {
    title: '시험/카테고리 관리',
    description: '자격증, 과목, 시험별 학습 허브 구성을 관리합니다.',
    icon: Library,
    status: '준비 중',
  },
  {
    title: '기출문제 관리',
    description: '문제, 선택지, 정답, 해설 데이터를 입력하고 검수합니다.',
    icon: FileText,
    status: '최우선',
    href: '/admin/questions',
  },
  {
    title: '자료/PDF 관리',
    description: '무료 샘플, 유료 PDF, 미리보기 파일을 관리합니다.',
    icon: Settings,
    status: '준비 중',
  },
  {
    title: '블로그/공지 관리',
    description: 'SEO 글, 공지, 합격 후기 콘텐츠를 관리합니다.',
    icon: MessageSquareText,
    status: '준비 중',
    href: '/admin/notices',
  },
  {
    title: '신고 관리',
    description: '자유게시판 글·댓글 신고를 확인하고 처리합니다.',
    icon: Flag,
    status: '신규',
    href: '/admin/reports',
  },
  {
    title: '판매/전환 지표',
    description: '자료 조회, 다운로드, 구매 전환 흐름을 확인합니다.',
    icon: BarChart3,
    status: '나중에',
  },
]

export default async function AdminPage() {
  if ((await getCurrentUserRole()) !== 'master') {
    redirect('/login?next=/admin')
  }

  return (
    <section className="max-w-6xl mx-auto px-4 py-12">
      <div className="mb-8">
        <p className="text-[13px] font-bold text-[var(--primary)] mb-2">SYSTEM ADMIN</p>
        <h1 className="text-3xl font-bold text-[var(--text-primary)]">아부배 운영 관리</h1>
        <p className="text-[15px] text-[var(--text-secondary)] mt-3">
          지금은 운영 화면의 골격입니다. 초반에는 Supabase Studio로 데이터를 관리하고, 반복 업무가 생기는 영역부터 Admin 기능을 붙입니다.
        </p>
      </div>

      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
        {adminCards.map((card) => {
          const Icon = card.icon

          const content = (
            <>
              <div className="mb-4 flex items-start justify-between gap-3">
                <div className="flex h-10 w-10 items-center justify-center rounded-xl bg-[var(--primary-light)] text-[var(--primary)]">
                  <Icon size={18} />
                </div>
                <span className="rounded-full bg-[var(--bg-subtle)] px-2.5 py-1 text-[11px] font-bold text-[var(--text-secondary)]">
                  {card.status}
                </span>
              </div>
              <h2 className="text-[16px] font-bold text-[var(--text-primary)]">{card.title}</h2>
              <p className="text-[13px] text-[var(--text-secondary)] mt-2 leading-relaxed">{card.description}</p>
            </>
          )

          return card.href ? (
            <Link key={card.title} href={card.href} className="block rounded-[var(--radius-lg)] border border-[var(--border)] bg-white p-5 hover:border-[var(--primary)]">
              {content}
            </Link>
          ) : (
            <div key={card.title} className="rounded-[var(--radius-lg)] border border-[var(--border)] bg-white p-5">
              {content}
            </div>
          )
        })}
      </div>
    </section>
  )
}
