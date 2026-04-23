import Link from 'next/link'
import { notFound } from 'next/navigation'
import { ArrowLeft, CheckCircle } from 'lucide-react'
import { getExam, getQuestion } from '@/lib/data'

type PageProps = {
  params: Promise<{ slug: string; id: string }>
}

export async function generateMetadata({ params }: PageProps) {
  const { slug, id } = await params
  const [exam, question] = await Promise.all([
    getExam(slug),
    getQuestion(slug, id),
  ])

  return {
    title: question && exam ? `${exam.name} ${question.year}년 ${question.round}회 ${question.number}번 해설` : '기출문제 해설',
    description: question?.content,
  }
}

export default async function QuestionDetailPage({ params }: PageProps) {
  const { slug, id } = await params
  const [exam, question] = await Promise.all([
    getExam(slug),
    getQuestion(slug, id),
  ])

  if (!exam || !question) {
    notFound()
  }

  return (
    <section className="max-w-3xl mx-auto px-4 py-12">
      <Link href={`/exam/${exam.slug}/questions`} className="inline-flex items-center gap-1.5 text-[13px] font-bold text-[var(--text-secondary)] hover:text-[var(--primary)] mb-7">
        <ArrowLeft size={14} /> 문제 목록으로
      </Link>

      <article className="bg-white border border-[var(--border)] rounded-[var(--radius-lg)] p-5 md:p-6">
        <div className="flex flex-wrap items-center gap-2 text-[12px] text-[var(--text-muted)] mb-4">
          <span className="font-bold text-[var(--primary)]">{exam.name}</span>
          <span>{question.year}년 {question.round}회</span>
          <span>{question.subject}</span>
          <span>난이도 {question.difficulty}/5</span>
        </div>

        <h1 className="text-[20px] md:text-[24px] font-bold text-[var(--text-primary)] leading-relaxed">
          {question.number}. {question.content}
        </h1>

        <div className="space-y-2 mt-6">
          {question.choices.map((choice, index) => {
            const isAnswer = index === question.answer

            return (
              <div
                key={choice}
                className={`flex items-center gap-3 p-3 rounded-xl border text-[14px] ${
                  isAnswer
                    ? 'border-[var(--success)] bg-green-50 text-green-800'
                    : 'border-[var(--border)] text-[var(--text-secondary)]'
                }`}
              >
                <span className={`w-7 h-7 rounded-full flex items-center justify-center text-[12px] font-bold ${
                  isAnswer ? 'bg-[var(--success)] text-white' : 'bg-[var(--bg-muted)]'
                }`}>
                  {index + 1}
                </span>
                <span>{choice}</span>
                {isAnswer && <CheckCircle size={16} className="ml-auto" />}
              </div>
            )
          })}
        </div>

        <div className="mt-6 rounded-xl bg-[var(--bg-subtle)] border border-[var(--border)] p-5">
          <p className="text-[13px] font-bold text-[var(--primary)] mb-2">정답 해설</p>
          <p className="text-[14px] text-[var(--text-secondary)] leading-relaxed">{question.explanation}</p>
        </div>
      </article>
    </section>
  )
}
