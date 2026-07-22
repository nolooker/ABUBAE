import { cleanup, render, screen } from '@testing-library/react'
import userEvent from '@testing-library/user-event'
import { afterEach, describe, expect, it, vi } from 'vitest'

import WrittenRoundRunner from './WrittenRoundRunner'

const questions = [
  { id: 'q1', number: 1, subject: '소프트웨어 설계', content: '첫 문제', choices: ['A', 'B', 'C', 'D'] },
  { id: 'q2', number: 2, subject: '소프트웨어 설계', content: '둘째 문제', choices: ['E', 'F', 'G', 'H'] },
]

describe('WrittenRoundRunner', () => {
  afterEach(cleanup)

  it('keeps selected answers while navigating between questions', async () => {
    vi.stubGlobal('scrollTo', vi.fn())
    const user = userEvent.setup()
    render(<WrittenRoundRunner title="2021년 1회" questions={questions} />)

    await user.click(screen.getByLabelText('1번 선택지 ② B'))
    await user.click(screen.getByRole('button', { name: '다음 문제' }))
    expect(screen.getByText('답변 1')).toBeInTheDocument()

    await user.click(screen.getByRole('button', { name: '1번 문제로 이동' }))
    expect(screen.getByLabelText('1번 선택지 ② B')).toBeChecked()
    expect(screen.queryByText(/정답/)).not.toBeInTheDocument()
  })

  it('moves questions even when the browser cannot perform smooth scrolling', async () => {
    vi.stubGlobal('scrollTo', vi.fn(() => { throw new Error('scroll unavailable') }))
    const user = userEvent.setup()
    render(<WrittenRoundRunner title="2021년 1회" questions={questions} />)

    await user.click(screen.getByRole('button', { name: '다음 문제' }))

    expect(screen.getByRole('heading', { name: '2. 둘째 문제' })).toBeInTheDocument()
  })
})
