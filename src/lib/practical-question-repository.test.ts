import type { SupabaseClient } from '@supabase/supabase-js'
import { describe, expect, it } from 'vitest'

import { createPracticalQuestionRepository } from './practical-question-repository'

type QueryResult = { data: unknown; error: { message: string } | null }
type QueryExpectation = {
  select: string
  filters: Array<[string, unknown]>
  order: string
}

const publicQuery: QueryExpectation = {
  select: 'id,number,subject,content,updated_at,practical_answers(blank_number),exams!inner(slug)',
  filters: [
    ['exam_type', 'practical'],
    ['year', 2025],
    ['round', 2],
    ['published', true],
    ['exams.slug', 'jeongchogi'],
  ],
  order: 'number',
}

const gradingQuery: QueryExpectation = {
  select: 'id,number,subject,explanation,practical_answers(blank_number,accepted_answers),exams!inner(slug)',
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
    subject: '실기',
    content: 'Question',
    updated_at: '2026-07-23T00:00:00Z',
    exams: { slug: 'jeongchogi' },
    practical_answers: [{ blank_number: 1 }],
    ...overrides,
  }
}

function gradingQuestion(overrides: Record<string, unknown> = {}) {
  return {
    id: 'q1',
    number: 1,
    subject: '실기',
    explanation: 'Edited explanation',
    exams: { slug: 'jeongchogi' },
    practical_answers: [{ blank_number: 1, accepted_answers: ['SSH'] }],
    ...overrides,
  }
}

function createSummaryClient(results: QueryResult | QueryResult[]) {
  const pages = Array.isArray(results) ? results : [results]
  const filters: Array<[string, unknown]> = []
  const ranges: Array<[number, number]> = []
  let selected: string | undefined
  let callIndex = 0

  const query: PromiseLike<QueryResult> & {
    select: (s: string) => typeof query
    eq: (c: string, v: unknown) => typeof query
    range: (from: number, to: number) => typeof query
  } = {
    select(selection: string) {
      selected = selection
      return query
    },
    eq(column: string, value: unknown) {
      filters.push([column, value])
      return query
    },
    range(from: number, to: number) {
      ranges.push([from, to])
      return query
    },
    then(onfulfilled) {
      const result = pages[Math.min(callIndex, pages.length - 1)]
      callIndex += 1
      return Promise.resolve(result).then(onfulfilled)
    },
  }

  return {
    client: { from: () => query } as unknown as SupabaseClient,
    filters,
    ranges,
    selected: () => selected,
  }
}

describe('practical question repository', () => {
  it('groups published practical questions into per-round summaries', async () => {
    const { client, filters, selected } = createSummaryClient({
      data: [
        { year: 2025, round: 2, subject: '실기', exams: { slug: 'jeongchogi' } },
        { year: 2025, round: 2, subject: '실기', exams: { slug: 'jeongchogi' } },
        { year: 2025, round: 3, subject: '실기', exams: { slug: 'jeongchogi' } },
      ],
      error: null,
    })

    const repository = createPracticalQuestionRepository(client)
    const summaries = await repository.listPublishedRoundSummaries()

    expect(summaries).toEqual([
      { year: 2025, round: 2, questionCount: 2, subjectCount: 1 },
      { year: 2025, round: 3, questionCount: 1, subjectCount: 1 },
    ])
    expect(selected()).toBe('year,round,subject,exams!inner(slug)')
    expect(filters).toEqual([
      ['exam_type', 'practical'],
      ['published', true],
      ['exams.slug', 'jeongchogi'],
    ])
  })

  it('reports database failures as content unavailability for round summaries', async () => {
    const { client } = createSummaryClient({ data: null, error: { message: 'connection failed' } })
    const repository = createPracticalQuestionRepository(client)

    await expect(repository.listPublishedRoundSummaries()).rejects.toMatchObject({
      name: 'PracticalContentUnavailableError',
    })
  })

  it('maps joined rows to a blank count without exposing accepted answers publicly', async () => {
    const repository = createPracticalQuestionRepository(createSupabaseClient({
      data: [publicQuestion({ practical_answers: [{ blank_number: 1 }, { blank_number: 2 }] })],
      error: null,
    }, publicQuery))

    const round = await repository.getPublicPracticalRound(2025, 2)

    expect(round?.questions[0]).toEqual({
      id: 'q1',
      number: 1,
      subject: '실기',
      content: 'Question',
      blankCount: 2,
      updatedAt: '2026-07-23T00:00:00Z',
    })
    expect(round?.questions[0]).not.toHaveProperty('explanation')
  })

  it('reports database failures as content unavailability for the public round', async () => {
    const repository = createPracticalQuestionRepository(createSupabaseClient({
      data: null,
      error: { message: 'connection failed' },
    }, publicQuery))

    await expect(repository.getPublicPracticalRound(2025, 2)).rejects.toMatchObject({
      name: 'PracticalContentUnavailableError',
    })
  })

  it('loads accepted answers only inside grading', async () => {
    const repository = createPracticalQuestionRepository(createSupabaseClient({
      data: [gradingQuestion()],
      error: null,
    }, gradingQuery))

    const result = await repository.gradePracticalSubmission(2025, 2, { q1: ['SSH'] })

    expect(result?.correct).toBe(1)
    expect(result?.questions[0].explanation).toBe('Edited explanation')
  })

  it('rejects answers for questions outside the loaded round', async () => {
    const repository = createPracticalQuestionRepository(createSupabaseClient({
      data: [gradingQuestion()],
      error: null,
    }, gradingQuery))

    await expect(repository.gradePracticalSubmission(2025, 2, { unknown: ['x'] })).rejects.toThrow(
      'unknown is not part of this practical round',
    )
  })

  it.each([
    null,
    [],
    [{ blank_number: 0, accepted_answers: ['A'] }],
    [{ blank_number: 1, accepted_answers: [] }],
    [{ blank_number: 1, accepted_answers: [1] }],
  ])('treats malformed nested answers as unavailable content', async (practicalAnswers) => {
    const repository = createPracticalQuestionRepository(createSupabaseClient({
      data: [gradingQuestion({ practical_answers: practicalAnswers })],
      error: null,
    }, gradingQuery))

    await expect(repository.gradePracticalSubmission(2025, 2, {})).rejects.toMatchObject({
      name: 'PracticalContentUnavailableError',
    })
  })
})
