import HeroSection from '@/components/home/HeroSection'
import PopularResources from '@/components/home/PopularResources'
import {
  TodayQuestion,
  ExamCategories,
  TrustStats,
  RecentReviews,
  PremiumBanner,
} from '@/components/home/HomeSections'

export default function HomePage() {
  return (
    <>
      <HeroSection />
      <TodayQuestion />
      <PopularResources />
      <ExamCategories />
      <TrustStats />
      <RecentReviews />
      <PremiumBanner />
    </>
  )
}
