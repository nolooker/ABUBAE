import type { Metadata } from 'next'
import './globals.css'
import Header from '@/components/layout/Header'
import Footer from '@/components/layout/Footer'

export const metadata: Metadata = {
  title: {
    default: '아부배 — 자격증 합격, 여기서 시작하세요',
    template: '%s | 아부배',
  },
  description: '기출문제, 요약노트, 합격 후기까지 한 곳에서. 정보처리기사, SQLD, 컴퓨터활용능력 자격증 학습 플랫폼.',
  keywords: ['정보처리기사', 'SQLD', '컴퓨터활용능력', '자격증', '기출문제', '요약노트'],
  openGraph: {
    type: 'website',
    locale: 'ko_KR',
    siteName: '아부배',
  },
}

export default function RootLayout({ children }: { children: React.ReactNode }) {
  return (
    <html lang="ko">
      <body className="min-h-screen flex flex-col">
        <Header />
        <main className="flex-1">
          {children}
        </main>
        <Footer />
      </body>
    </html>
  )
}
