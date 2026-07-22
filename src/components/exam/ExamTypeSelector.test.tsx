import { render, screen } from '@testing-library/react'
import { describe, expect, it } from 'vitest'

import ExamTypeSelector from './ExamTypeSelector'

describe('ExamTypeSelector', () => {
  it('links to written rounds and marks practical exams as coming soon', () => {
    render(<ExamTypeSelector examSlug="jeongchogi" />)

    expect(screen.getByRole('link', { name: /필기 기출문제/ })).toHaveAttribute(
      'href',
      '/exam/jeongchogi/questions/written',
    )
    expect(screen.getByText('실기 기출문제')).toBeInTheDocument()
    expect(screen.getAllByText('준비 중')).not.toHaveLength(0)
    expect(screen.queryByRole('link', { name: /실기 기출문제/ })).not.toBeInTheDocument()
  })
})
