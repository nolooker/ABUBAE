import { getExams, getResources } from '@/lib/data'
import { getJeongchogiContentStats } from '@/lib/exam-content-stats'
import ExamCard from '@/components/exam/ExamCard'

export const metadata = {
  title: '시험 정보',
  description: '아부배에서 준비 중인 자격증별 기출문제, 요약 자료, 학습 가이드를 확인하세요.',
}

export default async function ExamListPage() {
  const [exams, resources, jeongchogiStats] = await Promise.all([
    getExams(),
    getResources(),
    getJeongchogiContentStats(),
  ])

  const examsWithRealStats = exams.map((exam) => ({
    ...exam,
    questionCount: exam.slug === 'jeongchogi' ? jeongchogiStats.questionCount : 0,
    resourceCount: resources.filter((resource) => resource.examSlug === exam.slug).length,
  }))

  return (
    <section className="max-w-6xl mx-auto px-4 py-12">
      <div className="mb-8">
        <p className="text-[13px] font-semibold text-[var(--primary)] mb-2">시험별 학습 허브</p>
        <h1 className="text-3xl font-bold text-[var(--text-primary)]">어떤 자격증을 준비하나요?</h1>
        <p className="text-[15px] text-[var(--text-secondary)] mt-3">
          시험 정보, 기출문제, 요약 자료를 자격증별로 모아두었습니다.
        </p>
      </div>

      <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
        {examsWithRealStats.map((exam) => (
          <ExamCard key={exam.slug} exam={exam} />
        ))}
      </div>
    </section>
  )
}
