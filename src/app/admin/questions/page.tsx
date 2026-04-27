import Link from 'next/link'
import { redirect } from 'next/navigation'
import { ChevronLeft, Database, FilePlus2, PencilRuler } from 'lucide-react'
import { isAdminSession } from '@/lib/admin-auth'
import { getExams } from '@/lib/data'
import { createPracticalQuestion, createWrittenQuestion } from './actions'

export const metadata = {
  title: '문제 등록 | System Admin',
  description: '아부배 필기/실기 기출문제 등록 페이지입니다.',
}

type PageProps = {
  searchParams: Promise<{ success?: string; error?: string; exam?: string; type?: string }>
}

const errorMessageMap: Record<string, string> = {
  required: '필수 입력값이 비어 있어요. 필요한 칸을 모두 채워주세요.',
  exam: '선택한 시험을 찾지 못했어요. 먼저 exams 테이블의 slug를 확인해 주세요.',
  question: '필기 questions 저장에 실패했어요. Supabase RLS나 컬럼 구성을 확인해 주세요.',
  choice: '필기 choices 저장에 실패했어요. 보기 저장 단계에서 막혔습니다.',
  practical_schema:
    '실기 문제 저장에 실패했어요. questions 테이블에 exam_part와 answer_text 컬럼이 먼저 있어야 합니다.',
}

function SegmentLink({
  href,
  active,
  children,
}: {
  href: string
  active: boolean
  children: React.ReactNode
}) {
  return (
    <Link
      href={href}
      className={`rounded-xl px-4 py-2 text-[13px] font-semibold transition-colors ${
        active
          ? 'bg-white text-[var(--primary)] shadow-sm'
          : 'text-[var(--text-secondary)] hover:text-[var(--text-primary)]'
      }`}
    >
      {children}
    </Link>
  )
}

export default async function AdminQuestionsPage({ searchParams }: PageProps) {
  if (!(await isAdminSession())) {
    redirect('/admin/login')
  }

  const [{ success, error, exam, type }, exams] = await Promise.all([searchParams, getExams()])
  const selectedType = type === 'practical' ? 'practical' : 'written'
  const selectedExamSlug =
    exam && exams.some((item) => item.slug === exam) ? exam : exams[0]?.slug || 'jeongchogi'

  return (
    <section className="mx-auto max-w-5xl px-4 py-12">
      <div className="mb-8 flex flex-col gap-4 md:flex-row md:items-start md:justify-between">
        <div>
          <Link
            href="/admin"
            className="mb-3 inline-flex items-center gap-1.5 text-[13px] font-semibold text-[var(--text-secondary)] hover:text-[var(--text-primary)]"
          >
            <ChevronLeft size={14} />
            운영 대시보드로 돌아가기
          </Link>
          <p className="mb-2 text-[13px] font-bold text-[var(--primary)]">SYSTEM ADMIN</p>
          <h1 className="text-3xl font-bold text-[var(--text-primary)]">기출문제 등록</h1>
          <p className="mt-3 max-w-3xl text-[15px] leading-7 text-[var(--text-secondary)]">
            관리자 입장에서는 필기와 실기를 따로 관리하는 편이 훨씬 덜 헷갈립니다. 그래서 등록 화면도
            두 흐름으로 분리해두었고, 저장 구조도 각각 다르게 확장할 수 있게 열어뒀어요.
          </p>
        </div>

        <div className="rounded-[var(--radius-lg)] border border-[var(--border)] bg-white p-4 text-[13px] text-[var(--text-secondary)]">
          <div className="mb-2 flex items-center gap-2 font-bold text-[var(--text-primary)]">
            <Database size={16} />
            저장 대상
          </div>
          <p>필기: `questions` + `choices`</p>
          <p className="mt-1">실기: `questions` + `answer_text`</p>
        </div>
      </div>

      <div className="mb-6 inline-flex flex-wrap rounded-xl border border-[var(--border)] bg-[var(--bg-subtle)] p-1">
        <SegmentLink href="/admin/questions?type=written" active={selectedType === 'written'}>
          필기 문제 등록
        </SegmentLink>
        <SegmentLink href="/admin/questions?type=practical" active={selectedType === 'practical'}>
          실기 문제 등록
        </SegmentLink>
      </div>

      {success === '1' && (
        <div className="mb-6 rounded-2xl border border-emerald-200 bg-emerald-50 px-4 py-3 text-[14px] text-emerald-800">
          {selectedType === 'practical' ? '실기 문제' : '필기 문제'} 저장이 완료됐어요.{' '}
          {exam && (
            <Link href={`/exam/${exam}/questions`} className="font-bold underline">
              기출문제 목록
            </Link>
          )}{' '}
          에서 바로 확인해보면 됩니다.
        </div>
      )}

      {error && errorMessageMap[error] && (
        <div className="mb-6 rounded-2xl border border-red-200 bg-red-50 px-4 py-3 text-[14px] text-red-700">
          {errorMessageMap[error]}
        </div>
      )}

      {selectedType === 'practical' ? (
        <form action={createPracticalQuestion} className="space-y-6">
          <div className="rounded-[var(--radius-lg)] border border-[var(--border)] bg-white p-6">
            <div className="mb-5 flex items-center gap-2">
              <PencilRuler size={18} className="text-[var(--primary)]" />
              <h2 className="text-[18px] font-bold text-[var(--text-primary)]">실기 기본 정보</h2>
            </div>

            <div className="grid grid-cols-1 gap-4 md:grid-cols-2">
              <label className="block">
                <span className="mb-1.5 block text-[13px] font-semibold text-[var(--text-primary)]">시험</span>
                <select
                  name="examSlug"
                  defaultValue={selectedExamSlug}
                  className="h-11 w-full rounded-xl border border-[var(--border)] bg-white px-3 text-[14px] outline-none focus:border-[var(--primary)]"
                >
                  {exams.map((item) => (
                    <option key={item.slug} value={item.slug}>
                      {item.name}
                    </option>
                  ))}
                </select>
              </label>

              <label className="block">
                <span className="mb-1.5 block text-[13px] font-semibold text-[var(--text-primary)]">과목/유형</span>
                <input
                  type="text"
                  name="subject"
                  defaultValue="실기"
                  className="h-11 w-full rounded-xl border border-[var(--border)] px-3 text-[14px] outline-none focus:border-[var(--primary)]"
                />
              </label>

              <label className="block">
                <span className="mb-1.5 block text-[13px] font-semibold text-[var(--text-primary)]">연도</span>
                <input
                  type="number"
                  name="year"
                  defaultValue={2024}
                  className="h-11 w-full rounded-xl border border-[var(--border)] px-3 text-[14px] outline-none focus:border-[var(--primary)]"
                />
              </label>

              <label className="block">
                <span className="mb-1.5 block text-[13px] font-semibold text-[var(--text-primary)]">회차</span>
                <input
                  type="number"
                  name="round"
                  defaultValue={1}
                  className="h-11 w-full rounded-xl border border-[var(--border)] px-3 text-[14px] outline-none focus:border-[var(--primary)]"
                />
              </label>

              <label className="block">
                <span className="mb-1.5 block text-[13px] font-semibold text-[var(--text-primary)]">문항 번호</span>
                <input
                  type="number"
                  name="number"
                  defaultValue={1}
                  className="h-11 w-full rounded-xl border border-[var(--border)] px-3 text-[14px] outline-none focus:border-[var(--primary)]"
                />
              </label>

              <label className="block">
                <span className="mb-1.5 block text-[13px] font-semibold text-[var(--text-primary)]">난이도</span>
                <select
                  name="difficulty"
                  defaultValue={2}
                  className="h-11 w-full rounded-xl border border-[var(--border)] bg-white px-3 text-[14px] outline-none focus:border-[var(--primary)]"
                >
                  {[1, 2, 3, 4, 5].map((value) => (
                    <option key={value} value={value}>
                      {value} / 5
                    </option>
                  ))}
                </select>
              </label>
            </div>
          </div>

          <div className="rounded-[var(--radius-lg)] border border-[var(--border)] bg-white p-6">
            <h2 className="mb-4 text-[18px] font-bold text-[var(--text-primary)]">실기 문제와 모범답안</h2>

            <label className="block">
              <span className="mb-1.5 block text-[13px] font-semibold text-[var(--text-primary)]">문제 본문</span>
              <textarea
                name="content"
                rows={5}
                placeholder="실기 문제 본문을 그대로 붙여 넣어주세요."
                className="w-full rounded-2xl border border-[var(--border)] px-4 py-3 text-[14px] leading-7 outline-none focus:border-[var(--primary)]"
              />
            </label>

            <label className="mt-5 block">
              <span className="mb-1.5 block text-[13px] font-semibold text-[var(--text-primary)]">모범답안 / 정답 문자열</span>
              <textarea
                name="answerText"
                rows={4}
                placeholder="채점 기준이 되는 핵심 답안을 적어주세요."
                className="w-full rounded-2xl border border-[var(--border)] bg-[var(--bg-subtle)] px-4 py-3 text-[14px] leading-7 outline-none focus:border-[var(--primary)]"
              />
            </label>

            <label className="mt-5 block">
              <span className="mb-1.5 block text-[13px] font-semibold text-[var(--text-primary)]">해설 / 작성 팁</span>
              <textarea
                name="explanation"
                rows={6}
                placeholder="핵심 포인트, 자주 빠지는 표현, 답안 구성 팁을 적어주세요."
                className="w-full rounded-2xl border border-[var(--border)] px-4 py-3 text-[14px] leading-7 outline-none focus:border-[var(--primary)]"
              />
            </label>
          </div>

          <div className="flex flex-wrap items-center gap-3">
            <button
              type="submit"
              className="inline-flex h-11 items-center justify-center rounded-xl bg-[var(--primary)] px-5 text-[14px] font-bold text-white hover:bg-[var(--primary-hover)]"
            >
              실기 문제 저장하기
            </button>
            <Link
              href="/admin"
              className="inline-flex h-11 items-center justify-center rounded-xl border border-[var(--border)] bg-white px-5 text-[14px] font-semibold text-[var(--text-primary)] hover:bg-[var(--bg-subtle)]"
            >
              대시보드로 돌아가기
            </Link>
          </div>
        </form>
      ) : (
        <form action={createWrittenQuestion} className="space-y-6">
          <div className="rounded-[var(--radius-lg)] border border-[var(--border)] bg-white p-6">
            <div className="mb-5 flex items-center gap-2">
              <FilePlus2 size={18} className="text-[var(--primary)]" />
              <h2 className="text-[18px] font-bold text-[var(--text-primary)]">필기 기본 정보</h2>
            </div>

            <div className="grid grid-cols-1 gap-4 md:grid-cols-2">
              <label className="block">
                <span className="mb-1.5 block text-[13px] font-semibold text-[var(--text-primary)]">시험</span>
                <select
                  name="examSlug"
                  defaultValue={selectedExamSlug}
                  className="h-11 w-full rounded-xl border border-[var(--border)] bg-white px-3 text-[14px] outline-none focus:border-[var(--primary)]"
                >
                  {exams.map((item) => (
                    <option key={item.slug} value={item.slug}>
                      {item.name}
                    </option>
                  ))}
                </select>
              </label>

              <label className="block">
                <span className="mb-1.5 block text-[13px] font-semibold text-[var(--text-primary)]">과목</span>
                <input
                  type="text"
                  name="subject"
                  placeholder="예: 소프트웨어 설계"
                  className="h-11 w-full rounded-xl border border-[var(--border)] px-3 text-[14px] outline-none focus:border-[var(--primary)]"
                />
              </label>

              <label className="block">
                <span className="mb-1.5 block text-[13px] font-semibold text-[var(--text-primary)]">연도</span>
                <input
                  type="number"
                  name="year"
                  defaultValue={2024}
                  className="h-11 w-full rounded-xl border border-[var(--border)] px-3 text-[14px] outline-none focus:border-[var(--primary)]"
                />
              </label>

              <label className="block">
                <span className="mb-1.5 block text-[13px] font-semibold text-[var(--text-primary)]">회차</span>
                <input
                  type="number"
                  name="round"
                  defaultValue={1}
                  className="h-11 w-full rounded-xl border border-[var(--border)] px-3 text-[14px] outline-none focus:border-[var(--primary)]"
                />
              </label>

              <label className="block">
                <span className="mb-1.5 block text-[13px] font-semibold text-[var(--text-primary)]">문항 번호</span>
                <input
                  type="number"
                  name="number"
                  defaultValue={1}
                  className="h-11 w-full rounded-xl border border-[var(--border)] px-3 text-[14px] outline-none focus:border-[var(--primary)]"
                />
              </label>

              <label className="block">
                <span className="mb-1.5 block text-[13px] font-semibold text-[var(--text-primary)]">난이도</span>
                <select
                  name="difficulty"
                  defaultValue={2}
                  className="h-11 w-full rounded-xl border border-[var(--border)] bg-white px-3 text-[14px] outline-none focus:border-[var(--primary)]"
                >
                  {[1, 2, 3, 4, 5].map((value) => (
                    <option key={value} value={value}>
                      {value} / 5
                    </option>
                  ))}
                </select>
              </label>
            </div>
          </div>

          <div className="rounded-[var(--radius-lg)] border border-[var(--border)] bg-white p-6">
            <h2 className="mb-4 text-[18px] font-bold text-[var(--text-primary)]">문제와 보기</h2>

            <label className="block">
              <span className="mb-1.5 block text-[13px] font-semibold text-[var(--text-primary)]">문제 본문</span>
              <textarea
                name="content"
                rows={5}
                placeholder="문제 본문을 그대로 붙여 넣어주세요."
                className="w-full rounded-2xl border border-[var(--border)] px-4 py-3 text-[14px] leading-7 outline-none focus:border-[var(--primary)]"
              />
            </label>

            <div className="mt-5 grid grid-cols-1 gap-4 md:grid-cols-2">
              {[1, 2, 3, 4].map((choiceNumber) => (
                <label key={choiceNumber} className="block">
                  <span className="mb-1.5 block text-[13px] font-semibold text-[var(--text-primary)]">
                    보기 {choiceNumber}
                  </span>
                  <input
                    type="text"
                    name={`choice${choiceNumber}`}
                    placeholder={`${choiceNumber}번 보기`}
                    className="h-11 w-full rounded-xl border border-[var(--border)] px-3 text-[14px] outline-none focus:border-[var(--primary)]"
                  />
                </label>
              ))}
            </div>

            <div className="mt-5">
              <span className="mb-1.5 block text-[13px] font-semibold text-[var(--text-primary)]">정답 번호</span>
              <select
                name="correctChoice"
                defaultValue={1}
                className="h-11 w-full max-w-[180px] rounded-xl border border-[var(--border)] bg-white px-3 text-[14px] outline-none focus:border-[var(--primary)]"
              >
                {[1, 2, 3, 4].map((value) => (
                  <option key={value} value={value}>
                    {value}번
                  </option>
                ))}
              </select>
            </div>
          </div>

          <div className="rounded-[var(--radius-lg)] border border-[var(--border)] bg-white p-6">
            <h2 className="mb-4 text-[18px] font-bold text-[var(--text-primary)]">해설</h2>
            <label className="block">
              <span className="mb-1.5 block text-[13px] font-semibold text-[var(--text-primary)]">정답 해설</span>
              <textarea
                name="explanation"
                rows={6}
                placeholder="정답 근거와 핵심 포인트를 적어주세요."
                className="w-full rounded-2xl border border-[var(--border)] px-4 py-3 text-[14px] leading-7 outline-none focus:border-[var(--primary)]"
              />
            </label>
          </div>

          <div className="flex flex-wrap items-center gap-3">
            <button
              type="submit"
              className="inline-flex h-11 items-center justify-center rounded-xl bg-[var(--primary)] px-5 text-[14px] font-bold text-white hover:bg-[var(--primary-hover)]"
            >
              필기 문제 저장하기
            </button>
            <Link
              href="/admin"
              className="inline-flex h-11 items-center justify-center rounded-xl border border-[var(--border)] bg-white px-5 text-[14px] font-semibold text-[var(--text-primary)] hover:bg-[var(--bg-subtle)]"
            >
              대시보드로 돌아가기
            </Link>
          </div>
        </form>
      )}
    </section>
  )
}
