import { createClient } from '@/lib/supabase/server'

export type ContentFeedType = 'blog' | 'review'

export type ContentFeedItem = {
  id: string
  type: ContentFeedType
  title: string
  slug: string
  excerpt: string
  content: string
  createdAt: string
  displayDate: string
  viewCount: number
  badge: string
}

type PostRow = {
  id: string
  type: ContentFeedType
  title: string
  slug: string
  content: string | null
  created_at: string
  view_count: number | null
}

const blogFallback: ContentFeedItem[] = [
  {
    id: 'blog-fallback-1',
    type: 'blog',
    title: '정처기 최신 기출을 먼저 보는 이유',
    slug: 'why-latest-questions-first',
    excerpt:
      '최신 회차부터 정리하면 실제 출제 경향과 이미지 문제 대응 방식을 더 빠르게 잡을 수 있습니다.',
    content:
      '최신 회차부터 보는 이유는 단순히 새 문제라서가 아닙니다. 실제 출제 경향, 문제 문장 길이, 이미지 문제 비중이 최근 회차에 더 잘 드러나기 때문입니다. 아부배에서는 최신 회차부터 정리하고, 이후 구회차를 보강하는 방식으로 학습 흐름을 잡아가려 합니다.',
    createdAt: '2026-04-29',
    displayDate: '2026.04.29',
    viewCount: 124,
    badge: '운영 노트',
  },
  {
    id: 'blog-fallback-2',
    type: 'blog',
    title: '요약노트와 기출문제를 같이 보는 가장 쉬운 순서',
    slug: 'notes-and-questions-routine',
    excerpt:
      '요약노트로 큰 구조를 먼저 잡고, 바로 기출문제로 연결하는 루틴이 재시험 준비에도 가장 안정적으로 먹힙니다.',
    content:
      '공부 흐름이 자주 끊기는 이유는 자료와 문제풀이가 분리되어 있기 때문입니다. 요약노트로 구조를 먼저 보고, 같은 주제의 기출문제를 바로 이어서 풀면 이해가 오래 남습니다. 이 흐름을 페이지 구조에도 계속 반영할 예정입니다.',
    createdAt: '2026-04-27',
    displayDate: '2026.04.27',
    viewCount: 88,
    badge: '학습 가이드',
  },
  {
    id: 'blog-fallback-3',
    type: 'blog',
    title: '혼자 공부하는 사람을 위한 오늘의 문제 활용법',
    slug: 'daily-quiz-routine',
    excerpt:
      '짧게라도 매일 문제를 열어보게 만드는 장치가 있어야 다시 돌아오게 됩니다. 오늘의 문제는 그 시작점입니다.',
    content:
      '재방문을 유도하는 기능은 많아 보이지만 실제로 남는 건 습관입니다. 오늘의 문제는 길게 공부하지 못하는 날에도 플랫폼을 다시 열게 만드는 최소 단위의 진입점입니다. 이후에는 오답 기록, 회차 연결, 자료 추천까지 이어붙일 수 있습니다.',
    createdAt: '2026-04-25',
    displayDate: '2026.04.25',
    viewCount: 65,
    badge: '기능 소개',
  },
]

const reviewFallback: ContentFeedItem[] = [
  {
    id: 'review-fallback-1',
    type: 'review',
    title: '비전공자 정처기 필기 4주 합격 후기',
    slug: 'jeongchogi-written-4weeks',
    excerpt:
      '기출 위주로 반복하고, 틀린 문제만 따로 모아서 다시 보는 방식으로 4주 안에 감을 잡았습니다.',
    content:
      '처음에는 교재를 처음부터 끝까지 보려다가 금방 지쳤습니다. 이후 회차별 기출문제를 먼저 풀고, 틀린 문제만 따로 적어 다시 보는 방식으로 바꾸자 훨씬 진도가 붙었습니다. 모르는 개념은 요약노트에서만 짧게 보충했습니다.',
    createdAt: '2026-04-28',
    displayDate: '2026.04.28',
    viewCount: 203,
    badge: '4주 합격',
  },
  {
    id: 'review-fallback-2',
    type: 'review',
    title: '직장인 기준 주말 2회 학습으로 실기 준비한 기록',
    slug: 'practical-weekend-routine',
    excerpt:
      '실기는 답안 구조를 짧게라도 직접 써보는 시간이 중요했고, 긴 설명보다 키워드 중심 복습이 도움이 됐습니다.',
    content:
      '평일에는 시간을 길게 내기 어려워서 주말에만 실기 답안을 직접 써봤습니다. 핵심은 완벽한 문장을 만드는 것보다 답안 키워드를 반복해서 익히는 것이었습니다. 답안은 짧게 써도 구조가 유지되면 복습 속도가 빨라졌습니다.',
    createdAt: '2026-04-26',
    displayDate: '2026.04.26',
    viewCount: 151,
    badge: '직장인 루틴',
  },
  {
    id: 'review-fallback-3',
    type: 'review',
    title: '재시험 응시자가 기출 회독 방식을 바꿔서 붙은 사례',
    slug: 'retake-question-loop',
    excerpt:
      '처음에는 무작정 많이 푸는 데 집중했지만, 두 번째부터는 회차별 약점 기록이 훨씬 중요했습니다.',
    content:
      '재시험 때는 회독 수를 늘리는 것보다 어떤 회차에서 어떤 유형을 틀렸는지 적는 게 훨씬 도움이 됐습니다. 약점 기록이 쌓이니 다음에 같은 실수를 덜 하게 됐고, 문제 풀이 순서도 자연스럽게 정리됐습니다.',
    createdAt: '2026-04-24',
    displayDate: '2026.04.24',
    viewCount: 117,
    badge: '재도전',
  },
]

function formatDateLabel(input: string) {
  const date = new Date(input)
  if (Number.isNaN(date.getTime())) {
    return input
  }

  const year = date.getFullYear()
  const month = `${date.getMonth() + 1}`.padStart(2, '0')
  const day = `${date.getDate()}`.padStart(2, '0')
  return `${year}.${month}.${day}`
}

function buildExcerpt(content: string | null) {
  const normalized = (content || '').replace(/\s+/g, ' ').trim()
  if (!normalized) {
    return '아직 본문 요약이 준비되지 않았습니다.'
  }

  return normalized.length > 110 ? `${normalized.slice(0, 110)}...` : normalized
}

function buildContent(content: string | null, fallbackExcerpt: string) {
  const normalized = (content || '').trim()
  return normalized || fallbackExcerpt
}

function mapPost(row: PostRow): ContentFeedItem {
  const excerpt = buildExcerpt(row.content)

  return {
    id: row.id,
    type: row.type,
    title: row.title,
    slug: row.slug,
    excerpt,
    content: buildContent(row.content, excerpt),
    createdAt: row.created_at,
    displayDate: formatDateLabel(row.created_at),
    viewCount: row.view_count || 0,
    badge: row.type === 'blog' ? '블로그' : '합격후기',
  }
}

function getFallbackByType(type: ContentFeedType) {
  return type === 'blog' ? blogFallback : reviewFallback
}

export async function getContentFeed(type: ContentFeedType): Promise<ContentFeedItem[]> {
  const fallback = getFallbackByType(type)

  try {
    const supabase = await createClient()
    const { data, error } = await supabase
      .from('posts')
      .select('id, type, title, slug, content, created_at, view_count')
      .eq('is_published', true)
      .eq('type', type)
      .order('created_at', { ascending: false })
      .limit(24)

    if (error || !data?.length) {
      return fallback
    }

    return (data as PostRow[]).map(mapPost)
  } catch {
    return fallback
  }
}

export async function getContentDetail(type: ContentFeedType, slug: string): Promise<ContentFeedItem | undefined> {
  try {
    const supabase = await createClient()
    const { data, error } = await supabase
      .from('posts')
      .select('id, type, title, slug, content, created_at, view_count')
      .eq('is_published', true)
      .eq('type', type)
      .eq('slug', slug)
      .maybeSingle()

    if (!error && data) {
      return mapPost(data as PostRow)
    }
  } catch {
    // fallback below
  }

  return getFallbackByType(type).find((item) => item.slug === slug)
}

export async function getContentSlugs(type: ContentFeedType): Promise<string[]> {
  try {
    const supabase = await createClient()
    const { data, error } = await supabase
      .from('posts')
      .select('slug')
      .eq('is_published', true)
      .eq('type', type)

    if (error || !data?.length) {
      return getFallbackByType(type).map((item) => item.slug)
    }

    const slugs = data.map((row) => row.slug).filter(Boolean)
    return slugs.length ? slugs : getFallbackByType(type).map((item) => item.slug)
  } catch {
    return getFallbackByType(type).map((item) => item.slug)
  }
}
