import Link from 'next/link'
import Image from 'next/image'
import { FileText, Newspaper, Sparkles } from 'lucide-react'

// [이미지] 홈 첫 화면 배경 이미지입니다.
// 파일을 바꾸고 싶으면 public/images/home-hero.png를 교체하면 됩니다.
const heroImage = '/images/home-hero-mentor.png'

// [화면 데이터] 히어로 아래에 붙는 빠른 이동 버튼입니다.
// label/href/icon만 바꾸면 화면 버튼이 바뀝니다.
const quickLinks = [
  { label: '공지사항', href: '/blog', icon: Newspaper },
  { label: '자료실', href: '/resources', icon: FileText },
  { label: '오늘의 문제', href: '/quiz/daily', icon: Sparkles },
]

export default function HeroSection() {
  return (
    <section className="relative overflow-hidden border-b border-[var(--border)] bg-white">
      {/* [화면] 히어로 배경 이미지. 텍스트가 읽히도록 왼쪽에 밝은 오버레이를 깔았습니다. */}
      <Image
        src={heroImage}
        alt="자격증 공부 자료와 태블릿이 놓인 학습 데스크"
        fill
        priority
        sizes="100vw"
        className="object-cover object-center"
      />
      <div className="absolute inset-0 bg-gradient-to-r from-white via-white/90 to-white/20" />
      <div className="absolute inset-0 bg-gradient-to-t from-white/70 via-transparent to-transparent" />

      <div className="relative max-w-6xl mx-auto flex min-h-[520px] items-center px-4 py-20 md:min-h-[640px] md:py-24">
        <div className="max-w-xl">
          {/* [화면] 홈에서 가장 먼저 읽히는 문장입니다. 너무 길게 쓰지 않는 게 좋습니다. */}
          <h1 className="text-3xl md:text-5xl font-bold tracking-tight text-[var(--text-primary)]">
            아직 부족해도 괜찮은 배움
          </h1>
          <p className="mt-4 text-[15px] md:text-[17px] leading-relaxed text-[var(--text-secondary)]">
            자격증 공부가 막막할 때, 오늘 볼 자료와 풀 문제를 차근차근 정리해드립니다.
          </p>

          {/* [화면] 사용자가 바로 이동할 수 있는 핵심 버튼 3개 */}
          <div className="mt-7 flex flex-wrap gap-2">
            {quickLinks.map((item) => {
              const Icon = item.icon

              return (
                <Link
                  key={item.label}
                  href={item.href}
                  className="inline-flex items-center gap-1.5 rounded-full border border-white/80 bg-white/90 px-4 py-2 text-[13px] font-bold text-[var(--text-primary)] shadow-sm backdrop-blur transition-colors hover:border-[var(--primary)] hover:text-[var(--primary)]"
                >
                  <Icon size={14} />
                  {item.label}
                </Link>
              )
            })}
          </div>

          {/* [화면] 보조 이동 링크입니다. Admin은 공개 홈에서 숨겼고 /admin/login 주소로 직접 들어가면 됩니다. */}
          <div className="mt-5 flex gap-3 text-[13px] font-semibold text-[var(--text-secondary)]">
            <Link href="/exam" className="hover:text-[var(--primary)]">
              시험별 학습
            </Link>
            <span aria-hidden="true">·</span>
            <Link href="/resources" className="hover:text-[var(--primary)]">
              PDF 자료
            </Link>
          </div>
        </div>
      </div>
    </section>
  )
}
