'use server'

import { revalidatePath } from 'next/cache'
import { redirect } from 'next/navigation'
import { createClient } from '@/lib/supabase/server'

function makeSlug() {
  const now = Date.now()
  const random = Math.random().toString(36).slice(2, 8)
  return `free-${now}-${random}`
}

function makeTitleFromContent(content: string) {
  const normalized = content.replace(/\s+/g, ' ').trim()
  if (!normalized) {
    return '자유게시판 글'
  }

  const firstLine = normalized.split(/[.!?\n]/)[0]?.trim() || normalized
  return firstLine.length > 36 ? `${firstLine.slice(0, 36)}...` : firstLine
}

export async function createFreeBoardPost(formData: FormData) {
  const content = String(formData.get('content') || '').trim()

  if (content.length < 8) {
    redirect('/board?tab=free&status=too-short')
  }

  try {
    const supabase = await createClient()
    const { error } = await supabase.from('posts').insert({
      exam_id: null,
      type: 'note',
      title: makeTitleFromContent(content),
      slug: makeSlug(),
      content,
      is_premium: false,
      is_published: true,
      view_count: 0,
    })

    if (error) {
      redirect('/board?tab=free&status=error')
    }

    revalidatePath('/board')
    redirect('/board?tab=free&status=posted')
  } catch {
    redirect('/board?tab=free&status=error')
  }
}
