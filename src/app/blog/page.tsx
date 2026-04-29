import type { Metadata } from 'next'
import Link from 'next/link'
import { getContentFeed } from '@/lib/content-feed'

export const metadata: Metadata = {
  title: '블로그',
  description:
    '정처기 공부법, 기출 정리, 학습 루틴, 운영 메모를 모아보는 아부배 블로그입니다.',
  alternates: {
    canonical: '/blog',
  },
  openGraph: {
    title: '아부배 블로그',
    description: '정처기 공부법, 기출 정리, 학습 루틴, 운영 메모를 모아보는 아부배 블로그입니다.',
    url: 'https://abubae.vercel.app/blog',
    type: 'website',
  },
  twitter: {
    card: 'summary_large_image',
    title: '아부배 블로그',
    description: '정처기 공부법, 기출 정리, 학습 루틴, 운영 메모를 모아보는 아부배 블로그입니다.',
  },
  robots: {
    index: true,
    follow: true,
  },
}

export default async function BlogPage() {
  const posts = await getContentFeed('blog')

  const jsonLd = {
    '@context': 'https://schema.org',
    '@type': 'CollectionPage',
    name: '아부배 블로그',
    description: '정처기 공부법, 기출 정리, 학습 루틴, 운영 메모를 모아보는 아부배 블로그입니다.',
    url: 'https://abubae.vercel.app/blog',
    inLanguage: 'ko-KR',
    isPartOf: {
      '@type': 'WebSite',
      name: '아부배',
      url: 'https://abubae.vercel.app',
    },
    hasPart: posts.map((post) => ({
      '@type': 'BlogPosting',
      headline: post.title,
      datePublished: post.createdAt,
      url: `https://abubae.vercel.app/blog#${post.slug}`,
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
          <p className="mb-2 text-[13px] font-bold text-[var(--primary)]">BLOG</p>
          <h1 className="text-3xl font-bold text-[var(--text-primary)]">공부 흐름을 정리하는 블로그</h1>
          <p className="mt-3 text-[15px] leading-7 text-[var(--text-secondary)]">
            정처기 공부법, 최신 기출 정리, 학습 루틴, 운영 메모를 차곡차곡 쌓아두는 공간입니다. 검색으로
            들어온 사람이 바로 다음 공부 흐름을 잡을 수 있게 정리해둘 거예요.
          </p>
          <div className="mt-5 flex flex-wrap gap-3 text-sm">
            <Link href="/exam/jeongchogi" className="ab-btn ab-btn-secondary ab-btn-sm">
              정처기 허브 보기
            </Link>
            <Link href="/exam/jeongchogi/questions" className="ab-btn ab-btn-secondary ab-btn-sm">
              기출문제 바로 가기
            </Link>
            <Link href="/resources" className="ab-btn ab-btn-secondary ab-btn-sm">
              자료실 보기
            </Link>
          </div>
        </div>

        <div className="grid gap-4">
          {posts.map((post) => (
            <article
              key={post.id}
              id={post.slug}
              className="ab-card p-6"
            >
              <div className="mb-3 flex flex-wrap items-center gap-3">
                <span className="ab-badge ab-badge-exam">{post.badge}</span>
                <span className="text-xs text-[var(--text-muted)]">{post.createdAt}</span>
                <span className="text-xs text-[var(--text-muted)]">조회 {post.viewCount}</span>
              </div>
              <h2 className="text-xl font-bold text-[var(--text-primary)]">{post.title}</h2>
              <p className="mt-3 text-sm leading-7 text-[var(--text-secondary)]">{post.excerpt}</p>
              <div className="mt-5">
                <Link href={`/blog/${post.slug}`} className="ab-btn ab-btn-secondary ab-btn-sm">
                  자세히 읽기
                </Link>
              </div>
            </article>
          ))}
        </div>
      </div>
    </section>
  )
}
