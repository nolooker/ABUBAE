import { describe, expect, it } from 'vitest'

import {
  ExamScheduleValidationError,
  isValidExamScheduleDate,
  validateExamScheduleId,
  validateExamScheduleInput,
} from './exam-schedule'

const fullInput = {
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

describe('isValidExamScheduleDate', () => {
  it('accepts a real calendar date', () => {
    expect(isValidExamScheduleDate('2026-02-07')).toBe(true)
  })

  it.each(['2026-02-30', '2026-13-01', '2026/02/07', '2026-2-7', 20260207, null, undefined])(
    'rejects invalid dates: %o',
    (value) => {
      expect(isValidExamScheduleDate(value)).toBe(false)
    },
  )
})

describe('validateExamScheduleId', () => {
  it('accepts a UUID', () => {
    expect(validateExamScheduleId('d7d68087-a5a8-4b6e-a0aa-550a4f5937a1')).toBe('d7d68087-a5a8-4b6e-a0aa-550a4f5937a1')
  })

  it.each(['not-a-uuid', 42, null])('rejects malformed ids: %o', (id) => {
    expect(() => validateExamScheduleId(id)).toThrow('scheduleId must be a UUID')
  })
})

describe('validateExamScheduleInput', () => {
  it('accepts a fully populated schedule', () => {
    expect(validateExamScheduleInput(fullInput)).toEqual(fullInput)
  })

  it('defaults omitted date fields to null', () => {
    expect(validateExamScheduleInput({ year: 2026, round: 1 })).toEqual({
      year: 2026,
      round: 1,
      writtenApplyStart: null,
      writtenApplyEnd: null,
      writtenExamDate: null,
      writtenResultDate: null,
      practicalApplyStart: null,
      practicalApplyEnd: null,
      practicalExamDate: null,
      finalResultDate: null,
    })
  })

  it('accepts null date fields', () => {
    const input = { year: 2026, round: 2, writtenApplyStart: null, writtenApplyEnd: null, writtenExamDate: null, writtenResultDate: null, practicalApplyStart: null, practicalApplyEnd: null, practicalExamDate: null, finalResultDate: null }
    expect(validateExamScheduleInput(input)).toEqual(input)
  })

  it.each([
    [{ ...fullInput, year: 1999 }, 'year must be'],
    [{ ...fullInput, year: 2101 }, 'year must be'],
    [{ ...fullInput, year: 2026.5 }, 'year must be'],
    [{ ...fullInput, round: 0 }, 'round must be'],
    [{ ...fullInput, round: 13 }, 'round must be'],
    [{ ...fullInput, writtenExamDate: '2026-02-30' }, 'writtenExamDate must be a valid date'],
    [{ ...fullInput, writtenExamDate: 'not-a-date' }, 'writtenExamDate must be a valid date'],
    [{ ...fullInput, extra: 'nope' }, 'unknown field'],
  ])('rejects invalid schedule payloads: %o', (input, message) => {
    expect(() => validateExamScheduleInput(input)).toThrow(ExamScheduleValidationError)
    expect(() => validateExamScheduleInput(input)).toThrow(message)
  })

  it.each([null, undefined, 'string', 42, []])('rejects non-object payloads: %o', (input) => {
    expect(() => validateExamScheduleInput(input)).toThrow('exam schedule input must be an object')
  })
})
