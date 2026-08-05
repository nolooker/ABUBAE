'use client'

import { useRef, useState, type FormEvent } from 'react'
import { useRouter } from 'next/navigation'
import { boardCategories, boardCategoryLabel, type BoardCategory } from '@/lib/board'

type Draft = {
  title: string
  content: string
  category: BoardCategory
}

const emptyDraft: Draft = { title: '', content: '', category: 'free' }

type BoardPostFormProps = {
  mode: 'create' | 'edit'
  postId?: string
  initialDraft?: Draft
}

function errorMessage(status: number): string {
  if (status === 400) return '입력값을 다시 확인해 주세요.'
  if (status === 401) return '로그인이 필요합니다.'
  if (status === 404) return '글을 찾을 수 없습니다.'
  return '저장하지 못했습니다. 다시 시도해 주세요.'
}

function deleteErrorMessage(status: number): string {
  if (status === 404) return '이미 삭제된 글입니다.'
  return '삭제하지 못했습니다. 다시 시도해 주세요.'
}

export default function BoardPostForm({ mode, postId, initialDraft }: BoardPostFormProps) {
  const router = useRouter()
  const [draft, setDraft] = useState<Draft>(initialDraft ?? emptyDraft)
  const [isSaving, setIsSaving] = useState(false)
  const [isDeleting, setIsDeleting] = useState(false)
  const [error, setError] = useState<string | null>(null)
  const savingRef = useRef(false)
  const isEdit = mode === 'edit'

  const updateDraft = <Key extends keyof Draft>(field: Key, value: Draft[Key]) => {
    setDraft((current) => ({ ...current, [field]: value }))
  }

  const submit = async (event: FormEvent<HTMLFormElement>) => {
    event.preventDefault()
    if (savingRef.current) return
    savingRef.current = true
    setIsSaving(true)
    setError(null)

    try {
      const response = await fetch(isEdit ? `/api/board/posts/${postId}` : '/api/board/posts', {
        method: isEdit ? 'PATCH' : 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(draft),
      })

      if (!response.ok) {
        setError(errorMessage(response.status))
        savingRef.current = false
        setIsSaving(false)
        return
      }

      const saved: { id: string } = await response.json()
      router.push(`/board/${isEdit ? postId : saved.id}`)
      router.refresh()
    } catch {
      setError('저장하지 못했습니다. 다시 시도해 주세요.')
      savingRef.current = false
      setIsSaving(false)
    }
  }

  const deletePost = async () => {
    if (!postId || isDeleting || isSaving) return
    if (!window.confirm('이 글을 삭제할까요? 되돌릴 수 없습니다.')) return

    setIsDeleting(true)
    setError(null)

    try {
      const response = await fetch(`/api/board/posts/${postId}`, { method: 'DELETE' })

      if (!response.ok) {
        setError(deleteErrorMessage(response.status))
        setIsDeleting(false)
        return
      }

      router.push('/board')
      router.refresh()
    } catch {
      setError('삭제하지 못했습니다. 다시 시도해 주세요.')
      setIsDeleting(false)
    }
  }

  return (
    <form onSubmit={submit} className="space-y-5" noValidate>
      <fieldset disabled={isSaving || isDeleting} className="space-y-5">
        <div>
          <p className="block text-sm font-semibold text-[var(--text-primary)]">카테고리</p>
          <div role="radiogroup" aria-label="카테고리" className="mt-2 flex gap-2">
            {boardCategories.map((category) => (
              <button
                key={category}
                type="button"
                role="radio"
                aria-checked={draft.category === category}
                onClick={() => updateDraft('category', category)}
                className={`rounded-full px-4 py-1.5 text-[13px] font-bold ${
                  draft.category === category ? 'bg-[var(--primary)] text-white' : 'bg-[var(--bg-subtle)] text-[var(--text-secondary)]'
                }`}
              >
                {boardCategoryLabel(category)}
              </button>
            ))}
          </div>
        </div>
        <label className="block text-sm font-semibold text-[var(--text-primary)]">
          제목
          <input aria-label="제목" value={draft.title} onChange={(event) => updateDraft('title', event.target.value)} className="mt-2 w-full rounded-lg border border-[var(--border)] p-3 font-normal" />
        </label>
        <label className="block text-sm font-semibold text-[var(--text-primary)]">
          내용
          <textarea aria-label="내용" value={draft.content} onChange={(event) => updateDraft('content', event.target.value)} rows={10} className="mt-2 w-full rounded-lg border border-[var(--border)] p-3 font-normal" />
        </label>
      </fieldset>

      {error && <p role="alert" className="text-sm font-semibold text-red-600">{error}</p>}

      <div className="flex items-center gap-3">
        <button type="submit" disabled={isSaving || isDeleting} className="rounded-xl bg-[var(--primary)] px-4 py-2 text-sm font-bold text-white disabled:cursor-not-allowed disabled:opacity-60">
          {isSaving ? '저장 중...' : isEdit ? '수정 완료' : '글 등록'}
        </button>
        {isEdit && (
          <button
            type="button"
            onClick={deletePost}
            disabled={isSaving || isDeleting}
            className="rounded-xl border border-red-200 px-4 py-2 text-sm font-bold text-red-600 disabled:cursor-not-allowed disabled:opacity-60"
          >
            {isDeleting ? '삭제 중...' : '글 삭제'}
          </button>
        )}
      </div>
    </form>
  )
}
