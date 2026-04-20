-- =============================================
-- edu-brand MVP 테이블 생성 SQL
-- Supabase SQL Editor에서 전체 복붙 후 Run
-- =============================================

-- 1. 시험/자격증 카테고리
CREATE TABLE exams (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  slug TEXT UNIQUE NOT NULL,
  name TEXT NOT NULL,
  description TEXT,
  thumbnail_url TEXT,
  is_active BOOLEAN DEFAULT TRUE,
  order_index INT DEFAULT 0,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- 2. 사용자 프로필 (Supabase Auth와 연동)
CREATE TABLE users (
  id UUID PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
  email TEXT UNIQUE NOT NULL,
  nickname TEXT,
  avatar_url TEXT,
  membership_type TEXT DEFAULT 'free' CHECK (membership_type IN ('free', 'standard', 'premium')),
  membership_expires_at TIMESTAMPTZ,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- 3. 기출문제
CREATE TABLE questions (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  exam_id UUID REFERENCES exams(id) ON DELETE CASCADE,
  year INT NOT NULL,
  round INT NOT NULL,
  subject TEXT NOT NULL,
  number INT NOT NULL,
  content TEXT NOT NULL,
  explanation TEXT,
  difficulty INT DEFAULT 2 CHECK (difficulty BETWEEN 1 AND 5),
  is_premium BOOLEAN DEFAULT FALSE,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- 4. 선택지
CREATE TABLE choices (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  question_id UUID REFERENCES questions(id) ON DELETE CASCADE,
  number INT NOT NULL CHECK (number BETWEEN 1 AND 4),
  content TEXT NOT NULL,
  is_correct BOOLEAN DEFAULT FALSE
);

-- 5. 콘텐츠 포스트 (블로그 + 공지 + 후기 + 요약노트 통합)
CREATE TABLE posts (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  exam_id UUID REFERENCES exams(id) ON DELETE SET NULL,
  type TEXT NOT NULL CHECK (type IN ('blog', 'notice', 'review', 'note')),
  title TEXT NOT NULL,
  slug TEXT UNIQUE NOT NULL,
  content TEXT,
  thumbnail_url TEXT,
  is_premium BOOLEAN DEFAULT FALSE,
  is_published BOOLEAN DEFAULT FALSE,
  view_count INT DEFAULT 0,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- 6. 디지털 자료 (PDF 등)
CREATE TABLE resources (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  exam_id UUID REFERENCES exams(id) ON DELETE SET NULL,
  title TEXT NOT NULL,
  description TEXT,
  file_url TEXT,
  preview_url TEXT,
  price INT DEFAULT 0,
  download_count INT DEFAULT 0,
  is_published BOOLEAN DEFAULT FALSE,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- 7. 즐겨찾기
CREATE TABLE bookmarks (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID REFERENCES users(id) ON DELETE CASCADE,
  target_type TEXT NOT NULL CHECK (target_type IN ('post', 'question', 'resource')),
  target_id UUID NOT NULL,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  UNIQUE(user_id, target_type, target_id)
);

-- 8. 다운로드 권한 (무료 자료 or 구매 완료)
CREATE TABLE download_grants (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID REFERENCES users(id) ON DELETE CASCADE,
  resource_id UUID REFERENCES resources(id) ON DELETE CASCADE,
  granted_at TIMESTAMPTZ DEFAULT NOW(),
  UNIQUE(user_id, resource_id)
);

-- =============================================
-- 샘플 데이터 (시작용)
-- =============================================

INSERT INTO exams (slug, name, description, order_index) VALUES
  ('jeongchogi', '정보처리기사', 'IT 분야 대표 국가기술자격증. 소프트웨어 설계부터 실기까지', 1),
  ('sqld', 'SQLD', '데이터베이스 SQL 개발자 자격증', 2),
  ('comhwal', '컴퓨터활용능력 1급', '스프레드시트와 데이터베이스 활용 능력 검증', 3);

-- =============================================
-- RLS (Row Level Security) 설정
-- =============================================

-- users: 본인 데이터만 수정 가능
ALTER TABLE users ENABLE ROW LEVEL SECURITY;
CREATE POLICY "users_select_own" ON users FOR SELECT USING (auth.uid() = id);
CREATE POLICY "users_update_own" ON users FOR UPDATE USING (auth.uid() = id);

-- bookmarks: 본인 데이터만
ALTER TABLE bookmarks ENABLE ROW LEVEL SECURITY;
CREATE POLICY "bookmarks_all_own" ON bookmarks USING (auth.uid() = user_id);

-- download_grants: 본인 데이터만 조회
ALTER TABLE download_grants ENABLE ROW LEVEL SECURITY;
CREATE POLICY "grants_select_own" ON download_grants FOR SELECT USING (auth.uid() = user_id);

-- exams, questions, choices, posts, resources: 전체 공개 읽기
ALTER TABLE exams ENABLE ROW LEVEL SECURITY;
CREATE POLICY "exams_public_read" ON exams FOR SELECT USING (true);

ALTER TABLE questions ENABLE ROW LEVEL SECURITY;
CREATE POLICY "questions_public_read" ON questions FOR SELECT USING (true);

ALTER TABLE choices ENABLE ROW LEVEL SECURITY;
CREATE POLICY "choices_public_read" ON choices FOR SELECT USING (true);

ALTER TABLE posts ENABLE ROW LEVEL SECURITY;
CREATE POLICY "posts_public_read" ON posts FOR SELECT USING (is_published = true);

ALTER TABLE resources ENABLE ROW LEVEL SECURITY;
CREATE POLICY "resources_public_read" ON resources FOR SELECT USING (is_published = true);