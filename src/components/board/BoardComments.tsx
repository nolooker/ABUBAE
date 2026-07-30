'use client'

import Link from 'next/link'
import { useRef, useState, type FormEvent } from 'react'
import BoardReportButton from './BoardReportButton'

type Comment = {
  id: string
  postId: string
  userId: string
  authorNickname: string
  content: string
  createdAt: string
  updatedAt: string | null
  parentCommentId: string | null
}

type BoardCommentsProps = {
  postId: string
  initialComments: Comment[]
  currentUserId: string | null
  canModerate?: boolean
}

function formattedDate(timestamp: string) {
  return new Intl.DateTimeFormat('ko-KR', { month: 'long', day: 'numeric', timeZone: 'UTC' }).format(new Date(timestamp))
}

async function postComment(postId: string, content: string, parentCommentId: string | null): Promise<Comment> {
  const response = await fetch(`/api/board/posts/${postId}/comments`, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({ content, parentCommentId }),
  })
  if (!response.ok) throw new Error('unable to save comment')
  return response.json()
}

export default function BoardComments({ postId, initialComments, currentUserId, canModerate = false }: BoardCommentsProps) {
  const [comments, setComments] = useState(initialComments)
  const [content, setContent] = useState('')
  const [isSaving, setIsSaving] = useState(false)
  const [error, setError] = useState<string | null>(null)
  const [replyTargetId, setReplyTargetId] = useState<string | null>(null)
  const [replyContent, setReplyContent] = useState('')
  const [isReplying, setIsReplying] = useState(false)
  const [replyError, setReplyError] = useState<string | null>(null)
  const [editTargetId, setEditTargetId] = useState<string | null>(null)
  const [editContent, setEditContent] = useState('')
  const [isEditing, setIsEditing] = useState(false)
  const [editError, setEditError] = useState<string | null>(null)
  const savingRef = useRef(false)
  const replyingRef = useRef(false)
  const editingRef = useRef(false)

  const topLevelComments = comments.filter((comment) => comment.parentCommentId === null)
  const repliesFor = (commentId: string) => comments.filter((comment) => comment.parentCommentId === commentId)

  const submit = async (event: FormEvent<HTMLFormElement>) => {
    event.preventDefault()
    if (savingRef.current) return
    savingRef.current = true
    setIsSaving(true)
    setError(null)

    try {
      const comment = await postComment(postId, content, null)
      setComments((previous) => [...previous, comment])
      setContent('')
    } catch {
      setError('댓글을 등록하지 못했습니다. 다시 시도해 주세요.')
    } finally {
      savingRef.current = false
      setIsSaving(false)
    }
  }

  const toggleReply = (commentId: string) => {
    setReplyError(null)
    setReplyTargetId((current) => (current === commentId ? null : commentId))
    setReplyContent('')
  }

  const submitReply = async (event: FormEvent<HTMLFormElement>, parentCommentId: string) => {
    event.preventDefault()
    if (replyingRef.current) return
    replyingRef.current = true
    setIsReplying(true)
    setReplyError(null)

    try {
      const comment = await postComment(postId, replyContent, parentCommentId)
      setComments((previous) => [...previous, comment])
      setReplyContent('')
      setReplyTargetId(null)
    } catch {
      setReplyError('답글을 등록하지 못했습니다. 다시 시도해 주세요.')
    } finally {
      replyingRef.current = false
      setIsReplying(false)
    }
  }

  const toggleEdit = (comment: Comment) => {
    setEditError(null)
    if (editTargetId === comment.id) {
      setEditTargetId(null)
      return
    }
    setEditTargetId(comment.id)
    setEditContent(comment.content)
  }

  const submitEdit = async (event: FormEvent<HTMLFormElement>, commentId: string) => {
    event.preventDefault()
    if (editingRef.current) return
    editingRef.current = true
    setIsEditing(true)
    setEditError(null)

    try {
      const response = await fetch(`/api/board/comments/${commentId}`, {
        method: 'PATCH',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ content: editContent }),
      })
      if (!response.ok) {
        setEditError('댓글을 수정하지 못했습니다. 다시 시도해 주세요.')
        return
      }
      const updated: Comment = await response.json()
      setComments((previous) => previous.map((comment) => (comment.id === commentId ? updated : comment)))
      setEditTargetId(null)
    } catch {
      setEditError('댓글을 수정하지 못했습니다. 다시 시도해 주세요.')
    } finally {
      editingRef.current = false
      setIsEditing(false)
    }
  }

  const removeComment = async (commentId: string) => {
    if (!window.confirm('삭제할까요?')) return

    const response = await fetch(`/api/board/comments/${commentId}`, { method: 'DELETE' })
    if (response.ok) {
      setComments((previous) => previous.filter((comment) => comment.id !== commentId))
    }
  }

  const renderComment = (comment: Comment, options: { nested: boolean }) => {
    const canEdit = currentUserId === comment.userId
    const canDelete = canEdit || canModerate

    return (
      <div key={comment.id}>
        <div className="flex items-center justify-between gap-2">
          <p className="text-sm font-semibold text-[var(--text-primary)]">
            {comment.authorNickname}
            <span className="ml-2 font-normal text-[var(--text-muted)]">
              {formattedDate(comment.createdAt)}
              {comment.updatedAt && ' (수정됨)'}
            </span>
          </p>
          <div className="flex shrink-0 items-center gap-3">
            {canEdit && (
              <button type="button" onClick={() => toggleEdit(comment)} className="text-xs font-semibold text-[var(--primary)]">
                {editTargetId === comment.id ? '취소' : '수정'}
              </button>
            )}
            {canDelete && (
              <button type="button" onClick={() => removeComment(comment.id)} className="text-xs font-semibold text-red-600">
                삭제
              </button>
            )}
          </div>
        </div>

        {editTargetId === comment.id ? (
          <form onSubmit={(event) => submitEdit(event, comment.id)} className="mt-2 space-y-2">
            <textarea
              aria-label="댓글 수정"
              value={editContent}
              onChange={(event) => setEditContent(event.target.value)}
              rows={2}
              disabled={isEditing}
              className="w-full rounded-lg border border-[var(--border)] p-2 text-sm"
            />
            {editError && <p role="alert" className="text-xs font-semibold text-red-600">{editError}</p>}
            <button type="submit" disabled={isEditing} className="rounded-lg bg-[var(--primary)] px-3 py-1.5 text-xs font-bold text-white disabled:cursor-not-allowed disabled:opacity-60">
              {isEditing ? '저장 중...' : '저장'}
            </button>
          </form>
        ) : (
          <p className="mt-2 whitespace-pre-wrap text-sm text-[var(--text-secondary)]">{comment.content}</p>
        )}

        <div className="mt-2 flex items-center gap-3">
          {!options.nested && currentUserId && (
            <button type="button" onClick={() => toggleReply(comment.id)} className="text-xs font-semibold text-[var(--primary)]">
              {replyTargetId === comment.id ? '답글 취소' : '답글'}
            </button>
          )}
          {currentUserId && !canEdit && <BoardReportButton targetType="comment" targetId={comment.id} />}
        </div>
      </div>
    )
  }

  return (
    <div className="mt-8">
      <h2 className="text-lg font-bold text-[var(--text-primary)]">댓글 {comments.length}</h2>

      <div className="mt-4 space-y-3">
        {topLevelComments.map((comment) => (
          <div key={comment.id} className="rounded-xl border border-[var(--border)] bg-white p-4">
            {renderComment(comment, { nested: false })}

            {repliesFor(comment.id).length > 0 && (
              <div className="mt-3 space-y-3 border-l-2 border-[var(--border)] pl-4">
                {repliesFor(comment.id).map((reply) => renderComment(reply, { nested: true }))}
              </div>
            )}

            {replyTargetId === comment.id && (
              <form onSubmit={(event) => submitReply(event, comment.id)} className="mt-3 space-y-2 border-l-2 border-[var(--border)] pl-4">
                <textarea
                  aria-label="답글"
                  value={replyContent}
                  onChange={(event) => setReplyContent(event.target.value)}
                  rows={2}
                  disabled={isReplying}
                  placeholder="답글을 입력하세요"
                  className="w-full rounded-lg border border-[var(--border)] p-2 text-sm"
                />
                {replyError && <p role="alert" className="text-xs font-semibold text-red-600">{replyError}</p>}
                <button type="submit" disabled={isReplying} className="rounded-lg bg-[var(--primary)] px-3 py-1.5 text-xs font-bold text-white disabled:cursor-not-allowed disabled:opacity-60">
                  {isReplying ? '등록 중...' : '답글 등록'}
                </button>
              </form>
            )}
          </div>
        ))}
        {topLevelComments.length === 0 && <p className="text-sm text-[var(--text-muted)]">첫 댓글을 남겨보세요.</p>}
      </div>

      {currentUserId ? (
        <form onSubmit={submit} className="mt-4 space-y-3">
          <textarea
            aria-label="댓글"
            value={content}
            onChange={(event) => setContent(event.target.value)}
            rows={3}
            disabled={isSaving}
            placeholder="댓글을 입력하세요"
            className="w-full rounded-lg border border-[var(--border)] p-3 text-sm"
          />
          {error && <p role="alert" className="text-sm font-semibold text-red-600">{error}</p>}
          <button type="submit" disabled={isSaving} className="rounded-xl bg-[var(--primary)] px-4 py-2 text-sm font-bold text-white disabled:cursor-not-allowed disabled:opacity-60">
            {isSaving ? '등록 중...' : '댓글 등록'}
          </button>
        </form>
      ) : (
        <p className="mt-4 text-sm text-[var(--text-secondary)]">
          댓글을 남기려면 <Link href="/login" className="font-semibold text-[var(--primary)] hover:underline">로그인</Link>이 필요합니다.
        </p>
      )}
    </div>
  )
}
