import { render, screen } from '@testing-library/react'
import { describe, expect, it } from 'vitest'

import ExamTypeSelector from './ExamTypeSelector'

describe('ExamTypeSelector', () => {
  it('links to both written and practical rounds', () => {
    render(<ExamTypeSelector examSlug="jeongchogi" />)

    expect(screen.getByRole('link', { name: /필기 기출문제/ })).toHaveAttribute(
      'href',
      '/exam/jeongchogi/questions/written',
    )
    expect(screen.getByRole('link', { name: /실기 기출문제/ })).toHaveAttribute(
      'href',
      '/exam/jeongchogi/questions/practical',
    )
  })
})
