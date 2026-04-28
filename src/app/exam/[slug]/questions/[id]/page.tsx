import Image from 'next/image'
import Link from 'next/link'
import { notFound } from 'next/navigation'
import { ArrowLeft, CheckCircle } from 'lucide-react'
import { getExam, getQuestion } from '@/lib/data'

type PageProps = {
  params: Promise<{ slug: string; id: string }>
}

export async function generateMetadata({ params }: PageProps) {
  const { slug, id } = await params
  const [exam, question] = await Promise.all([getExam(slug), getQuestion(slug, id)])

  return {
    title:
      question && exam
        ? `${exam.name} ${question.year}년 ${question.round}회 ${question.number}번 해설`
        : '기출문제 해설',
    description: question?.content || '기출문제 정답과 해설 페이지입니다.',
  }
}

export default async function QuestionDetailPage({ params }: PageProps) {
  const { slug, id } = await params
  const [exam, question] = await Promise.all([getExam(slug), getQuestion(slug, id)])

  if (!exam || !question) {
    notFound()
  }

  return (
    <section className="mx-auto max-w-3xl px-4 py-12">
      <Link
        href={`/exam/${exam.slug}/questions`}
        className="mb-7 inline-flex items-center gap-1.5 text-[13px] font-bold text-[var(--text-secondary)] hover:text-[var(--primary)]"
      >
        <ArrowLeft size={14} /> 문제 목록으로
      </Link>

      <article className="rounded-[var(--radius-lg)] border border-[var(--border)] bg-white p-5 md:p-6">
        <div className="mb-4 flex flex-wrap items-center gap-2 text-[12px] text-[var(--text-muted)]">
          <span className="font-bold text-[var(--primary)]">{exam.name}</span>
          <span>
            {question.year}년 {question.round}회
          </span>
          <span>{question.number}번</span>
          <span>{question.subject}</span>
          <span>난이도 {question.difficulty}/5</span>
        </div>

        <h1 className="text-[20px] font-bold leading-relaxed text-[var(--text-primary)] md:text-[24px]">
          {question.number}. {question.content}
        </h1>

        {question.imageUrl && (
          <div className="mt-6 overflow-hidden rounded-2xl border border-[var(--border)] bg-[var(--bg-subtle)] p-4">
            <div className="relative mx-auto aspect-[16/10] w-full max-w-2xl overflow-hidden rounded-xl bg-white">
              <Image
                src={question.imageUrl}
                alt={question.imageCaption || `${question.number}번 문제 참고 이미지`}
                fill
                className="object-contain"
              />
            </div>
            {question.imageCaption && (
              <p className="mt-3 text-center text-[13px] text-[var(--text-secondary)]">
                {question.imageCaption}
              </p>
            )}
          </div>
        )}

        <div className="mt-6 space-y-2">
          {question.choices.map((choice, index) => {
            const isAnswer = index === question.answer

            return (
              <div
                key={`${question.id}-${index}`}
                className={`flex items-center gap-3 rounded-xl border p-3 text-[14px] ${
                  isAnswer
                    ? 'border-[var(--success)] bg-green-50 text-green-800'
                    : 'border-[var(--border)] text-[var(--text-secondary)]'
                }`}
              >
                <span
                  className={`flex h-7 w-7 items-center justify-center rounded-full text-[12px] font-bold ${
                    isAnswer ? 'bg-[var(--success)] text-white' : 'bg-[var(--bg-muted)]'
                  }`}
                >
                  {index + 1}
                </span>
                <span>{choice}</span>
                {isAnswer && <CheckCircle size={16} className="ml-auto" />}
              </div>
            )
          })}
        </div>

        <div className="mt-6 rounded-xl border border-[var(--border)] bg-[var(--bg-subtle)] p-5">
          <p className="mb-2 text-[13px] font-bold text-[var(--primary)]">정답 해설</p>
          <p className="text-[14px] leading-relaxed text-[var(--text-secondary)]">{question.explanation}</p>
        </div>
      </article>
    </section>
  )
}
