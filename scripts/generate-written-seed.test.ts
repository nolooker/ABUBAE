import { describe, expect, it } from 'vitest'

import { renderWrittenSeed } from './generate-written-seed.mjs'

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
  })
})
