import { render, screen } from '@testing-library/react'
import { describe, expect, it } from 'vitest'

import WrittenRoundList from './WrittenRoundList'

describe('WrittenRoundList', () => {
  it('groups available rounds by year and links each round to its runner', () => {
    render(<WrittenRoundList examSlug="jeongchogi" rounds={[
      { year: 2021, round: 1, questionCount: 100, subjectCount: 5 },
      { year: 2021, round: 2, questionCount: 100, subjectCount: 5 },
    ]} />)

    expect(screen.getByRole('heading', { name: '2021년' })).toBeInTheDocument()
    expect(screen.getByRole('link', { name: /2021년 1회 문제 풀기/ })).toHaveAttribute(
      'href',
      '/exam/jeongchogi/questions/written/2021/1',
    )
    expect(screen.getAllByText('100문항 · 5과목')).toHaveLength(2)
  })
})

