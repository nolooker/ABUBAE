import { describe, expect, it } from 'vitest'

import {
  BoardValidationError,
  validateBoardCommentEditInput,
  validateBoardCommentInput,
  validateBoardId,
  validateBoardPostInput,
  validateBoardReportInput,
} from './board'

describe('validateBoardPostInput', () => {
  it('trims valid post fields without changing their types', () => {
    expect(validateBoardPostInput({ title: ' 제목 ', content: ' 내용 ', category: 'free' })).toEqual({
      title: '제목',
      content: '내용',
      category: 'free',
    })
  })

  it('accepts the review category', () => {
    expect(validateBoardPostInput({ title: '제목', content: '내용', category: 'review' })).toEqual({
      title: '제목',
      content: '내용',
      category: 'review',
    })
  })

  it.each([
    [{ title: '', content: 'content', category: 'free' }, 'title'],
    [{ title: '   ', content: 'content', category: 'free' }, 'title'],
    [{ title: 'x'.repeat(201), content: 'content', category: 'free' }, 'title'],
    [{ title: 'title', content: '', category: 'free' }, 'content'],
    [{ title: 'title', content: 'x'.repeat(5_001), category: 'free' }, 'content'],
    [{ title: 'title', content: 'content', category: 'free', extra: 'nope' }, 'unknown'],
    [{ title: 123, content: 'content', category: 'free' }, 'title'],
    [{ title: 'title', content: 'content' }, 'category must be "free" or "review"'],
    [{ title: 'title', content: 'content', category: 'other' }, 'category must be "free" or "review"'],
  ])('rejects invalid post payloads: %o', (input, message) => {
    expect(() => validateBoardPostInput(input)).toThrow(BoardValidationError)
    expect(() => validateBoardPostInput(input)).toThrow(message)
  })

  it.each([null, undefined, 'string', 42, []])('rejects non-object payloads: %o', (input) => {
    expect(() => validateBoardPostInput(input)).toThrow('payload must be an object')
  })
})

describe('validateBoardCommentInput', () => {
  it('trims a valid top-level comment and defaults parentCommentId to null', () => {
    expect(validateBoardCommentInput({ content: ' 댓글 ' })).toEqual({ content: '댓글', parentCommentId: null })
  })

  it('accepts an explicit null parentCommentId', () => {
    expect(validateBoardCommentInput({ content: '댓글', parentCommentId: null })).toEqual({ content: '댓글', parentCommentId: null })
  })

  it('accepts a valid parentCommentId for a reply', () => {
    const parentCommentId = 'd7d68087-a5a8-4b6e-a0aa-550a4f5937a1'
    expect(validateBoardCommentInput({ content: '답글', parentCommentId })).toEqual({ content: '답글', parentCommentId })
  })

  it.each([
    [{ content: '' }, 'content'],
    [{ content: 'x'.repeat(2_001) }, 'content'],
    [{ content: 'content', extra: 'nope' }, 'unknown'],
    [{ content: 'content', parentCommentId: 'not-a-uuid' }, 'parentCommentId must be a UUID'],
    [{ content: 'content', parentCommentId: 42 }, 'parentCommentId must be a UUID'],
  ])('rejects invalid comment payloads: %o', (input, message) => {
    expect(() => validateBoardCommentInput(input)).toThrow(BoardValidationError)
    expect(() => validateBoardCommentInput(input)).toThrow(message)
  })
})

describe('validateBoardCommentEditInput', () => {
  it('trims a valid edit', () => {
    expect(validateBoardCommentEditInput({ content: ' 수정된 댓글 ' })).toEqual({ content: '수정된 댓글' })
  })

  it.each([
    [{ content: '' }, 'content'],
    [{ content: 'x'.repeat(2_001) }, 'content'],
    [{ content: 'content', parentCommentId: null }, 'unknown'],
    [{ content: 'content', extra: 'nope' }, 'unknown'],
  ])('rejects invalid edit payloads: %o', (input, message) => {
    expect(() => validateBoardCommentEditInput(input)).toThrow(BoardValidationError)
    expect(() => validateBoardCommentEditInput(input)).toThrow(message)
  })
})

describe('validateBoardReportInput', () => {
  const targetId = 'd7d68087-a5a8-4b6e-a0aa-550a4f5937a1'

  it('trims a valid post report', () => {
    expect(validateBoardReportInput({ targetType: 'post', targetId, reason: ' 스팸입니다 ' })).toEqual({
      targetType: 'post',
      targetId,
      reason: '스팸입니다',
    })
  })

  it('accepts a comment report', () => {
    expect(validateBoardReportInput({ targetType: 'comment', targetId, reason: '욕설' })).toEqual({
      targetType: 'comment',
      targetId,
      reason: '욕설',
    })
  })

  it.each([
    [{ targetType: 'other', targetId, reason: 'reason' }, 'targetType must be "post" or "comment"'],
    [{ targetType: 'post', targetId: 'not-a-uuid', reason: 'reason' }, 'targetId must be a UUID'],
    [{ targetType: 'post', targetId, reason: '' }, 'reason'],
    [{ targetType: 'post', targetId, reason: 'x'.repeat(1_001) }, 'reason'],
    [{ targetType: 'post', targetId, reason: 'reason', extra: 'nope' }, 'unknown'],
  ])('rejects invalid report payloads: %o', (input, message) => {
    expect(() => validateBoardReportInput(input)).toThrow(BoardValidationError)
    expect(() => validateBoardReportInput(input)).toThrow(message)
  })
})

describe('validateBoardId', () => {
  it('accepts a UUID', () => {
    expect(validateBoardId('d7d68087-a5a8-4b6e-a0aa-550a4f5937a1')).toBe('d7d68087-a5a8-4b6e-a0aa-550a4f5937a1')
  })

  it.each(['not-a-uuid', '00000000-0000-0000-0000-00000000000z', 42, null])('rejects malformed ids: %o', (id) => {
    expect(() => validateBoardId(id)).toThrow('id must be a UUID')
  })
})
