import { createClient } from '@/lib/supabase/server'
import {
  exams as mockExams,
  getExam as getMockExam,
  getResource as getMockResource,
  questions as mockQuestions,
  resources as mockResources,
} from '@/lib/mock-data'

export type ExamView = (typeof mockExams)[number]
export type ResourceView = (typeof mockResources)[number]

export type QuestionView = {
  id: string
  examSlug: string
  year: number
  round: number
  subject: string
  number: number
  difficulty: number
  content: string
  choices: string[]
  answer: number
  explanation: string
  imageUrl?: string
  imageCaption?: string
}

export type BoardTab = 'notice' | 'free' | 'review'

export type BoardPostView = {
  id: string
  tab: BoardTab
  title: string
  slug: string
  excerpt: string
  authorLabel: string
  meta: string
  createdAt: string
  viewCount: number
}

type ChoiceRow = {
  number: number
  content: string
  is_correct: boolean
}

type QuestionRow = {
  id: string
  exam_id: string
  year: number
  round: number
  subject: string
  number: number
  content: string
  explanation: string | null
  difficulty: number | null
  image_url?: string | null
  image_caption?: string | null
  choices?: ChoiceRow[]
}

type PostRow = {
  id: string
  type: 'blog' | 'notice' | 'review' | 'note'
  title: string
  slug: string
  content: string | null
  created_at: string
  updated_at: string
  view_count: number | null
}

const mockBoardPosts: BoardPostView[] = [
  {
    id: 'notice-1',
    tab: 'notice',
    title: '정처기 필기 최신 회차 업로드 일정 안내',
    slug: 'notice-written-upload-plan',
    excerpt: '최신 회차부터 우선 반영하고, 이미지가 필요한 문제는 순차적으로 보강할 예정입니다.',
    authorLabel: '운영팀',
    meta: '2026.04.28 · 운영팀',
    createdAt: '2026-04-28',
    viewCount: 120,
  },
  {
    id: 'notice-2',
    tab: 'notice',
    title: '실기 기출 답안형 화면 개선 예정',
    slug: 'notice-practical-ui-plan',
    excerpt: '실기 답안을 더 길게 작성할 수 있도록 textarea와 모범답안 영역을 확장하고 있습니다.',
    authorLabel: '운영팀',
    meta: '2026.04.27 · 운영팀',
    createdAt: '2026-04-27',
    viewCount: 88,
  },
  {
    id: 'free-1',
    tab: 'free',
    title: '정처기 공부하다 막히는 부분이 있으면 어떻게 질문하면 좋을까요?',
    slug: 'free-how-to-ask-better',
    excerpt: '오류 화면, 시도한 방법, 기대한 결과를 같이 적으면 훨씬 빠르게 답을 받을 수 있습니다.',
    authorLabel: '자유게시판',
    meta: '댓글 12 · 오늘',
    createdAt: '2026-04-28',
    viewCount: 54,
  },
  {
    id: 'free-2',
    tab: 'free',
    title: '실기 답안형 공부 루틴 공유합니다',
    slug: 'free-practical-study-routine',
    excerpt: '답안형은 그냥 외우기보다 키워드-설명-예시 3단으로 정리하니 훨씬 덜 막혔습니다.',
    authorLabel: '자유게시판',
    meta: '댓글 7 · 1시간 전',
    createdAt: '2026-04-28',
    viewCount: 31,
  },
  {
    id: 'free-3',
    tab: 'free',
    title: '정처기 최근 회차에서 코드 문제만 따로 모아볼 수 있으면 좋겠어요',
    slug: 'free-code-only-filter',
    excerpt:
      '기출문제 페이지에서 코드형 문제만 빠르게 보고 싶은데, 과목별 말고 유형별 필터도 있으면 공부가 훨씬 편할 것 같아요.',
    authorLabel: '자유게시판',
    meta: '댓글 5 · 오늘',
    createdAt: '2026-04-28',
    viewCount: 22,
  },
  {
    id: 'free-4',
    tab: 'free',
    title: '문제 상세에서 이미지가 필요한 문제는 표시가 있으면 좋겠습니다',
    slug: 'free-image-problem-badge',
    excerpt: '문제 목록에서 미리 이미지 문제인지 알 수 있으면 PDF랑 같이 보면서 정리하기 더 쉬울 것 같아요.',
    authorLabel: '자유게시판',
    meta: '댓글 3 · 오늘',
    createdAt: '2026-04-28',
    viewCount: 18,
  },
  {
    id: 'free-5',
    tab: 'free',
    title: '실기 답안 연습용으로 임시 저장 기능이 있으면 좋겠어요',
    slug: 'free-practical-draft-save',
    excerpt:
      '실기 textarea에 쓰다가 다른 페이지 갔다 오면 날아가서, 임시 저장만 있어도 반복 연습할 때 훨씬 좋을 것 같습니다.',
    authorLabel: '자유게시판',
    meta: '댓글 6 · 오늘',
    createdAt: '2026-04-28',
    viewCount: 27,
  },
  {
    id: 'free-6',
    tab: 'free',
    title: '질문 남길 때 시험명 태그만 있어도 찾기 편할 것 같아요',
    slug: 'free-board-exam-tag',
    excerpt:
      '정처기, SQLD, 실기 같은 최소 태그만 있어도 나중에 같은 시험 준비하는 사람들이 글 찾기가 더 편할 것 같아요.',
    authorLabel: '자유게시판',
    meta: '댓글 2 · 오늘',
    createdAt: '2026-04-28',
    viewCount: 14,
  },
  {
    id: 'review-1',
    tab: 'review',
    title: '비전공자 정처기 필기 5주 합격 후기',
    slug: 'review-jeongchogi-5weeks',
    excerpt: '기출 회독 순서와 요약노트 활용법을 중심으로 정리한 실제 합격 후기입니다.',
    authorLabel: '합격자',
    meta: '조회 324 · 2026.04.26',
    createdAt: '2026-04-26',
    viewCount: 324,
  },
  {
    id: 'review-2',
    tab: 'review',
    title: 'SQLD 주말 공부 루틴 공유',
    slug: 'review-sqld-weekend-routine',
    excerpt: '직장인이 평일 시간을 아끼면서도 문제풀이를 유지한 방식 위주로 남긴 후기입니다.',
    authorLabel: '합격자',
    meta: '조회 198 · 2026.04.24',
    createdAt: '2026-04-24',
    viewCount: 198,
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

function trimExcerpt(content: string | null, fallback: string) {
  const value = (content || '').replace(/\s+/g, ' ').trim()
  if (!value) {
    return fallback
  }

  return value.length > 96 ? `${value.slice(0, 96)}...` : value
}

function toBoardTab(type: PostRow['type']): BoardTab | null {
  if (type === 'notice') return 'notice'
  if (type === 'review') return 'review'
  if (type === 'note') return 'free'
  return null
}

function toExamView(row: {
  slug: string
  name: string
  description: string | null
  question_count?: number | null
  resource_count?: number | null
}): ExamView {
  const mock = getMockExam(row.slug)

  return {
    slug: row.slug,
    name: row.name,
    shortName: mock?.shortName || row.name,
    description: row.description || '',
    subjects: mock?.subjects || [],
    questionCount: row.question_count || mock?.questionCount || 0,
    resourceCount: row.resource_count || mock?.resourceCount || 0,
    color: mock?.color || 'blue',
  }
}

function toResourceView(row: {
  id: string
  title: string
  description: string | null
  price: number | null
  exam_slug?: string | null
}): ResourceView {
  return {
    id: row.id,
    examSlug: row.exam_slug || 'jeongchogi',
    title: row.title,
    description: row.description || '',
    pages: 0,
    price: row.price || 0,
    type: 'PDF',
  }
}

function toQuestionView(row: QuestionRow, examSlug: string): QuestionView {
  const choices = [...(row.choices || [])].sort((a, b) => a.number - b.number)
  const answerIndex = Math.max(0, choices.findIndex((choice) => choice.is_correct))

  return {
    id: row.id,
    examSlug,
    year: row.year,
    round: row.round,
    subject: row.subject,
    number: row.number,
    difficulty: row.difficulty || 2,
    content: row.content,
    choices: choices.map((choice) => choice.content),
    answer: answerIndex,
    explanation: row.explanation || '정답 해설 준비 중입니다.',
    imageUrl: row.image_url || undefined,
    imageCaption: row.image_caption || undefined,
  }
}

function toMockQuestionView(question: (typeof mockQuestions)[number]): QuestionView {
  return {
    ...question,
    imageUrl: undefined,
    imageCaption: undefined,
  }
}

function toBoardPostView(row: PostRow): BoardPostView | null {
  const tab = toBoardTab(row.type)
  if (!tab) {
    return null
  }

  const authorLabel =
    tab === 'notice' ? '운영팀' : tab === 'review' ? '합격자' : '자유게시판'

  return {
    id: row.id,
    tab,
    title: row.title,
    slug: row.slug,
    excerpt: trimExcerpt(
      row.content,
      tab === 'free'
        ? '자유게시판 글입니다. 오류 제보나 질문은 재현 경로와 기대 결과를 함께 적어주세요.'
        : '게시글 요약을 준비 중입니다.'
    ),
    authorLabel,
    meta:
      tab === 'free'
        ? `댓글 참여형 · ${formatDateLabel(row.created_at)}`
        : `${formatDateLabel(row.created_at)} · ${authorLabel}`,
    createdAt: row.created_at,
    viewCount: row.view_count || 0,
  }
}

export async function getExams(): Promise<ExamView[]> {
  try {
    const supabase = await createClient()
    const { data, error } = await supabase
      .from('exams')
      .select('slug, name, description')
      .eq('is_active', true)
      .order('order_index', { ascending: true })

    if (error || !data?.length) {
      return mockExams
    }

    return data.map(toExamView)
  } catch {
    return mockExams
  }
}

export async function getExam(slug: string): Promise<ExamView | undefined> {
  const exams = await getExams()
  return exams.find((exam) => exam.slug === slug) || getMockExam(slug)
}

export async function getResources(): Promise<ResourceView[]> {
  try {
    const supabase = await createClient()
    const { data, error } = await supabase
      .from('resources')
      .select('id, title, description, price, exams(slug)')
      .eq('is_published', true)
      .order('created_at', { ascending: false })

    if (error || !data?.length) {
      return mockResources
    }

    return data.map((row) => {
      const examRelation = row.exams as { slug?: string } | null
      return toResourceView({
        id: row.id,
        title: row.title,
        description: row.description,
        price: row.price,
        exam_slug: examRelation?.slug,
      })
    })
  } catch {
    return mockResources
  }
}

export async function getResource(id: string): Promise<ResourceView | undefined> {
  const resources = await getResources()
  return resources.find((resource) => resource.id === id) || getMockResource(id)
}

export async function getQuestionsByExam(slug: string): Promise<QuestionView[]> {
  try {
    const supabase = await createClient()
    const { data: exam } = await supabase
      .from('exams')
      .select('id, slug')
      .eq('slug', slug)
      .maybeSingle()

    if (!exam) {
      return mockQuestions.filter((question) => question.examSlug === slug).map(toMockQuestionView)
    }

    const { data, error } = await supabase
      .from('questions')
      .select(
        'id, exam_id, year, round, subject, number, content, explanation, difficulty, image_url, image_caption, choices(number, content, is_correct)'
      )
      .eq('exam_id', exam.id)
      .order('year', { ascending: false })
      .order('round', { ascending: false })
      .order('number', { ascending: true })

    if (error || !data?.length) {
      return mockQuestions.filter((question) => question.examSlug === slug).map(toMockQuestionView)
    }

    return (data as QuestionRow[]).map((row) => toQuestionView(row, exam.slug))
  } catch {
    return mockQuestions.filter((question) => question.examSlug === slug).map(toMockQuestionView)
  }
}

export async function getQuestion(slug: string, id: string): Promise<QuestionView | undefined> {
  try {
    const supabase = await createClient()
    const { data: exam } = await supabase
      .from('exams')
      .select('id, slug')
      .eq('slug', slug)
      .maybeSingle()

    if (exam) {
      const { data, error } = await supabase
        .from('questions')
        .select(
          'id, exam_id, year, round, subject, number, content, explanation, difficulty, image_url, image_caption, choices(number, content, is_correct)'
        )
        .eq('exam_id', exam.id)
        .eq('id', id)
        .maybeSingle()

      if (!error && data) {
        return toQuestionView(data as QuestionRow, exam.slug)
      }
    }
  } catch {
    // fallback below
  }

  const fallback = mockQuestions.find((question) => question.examSlug === slug && question.id === id)
  return fallback ? toMockQuestionView(fallback) : undefined
}

export async function getDailyQuestion(): Promise<QuestionView> {
  const dbQuestions = await getQuestionsByExam('jeongchogi')
  return dbQuestions[0] || toMockQuestionView(mockQuestions[0])
}

export async function getBoardPosts(tab: BoardTab): Promise<BoardPostView[]> {
  try {
    const supabase = await createClient()
    const typeFilter = tab === 'free' ? 'note' : tab

    const { data, error } = await supabase
      .from('posts')
      .select('id, type, title, slug, content, created_at, updated_at, view_count')
      .eq('is_published', true)
      .eq('type', typeFilter)
      .order('created_at', { ascending: false })
      .limit(12)

    if (error || !data?.length) {
      return mockBoardPosts.filter((post) => post.tab === tab)
    }

    const mapped = (data as PostRow[])
      .map(toBoardPostView)
      .filter((post): post is BoardPostView => Boolean(post))

    return mapped.length ? mapped : mockBoardPosts.filter((post) => post.tab === tab)
  } catch {
    return mockBoardPosts.filter((post) => post.tab === tab)
  }
}
