import type { Metadata } from 'next'
import Link from 'next/link'
import { notFound } from 'next/navigation'
import { getContentDetail, getContentFeed, getContentSlugs } from '@/lib/content-feed'

type ReviewDetailPageProps = {
  params: Promise<{
    slug: string
  }>
}

export async function generateStaticParams() {
  const slugs = await getContentSlugs('review')
  return slugs.map((slug) => ({ slug }))
}

export async function generateMetadata({ params }: ReviewDetailPageProps): Promise<Metadata> {
  const { slug } = await params
  const post = await getContentDetail('review', slug)

  if (!post) {
    return {
      title: '합격후기',
    }
  }

  return {
    title: post.title,
    description: post.excerpt,
    alternates: {
      canonical: `/reviews/${post.slug}`,
    },
    openGraph: {
      title: post.title,
      description: post.excerpt,
      url: `https://abubae.vercel.app/reviews/${post.slug}`,
      type: 'article',
    },
    twitter: {
      card: 'summary_large_image',
      title: post.title,
      description: post.excerpt,
    },
    robots: {
      index: true,
      follow: true,
    },
  }
}

export default async function ReviewDetailPage({ params }: ReviewDetailPageProps) {
  const { slug } = await params
  const post = await getContentDetail('review', slug)

  if (!post) {
    notFound()
  }

  const relatedPosts = (await getContentFeed('review'))
    .filter((item) => item.slug !== post.slug)
    .slice(0, 3)

  const paragraphs = post.content
    .split(/\n{2,}/)
    .map((paragraph) => paragraph.trim())
    .filter(Boolean)

  const jsonLd = {
    '@context': 'https://schema.org',
    '@type': 'Article',
    headline: post.title,
    description: post.excerpt,
    datePublished: post.createdAt,
    dateModified: post.createdAt,
    url: `https://abubae.vercel.app/reviews/${post.slug}`,
    inLanguage: 'ko-KR',
    publisher: {
      '@type': 'Organization',
      name: '아부배',
      url: 'https://abubae.vercel.app',
    },
  }

  return (
    <section className="border-b border-[var(--border)] bg-[var(--bg-subtle)]">
      <script
        type="application/ld+json"
        dangerouslySetInnerHTML={{ __html: JSON.stringify(jsonLd) }}
      />

      <div className="mx-auto max-w-6xl px-4 py-12">
        <div className="max-w-4xl">
          <Link href="/reviews" className="text-sm font-semibold text-[var(--primary)]">
            합격후기 목록으로
          </Link>
          <div className="mt-5 flex flex-wrap items-center gap-3">
            <span className="ab-badge ab-badge-pro">{post.badge}</span>
            <span className="text-xs text-[var(--text-muted)]">{post.displayDate}</span>
            <span className="text-xs text-[var(--text-muted)]">조회 {post.viewCount}</span>
          </div>
          <h1 className="mt-5 text-3xl font-bold leading-tight text-[var(--text-primary)] md:text-4xl">
            {post.title}
          </h1>
          <p className="mt-5 max-w-3xl text-[16px] leading-8 text-[var(--text-secondary)]">{post.excerpt}</p>
        </div>

        <div className="mt-10 grid gap-8 lg:grid-cols-[minmax(0,1fr)_280px]">
          <article className="rounded-2xl border border-[var(--border)] bg-white p-7 shadow-sm md:p-10">
            <div className="mb-8 rounded-2xl bg-[var(--bg-subtle)] p-5">
              <p className="text-xs font-bold tracking-[0.16em] text-[var(--primary)]">REVIEW SUMMARY</p>
              <p className="mt-3 text-sm leading-7 text-[var(--text-secondary)]">
                합격후기는 단순 인증보다 공부 흐름을 보여주는 데 집중합니다. 기간, 회독 방식, 막혔던 구간,
                다시 풀어본 문제 유형 같은 요소를 읽기 쉽게 남겨두는 방향으로 다듬고 있습니다.
              </p>
            </div>

            <div className="space-y-6 text-[16px] leading-8 text-[var(--text-primary)]">
              {paragraphs.map((paragraph, index) => (
                <p key={`${post.id}-paragraph-${index}`}>{paragraph}</p>
              ))}
            </div>
          </article>

          <aside className="space-y-4">
            <div className="rounded-2xl border border-[var(--border)] bg-white p-5 shadow-sm">
              <p className="text-xs font-bold tracking-[0.16em] text-[var(--primary)]">NEXT STEP</p>
              <div className="mt-4 space-y-2">
                <Link href="/exam/jeongchogi" className="ab-btn ab-btn-secondary ab-btn-sm w-full">
                  정처기 허브 보기
                </Link>
                <Link href="/quiz/daily" className="ab-btn ab-btn-secondary ab-btn-sm w-full">
                  오늘의 문제 보기
                </Link>
                <Link href="/board" className="ab-btn ab-btn-secondary ab-btn-sm w-full">
                  자유게시판 가기
                </Link>
              </div>
            </div>

            <div className="rounded-2xl border border-[var(--border)] bg-white p-5 shadow-sm">
              <p className="text-xs font-bold tracking-[0.16em] text-[var(--primary)]">READING POINT</p>
              <p className="mt-3 text-sm leading-7 text-[var(--text-secondary)]">
                후기는 길게 써도 좋지만, 실제로는 어떤 순서로 공부했는지가 제일 중요합니다. 이후에는 후기에도
                시험명, 기간, 루틴 같은 메타를 더 촘촘히 붙일 예정입니다.
              </p>
            </div>
          </aside>
        </div>

        {relatedPosts.length > 0 && (
          <section className="mt-12">
            <div className="mb-5 flex items-center justify-between gap-4">
              <div>
                <p className="text-xs font-bold tracking-[0.16em] text-[var(--primary)]">MORE REVIEWS</p>
                <h2 className="mt-2 text-2xl font-bold text-[var(--text-primary)]">비슷한 후기 더 보기</h2>
              </div>
              <Link
                href="/reviews"
                className="text-sm font-semibold text-[var(--text-secondary)] hover:text-[var(--text-primary)]"
              >
                전체 보기
              </Link>
            </div>

            <div className="grid gap-4 md:grid-cols-3">
              {relatedPosts.map((item) => (
                <article key={item.id} className="rounded-2xl border border-[var(--border)] bg-white p-5 shadow-sm">
                  <div className="flex items-center gap-2">
                    <span className="ab-badge ab-badge-pro">{item.badge}</span>
                    <span className="text-xs text-[var(--text-muted)]">{item.displayDate}</span>
                  </div>
                  <h3 className="mt-3 text-base font-bold leading-7 text-[var(--text-primary)]">{item.title}</h3>
                  <p className="mt-2 text-sm leading-6 text-[var(--text-secondary)]">{item.excerpt}</p>
                  <div className="mt-4">
                    <Link href={`/reviews/${item.slug}`} className="ab-btn ab-btn-secondary ab-btn-sm">
                      이어서 보기
                    </Link>
                  </div>
                </article>
              ))}
            </div>
          </section>
        )}
      </div>
    </section>
  )
}
