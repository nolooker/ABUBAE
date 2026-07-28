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
  if (status === 400) return 'Please check the notice details and try again.'
  if (status === 409) return 'The notice conflicts with an existing or newer notice.'
  return 'Unable to save the notice. Please try again.'
}

export default function NoticeForm({ mode, initialNotice }: NoticeFormProps) {
  const router = useRouter()
  const [draft, setDraft] = useState<Draft>(() => initialDraft(initialNotice))
  const [isSaving, setIsSaving] = useState(false)
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
      setError('Unable to save the notice. Please try again.')
      savingRef.current = false
      setIsSaving(false)
    }
  }

  return (
    <form onSubmit={submit} className="space-y-5" noValidate>
      <fieldset disabled={isSaving} className="space-y-5">
        <label className="block text-sm font-semibold text-[var(--text-primary)]">
          Title
          <input aria-label="Title" value={draft.title} onChange={(event) => updateDraft('title', event.target.value)} className="mt-2 w-full rounded-lg border border-[var(--border)] p-3 font-normal" />
        </label>
        <label className="block text-sm font-semibold text-[var(--text-primary)]">
          Slug
          <input aria-label="Slug" value={draft.slug} onChange={(event) => updateDraft('slug', event.target.value)} className="mt-2 w-full rounded-lg border border-[var(--border)] p-3 font-normal" />
        </label>
        <label className="block text-sm font-semibold text-[var(--text-primary)]">
          Content
          <textarea aria-label="Content" value={draft.content} onChange={(event) => updateDraft('content', event.target.value)} rows={12} className="mt-2 w-full rounded-lg border border-[var(--border)] p-3 font-normal" />
        </label>
        <label className="flex items-center gap-2 text-sm font-semibold text-[var(--text-primary)]">
          <input aria-label="Published" type="checkbox" checked={draft.isPublished} onChange={(event) => updateDraft('isPublished', event.target.checked)} />
          Published
        </label>
      </fieldset>
      {error && <p role="alert" className="text-sm font-semibold text-red-600">{error}</p>}
      <button type="submit" disabled={isSaving} className="rounded-xl bg-[var(--primary)] px-4 py-2 text-sm font-bold text-white disabled:cursor-not-allowed disabled:opacity-60">
        {isSaving ? 'Saving...' : isEdit ? 'Save changes' : 'Create notice'}
      </button>
    </form>
  )
}
