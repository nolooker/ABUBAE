import type { Metadata } from 'next'
import Link from 'next/link'
import { getContentFeed } from '@/lib/content-feed'

export const metadata: Metadata = {
  title: '합격후기',
  description:
    '정처기와 자격증 준비 경험, 공부 기간, 회독 방식, 재시험 경험을 모아보는 아부배 합격후기 페이지입니다.',
  alternates: {
    canonical: '/reviews',
  },
  openGraph: {
    title: '아부배 합격후기',
    description:
      '정처기와 자격증 준비 경험, 공부 기간, 회독 방식, 재시험 경험을 모아보는 아부배 합격후기 페이지입니다.',
    url: 'https://abubae.vercel.app/reviews',
    type: 'website',
  },
  twitter: {
    card: 'summary_large_image',
    title: '아부배 합격후기',
    description:
      '정처기와 자격증 준비 경험, 공부 기간, 회독 방식, 재시험 경험을 모아보는 아부배 합격후기 페이지입니다.',
  },
  robots: {
    index: true,
    follow: true,
  },
}

export default async function ReviewsPage() {
  const posts = await getContentFeed('review')

  const jsonLd = {
    '@context': 'https://schema.org',
    '@type': 'CollectionPage',
    name: '아부배 합격후기',
    description:
      '정처기와 자격증 준비 경험, 공부 기간, 회독 방식, 재시험 경험을 모아보는 아부배 합격후기 페이지입니다.',
    url: 'https://abubae.vercel.app/reviews',
    inLanguage: 'ko-KR',
    isPartOf: {
      '@type': 'WebSite',
      name: '아부배',
      url: 'https://abubae.vercel.app',
    },
    hasPart: posts.map((post) => ({
      '@type': 'Article',
      headline: post.title,
      datePublished: post.createdAt,
      url: `https://abubae.vercel.app/reviews#${post.slug}`,
      description: post.excerpt,
    })),
  }

  return (
    <section className="min-h-[calc(100vh-12rem)] border-b border-[var(--border)] bg-[var(--bg-subtle)]">
      <script
        type="application/ld+json"
        dangerouslySetInnerHTML={{ __html: JSON.stringify(jsonLd) }}
      />

      <div className="mx-auto max-w-6xl px-4 py-12">
        <div className="mb-8 max-w-3xl">
          <p className="mb-2 text-[13px] font-bold text-[var(--primary)]">REVIEWS</p>
          <h1 className="text-3xl font-bold text-[var(--text-primary)]">합격 흐름이 보이는 후기 모음</h1>
          <p className="mt-3 text-[15px] leading-7 text-[var(--text-secondary)]">
            공부 기간, 회독 방식, 막혔던 구간, 재시험 경험을 중심으로 실제 후기를 모아둡니다. 검색에서
            들어온 사람도 바로 자신의 상황과 비슷한 사례를 찾을 수 있게 쌓아갈 거예요.
          </p>
          <div className="mt-5 flex flex-wrap gap-3 text-sm">
            <Link href="/exam/jeongchogi" className="ab-btn ab-btn-secondary ab-btn-sm">
              정처기 허브 보기
            </Link>
            <Link href="/quiz/daily" className="ab-btn ab-btn-secondary ab-btn-sm">
              오늘의 문제 보기
            </Link>
            <Link href="/board" className="ab-btn ab-btn-secondary ab-btn-sm">
              자유게시판 가기
            </Link>
          </div>
        </div>

        <div className="grid gap-4 md:grid-cols-2">
          {posts.map((post) => (
            <article
              key={post.id}
              id={post.slug}
              className="ab-card p-6"
            >
              <div className="mb-3 flex flex-wrap items-center gap-3">
                <span className="ab-badge ab-badge-pro">{post.badge}</span>
                <span className="text-xs text-[var(--text-muted)]">{post.createdAt}</span>
                <span className="text-xs text-[var(--text-muted)]">조회 {post.viewCount}</span>
              </div>
              <h2 className="text-lg font-bold leading-7 text-[var(--text-primary)]">{post.title}</h2>
              <p className="mt-3 text-sm leading-7 text-[var(--text-secondary)]">{post.excerpt}</p>
              <div className="mt-5">
                <Link href={`/reviews/${post.slug}`} className="ab-btn ab-btn-secondary ab-btn-sm">
                  후기 읽기
                </Link>
              </div>
            </article>
          ))}
        </div>
      </div>
    </section>
  )
}
