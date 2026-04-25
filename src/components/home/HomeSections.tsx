import Link from 'next/link'
import {
  ArrowRight,
  CheckCircle,
  FileText,
  FolderOpen,
  PenSquare,
  Trophy,
} from 'lucide-react'
import ExamCard from '@/components/exam/ExamCard'
import type { ExamView, QuestionView, ResourceView } from '@/lib/data'

type HomeStatsProps = {
  exams: ExamView[]
  resources: ResourceView[]
}

export function HomeHeroCard() {
  return (
    <section className="mx-auto max-w-6xl px-4 pt-8 pb-8">
      <div className="relative overflow-hidden rounded-[18px] border border-[var(--border)] bg-white px-6 py-12 text-center shadow-sm md:px-10 md:py-14">
        <div className="absolute right-[-28px] top-[-24px] h-36 w-36 rounded-full bg-[var(--primary-light)] opacity-80" />

        <span className="inline-flex rounded-full bg-[var(--primary-light)] px-3 py-1 text-[11px] font-semibold text-[var(--primary)]">
          정보처리기사 전문 학습 플랫폼
        </span>

        <h2 className="mt-5 text-[30px] font-extrabold leading-[1.28] text-[var(--text-primary)] md:text-[44px]">
          코드 한 줄씩
          <br />
          <span className="text-[var(--primary)]">비전공자도 합격</span>하는 법
        </h2>

        <p className="mx-auto mt-4 max-w-2xl text-[14px] leading-7 text-[var(--text-secondary)] md:text-[15px]">
          기출문제 풀이부터 코드 해설까지. 처음 보는 사람도 이해하는 설명으로, 오늘 공부해야 할
          순서를 차근차근 안내합니다.
        </p>

        <div className="mt-8 flex flex-wrap justify-center gap-3">
          <Link
            href="/exam/jeongchogi/questions"
            className="inline-flex items-center justify-center rounded-xl bg-[var(--primary)] px-5 py-3 text-[14px] font-semibold text-white transition-colors hover:bg-[var(--primary-hover)]"
          >
            지금 공부 시작하기
          </Link>
          <Link
            href="/resources"
            className="inline-flex items-center justify-center rounded-xl border border-[var(--primary)] bg-white px-5 py-3 text-[14px] font-semibold text-[var(--primary)] transition-colors hover:bg-[var(--primary-light)]"
          >
            무료 PDF 받기
          </Link>
        </div>
      </div>
    </section>
  )
}

export function HomeStats({ exams, resources }: HomeStatsProps) {
  const totalQuestions = exams.reduce((sum, exam) => sum + exam.questionCount, 0)
  const studentCount = totalQuestions > 0 ? totalQuestions * 24 : 12400

  const stats = [
    { label: '공부 중인 수험생', value: studentCount.toLocaleString(), icon: Trophy },
    { label: '기출문제', value: totalQuestions.toLocaleString(), icon: PenSquare },
    { label: '자료 만족도', value: '94%', icon: CheckCircle },
    { label: '학습 자료', value: resources.length.toString(), icon: FolderOpen },
  ]

  return (
    <section className="mx-auto max-w-6xl px-4 pb-8">
      <div className="grid grid-cols-2 gap-3 md:grid-cols-4">
        {stats.map((item) => {
          const Icon = item.icon

          return (
            <div
              key={item.label}
              className="rounded-[16px] border border-[var(--border)] bg-white px-4 py-5 text-center shadow-sm"
            >
              <div className="mx-auto mb-3 flex h-10 w-10 items-center justify-center rounded-xl bg-[var(--bg-subtle)] text-[var(--primary)]">
                <Icon size={18} />
              </div>
              <div className="text-[24px] font-extrabold text-[var(--primary)]">{item.value}</div>
              <div className="mt-1 text-[12px] text-[var(--text-secondary)]">{item.label}</div>
            </div>
          )
        })}
      </div>
    </section>
  )
}

type HomeDailyQuestionProps = {
  question: QuestionView
  examName: string
}

export function HomeDailyQuestion({ question, examName }: HomeDailyQuestionProps) {
  return (
    <section className="mx-auto max-w-6xl px-4 pb-8">
      <div className="rounded-[18px] bg-[var(--primary)] px-5 py-6 text-white shadow-md md:px-6">
        <p className="text-[11px] font-semibold tracking-[0.05em] text-white/75">
          오늘의 문제 · {question.year}년 {question.round}회
        </p>
        <div className="mt-3 flex flex-col gap-5 md:flex-row md:items-end md:justify-between">
          <div className="max-w-3xl">
            <div className="mb-2 text-[12px] font-medium text-white/80">{examName}</div>
            <p className="text-[15px] leading-7 text-white">{question.content}</p>
          </div>

          <Link
            href="/quiz/daily"
            className="inline-flex w-fit items-center justify-center rounded-lg bg-white px-4 py-2.5 text-[13px] font-semibold text-[var(--primary)] transition-colors hover:bg-blue-50"
          >
            풀러가기 →
          </Link>
        </div>
      </div>
    </section>
  )
}

type FeaturedQuestionProps = {
  question: QuestionView
  examName: string
}

export function FeaturedQuestion({ question, examName }: FeaturedQuestionProps) {
  return (
    <section className="mx-auto max-w-6xl px-4 pb-10">
      <div className="overflow-hidden rounded-[18px] border border-[var(--border)] bg-white shadow-sm">
        <div className="flex flex-wrap items-center justify-between gap-3 border-b border-[var(--border)] px-5 py-4">
          <div className="flex flex-wrap items-center gap-2">
            <span className="rounded-full bg-[var(--primary-light)] px-2.5 py-1 text-[11px] font-semibold text-[var(--primary)]">
              {examName}
            </span>
            <span className="text-[11px] font-medium text-[var(--text-muted)]">
              {question.year}년 {question.round}회 · {question.number}번
            </span>
          </div>

          <div className="flex items-center gap-2">
            <span className="rounded-full bg-red-50 px-2.5 py-1 text-[11px] font-semibold text-red-500">
              코드
            </span>
            <span className="text-[11px] text-[var(--text-muted)]">{question.subject}</span>
          </div>
        </div>

        <div className="px-5 py-5">
          <p className="mb-4 text-[15px] leading-7 text-[var(--text-primary)]">{question.content}</p>

          <div className="mb-4 rounded-lg border-l-[3px] border-[var(--primary)] bg-[var(--bg-subtle)] px-4 py-4 font-mono text-[12px] leading-6 text-[var(--text-primary)]">
            <pre className="whitespace-pre-wrap">
              {`#include <stdio.h>
int main() {
  int a = 3, b = 4;
  printf("%d", a << 1);
  return 0;
}`}
            </pre>
          </div>

          <div className="space-y-2">
            {question.choices.map((choice, index) => {
              const isCorrect = index === question.answer
              const isSelected = !isCorrect && index === Math.max(0, question.answer - 1)

              return (
                <div
                  key={choice}
                  className={`flex items-center gap-3 rounded-xl border px-4 py-3 text-[13px] transition-colors ${
                    isCorrect
                      ? 'border-green-200 bg-green-50 text-green-800'
                      : isSelected
                        ? 'border-red-200 bg-red-50 text-red-700'
                        : 'border-[var(--border)] bg-white text-[var(--text-primary)]'
                  }`}
                >
                  <span
                    className={`flex h-6 w-6 items-center justify-center rounded-full text-[11px] font-bold ${
                      isCorrect
                        ? 'bg-[var(--success)] text-white'
                        : isSelected
                          ? 'bg-[var(--error)] text-white'
                          : 'border border-[var(--border-strong)] bg-white text-[var(--text-secondary)]'
                    }`}
                  >
                    {index + 1}
                  </span>
                  <span className="flex-1">{choice}</span>
                  {isCorrect && <span className="text-[11px] font-semibold text-green-700">← 정답</span>}
                  {isSelected && <span className="text-[11px] font-medium text-red-600">내가 선택</span>}
                </div>
              )
            })}
          </div>

          <div className="mt-4 rounded-xl border-l-[3px] border-green-500 bg-green-50 px-4 py-4">
            <p className="mb-2 text-[11px] font-bold text-green-700">한 줄씩 해설</p>
            <p className="text-[13px] leading-6 text-green-900/90">{question.explanation}</p>
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
    <section className="mx-auto max-w-6xl px-4 pb-14">
      <div className="mb-5">
        <p className="mb-2 text-[11px] font-semibold tracking-[0.08em] text-[var(--text-muted)] uppercase">
          시험별 학습 허브
        </p>
        <h2 className="text-[22px] font-bold text-[var(--text-primary)]">무엇을 공부할지 바로 찾기</h2>
        <p className="mt-1 text-[13px] text-[var(--text-secondary)]">
          시험 정보, 기출문제, 요약자료를 시험별로 묶어서 볼 수 있게 구성합니다.
        </p>
      </div>

      <div className="grid grid-cols-1 gap-4 md:grid-cols-3">
        {exams.map((exam) => (
          <ExamCard key={exam.slug} exam={exam} />
        ))}
      </div>
    </section>
  )
}

export function LatestContent() {
  const updates = [
    {
      title: '정보처리기사 시험 일정과 접수 방법 정리',
      href: '/exam/jeongchogi',
      type: '시험 정보',
    },
    {
      title: '정처기 1과목 핵심 요약 샘플 공개',
      href: '/resources/1',
      type: '무료 자료',
    },
    {
      title: '코드 문제 먼저 보는 비전공자 가이드',
      href: '/exam/jeongchogi/questions',
      type: '기출 해설',
    },
  ]

  return (
    <section className="mx-auto max-w-6xl px-4 pb-12">
      <div className="mb-5">
        <h2 className="text-[22px] font-bold text-[var(--text-primary)]">최근 업데이트</h2>
        <p className="mt-1 text-[13px] text-[var(--text-secondary)]">
          블로그와 학습 콘텐츠가 같이 움직이도록 연결해 둔 영역입니다.
        </p>
      </div>
      <div className="grid grid-cols-1 gap-4 md:grid-cols-3">
        {updates.map((item) => (
          <Link
            key={item.title}
            href={item.href}
            className="rounded-[18px] border border-[var(--border)] bg-white p-5 transition-colors hover:border-[var(--primary)]"
          >
            <p className="mb-1 text-[12px] font-bold text-[var(--primary)]">{item.type}</p>
            <h3 className="text-[15px] font-bold leading-snug text-[var(--text-primary)]">{item.title}</h3>
          </Link>
        ))}
      </div>
    </section>
  )
}

export function ConversionStrip() {
  return (
    <section className="mx-auto max-w-6xl px-4 pb-14">
      <div className="rounded-[18px] border border-[var(--border)] bg-white p-6 md:p-8">
        <div className="flex flex-col items-start justify-between gap-5 md:flex-row md:items-center">
          <div>
            <p className="mb-2 text-[12px] font-bold text-[var(--primary)]">FREE TO PAID</p>
            <h2 className="text-[22px] font-bold leading-tight text-[var(--text-primary)]">
              무료 자료로 시작하고, 필요한 PDF만 가볍게 구매하세요
            </h2>
            <p className="mt-2 text-[13px] text-[var(--text-secondary)]">
              초기에는 강한 판매보다 무료 자료, 기출 해설, 요약노트로 먼저 신뢰를 쌓는 흐름이 더
              좋습니다.
            </p>
          </div>
          <div className="flex w-full flex-col gap-2 sm:flex-row md:w-auto">
            <Link
              href="/resources"
              className="inline-flex items-center justify-center gap-1.5 rounded-xl bg-[var(--primary)] px-5 py-3 text-[14px] font-bold text-white transition-colors hover:bg-[var(--primary-hover)]"
            >
              자료실 보기 <ArrowRight size={15} />
            </Link>
            <Link
              href="/signup"
              className="inline-flex items-center justify-center gap-1.5 rounded-xl border border-[var(--border)] bg-white px-5 py-3 text-[14px] font-bold text-[var(--text-primary)] transition-colors hover:bg-[var(--bg-subtle)]"
            >
              무료 회원가입 <FileText size={15} />
            </Link>
          </div>
        </div>
      </div>
    </section>
  )
}
