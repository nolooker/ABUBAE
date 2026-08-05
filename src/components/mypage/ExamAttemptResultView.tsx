'use client'

import { useRouter } from 'next/navigation'

import PracticalRoundResult from '@/components/quiz/PracticalRoundResult'
import WrittenRoundResult from '@/components/quiz/WrittenRoundResult'
import type { ExamAttempt } from '@/lib/exam-attempt'
import type { PublicPracticalQuestion } from '@/lib/practical-question-repository'
import type { PublicWrittenQuestion } from '@/lib/written-question-repository'

type Props = {
  slug: string
  title: string
  attempt: ExamAttempt
  questions: PublicWrittenQuestion[] | PublicPracticalQuestion[]
}

export default function ExamAttemptResultView({ slug, title, attempt, questions }: Props) {
  const router = useRouter()
  const retryPath = `/exam/${slug}/questions/${attempt.examType}/${attempt.year}/${attempt.round}`
  const onRetry = () => router.push(retryPath)
  const savedNotice = `${new Intl.DateTimeFormat('ko-KR', { year: 'numeric', month: 'long', day: 'numeric', timeZone: 'UTC' }).format(new Date(attempt.createdAt))}에 채점된 기록입니다.`

  if (attempt.examType === 'practical') {
    return (
      <PracticalRoundResult
        title={title}
        questions={questions as PublicPracticalQuestion[]}
        result={attempt.result}
        onRetry={onRetry}
        savedNotice={savedNotice}
      />
    )
  }

  return (
    <WrittenRoundResult
      title={title}
      questions={questions as PublicWrittenQuestion[]}
      result={attempt.result}
      onRetry={onRetry}
      savedNotice={savedNotice}
    />
  )
}
