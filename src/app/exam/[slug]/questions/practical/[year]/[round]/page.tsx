import Link from 'next/link'
import { notFound } from 'next/navigation'

import PracticalRoundRunner from '@/components/quiz/PracticalRoundRunner'
import type { EditablePracticalQuestion } from '@/components/quiz/PracticalQuestionEditDialog'
import { createBookmarkRepository } from '@/lib/bookmark-repository'
import { getCurrentUserRole } from '@/lib/master-auth'
import { createClient } from '@/lib/supabase/server'
import { getPublicPracticalRound } from '@/lib/practical-content'

type Props = { params: Promise<{ slug: string; year: string; round: string }> }

export const dynamic = 'force-dynamic'

type EditableRpcClient = Awaited<ReturnType<typeof createClient>> & {
  rpc: (name: string, args: Record<string, unknown>) => Promise<{ data: unknown; error: unknown }>
}

function isRecord(value: unknown): value is Record<string, unknown> {
  return typeof value === 'object' && value !== null && !Array.isArray(value)
}

function editableQuestion(value: unknown): EditablePracticalQuestion | undefined {
  if (!isRecord(value) || !isRecord(value.question) || !Array.isArray(value.blanks)) return undefined

  const question = value.question
  if (typeof question.id !== 'string'
    || typeof question.number !== 'number'
    || typeof question.subject !== 'string'
    || typeof question.content !== 'string'
    || typeof question.updated_at !== 'string') return undefined

  const blanks = value.blanks.map((blank) => (
    isRecord(blank)
      && typeof blank.blank_number === 'number'
      && Array.isArray(blank.accepted_answers)
      && blank.accepted_answers.every((answer) => typeof answer === 'string')
      ? { blankNumber: blank.blank_number, acceptedAnswers: blank.accepted_answers as string[] }
      : undefined
  ))
  if (blanks.some((blank) => !blank) || blanks.length === 0) return undefined

  return {
    id: question.id,
    number: question.number,
    subject: question.subject,
    content: question.content,
    blankCount: blanks.length,
    updatedAt: question.updated_at,
    blanks: blanks as EditablePracticalQuestion['blanks'],
    explanation: typeof question.explanation === 'string' ? question.explanation : '',
  }
}

export default async function PracticalRoundPage({ params }: Props) {
  const { slug, year, round } = await params
  if (slug !== 'jeongchogi') notFound()
  const content = await getPublicPracticalRound(Number(year), Number(round))
  if (!content) notFound()

  const supabase = await createClient()
  const { data: { user } } = await supabase.auth.getUser()
  const role = await getCurrentUserRole(supabase)
  const bookmarkedIds = user
    ? await createBookmarkRepository(supabase).listBookmarkedQuestionIds(user.id).catch(() => [])
    : []

  async function loadEditableQuestion(questionId: string): Promise<EditablePracticalQuestion> {
    'use server'

    const supabase = await createClient() as EditableRpcClient
    if (await getCurrentUserRole(supabase) !== 'master') throw new Error('not authorized')

    const { data, error } = await supabase.rpc('get_practical_question_for_edit', { p_question_id: questionId })
    const question = error ? undefined : editableQuestion(data)
    if (!question) throw new Error('unable to load question')
    return question
  }

  return (
    <section className="mx-auto max-w-7xl px-4 py-8">
      <Link href={`/exam/${slug}/questions/practical`} className="mb-5 inline-block text-sm font-semibold text-[var(--primary)]">← 회차 선택으로 돌아가기</Link>
      <PracticalRoundRunner
        canEdit={role === 'master'}
        loadEditableQuestion={role === 'master' ? loadEditableQuestion : undefined}
        year={Number(year)}
        round={Number(round)}
        title={content.title}
        questions={content.questions}
        isLoggedIn={Boolean(user)}
        initialBookmarkedIds={bookmarkedIds}
      />
    </section>
  )
}
