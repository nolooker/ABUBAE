import Link from 'next/link'
import { notFound } from 'next/navigation'
import { ArrowRight, CheckCircle, Download, ListChecks } from 'lucide-react'
import { getExam, getQuestionsByExam, getResources } from '@/lib/data'

type PageProps = {
  params: Promise<{ slug: string }>
}

export async function generateMetadata({ params }: PageProps) {
  const { slug } = await params
  const exam = await getExam(slug)

  if (!exam) {
    return { title: '시험 정보' }
  }

  return {
    title: `${exam.name} 학습 허브`,
    description: exam.description,
  }
}

export default async function ExamDetailPage({ params }: PageProps) {
  const { slug } = await params
  const exam = await getExam(slug)

  if (!exam) {
    notFound()
  }

  const [examQuestions, allResources] = await Promise.all([
    getQuestionsByExam(exam.slug),
    getResources(),
  ])
  const examResources = allResources.filter((resource) => resource.examSlug === exam.slug)

  return (
    <section className="max-w-6xl mx-auto px-4 py-12">
      <div className="grid grid-cols-1 lg:grid-cols-[1.4fr_0.8fr] gap-8 items-start">
        <div>
          <p className="text-[13px] font-semibold text-[var(--primary)] mb-2">{exam.shortName} 완전 가이드</p>
          <h1 className="text-3xl md:text-4xl font-bold text-[var(--text-primary)]">{exam.name}</h1>
          <p className="text-[15px] text-[var(--text-secondary)] mt-4 leading-relaxed">{exam.description}</p>

          <div className="flex flex-col sm:flex-row gap-2 mt-7">
            <Link
              href={`/exam/${exam.slug}/questions`}
              className="inline-flex items-center justify-center gap-1.5 px-5 py-3 bg-[var(--primary)] text-white text-[14px] font-bold rounded-xl hover:bg-[var(--primary-hover)] transition-colors"
            >
              기출문제 풀기 <ArrowRight size={16} />
            </Link>
            <Link
              href="/resources"
              className="inline-flex items-center justify-center gap-1.5 px-5 py-3 border border-[var(--border)] text-[var(--text-primary)] text-[14px] font-semibold rounded-xl hover:bg-[var(--bg-muted)] transition-colors"
            >
              요약 자료 보기
            </Link>
            {exam.slug === 'jeongchogi' && (
              <Link
                href="/exam/jeongchogi/schedule"
                className="inline-flex items-center justify-center gap-1.5 px-5 py-3 border border-[var(--border)] text-[var(--text-primary)] text-[14px] font-semibold rounded-xl hover:bg-[var(--bg-muted)] transition-colors"
              >
                시험일정 보기
              </Link>
            )}
          </div>
        </div>

        <aside className="bg-[var(--bg-subtle)] border border-[var(--border)] rounded-[var(--radius-lg)] p-5">
          <h2 className="text-[15px] font-bold text-[var(--text-primary)] mb-4">현재 준비된 콘텐츠</h2>
          <div className="space-y-3 text-[13px] text-[var(--text-secondary)]">
            <p className="flex items-center gap-2"><ListChecks size={15} className="text-[var(--primary)]" /> 기출 {examQuestions.length || exam.questionCount}문제</p>
            <p className="flex items-center gap-2"><Download size={15} className="text-[var(--primary)]" /> 자료 {examResources.length}개</p>
            <p className="flex items-center gap-2"><CheckCircle size={15} className="text-[var(--success)]" /> 무료 요약 자료 우선 제공</p>
          </div>
        </aside>
      </div>

      <div className="grid grid-cols-1 lg:grid-cols-2 gap-6 mt-12">
        <div>
          <h2 className="text-[20px] font-bold text-[var(--text-primary)] mb-4">과목 구성</h2>
          <div className="space-y-2">
            {(exam.subjects.length ? exam.subjects : ['과목 정보를 준비 중입니다']).map((subject, index) => (
              <div key={subject} className="flex items-center gap-3 bg-white border border-[var(--border)] rounded-xl p-4">
                <span className="w-7 h-7 rounded-full bg-[var(--primary-light)] text-[var(--primary)] flex items-center justify-center text-[12px] font-bold">
                  {index + 1}
                </span>
                <span className="text-[14px] font-semibold text-[var(--text-primary)]">{subject}</span>
              </div>
            ))}
          </div>
        </div>

        <div>
          <h2 className="text-[20px] font-bold text-[var(--text-primary)] mb-4">최근 기출 미리보기</h2>
          <div className="space-y-2">
            {examQuestions.slice(0, 4).map((question) => (
              <Link
                key={question.id}
                href={`/exam/${exam.slug}/questions/${question.id}`}
                className="block bg-white border border-[var(--border)] rounded-xl p-4 hover:border-[var(--primary)] transition-colors"
              >
                <p className="text-[12px] text-[var(--text-muted)] mb-1">
                  {question.year}년 {question.round}회 · {question.subject}
                </p>
                <p className="text-[14px] font-semibold text-[var(--text-primary)] line-clamp-2">{question.content}</p>
              </Link>
            ))}
          </div>
        </div>
      </div>
    </section>
  )
}
