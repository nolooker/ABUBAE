import type { SupabaseClient } from '@supabase/supabase-js'
import { describe, expect, it } from 'vitest'

import { createWrittenQuestionRepository } from './written-question-repository'

type QueryResult = { data: unknown; error: { message: string } | null }
type QueryExpectation = {
  select: string
  filters: Array<[string, unknown]>
  order: string
}

const publicQuery: QueryExpectation = {
  select: 'id,number,subject,content,updated_at,choices(number,content),exams!inner(slug)',
  filters: [
    ['exam_type', 'written'],
    ['year', 2021],
    ['round', 1],
    ['published', true],
    ['exams.slug', 'jeongchogi'],
  ],
  order: 'number',
}

const gradingQuery: QueryExpectation = {
  select: 'id,number,subject,choices(number,is_correct),exams!inner(slug)',
  filters: publicQuery.filters,
  order: 'number',
}

function createSupabaseClient(result: QueryResult, expected: QueryExpectation) {
  let selected: string | undefined
  const filters: Array<[string, unknown]> = []

  const query = {
    select(selection: string) {
      selected = selection
      return query
    },
    eq(column: string, value: unknown) {
      filters.push([column, value])
      return query
    },
    order(column: string) {
      expect(selected).toBe(expected.select)
      expect(filters).toEqual(expected.filters)
      expect(column).toBe(expected.order)
      return Promise.resolve(result)
    },
  }

  return {
    from() {
      return query
    },
  } as unknown as SupabaseClient
}

function publicQuestion(overrides: Record<string, unknown> = {}) {
  return {
    id: 'q1',
    number: 1,
    subject: 'software',
    content: 'Question',
    updated_at: '2026-07-23T00:00:00Z',
    exams: { slug: 'jeongchogi' },
    choices: [
      { number: 2, content: 'B' },
      { number: 1, content: 'A' },
      { number: 4, content: 'D' },
      { number: 3, content: 'C' },
    ],
    ...overrides,
  }
}

function gradingQuestion(overrides: Record<string, unknown> = {}) {
  return {
    id: 'q1',
    number: 1,
    subject: 'software',
    exams: { slug: 'jeongchogi' },
    choices: [
      { number: 1, is_correct: false },
      { number: 2, is_correct: true },
      { number: 3, is_correct: false },
      { number: 4, is_correct: false },
    ],
    ...overrides,
  }
}

describe('written question repository', () => {
  it('maps joined rows without exposing correctness publicly', async () => {
    const repository = createWrittenQuestionRepository(createSupabaseClient({
      data: [publicQuestion()],
      error: null,
    }, publicQuery))

    const round = await repository.getPublicWrittenRound(2021, 1)

    expect(round?.questions[0]).toEqual({
      id: 'q1',
      number: 1,
      subject: 'software',
      content: 'Question',
      choices: ['A', 'B', 'C', 'D'],
      updatedAt: '2026-07-23T00:00:00Z',
    })
    expect(round?.questions[0]).not.toHaveProperty('acceptedAnswerIndexes')
  })

  it('loads correct choices only inside grading', async () => {
    const repository = createWrittenQuestionRepository(createSupabaseClient({
      data: [gradingQuestion()],
      error: null,
    }, gradingQuery))

    const result = await repository.gradeWrittenSubmission(2021, 1, { q1: 1 })

    expect(result?.correct).toBe(1)
  })

  it('reports database failures as content unavailability', async () => {
    const repository = createWrittenQuestionRepository(createSupabaseClient({
      data: null,
      error: { message: 'connection failed' },
    }, publicQuery))

    await expect(repository.getPublicWrittenRound(2021, 1)).rejects.toMatchObject({
      name: 'WrittenContentUnavailableError',
    })
  })

  it('rejects answers for questions outside the loaded round', async () => {
    const repository = createWrittenQuestionRepository(createSupabaseClient({
      data: [gradingQuestion()],
      error: null,
    }, gradingQuery))

    await expect(repository.gradeWrittenSubmission(2021, 1, { unknown: 0 })).rejects.toThrow(
      'unknown is not part of this written round',
    )
  })

  it.each([
    null,
    [],
    [{ number: 0, content: 'A' }, { number: 2, content: 'B' }, { number: 3, content: 'C' }, { number: 4, content: 'D' }],
    [{ number: 1, content: 'A' }, { number: 2, content: 'B' }, { number: 3, content: 'C' }, { number: 4, content: false }],
  ])('treats malformed nested public choices as unavailable content', async (choices) => {
    const repository = createWrittenQuestionRepository(createSupabaseClient({
      data: [publicQuestion({ choices })],
      error: null,
    }, publicQuery))

    await expect(repository.getPublicWrittenRound(2021, 1)).rejects.toMatchObject({
      name: 'WrittenContentUnavailableError',
    })
  })
})
