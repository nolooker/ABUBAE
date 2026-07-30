'use client'

import { useRef, useState, type FormEvent } from 'react'
import { useRouter } from 'next/navigation'
import type { AdminNotice, NoticeInput, NoticeUpdateInput } from '@/lib/notice'

type NoticeFormProps = {
  mode: 'create' | 'edit'
  initialNotice?: AdminNotice
}

type Draft = NoticeInput

const emptyDraft: Draft = { title: '', slug: '', content: '', isPublished: false }

function initialDraft(initialNotice?: AdminNotice): Draft {
  if (!initialNotice) return emptyDraft
  return {
    title: initialNotice.title,
    slug: initialNotice.slug,
    content: initialNotice.content,
    isPublished: initialNotice.isPublished,
  }
}

function errorMessage(status: number): string {
  if (status === 400) return '입력값을 다시 확인해 주세요.'
  if (status === 409) return '다른 공지와 충돌하거나, 그 사이 다른 곳에서 먼저 수정되었습니다.'
  return '공지를 저장하지 못했습니다. 다시 시도해 주세요.'
}

function deleteErrorMessage(status: number): string {
  if (status === 404) return '이미 삭제된 공지입니다.'
  return '공지를 삭제하지 못했습니다. 다시 시도해 주세요.'
}

export default function NoticeForm({ mode, initialNotice }: NoticeFormProps) {
  const router = useRouter()
  const [draft, setDraft] = useState<Draft>(() => initialDraft(initialNotice))
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
    const payload: NoticeInput | NoticeUpdateInput = isEdit
      ? { ...draft, expectedUpdatedAt: initialNotice!.updatedAt }
      : draft

    try {
      const response = await fetch(
        isEdit ? `/api/admin/notices/${initialNotice!.id}` : '/api/admin/notices',
        {
          method: isEdit ? 'PATCH' : 'POST',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify(payload),
        },
      )

      if (!response.ok) {
        setError(errorMessage(response.status))
        savingRef.current = false
        setIsSaving(false)
        return
      }

      if (!isEdit) setDraft(emptyDraft)
      router.push('/admin/notices?status=saved')
    } catch {
      setError('공지를 저장하지 못했습니다. 다시 시도해 주세요.')
      savingRef.current = false
      setIsSaving(false)
    }
  }

  const deleteNotice = async () => {
    if (!initialNotice || isDeleting || isSaving) return
    if (!window.confirm('이 공지를 삭제할까요? 되돌릴 수 없습니다.')) return

    setIsDeleting(true)
    setError(null)

    try {
      const response = await fetch(`/api/admin/notices/${initialNotice.id}`, { method: 'DELETE' })

      if (!response.ok) {
        setError(deleteErrorMessage(response.status))
        setIsDeleting(false)
        return
      }

      router.push('/admin/notices?status=deleted')
    } catch {
      setError('공지를 삭제하지 못했습니다. 다시 시도해 주세요.')
      setIsDeleting(false)
    }
  }

  return (
    <form onSubmit={submit} className="space-y-5" noValidate>
      <fieldset disabled={isSaving || isDeleting} className="space-y-5">
        <label className="block text-sm font-semibold text-[var(--text-primary)]">
          제목
          <input aria-label="제목" value={draft.title} onChange={(event) => updateDraft('title', event.target.value)} className="mt-2 w-full rounded-lg border border-[var(--border)] p-3 font-normal" />
        </label>
        <label className="block text-sm font-semibold text-[var(--text-primary)]">
          슬러그
          <input aria-label="슬러그" value={draft.slug} onChange={(event) => updateDraft('slug', event.target.value)} className="mt-2 w-full rounded-lg border border-[var(--border)] p-3 font-normal" />
        </label>
        <label className="block text-sm font-semibold text-[var(--text-primary)]">
          내용
          <textarea aria-label="내용" value={draft.content} onChange={(event) => updateDraft('content', event.target.value)} rows={12} className="mt-2 w-full rounded-lg border border-[var(--border)] p-3 font-normal" />
        </label>
        <label className="flex items-center gap-2 text-sm font-semibold text-[var(--text-primary)]">
          <input aria-label="공개" type="checkbox" checked={draft.isPublished} onChange={(event) => updateDraft('isPublished', event.target.checked)} />
          공개
        </label>
      </fieldset>
      {error && <p role="alert" className="text-sm font-semibold text-red-600">{error}</p>}
      <div className="flex items-center gap-3">
        <button type="submit" disabled={isSaving || isDeleting} className="rounded-xl bg-[var(--primary)] px-4 py-2 text-sm font-bold text-white disabled:cursor-not-allowed disabled:opacity-60">
          {isSaving ? '저장 중...' : isEdit ? '변경사항 저장' : '공지 생성'}
        </button>
        {isEdit && (
          <button
            type="button"
            onClick={deleteNotice}
            disabled={isSaving || isDeleting}
            className="rounded-xl border border-red-200 px-4 py-2 text-sm font-bold text-red-600 disabled:cursor-not-allowed disabled:opacity-60"
          >
            {isDeleting ? '삭제 중...' : '공지 삭제'}
          </button>
        )}
      </div>
    </form>
  )
}
