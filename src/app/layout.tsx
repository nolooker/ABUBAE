import type { Metadata } from 'next'
import './globals.css'
import Header from '@/components/layout/Header'
import Footer from '@/components/layout/Footer'

export const metadata: Metadata = {
  metadataBase: new URL('https://abubae.vercel.app'),
  title: {
    default: '아부배 | 자격증 공부를 차근차근 이어가는 곳',
    template: '%s | 아부배',
  },
  description:
    '기출문제, 요약노트, 오늘의 문제, 합격후기까지 한곳에서 이어보는 자격증 학습 플랫폼 아부배입니다.',
  keywords: ['정보처리기사', '정처기', '기출문제', '오늘의 문제', '요약노트', '합격후기', '자격증 공부'],
  alternates: {
    canonical: '/',
  },
  openGraph: {
    type: 'website',
    locale: 'ko_KR',
    url: 'https://abubae.vercel.app',
    siteName: '아부배',
    title: '아부배 | 자격증 공부를 차근차근 이어가는 곳',
    description:
      '기출문제, 요약노트, 오늘의 문제, 합격후기까지 한곳에서 이어보는 자격증 학습 플랫폼 아부배입니다.',
  },
  twitter: {
    card: 'summary_large_image',
    title: '아부배 | 자격증 공부를 차근차근 이어가는 곳',
    description:
      '기출문제, 요약노트, 오늘의 문제, 합격후기까지 한곳에서 이어보는 자격증 학습 플랫폼 아부배입니다.',
  },
  robots: {
    index: true,
    follow: true,
  },
}

export default function RootLayout({ children }: { children: React.ReactNode }) {
  return (
    <html lang="ko">
      <body className="min-h-screen flex flex-col">
        <Header />
        <main className="flex-1">{children}</main>
        <Footer />
      </body>
    </html>
  )
}
