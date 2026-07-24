import { describe, expect, it } from 'vitest'

import { NoticeValidationError, validateNoticeId, validateNoticeInput } from './notice'

describe('validateNoticeInput', () => {
  it('trims valid notice fields without changing their types', () => {
    expect(validateNoticeInput({
      title: ' 공지 ',
      slug: 'first-notice',
      content: ' 내용 ',
      isPublished: true,
    })).toEqual({
      title: '공지',
      slug: 'first-notice',
      content: '내용',
      isPublished: true,
    })
  })

  it.each([
    [{ title: '', slug: 'first-notice', content: 'content', isPublished: true }, 'title'],
    [{ title: 'x'.repeat(121), slug: 'first-notice', content: 'content', isPublished: true }, 'title'],
    [{ title: 'title', slug: '', content: 'content', isPublished: true }, 'slug'],
    [{ title: 'title', slug: 'a'.repeat(121), content: 'content', isPublished: true }, 'slug'],
    [{ title: 'title', slug: 'First-Notice', content: 'content', isPublished: true }, 'slug'],
    [{ title: 'title', slug: 'first notice', content: 'content', isPublished: true }, 'slug'],
    [{ title: 'title', slug: 'first--notice', content: 'content', isPublished: true }, 'slug'],
    [{ title: 'title', slug: 'first-notice', content: '', isPublished: true }, 'content'],
    [{ title: 'title', slug: 'first-notice', content: 'x'.repeat(20_001), isPublished: true }, 'content'],
    [{ title: 'title', slug: 'first-notice', content: 'content', isPublished: 'true' }, 'isPublished'],
    [{ title: 'title', slug: 'first-notice', content: 'content', isPublished: true, extra: 'nope' }, 'unknown'],
  ])('rejects invalid notice payloads: %o', (input, message) => {
    expect(() => validateNoticeInput(input)).toThrow(NoticeValidationError)
    expect(() => validateNoticeInput(input)).toThrow(message)
  })
})

describe('validateNoticeId', () => {
  it.each(['not-a-uuid', '00000000-0000-0000-0000-00000000000z'])('rejects malformed UUIDs: %s', (id) => {
    expect(() => validateNoticeId(id)).toThrow('noticeId must be a UUID')
  })

  it('accepts UUIDs and rejects malformed optimistic-lock timestamps', () => {
    expect(validateNoticeId('d7d68087-a5a8-4b6e-a0aa-550a4f5937a1')).toBe('d7d68087-a5a8-4b6e-a0aa-550a4f5937a1')
    expect(() => validateNoticeInput({
      title: 'title',
      slug: 'first-notice',
      content: 'content',
      isPublished: true,
      expectedUpdatedAt: 'yesterday',
    }, { expectedUpdatedAt: true })).toThrow('expectedUpdatedAt must be an ISO timestamp')
    expect(() => validateNoticeInput({
      title: 'title',
      slug: 'first-notice',
      content: 'content',
      isPublished: true,
      expectedUpdatedAt: '2026-07-24',
    }, { expectedUpdatedAt: true })).toThrow('expectedUpdatedAt must be an ISO timestamp')
    expect(() => validateNoticeInput({
      title: 'title',
      slug: 'first-notice',
      content: 'content',
      isPublished: true,
      expectedUpdatedAt: '2026-02-30T00:00:00Z',
    }, { expectedUpdatedAt: true })).toThrow('expectedUpdatedAt must be an ISO timestamp')
  })
})
