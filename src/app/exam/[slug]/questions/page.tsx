import Link from 'next/link'
import { notFound } from 'next/navigation'
import { ArrowRight } from 'lucide-react'
import { getExam, getQuestionsByExam } from '@/lib/data'

type PageProps = {
  params: Promise<{ slug: string }>
}

export async function generateMetadata({ params }: PageProps) {
  const { slug } = await params
  const exam = await getExam(slug)

  return {
    title: exam ? `${exam.name} 기출문제` : '기출문제',
  }
}

export default async function QuestionListPage({ params }: PageProps) {
  const { slug } = await params
  const exam = await getExam(slug)

  if (!exam) {
    notFound()
  }

  const examQuestions = await getQuestionsByExam(exam.slug)

  return (
    <section className="max-w-4xl mx-auto px-4 py-12">
      <div className="mb-8">
        <p className="text-[13px] font-semibold text-[var(--primary)] mb-2">{exam.name}</p>
        <h1 className="text-3xl font-bold text-[var(--text-primary)]">기출문제 풀이</h1>
        <p className="text-[15px] text-[var(--text-secondary)] mt-3">
          Supabase에 문제가 등록되어 있으면 실제 DB를 읽고, 아직 없으면 샘플 문제를 보여줍니다.
        </p>
      </div>

      <div className="space-y-4">
        {examQuestions.map((question) => (
          <article key={question.id} className="bg-white border border-[var(--border)] rounded-[var(--radius-lg)] p-5">
            <div className="flex flex-wrap items-center gap-2 text-[12px] text-[var(--text-muted)] mb-3">
              <span className="font-semibold text-[var(--primary)]">{question.subject}</span>
              <span>{question.year}년 {question.round}회</span>
              <span>난이도 {question.difficulty}/5</span>
            </div>
            <h2 className="text-[16px] font-bold text-[var(--text-primary)] leading-relaxed">
              {question.number}. {question.content}
            </h2>
            <div className="grid grid-cols-1 sm:grid-cols-2 gap-2 mt-4">
              {question.choices.map((choice, index) => (
                <div key={choice} className="flex items-center gap-2.5 p-3 rounded-lg border border-[var(--border)] text-[13px] text-[var(--text-secondary)]">
                  <span className="w-6 h-6 rounded-full bg-[var(--bg-muted)] flex items-center justify-center text-[11px] font-bold">
                    {index + 1}
                  </span>
                  {choice}
                </div>
              ))}
            </div>
            <Link
              href={`/exam/${exam.slug}/questions/${question.id}`}
              className="inline-flex items-center gap-1.5 mt-4 text-[13px] font-bold text-[var(--primary)] hover:underline"
            >
              정답과 해설 보기 <ArrowRight size={13} />
            </Link>
          </article>
        ))}
      </div>

      <Link href="/quiz/daily" className="inline-flex items-center gap-1.5 mt-8 text-[14px] font-semibold text-[var(--primary)]">
        오늘의 문제 풀러가기 <ArrowRight size={15} />
      </Link>
    </section>
  )
}
