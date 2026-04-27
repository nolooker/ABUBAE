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
export type QuestionView = (typeof mockQuestions)[number]

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
  choices?: ChoiceRow[]
}

function toExamView(row: {
  slug: string
  name: string
  description: string | null
  question_count?: number | null
  resource_count?: number | null
}): ExamView {
  return {
    slug: row.slug,
    name: row.name,
    shortName: row.name === '정보처리기사' ? '정처기' : row.name,
    description: row.description || '',
    subjects: [],
    questionCount: row.question_count || 0,
    resourceCount: row.resource_count || 0,
    color: 'blue',
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
    explanation: row.explanation || '해설을 준비 중입니다.',
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

    return data.map((row) => {
      const mock = getMockExam(row.slug)
      return {
        ...toExamView(row),
        subjects: mock?.subjects || [],
        questionCount: mock?.questionCount || 0,
        resourceCount: mock?.resourceCount || 0,
        color: mock?.color || 'blue',
      }
    })
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
      return mockQuestions.filter((question) => question.examSlug === slug)
    }

    const { data, error } = await supabase
      .from('questions')
      .select('id, exam_id, year, round, subject, number, content, explanation, difficulty, choices(number, content, is_correct)')
      .eq('exam_id', exam.id)
      .order('year', { ascending: false })
      .order('round', { ascending: false })
      .order('number', { ascending: true })

    if (error || !data?.length) {
      return mockQuestions.filter((question) => question.examSlug === slug)
    }

    return (data as QuestionRow[]).map((row) => toQuestionView(row, exam.slug))
  } catch {
    return mockQuestions.filter((question) => question.examSlug === slug)
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
          'id, exam_id, year, round, subject, number, content, explanation, difficulty, choices(number, content, is_correct)'
        )
        .eq('exam_id', exam.id)
        .eq('id', id)
        .maybeSingle()

      if (!error && data) {
        return toQuestionView(data as QuestionRow, exam.slug)
      }
    }
  } catch {
    // DB 조회 실패 시 아래 fallback으로 이동
  }

  return mockQuestions.find((question) => question.examSlug === slug && question.id === id)
}

export async function getDailyQuestion(): Promise<QuestionView> {
  const dbQuestions = await getQuestionsByExam('jeongchogi')
  return dbQuestions[0] || mockQuestions[0]
}
