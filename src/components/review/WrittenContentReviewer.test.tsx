import { render, screen } from '@testing-library/react'
import userEvent from '@testing-library/user-event'
import { beforeEach, describe, expect, it, vi } from 'vitest'

import WrittenContentReviewer from './WrittenContentReviewer'

const questions = [
  {
    id: 'q-1',
    subject: '소프트웨어 설계',
    number: 1,
    content: '첫 번째 문제',
    choices: ['선택지 A', '선택지 B', '선택지 C', '선택지 D'],
    acceptedAnswerIndexes: [1],
    reviewed: false,
    published: false,
  },
  {
    id: 'q-2',
    subject: '소프트웨어 설계',
    number: 2,
    content: '두 번째 문제',
    choices: ['선택지 E', '선택지 F', '선택지 G', '선택지 H'],
    acceptedAnswerIndexes: [0, 2],
    reviewed: false,
    published: false,
  },
]

describe('WrittenContentReviewer', () => {
  beforeEach(() => {
    vi.stubGlobal('scrollTo', vi.fn())
  })

  it('navigates questions and reveals the extracted answer on request', async () => {
    const user = userEvent.setup()
    render(<WrittenContentReviewer title="2021년 1회" questions={questions} />)

    expect(screen.getByRole('heading', { name: '1. 첫 번째 문제' })).toBeInTheDocument()
    expect(screen.queryByText('추출 정답: ②')).not.toBeInTheDocument()

    await user.click(screen.getByRole('button', { name: '정답 표시' }))
    expect(screen.getByText('추출 정답: ②')).toBeInTheDocument()

    await user.click(screen.getByRole('button', { name: '다음 문제' }))
    expect(screen.getByRole('heading', { name: '2. 두 번째 문제' })).toBeInTheDocument()
    await user.click(screen.getByRole('button', { name: '정답 표시' }))
    expect(screen.getByText('추출 정답: ①, ③')).toBeInTheDocument()
  })
})
