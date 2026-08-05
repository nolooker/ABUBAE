import { describe, expect, it, vi } from 'vitest'

import { ExamAttemptRepositoryError, ExamNotFoundError, createExamAttemptRepository } from './exam-attempt-repository'

type Result = { data: unknown; error: { message?: string } | null }

function client(options: {
  examResult?: Result
  insertResult?: Result
  listResult?: Result
  singleResult?: Result
} = {}) {
  const calls: Array<[string, unknown[]]> = []
  const examResult = options.examResult ?? { data: { id: 'exam-id' }, error: null }
  const insertResult = options.insertResult ?? { data: null, error: null }
  const listResult = options.listResult ?? { data: [], error: null }
  const singleResult = options.singleResult ?? { data: null, error: null }

  const examsQuery = {
    select: vi.fn((...args: unknown[]) => { calls.push(['exams.select', args]); return examsQuery }),
    eq: vi.fn((...args: unknown[]) => { calls.push(['exams.eq', args]); return examsQuery }),
    maybeSingle: vi.fn(() => { calls.push(['exams.maybeSingle', []]); return Promise.resolve(examResult) }),
  }

  const attemptsQuery = {
    select: vi.fn((...args: unknown[]) => { calls.push(['select', args]); return attemptsQuery }),
    insert: vi.fn((...args: unknown[]) => { calls.push(['insert', args]); return attemptsQuery }),
    eq: vi.fn((...args: unknown[]) => { calls.push(['eq', args]); return attemptsQuery }),
    order: vi.fn((...args: unknown[]) => { calls.push(['order', args]); return Promise.resolve(listResult) }),
    single: vi.fn(() => { calls.push(['single', []]); return Promise.resolve(insertResult) }),
    maybeSingle: vi.fn(() => { calls.push(['maybeSingle', []]); return Promise.resolve(singleResult) }),
  }

  const from = vi.fn((table: string) => (table === 'exams' ? examsQuery : attemptsQuery))

  return { supabase: { from }, calls }
}

const writtenResult = {
  total: 2,
  correct: 1,
  incorrect: 1,
  unanswered: 0,
  score: 50,
  subjects: [],
  questions: [
    { id: 'q1', number: 1, subject: '설계', selectedAnswerIndex: 0, acceptedAnswerIndexes: [0], explanation: '', isCorrect: true, isUnanswered: false },
    { id: 'q2', number: 2, subject: '설계', selectedAnswerIndex: 1, acceptedAnswerIndexes: [2], explanation: '', isCorrect: false, isUnanswered: false },
  ],
}

const summaryRowData = {
  id: 'a1',
  exam_type: 'written',
  year: 2021,
  round: 1,
  total: 2,
  correct: 1,
  incorrect: 1,
  unanswered: 0,
  score: 50,
  created_at: '2026-08-05T00:00:00Z',
}

describe('exam attempt repository', () => {
  it('resolves the exam id by slug and saves an attempt', async () => {
    const { supabase, calls } = client({ insertResult: { data: summaryRowData, error: null } })

    const summary = await createExamAttemptRepository(supabase as never).saveAttempt({
      userId: 'user-1',
      examSlug: 'jeongchogi',
      examType: 'written',
      year: 2021,
      round: 1,
      result: writtenResult,
    })

    expect(summary).toEqual({
      id: 'a1',
      examType: 'written',
      year: 2021,
      round: 1,
      total: 2,
      correct: 1,
      incorrect: 1,
      unanswered: 0,
      score: 50,
      createdAt: '2026-08-05T00:00:00Z',
    })
    expect(calls).toContainEqual(['exams.eq', ['slug', 'jeongchogi']])
    expect(calls).toContainEqual(['insert', [expect.objectContaining({ user_id: 'user-1', exam_id: 'exam-id', exam_type: 'written' })]])
  })

  it('reports an unknown exam slug as not found', async () => {
    const { supabase } = client({ examResult: { data: null, error: null } })

    await expect(createExamAttemptRepository(supabase as never).saveAttempt({
      userId: 'user-1',
      examSlug: 'unknown',
      examType: 'written',
      year: 2021,
      round: 1,
      result: writtenResult,
    })).rejects.toBeInstanceOf(ExamNotFoundError)
  })

  it('lists a user\'s attempt summaries ordered by newest first', async () => {
    const { supabase, calls } = client({ listResult: { data: [summaryRowData], error: null } })

    await expect(createExamAttemptRepository(supabase as never).listAttempts('user-1')).resolves.toEqual([
      expect.objectContaining({ id: 'a1', score: 50 }),
    ])
    expect(calls).toContainEqual(['eq', ['user_id', 'user-1']])
    expect(calls).toContainEqual(['order', ['created_at', { ascending: false }]])
  })

  it('gets a single owned attempt with its full result', async () => {
    const { supabase, calls } = client({ singleResult: { data: { ...summaryRowData, result: writtenResult }, error: null } })

    const attempt = await createExamAttemptRepository(supabase as never).getAttempt('user-1', 'a1')

    expect(attempt).toMatchObject({ id: 'a1', examType: 'written' })
    expect(attempt?.result).toEqual(writtenResult)
    expect(calls).toContainEqual(['eq', ['user_id', 'user-1']])
    expect(calls).toContainEqual(['eq', ['id', 'a1']])
  })

  it('returns undefined for a missing or unowned attempt', async () => {
    const { supabase } = client({ singleResult: { data: null, error: null } })

    await expect(createExamAttemptRepository(supabase as never).getAttempt('user-1', 'missing')).resolves.toBeUndefined()
  })

  it('reports database failures as unavailable', async () => {
    const { supabase } = client({ listResult: { data: null, error: { message: 'connection failed' } } })

    await expect(createExamAttemptRepository(supabase as never).listAttempts('user-1')).rejects.toBeInstanceOf(ExamAttemptRepositoryError)
  })

  it('aggregates incorrect questions across attempts, keeping only the latest occurrence', async () => {
    const olderAttempt = {
      id: 'a-older',
      exam_type: 'written',
      year: 2021,
      round: 1,
      total: 1,
      correct: 0,
      incorrect: 1,
      unanswered: 0,
      score: 0,
      created_at: '2026-08-01T00:00:00Z',
      result: {
        total: 1,
        correct: 0,
        incorrect: 1,
        unanswered: 0,
        score: 0,
        subjects: [],
        questions: [{ id: 'q1', number: 1, subject: '설계', selectedAnswerIndex: 0, acceptedAnswerIndexes: [1], explanation: '', isCorrect: false, isUnanswered: false }],
      },
    }
    const newerAttempt = {
      id: 'a-newer',
      exam_type: 'written',
      year: 2021,
      round: 2,
      total: 1,
      correct: 0,
      incorrect: 1,
      unanswered: 0,
      score: 0,
      created_at: '2026-08-05T00:00:00Z',
      result: {
        total: 1,
        correct: 0,
        incorrect: 1,
        unanswered: 0,
        score: 0,
        subjects: [],
        questions: [{ id: 'q1', number: 5, subject: '설계', selectedAnswerIndex: 0, acceptedAnswerIndexes: [1], explanation: '', isCorrect: false, isUnanswered: false }],
      },
    }
    // repository queries ordered by created_at desc, so the newer attempt is returned first
    const { supabase } = client({ listResult: { data: [newerAttempt, olderAttempt], error: null } })

    const incorrect = await createExamAttemptRepository(supabase as never).listIncorrectQuestions('user-1')

    expect(incorrect).toEqual([
      { attemptId: 'a-newer', examType: 'written', year: 2021, round: 2, createdAt: '2026-08-05T00:00:00Z', questionId: 'q1', questionNumber: 5, subject: '설계' },
    ])
  })
})
