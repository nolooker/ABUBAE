import { describe, expect, it, vi } from 'vitest'

import {
  ExamNotFoundError,
  ExamScheduleDuplicateError,
  ExamScheduleNotFoundError,
  ExamScheduleRepositoryError,
  createExamScheduleRepository,
} from './exam-schedule-repository'

type Result = { data: unknown; error: { code?: string; message?: string } | null }

function client(options: {
  listResult?: Result
  examResult?: Result
  singleResult?: Result
  maybeSingleResult?: Result
} = {}) {
  const calls: Array<[string, unknown[]]> = []
  const listResult = options.listResult ?? { data: [], error: null }
  const examResult = options.examResult ?? { data: { id: 'exam-id' }, error: null }
  const singleResult = options.singleResult ?? { data: null, error: null }
  const maybeSingleResult = options.maybeSingleResult ?? { data: null, error: null }

  const examsQuery = {
    select: vi.fn((...args: unknown[]) => { calls.push(['exams.select', args]); return examsQuery }),
    eq: vi.fn((...args: unknown[]) => { calls.push(['exams.eq', args]); return examsQuery }),
    maybeSingle: vi.fn(() => { calls.push(['exams.maybeSingle', []]); return Promise.resolve(examResult) }),
  }

  const schedulesQuery = {
    select: vi.fn((...args: unknown[]) => { calls.push(['select', args]); return schedulesQuery }),
    eq: vi.fn((...args: unknown[]) => { calls.push(['eq', args]); return schedulesQuery }),
    order: vi.fn((...args: unknown[]) => { calls.push(['order', args]); return schedulesQuery }),
    insert: vi.fn((...args: unknown[]) => { calls.push(['insert', args]); return schedulesQuery }),
    update: vi.fn((...args: unknown[]) => { calls.push(['update', args]); return schedulesQuery }),
    delete: vi.fn((...args: unknown[]) => { calls.push(['delete', args]); return schedulesQuery }),
    single: vi.fn(() => { calls.push(['single', []]); return Promise.resolve(singleResult) }),
    maybeSingle: vi.fn(() => { calls.push(['maybeSingle', []]); return Promise.resolve(maybeSingleResult) }),
    then: (resolve: (value: unknown) => unknown) => Promise.resolve(listResult).then(resolve),
  }

  const from = vi.fn((table: string) => (table === 'exams' ? examsQuery : schedulesQuery))

  return { supabase: { from }, calls }
}

const row = {
  id: 'a1111111-a5a8-4b6e-a0aa-550a4f5937a1',
  year: 2026,
  round: 1,
  written_apply_start: '2026-01-05',
  written_apply_end: '2026-01-09',
  written_exam_date: '2026-02-07',
  written_result_date: '2026-03-11',
  practical_apply_start: '2026-03-16',
  practical_apply_end: '2026-03-20',
  practical_exam_date: '2026-04-18',
  final_result_date: '2026-06-10',
  created_at: '2026-01-01T00:00:00Z',
  updated_at: '2026-01-01T00:00:00Z',
}

const schedule = {
  id: row.id,
  year: 2026,
  round: 1,
  writtenApplyStart: '2026-01-05',
  writtenApplyEnd: '2026-01-09',
  writtenExamDate: '2026-02-07',
  writtenResultDate: '2026-03-11',
  practicalApplyStart: '2026-03-16',
  practicalApplyEnd: '2026-03-20',
  practicalExamDate: '2026-04-18',
  finalResultDate: '2026-06-10',
  createdAt: row.created_at,
  updatedAt: row.updated_at,
}

const input = {
  year: 2026,
  round: 1,
  writtenApplyStart: '2026-01-05',
  writtenApplyEnd: '2026-01-09',
  writtenExamDate: '2026-02-07',
  writtenResultDate: '2026-03-11',
  practicalApplyStart: '2026-03-16',
  practicalApplyEnd: '2026-03-20',
  practicalExamDate: '2026-04-18',
  finalResultDate: '2026-06-10',
}

describe('exam schedule repository', () => {
  it('lists schedules for an exam ordered by year and round descending', async () => {
    const { supabase, calls } = client({ listResult: { data: [row], error: null } })

    await expect(createExamScheduleRepository(supabase as never).listByExamSlug('jeongchogi')).resolves.toEqual([schedule])
    expect(calls).toContainEqual(['eq', ['exams.slug', 'jeongchogi']])
    expect(calls).toContainEqual(['order', ['year', { ascending: false }]])
    expect(calls).toContainEqual(['order', ['round', { ascending: false }]])
  })

  it('reports a database failure while listing as unavailable', async () => {
    const { supabase } = client({ listResult: { data: null, error: { message: 'connection failed' } } })

    await expect(createExamScheduleRepository(supabase as never).listByExamSlug('jeongchogi'))
      .rejects.toBeInstanceOf(ExamScheduleRepositoryError)
  })

  it('creates a schedule under the resolved exam id', async () => {
    const { supabase, calls } = client({ singleResult: { data: row, error: null } })

    await expect(createExamScheduleRepository(supabase as never).create('jeongchogi', input)).resolves.toEqual(schedule)
    expect(calls).toContainEqual(['exams.eq', ['slug', 'jeongchogi']])
    expect(calls).toContainEqual(['insert', [expect.objectContaining({ exam_id: 'exam-id', year: 2026, round: 1 })]])
  })

  it('reports a missing exam slug as not found', async () => {
    const { supabase } = client({ examResult: { data: null, error: null } })

    await expect(createExamScheduleRepository(supabase as never).create('unknown', input))
      .rejects.toBeInstanceOf(ExamNotFoundError)
  })

  it('reports a duplicate year/round as a conflict', async () => {
    const { supabase } = client({ singleResult: { data: null, error: { code: '23505' } } })

    await expect(createExamScheduleRepository(supabase as never).create('jeongchogi', input))
      .rejects.toBeInstanceOf(ExamScheduleDuplicateError)
  })

  it('updates a schedule and reports a missing row as not found', async () => {
    const found = client({ maybeSingleResult: { data: row, error: null } })
    await expect(createExamScheduleRepository(found.supabase as never).update(row.id, input)).resolves.toEqual(schedule)
    expect(found.calls).toContainEqual(['eq', ['id', row.id]])

    const missing = client({ maybeSingleResult: { data: null, error: null } })
    await expect(createExamScheduleRepository(missing.supabase as never).update(row.id, input))
      .rejects.toBeInstanceOf(ExamScheduleNotFoundError)
  })

  it('deletes a schedule and reports a missing row as not found', async () => {
    const found = client({ maybeSingleResult: { data: { id: row.id }, error: null } })
    await expect(createExamScheduleRepository(found.supabase as never).delete(row.id)).resolves.toBeUndefined()

    const missing = client({ maybeSingleResult: { data: null, error: null } })
    await expect(createExamScheduleRepository(missing.supabase as never).delete(row.id))
      .rejects.toBeInstanceOf(ExamScheduleNotFoundError)
  })
})
