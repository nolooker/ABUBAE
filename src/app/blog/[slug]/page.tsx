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

      <div className="mx-auto max-w-4xl px-4 py-12">
        <div className="mb-8">
          <Link href="/blog" className="text-sm font-semibold text-[var(--primary)]">
            블로그 목록으로
          </Link>
          <div className="mt-4 flex flex-wrap items-center gap-3">
            <span className="ab-badge ab-badge-exam">{post.badge}</span>
            <span className="text-xs text-[var(--text-muted)]">{post.displayDate}</span>
            <span className="text-xs text-[var(--text-muted)]">조회 {post.viewCount}</span>
          </div>
          <h1 className="mt-4 text-3xl font-bold leading-tight text-[var(--text-primary)]">{post.title}</h1>
          <p className="mt-4 text-base leading-8 text-[var(--text-secondary)]">{post.excerpt}</p>
        </div>

        <article className="ab-card p-8">
          <div className="space-y-5 text-[15px] leading-8 text-[var(--text-primary)]">
            {post.content
              .split(/\n{2,}/)
              .map((paragraph) => paragraph.trim())
              .filter(Boolean)
              .map((paragraph, index) => (
                <p key={`${post.id}-paragraph-${index}`}>{paragraph}</p>
              ))}
          </div>
        </article>

        {relatedPosts.length > 0 && (
          <section className="mt-8">
            <h2 className="mb-4 text-xl font-bold text-[var(--text-primary)]">같이 보면 좋은 글</h2>
            <div className="grid gap-4 md:grid-cols-3">
              {relatedPosts.map((item) => (
                <article key={item.id} className="ab-card p-5">
                  <p className="text-xs text-[var(--text-muted)]">{item.displayDate}</p>
                  <h3 className="mt-2 text-base font-bold leading-7 text-[var(--text-primary)]">{item.title}</h3>
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
