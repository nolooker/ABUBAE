export type MembershipType = 'free' | 'standard' | 'premium'
export type PostType = 'blog' | 'notice' | 'review' | 'note'
export type PaymentStatus = 'pending' | 'completed' | 'cancelled'

export interface Exam {
  id: string
  slug: string
  name: string
  description: string | null
  thumbnail_url: string | null
  is_active: boolean
  order_index: number
  created_at: string
}

export interface User {
  id: string
  email: string
  nickname: string | null
  avatar_url: string | null
  membership_type: MembershipType
  membership_expires_at: string | null
  created_at: string
}

export interface Question {
  id: string
  exam_id: string
  year: number
  round: number
  subject: string
  number: number
  content: string
  explanation: string | null
  difficulty: number | null
  is_premium: boolean
  created_at: string
  choices?: Choice[]
}

export interface Choice {
  id: string
  question_id: string
  number: number
  content: string
  is_correct: boolean
}

export interface Post {
  id: string
  exam_id: string | null
  type: PostType
  title: string
  slug: string
  content: string | null
  thumbnail_url: string | null
  is_premium: boolean
  is_published: boolean
  view_count: number
  created_at: string
  updated_at: string
}

export interface Resource {
  id: string
  exam_id: string | null
  title: string
  description: string | null
  file_url: string | null
  preview_url: string | null
  price: number
  download_count: number
  is_published: boolean
  created_at: string
}

export interface Bookmark {
  id: string
  user_id: string
  target_type: 'post' | 'question' | 'resource'
  target_id: string
  created_at: string
}

export interface DownloadGrant {
  id: string
  user_id: string
  resource_id: string
  granted_at: string
}