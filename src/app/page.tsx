import HeroSection from '@/components/home/HeroSection'
import PopularResources from '@/components/home/PopularResources'
import {
  TodayQuestion,
  ExamCategories,
} from '@/components/home/HomeSections'
import { getDailyQuestion, getExam, getExams, getResources } from '@/lib/data'

export default async function HomePage() {
  const [exams, resources, dailyQuestion] = await Promise.all([
    getExams(),
    getResources(),
    getDailyQuestion(),
  ])
  const dailyExam = await getExam(dailyQuestion.examSlug)

  return (
    <>
      <HeroSection />
      <PopularResources resources={resources} />
      <TodayQuestion question={dailyQuestion} examName={dailyExam?.shortName || dailyExam?.name || '오늘의 시험'} />
      <ExamCategories exams={exams} />
    </>
  )
}
