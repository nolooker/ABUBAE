import Link from 'next/link'
import { ArrowRight, CheckCircle } from 'lucide-react'
import ExamCard from '@/components/exam/ExamCard'
import type { ExamView, QuestionView } from '@/lib/data'

type TodayQuestionProps = {
  question: QuestionView
  examName: string
}

export function TodayQuestion({ question, examName }: TodayQuestionProps) {
  return (
    <section className="max-w-6xl mx-auto px-4 pb-12">
      <div className="rounded-[var(--radius-lg)] border border-[var(--border)] bg-[var(--bg-subtle)] p-5 md:p-6">
        <div className="grid grid-cols-1 lg:grid-cols-[0.7fr_1.3fr] gap-6 items-center">
          <div>
            <p className="text-[12px] font-bold text-[var(--primary)] mb-2">오늘의 문제</p>
            <h2 className="text-[22px] font-bold text-[var(--text-primary)]">자료만 보고 끝나지 않도록</h2>
            <p className="text-[13px] text-[var(--text-secondary)] mt-2 leading-relaxed">
              서재형 홈 안에 매일 한 문제를 넣어 반복 방문 이유를 만듭니다.
            </p>
          </div>

          <div className="rounded-xl border border-[var(--border)] bg-white p-5">
            <div className="flex flex-wrap items-center gap-2 mb-3">
              <span className="text-[11px] font-bold px-2 py-0.5 rounded-full bg-blue-50 text-blue-700">{examName}</span>
              <span className="text-[11px] text-[var(--text-muted)]">{question.year}년 {question.round}회 · {question.subject}</span>
            </div>
            <p className="text-[14px] font-semibold text-[var(--text-primary)] leading-relaxed mb-4">
              {question.content}
            </p>
            <Link
              href="/quiz/daily"
              className="inline-flex items-center gap-1.5 text-[13px] font-bold text-[var(--primary)] hover:underline"
            >
              정답 확인하기 <ArrowRight size={13} />
            </Link>
          </div>
        </div>
      </div>
    </section>
  )
}

type ExamCategoriesProps = {
  exams: ExamView[]
}

export function ExamCategories({ exams }: ExamCategoriesProps) {
  return (
    <section className="max-w-6xl mx-auto px-4 pb-12">
      <div className="mb-5">
        <h2 className="text-[22px] font-bold text-[var(--text-primary)]">자격증별 학습 허브</h2>
        <p className="mt-1 text-[13px] text-[var(--text-secondary)]">
          자료 구매 전, 시험 범위와 기출문제를 먼저 확인할 수 있습니다.
        </p>
      </div>
      <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
        {exams.map((exam) => (
          <ExamCard key={exam.slug} exam={exam} />
        ))}
      </div>
    </section>
  )
}

export function LatestContent() {
  const updates = [
    { title: '정보처리기사 시험 일정 + 접수 방법', href: '/exam/jeongchogi', type: '시험 정보' },
    { title: '정처기 1과목 핵심 요약 샘플', href: '/resources/1', type: '무료 자료' },
    { title: '기출 해설로 먼저 보는 빈출 개념', href: '/exam/jeongchogi/questions', type: '기출 해설' },
  ]

  return (
    <section className="max-w-6xl mx-auto px-4 pb-12">
      <div className="mb-5">
        <h2 className="text-[22px] font-bold text-[var(--text-primary)]">최근 업데이트</h2>
        <p className="mt-1 text-[13px] text-[var(--text-secondary)]">
          블로그와 웹사이트 콘텐츠가 서로 연결되도록 운영합니다.
        </p>
      </div>
      <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
        {updates.map((item) => (
          <Link
            key={item.title}
            href={item.href}
            className="rounded-[var(--radius-lg)] border border-[var(--border)] bg-white p-5 transition-colors hover:border-[var(--primary)]"
          >
            <p className="text-[12px] font-bold text-[var(--primary)] mb-1">{item.type}</p>
            <h3 className="text-[15px] font-bold text-[var(--text-primary)] leading-snug">{item.title}</h3>
          </Link>
        ))}
      </div>
    </section>
  )
}

export function ConversionStrip() {
  return (
    <section className="max-w-6xl mx-auto px-4 pb-14">
      <div className="rounded-[var(--radius-lg)] border border-[var(--border)] bg-white p-6 md:p-8">
        <div className="flex flex-col md:flex-row items-start md:items-center justify-between gap-5">
          <div>
            <p className="text-[12px] font-bold text-[var(--primary)] mb-2">FREE TO PAID</p>
            <h2 className="text-[22px] font-bold text-[var(--text-primary)] leading-tight">
              무료 자료로 시작하고, 필요한 PDF만 가볍게 구매하세요
            </h2>
            <p className="text-[13px] text-[var(--text-secondary)] mt-2">
              Dreaming Ryan처럼 자료 카탈로그를 중심에 두되, 아부배는 문제풀이와 학습 허브를 함께 제공합니다.
            </p>
          </div>
          <div className="flex flex-col sm:flex-row gap-2 w-full md:w-auto">
            <Link
              href="/resources"
              className="inline-flex items-center justify-center gap-1.5 rounded-xl bg-[var(--primary)] px-5 py-3 text-[14px] font-bold text-white transition-colors hover:bg-[var(--primary-hover)]"
            >
              자료실 보기 <ArrowRight size={15} />
            </Link>
            <Link
              href="/signup"
              className="inline-flex items-center justify-center gap-1.5 rounded-xl border border-[var(--border)] bg-white px-5 py-3 text-[14px] font-bold text-[var(--text-primary)] transition-colors hover:bg-[var(--bg-muted)]"
            >
              무료 회원가입 <CheckCircle size={15} />
            </Link>
          </div>
        </div>
      </div>
    </section>
  )
}
