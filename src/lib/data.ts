import { createClient } from '@/lib/supabase/server'
import {
  exams as mockExams,
  getExam as getMockExam,
  getResource as getMockResource,
  resources as mockResources,
} from '@/lib/mock-data'

export type ExamView = (typeof mockExams)[number]
export type ResourceView = (typeof mockResources)[number]

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
