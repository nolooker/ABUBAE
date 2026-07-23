import { describe, expect, it } from 'vitest'
import { readFileSync } from 'node:fs'

import { load2021Rounds, renderSeedSql, renderWrittenSeed } from './generate-written-seed.mjs'

describe('renderWrittenSeed', () => {
  it('renders one question, four choices, multiple answers, and published pending-review flags', () => {
    const sql = renderWrittenSeed({
      year: 2021,
      round: 1,
      title: 'test',
      questions: [{
        id: '2021-1-1',
        number: 1,
        subject: 'software',
        content: "Question 'A'",
        choices: ['one', 'two', 'three', 'four'],
        acceptedAnswerIndexes: [1, 3],
        explanation: null,
        reviewed: false,
        published: false,
      }],
    })

    expect(sql).toContain("'written', 2021, 1, 'software', 1")
    expect(sql.match(/is_correct/g)).toHaveLength(4)
    expect(sql).toContain('TRUE')
    expect(sql).toContain('FALSE, TRUE')
    expect(sql).toContain("Question ''A''")
    expect(sql).toContain('ON CONFLICT (id) DO NOTHING;')
    expect(sql.match(/ON CONFLICT \(question_id, number\) DO NOTHING;/g)).toHaveLength(4)
    expect(sql).not.toContain('DO UPDATE')
    expect(sql).not.toContain('EXCLUDED.')
  })

  it('asserts that the jeongchogi exam exists before inserting questions', () => {
    const sql = renderSeedSql([{
      year: 2021,
      round: 1,
      questions: [{
        id: '2021-1-1',
        number: 1,
        subject: 'software',
        content: 'Question',
        choices: ['one', 'two', 'three', 'four'],
        acceptedAnswerIndexes: [0],
        explanation: null,
      }],
    }])
    const errorSql = "RAISE EXCEPTION 'required exam \"jeongchogi\" does not exist';"

    expect(sql).toContain(errorSql)
    expect(sql.indexOf(errorSql)).toBeLessThan(sql.indexOf('INSERT INTO public.questions'))
  })

  it('keeps seed reruns non-destructive so Master edits and review metadata survive', () => {
    const sql = renderSeedSql([{
      year: 2021,
      round: 1,
      questions: [{
        id: '2021-1-1',
        number: 1,
        subject: 'software',
        content: 'Original seed content',
        choices: ['one', 'two', 'three', 'four'],
        acceptedAnswerIndexes: [0],
        explanation: 'Original explanation',
      }],
    }])

    expect(sql).not.toMatch(/\bUPDATE\b/)
    expect(sql).not.toContain('DO UPDATE')
    expect(sql).not.toContain('EXCLUDED.')
    expect(sql.match(/DO NOTHING;/g)).toHaveLength(5)
  })
})

describe('checked-in 2021 written seed', () => {
  it('matches deterministic generator output and contains 300 questions and 1200 choices', () => {
    const firstRender = renderSeedSql(load2021Rounds())
    const secondRender = renderSeedSql(load2021Rounds())
    const checkedInSql = readFileSync('supabase/seeds/2021-written.sql', 'utf8')

    expect(firstRender).toBe(secondRender)
    expect(checkedInSql).toBe(firstRender)
    expect(checkedInSql.match(/INSERT INTO public\.questions/g)).toHaveLength(300)
    expect(checkedInSql.match(/INSERT INTO public\.choices/g)).toHaveLength(1200)
    expect(checkedInSql.match(/ON CONFLICT \(id\) DO NOTHING;/g)).toHaveLength(300)
    expect(checkedInSql.match(/ON CONFLICT \(question_id, number\) DO NOTHING;/g)).toHaveLength(1200)
    expect(checkedInSql).not.toContain('DO UPDATE')
    expect(checkedInSql).not.toContain('EXCLUDED.')
  })
})
