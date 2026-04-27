'use server'

import { revalidatePath } from 'next/cache'
import { redirect } from 'next/navigation'
import { isAdminSession } from '@/lib/admin-auth'
import { createClient } from '@/lib/supabase/server'

function getText(formData: FormData, key: string) {
  return String(formData.get(key) || '').trim()
}

function getNumber(formData: FormData, key: string, fallback = 0) {
  const value = Number(getText(formData, key))
  return Number.isFinite(value) ? value : fallback
}

async function getExamBySlug(examSlug: string) {
  const supabase = await createClient()
  const { data: exam, error } = await supabase
    .from('exams')
    .select('id, slug')
    .eq('slug', examSlug)
    .maybeSingle()

  return { supabase, exam, error }
}

function revalidateExamPaths(examSlug: string, questionId?: string) {
  revalidatePath(`/exam/${examSlug}`)
  revalidatePath(`/exam/${examSlug}/written`)
  revalidatePath(`/exam/${examSlug}/practical`)
  revalidatePath(`/exam/${examSlug}/questions`)
  if (questionId) {
    revalidatePath(`/exam/${examSlug}/questions/${questionId}`)
  }
  revalidatePath('/admin/questions')
}

export async function createWrittenQuestion(formData: FormData) {
  if (!(await isAdminSession())) {
    redirect('/admin/login')
  }

  const examSlug = getText(formData, 'examSlug')
  const year = getNumber(formData, 'year')
  const round = getNumber(formData, 'round')
  const subject = getText(formData, 'subject')
  const number = getNumber(formData, 'number')
  const difficulty = getNumber(formData, 'difficulty', 2)
  const content = getText(formData, 'content')
  const explanation = getText(formData, 'explanation')
  const correctChoice = getNumber(formData, 'correctChoice', 1)

  const choices = [1, 2, 3, 4].map((choiceNumber) => ({
    number: choiceNumber,
    content: getText(formData, `choice${choiceNumber}`),
  }))

  if (
    !examSlug ||
    !year ||
    !round ||
    !subject ||
    !number ||
    !content ||
    !explanation ||
    choices.some((choice) => !choice.content)
  ) {
    redirect('/admin/questions?type=written&error=required')
  }

  const { supabase, exam, error: examError } = await getExamBySlug(examSlug)

  if (examError || !exam) {
    redirect('/admin/questions?type=written&error=exam')
  }

  const { data: insertedQuestion, error: questionError } = await supabase
    .from('questions')
    .insert({
      exam_id: exam.id,
      year,
      round,
      subject,
      number,
      content,
      explanation,
      difficulty,
    })
    .select('id')
    .single()

  if (questionError || !insertedQuestion) {
    redirect('/admin/questions?type=written&error=question')
  }

  const { error: choiceError } = await supabase.from('choices').insert(
    choices.map((choice) => ({
      question_id: insertedQuestion.id,
      number: choice.number,
      content: choice.content,
      is_correct: choice.number === correctChoice,
    }))
  )

  if (choiceError) {
    await supabase.from('questions').delete().eq('id', insertedQuestion.id)
    redirect('/admin/questions?type=written&error=choice')
  }

  revalidateExamPaths(exam.slug, insertedQuestion.id)

  redirect(`/admin/questions?type=written&success=1&exam=${exam.slug}`)
}

export async function createPracticalQuestion(formData: FormData) {
  if (!(await isAdminSession())) {
    redirect('/admin/login')
  }

  const examSlug = getText(formData, 'examSlug')
  const year = getNumber(formData, 'year')
  const round = getNumber(formData, 'round')
  const subject = getText(formData, 'subject') || '실기'
  const number = getNumber(formData, 'number')
  const difficulty = getNumber(formData, 'difficulty', 2)
  const content = getText(formData, 'content')
  const explanation = getText(formData, 'explanation')
  const answerText = getText(formData, 'answerText')

  if (!examSlug || !year || !round || !number || !content || !explanation || !answerText) {
    redirect('/admin/questions?type=practical&error=required')
  }

  const { supabase, exam, error: examError } = await getExamBySlug(examSlug)

  if (examError || !exam) {
    redirect('/admin/questions?type=practical&error=exam')
  }

  const { data: insertedQuestion, error: questionError } = await supabase
    .from('questions')
    .insert({
      exam_id: exam.id,
      year,
      round,
      subject,
      number,
      content,
      explanation,
      difficulty,
      exam_part: 'practical',
      answer_text: answerText,
    })
    .select('id')
    .single()

  if (questionError || !insertedQuestion) {
    redirect('/admin/questions?type=practical&error=practical_schema')
  }

  revalidateExamPaths(exam.slug, insertedQuestion.id)

  redirect(`/admin/questions?type=practical&success=1&exam=${exam.slug}`)
}
