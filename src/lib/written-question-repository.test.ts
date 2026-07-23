import type { SupabaseClient } from '@supabase/supabase-js'
import { describe, expect, it } from 'vitest'

import { createWrittenQuestionRepository } from './written-question-repository'

type QueryResult = { data: unknown; error: { message: string } | null }

function createSupabaseClient(result: QueryResult) {
  const query = {
    select() {
      return query
    },
    eq() {
      return query
    },
    order() {
      return Promise.resolve(result)
    },
  }

  return {
    from() {
      return query
    },
  } as unknown as SupabaseClient
}

describe('written question repository', () => {
  it('maps joined rows without exposing correctness publicly', async () => {
    const repository = createWrittenQuestionRepository(createSupabaseClient({
      data: [{
        id: 'q1',
        number: 1,
        subject: 'software',
        content: 'Question',
        updated_at: '2026-07-23T00:00:00Z',
        choices: [
          { number: 2, content: 'B' },
          { number: 1, content: 'A' },
          { number: 4, content: 'D' },
          { number: 3, content: 'C' },
        ],
      }],
      error: null,
    }))

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
      data: [{
        id: 'q1',
        number: 1,
        subject: 'software',
        choices: [
          { number: 1, is_correct: false },
          { number: 2, is_correct: true },
          { number: 3, is_correct: false },
          { number: 4, is_correct: false },
        ],
      }],
      error: null,
    }))

    const result = await repository.gradeWrittenSubmission(2021, 1, { q1: 1 })

    expect(result?.correct).toBe(1)
  })

  it('reports database failures as content unavailability', async () => {
    const repository = createWrittenQuestionRepository(createSupabaseClient({
      data: null,
      error: { message: 'connection failed' },
    }))

    await expect(repository.getPublicWrittenRound(2021, 1)).rejects.toMatchObject({
      name: 'WrittenContentUnavailableError',
    })
  })
})
