import HeroSection from '@/components/home/HeroSection'
import PopularResources from '@/components/home/PopularResources'
import {
  TodayQuestion,
  ExamCategories,
} from '@/components/home/HomeSections'
import { getDailyQuestion, getExam, getExams, getResources } from '@/lib/data'

export default async function HomePage() {
  // [기능] 홈에서 필요한 데이터만 먼저 불러옵니다.
  // - exams: 시험별 이동 카드
  // - resources: 홈에 보여줄 PDF/자료 카드
  // - dailyQuestion: 오늘의 문제 미리보기
  const [exams, resources, dailyQuestion] = await Promise.all([
    getExams(),
    getResources(),
    getDailyQuestion(),
  ])
  const dailyExam = await getExam(dailyQuestion.examSlug)

  return (
    <>
      {/* [화면 1] 첫 방문자가 바로 보는 브랜드 소개 영역 */}
      <HeroSection />

      {/* [화면 2] 꿈꾸는 라이언처럼 깔끔하게 자료를 먼저 진열하는 영역 */}
      <PopularResources resources={resources} />

      {/* [화면 3] 재방문 이유를 만드는 오늘의 문제 영역 */}
      <TodayQuestion
        question={dailyQuestion}
        examName={dailyExam?.shortName || dailyExam?.name || '오늘의 시험'}
      />

      {/* [화면 4] 시험별 상세 페이지로 이동하는 영역 */}
      <ExamCategories exams={exams} />

      {/*
        [나중에 다시 켤 수 있는 영역]
        홈이 복잡해질 수 있어서 지금은 숨겨둡니다.
        필요해지면 HomeSections.tsx의 LatestContent, ConversionStrip을 import해서 아래에 추가하면 됩니다.
      */}
    </>
  )
}
