import { describe, expect, it } from 'vitest'

import {
  BoardValidationError,
  validateBoardCommentInput,
  validateBoardId,
  validateBoardPostInput,
} from './board'

describe('validateBoardPostInput', () => {
  it('trims valid post fields without changing their types', () => {
    expect(validateBoardPostInput({ title: ' 제목 ', content: ' 내용 ' })).toEqual({
      title: '제목',
      content: '내용',
    })
  })

  it.each([
    [{ title: '', content: 'content' }, 'title'],
    [{ title: '   ', content: 'content' }, 'title'],
    [{ title: 'x'.repeat(201), content: 'content' }, 'title'],
    [{ title: 'title', content: '' }, 'content'],
    [{ title: 'title', content: 'x'.repeat(5_001) }, 'content'],
    [{ title: 'title', content: 'content', extra: 'nope' }, 'unknown'],
    [{ title: 123, content: 'content' }, 'title'],
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

describe('validateBoardId', () => {
  it('accepts a UUID', () => {
    expect(validateBoardId('d7d68087-a5a8-4b6e-a0aa-550a4f5937a1')).toBe('d7d68087-a5a8-4b6e-a0aa-550a4f5937a1')
  })

  it.each(['not-a-uuid', '00000000-0000-0000-0000-00000000000z', 42, null])('rejects malformed ids: %o', (id) => {
    expect(() => validateBoardId(id)).toThrow('id must be a UUID')
  })
})
