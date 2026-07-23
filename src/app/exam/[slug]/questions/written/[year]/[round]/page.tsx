import Link from 'next/link'
import { notFound } from 'next/navigation'

import WrittenRoundRunner from '@/components/quiz/WrittenRoundRunner'
import type { EditableWrittenQuestion } from '@/components/quiz/WrittenQuestionEditDialog'
import { getCurrentUserRole } from '@/lib/master-auth'
import { createClient } from '@/lib/supabase/server'
import { getPublicWrittenRound } from '@/lib/written-content'

type Props = { params: Promise<{ slug: string; year: string; round: string }> }

export const dynamic = 'force-dynamic'

type EditableRpcClient = Awaited<ReturnType<typeof createClient>> & {
  rpc: (name: string, args: Record<string, unknown>) => Promise<{ data: unknown; error: unknown }>
}

function editableQuestion(value: unknown): EditableWrittenQuestion | undefined {
  if (!isRecord(value) || !isRecord(value.question) || !Array.isArray(value.choices) || value.choices.length !== 4) return undefined

  const question = value.question
  if (typeof question.id !== 'string'
    || typeof question.number !== 'number'
    || typeof question.subject !== 'string'
    || typeof question.content !== 'string'
    || typeof question.updated_at !== 'string') return undefined

  const choices = value.choices
    .map((choice) => isRecord(choice) && typeof choice.number === 'number' && typeof choice.content === 'string' && typeof choice.is_correct === 'boolean'
      ? { number: choice.number, content: choice.content, isCorrect: choice.is_correct }
      : undefined)
  if (choices.some((choice) => !choice) || new Set(choices.map((choice) => choice?.number)).size !== 4) return undefined

  const numberedChoices = choices as { number: number; content: string; isCorrect: boolean }[]
  numberedChoices.sort((a, b) => a.number - b.number)
  if (!numberedChoices.every((choice, index) => choice.number === index + 1) || !numberedChoices.some((choice) => choice.isCorrect)) return undefined

  return {
    id: question.id,
    number: question.number,
    subject: question.subject,
    content: question.content,
    choices: numberedChoices.map((choice) => choice.content),
    updatedAt: question.updated_at,
    acceptedAnswerIndexes: numberedChoices.filter((choice) => choice.isCorrect).map((choice) => choice.number - 1),
    explanation: typeof question.explanation === 'string' ? question.explanation : '',
  }
}

function isRecord(value: unknown): value is Record<string, unknown> {
  return typeof value === 'object' && value !== null && !Array.isArray(value)
}

export default async function WrittenRoundPage({ params }: Props) {
  const { slug, year, round } = await params
  if (slug !== 'jeongchogi') notFound()
  const content = await getPublicWrittenRound(Number(year), Number(round))
  if (!content) notFound()
  const role = await getCurrentUserRole()

  async function loadEditableQuestion(questionId: string): Promise<EditableWrittenQuestion> {
    'use server'

    const supabase = await createClient() as EditableRpcClient
    if (await getCurrentUserRole(supabase) !== 'master') throw new Error('not authorized')

    const { data, error } = await supabase.rpc('get_written_question_for_edit', { p_question_id: questionId })
    const question = error ? undefined : editableQuestion(data)
    if (!question) throw new Error('unable to load question')
    return question
  }

  return (
    <section className="mx-auto max-w-7xl px-4 py-8">
      <Link href={`/exam/${slug}/questions/written`} className="mb-5 inline-block text-sm font-semibold text-[var(--primary)]">← 회차 선택으로 돌아가기</Link>
      <WrittenRoundRunner
        canEdit={role === 'master'}
        loadEditableQuestion={role === 'master' ? loadEditableQuestion : undefined}
        year={Number(year)}
        round={Number(round)}
        title={content.title}
        questions={content.questions}
      />
    </section>
  )
}
