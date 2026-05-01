import type { Metadata } from 'next'
import Link from 'next/link'
import { notFound } from 'next/navigation'
import { getContentDetail, getContentFeed, getContentSlugs } from '@/lib/content-feed'

type BlogDetailPageProps = {
  params: Promise<{
    slug: string
  }>
}

export async function generateStaticParams() {
  const slugs = await getContentSlugs('blog')
  return slugs.map((slug) => ({ slug }))
}

export async function generateMetadata({ params }: BlogDetailPageProps): Promise<Metadata> {
  const { slug } = await params
  const post = await getContentDetail('blog', slug)

  if (!post) {
    return {
      title: '블로그',
    }
  }

  return {
    title: post.title,
    description: post.excerpt,
    alternates: {
      canonical: `/blog/${post.slug}`,
    },
    openGraph: {
      title: post.title,
      description: post.excerpt,
      url: `https://abubae.vercel.app/blog/${post.slug}`,
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

export default async function BlogDetailPage({ params }: BlogDetailPageProps) {
  const { slug } = await params
  const post = await getContentDetail('blog', slug)

  if (!post) {
    notFound()
  }

  const relatedPosts = (await getContentFeed('blog'))
    .filter((item) => item.slug !== post.slug)
    .slice(0, 3)

  const paragraphs = post.content
    .split(/\n{2,}/)
    .map((paragraph) => paragraph.trim())
    .filter(Boolean)

  const jsonLd = {
    '@context': 'https://schema.org',
    '@type': 'BlogPosting',
    headline: post.title,
    description: post.excerpt,
    datePublished: post.createdAt,
    dateModified: post.createdAt,
    url: `https://abubae.vercel.app/blog/${post.slug}`,
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
          <Link href="/blog" className="text-sm font-semibold text-[var(--primary)]">
            블로그 목록으로
          </Link>
          <div className="mt-5 flex flex-wrap items-center gap-3">
            <span className="ab-badge ab-badge-exam">{post.badge}</span>
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
              <p className="text-xs font-bold tracking-[0.16em] text-[var(--primary)]">READING NOTE</p>
              <p className="mt-3 text-sm leading-7 text-[var(--text-secondary)]">
                이 글은 기출문제 흐름, 공부 루틴, 운영 메모를 정리해두는 아부배 블로그 아카이브입니다. 읽고
                끝나는 글보다 다음 페이지로 이어지는 글이 되도록 구성하고 있습니다.
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
                <Link href="/exam/jeongchogi/questions" className="ab-btn ab-btn-secondary ab-btn-sm w-full">
                  기출문제 바로 가기
                </Link>
                <Link href="/resources" className="ab-btn ab-btn-secondary ab-btn-sm w-full">
                  자료실 보기
                </Link>
              </div>
            </div>

            <div className="rounded-2xl border border-[var(--border)] bg-white p-5 shadow-sm">
              <p className="text-xs font-bold tracking-[0.16em] text-[var(--primary)]">THIS PAGE</p>
              <p className="mt-3 text-sm leading-7 text-[var(--text-secondary)]">
                지금은 상세 읽기 경험을 먼저 정리한 단계입니다. 이후에는 글 본문 안에 과목 허브, 회차,
                자료실로 이어지는 내부 링크를 더 촘촘하게 붙일 예정입니다.
              </p>
            </div>
          </aside>
        </div>

        {relatedPosts.length > 0 && (
          <section className="mt-12">
            <div className="mb-5 flex items-center justify-between gap-4">
              <div>
                <p className="text-xs font-bold tracking-[0.16em] text-[var(--primary)]">RELATED POSTS</p>
                <h2 className="mt-2 text-2xl font-bold text-[var(--text-primary)]">같이 보면 좋은 글</h2>
              </div>
              <Link href="/blog" className="text-sm font-semibold text-[var(--text-secondary)] hover:text-[var(--text-primary)]">
                전체 보기
              </Link>
            </div>

            <div className="grid gap-4 md:grid-cols-3">
              {relatedPosts.map((item) => (
                <article key={item.id} className="rounded-2xl border border-[var(--border)] bg-white p-5 shadow-sm">
                  <div className="flex items-center gap-2">
                    <span className="ab-badge ab-badge-exam">{item.badge}</span>
                    <span className="text-xs text-[var(--text-muted)]">{item.displayDate}</span>
                  </div>
                  <h3 className="mt-3 text-base font-bold leading-7 text-[var(--text-primary)]">{item.title}</h3>
                  <p className="mt-2 text-sm leading-6 text-[var(--text-secondary)]">{item.excerpt}</p>
                  <div className="mt-4">
                    <Link href={`/blog/${item.slug}`} className="ab-btn ab-btn-secondary ab-btn-sm">
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
