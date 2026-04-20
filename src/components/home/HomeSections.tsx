import Link from 'next/link'
import { ArrowRight, CheckCircle, ChevronRight } from 'lucide-react'

// ─── 오늘의 문제 ───────────────────────────────────────────
export function TodayQuestion() {
  return (
    <section className="bg-[var(--primary-light)] border-y border-blue-100">
      <div className="max-w-6xl mx-auto px-4 py-10">
        <div className="max-w-2xl mx-auto">
          <div className="flex items-center gap-2 mb-4">
            <span className="w-2 h-2 rounded-full bg-[var(--primary)] animate-pulse" />
            <span className="text-[12px] font-semibold text-[var(--primary)] uppercase tracking-wide">오늘의 문제</span>
          </div>

          <div className="bg-white rounded-[var(--radius-lg)] border border-blue-100 p-5 shadow-sm">
            <div className="flex items-center gap-2 mb-3">
              <span className="text-[11px] font-semibold px-2 py-0.5 rounded-full bg-blue-50 text-blue-700">정처기</span>
              <span className="text-[11px] text-[var(--text-muted)]">2023년 2회 · 1과목</span>
            </div>

            <p className="text-[14px] font-medium text-[var(--text-primary)] leading-relaxed mb-4">
              소프트웨어 설계에서 요구사항 분석 기법 중 구조적 분석 기법에 해당하지 않는 것은?
            </p>

            <div className="grid grid-cols-1 sm:grid-cols-2 gap-2 mb-4">
              {['데이터 흐름도(DFD)', '자료 사전(DD)', '유스케이스 다이어그램', '소단위 명세서(Mini-Spec)'].map((opt, i) => (
                <div key={i} className="flex items-center gap-2.5 p-2.5 rounded-lg border border-[var(--border)] text-[13px] text-[var(--text-secondary)] cursor-default hover:bg-[var(--bg-muted)] transition-colors">
                  <span className="w-5 h-5 rounded-full bg-[var(--bg-muted)] flex items-center justify-center text-[11px] font-semibold shrink-0">
                    {i + 1}
                  </span>
                  {opt}
                </div>
              ))}
            </div>

            <Link
              href="/quiz/daily"
              className="flex items-center justify-center gap-1.5 w-full py-2.5 bg-[var(--primary)] text-white text-[13px] font-semibold rounded-lg hover:bg-[var(--primary-hover)] transition-colors"
            >
              정답 확인하고 풀러가기 <ArrowRight size={14} />
            </Link>
          </div>
        </div>
      </div>
    </section>
  )
}

// ─── 시험 카테고리 ─────────────────────────────────────────
const exams = [
  { name: '정보처리기사', slug: 'jeongchogi', emoji: '💻', count: '기출 120문제' },
  { name: 'SQLD', slug: 'sqld', emoji: '🗄️', count: '기출 80문제' },
  { name: '컴퓨터활용능력', slug: 'comhwal', emoji: '📊', count: '기출 60문제' },
  { name: '한국사능력검정', slug: 'history', emoji: '📜', count: '준비 중' },
  { name: '사회조사분석사', slug: 'social', emoji: '📋', count: '준비 중' },
  { name: '더보기', slug: '', emoji: '➕', count: '곧 추가예요' },
]

export function ExamCategories() {
  return (
    <section className="bg-[var(--bg-subtle)] border-y border-[var(--border)]">
      <div className="max-w-6xl mx-auto px-4 py-14">
        <h2 className="text-[20px] font-bold text-[var(--text-primary)] mb-6">시험별 바로가기</h2>
        <div className="grid grid-cols-2 sm:grid-cols-3 lg:grid-cols-6 gap-3">
          {exams.map((exam) => (
            <Link
              key={exam.slug || exam.name}
              href={exam.slug ? `/exam/${exam.slug}` : '/exam'}
              className="flex flex-col items-center gap-2 p-4 bg-white rounded-[var(--radius-lg)] border border-[var(--border)] hover:border-[var(--primary)] hover:shadow-sm transition-all text-center group"
            >
              <span className="text-2xl">{exam.emoji}</span>
              <p className="text-[13px] font-semibold text-[var(--text-primary)] group-hover:text-[var(--primary)] transition-colors leading-tight">
                {exam.name}
              </p>
              <p className="text-[11px] text-[var(--text-muted)]">{exam.count}</p>
            </Link>
          ))}
        </div>
      </div>
    </section>
  )
}

// ─── 신뢰 지표 ─────────────────────────────────────────────
const stats = [
  { value: '12,400+', label: '함께 공부 중' },
  { value: '340+', label: '학습 자료' },
  { value: '890+', label: '합격 후기' },
  { value: '무료', label: '시작 비용' },
]

export function TrustStats() {
  return (
    <section className="max-w-6xl mx-auto px-4 py-10">
      <div className="grid grid-cols-2 lg:grid-cols-4 gap-4">
        {stats.map((s) => (
          <div key={s.label} className="text-center p-4 rounded-[var(--radius-lg)] bg-[var(--bg-subtle)] border border-[var(--border)]">
            <p className="text-[24px] font-bold text-[var(--primary)]">{s.value}</p>
            <p className="text-[12px] text-[var(--text-secondary)] mt-0.5">{s.label}</p>
          </div>
        ))}
      </div>
    </section>
  )
}

// ─── 합격 후기 ─────────────────────────────────────────────
const reviews = [
  {
    name: '김○○',
    exam: '정보처리기사',
    duration: '2개월',
    text: '요약노트 덕분에 핵심만 빠르게 정리할 수 있었어요. 필기는 3주, 실기는 5주 만에 합격했습니다!',
    date: '2024.03',
  },
  {
    name: '이○○',
    exam: 'SQLD',
    duration: '3주',
    text: '기출문제 풀이 해설이 정말 자세해서 이해가 쏙쏙 됐어요. 직장인도 충분히 가능합니다.',
    date: '2024.02',
  },
  {
    name: '박○○',
    exam: '정보처리기사',
    duration: '6주',
    text: '커뮤니티에서 스터디 그룹 만들어서 같이 공부했는데 동기부여가 정말 많이 됐어요!',
    date: '2024.01',
  },
]

export function RecentReviews() {
  return (
    <section className="max-w-6xl mx-auto px-4 py-14">
      <div className="flex items-center justify-between mb-6">
        <div>
          <h2 className="text-[20px] font-bold text-[var(--text-primary)]">합격 후기</h2>
          <p className="text-[13px] text-[var(--text-secondary)] mt-0.5">실제 합격자들의 공부 이야기</p>
        </div>
        <Link href="/reviews" className="flex items-center gap-1 text-[13px] font-medium text-[var(--primary)] hover:underline">
          더 보기 <ArrowRight size={13} />
        </Link>
      </div>

      <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
        {reviews.map((r) => (
          <div key={r.name} className="bg-white border border-[var(--border)] rounded-[var(--radius-lg)] p-5">
            <div className="flex items-center gap-2 mb-3">
              <div className="w-8 h-8 rounded-full bg-[var(--primary-light)] flex items-center justify-center text-[13px] font-bold text-[var(--primary)]">
                {r.name[0]}
              </div>
              <div>
                <p className="text-[13px] font-semibold text-[var(--text-primary)]">{r.name}</p>
                <p className="text-[11px] text-[var(--text-muted)]">{r.exam} · {r.duration} 합격</p>
              </div>
              <div className="ml-auto flex items-center gap-1 text-[var(--success)]">
                <CheckCircle size={14} strokeWidth={2.5} />
                <span className="text-[11px] font-semibold">합격</span>
              </div>
            </div>
            <p className="text-[13px] text-[var(--text-secondary)] leading-relaxed">{r.text}</p>
            <p className="text-[11px] text-[var(--text-muted)] mt-3">{r.date}</p>
          </div>
        ))}
      </div>
    </section>
  )
}

// ─── 프리미엄 CTA 배너 ─────────────────────────────────────
export function PremiumBanner() {
  return (
    <section className="max-w-6xl mx-auto px-4 pb-14">
      <div className="relative overflow-hidden bg-gradient-to-r from-[var(--primary)] to-blue-600 rounded-2xl p-8 md:p-10">
        {/* 배경 장식 */}
        <div className="absolute -top-8 -right-8 w-48 h-48 rounded-full bg-white/10" />
        <div className="absolute -bottom-10 -right-16 w-64 h-64 rounded-full bg-white/5" />

        <div className="relative flex flex-col md:flex-row items-start md:items-center justify-between gap-6">
          <div>
            <p className="text-[12px] font-semibold text-blue-200 uppercase tracking-wide mb-2">
              프리미엄 자료
            </p>
            <h3 className="text-[22px] font-bold text-white leading-tight mb-2">
              핵심만 담은 요약 PDF<br />시험 2주 전, 이것만 보세요
            </h3>
            <p className="text-[14px] text-blue-100">
              실제 합격자가 정리한 압축 요약 · 고화질 인쇄 가능
            </p>
          </div>

          <div className="flex flex-col sm:flex-row gap-2 shrink-0">
            <Link
              href="/resources"
              className="flex items-center gap-1.5 px-5 py-2.5 bg-white text-[var(--primary)] text-[14px] font-bold rounded-xl hover:bg-blue-50 transition-colors"
            >
              자료 둘러보기 <ChevronRight size={16} />
            </Link>
            <Link
              href="/premium"
              className="flex items-center gap-1.5 px-5 py-2.5 bg-white/20 text-white text-[14px] font-semibold rounded-xl hover:bg-white/30 transition-colors border border-white/30"
            >
              프리미엄 알아보기
            </Link>
          </div>
        </div>
      </div>
    </section>
  )
}
