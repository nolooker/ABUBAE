-- =============================================
-- edu-brand MVP 테이블 생성 SQL
-- Supabase SQL Editor에서 전체 복붙 후 Run
-- =============================================

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA extensions;

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
  role TEXT NOT NULL DEFAULT 'user' CHECK (role IN ('user', 'master')),
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
  exam_type TEXT NOT NULL DEFAULT 'written',
  subject TEXT NOT NULL,
  number INT NOT NULL,
  content TEXT NOT NULL,
  explanation TEXT,
  difficulty INT DEFAULT 2 CHECK (difficulty BETWEEN 1 AND 5),
  is_premium BOOLEAN DEFAULT FALSE,
  reviewed BOOLEAN NOT NULL DEFAULT FALSE,
  published BOOLEAN NOT NULL DEFAULT FALSE,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_by UUID REFERENCES users(id),
  CONSTRAINT questions_round_number_unique UNIQUE(exam_id, exam_type, year, round, number)
);

-- 4. 선택지
CREATE TABLE choices (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  question_id UUID REFERENCES questions(id) ON DELETE CASCADE,
  number INT NOT NULL CHECK (number BETWEEN 1 AND 4),
  content TEXT NOT NULL,
  is_correct BOOLEAN DEFAULT FALSE
);

CREATE UNIQUE INDEX choices_question_number_unique
  ON choices(question_id, number);

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

-- 회원가입 시 Supabase Auth 사용자를 public.users 프로필로 자동 동기화
CREATE OR REPLACE FUNCTION public.handle_new_user()
RETURNS TRIGGER AS $$
BEGIN
  INSERT INTO public.users (id, email, nickname, avatar_url)
  VALUES (
    NEW.id,
    NEW.email,
    COALESCE(NEW.raw_user_meta_data->>'nickname', split_part(NEW.email, '@', 1)),
    NEW.raw_user_meta_data->>'avatar_url'
  )
  ON CONFLICT (id) DO NOTHING;

  RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

CREATE TRIGGER on_auth_user_created
AFTER INSERT ON auth.users
FOR EACH ROW EXECUTE FUNCTION public.handle_new_user();

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

-- bookmarks: 본인 데이터만
ALTER TABLE bookmarks ENABLE ROW LEVEL SECURITY;
CREATE POLICY "bookmarks_all_own" ON bookmarks USING (auth.uid() = user_id);

-- download_grants: 본인 데이터만 조회
ALTER TABLE download_grants ENABLE ROW LEVEL SECURITY;
CREATE POLICY "grants_select_own" ON download_grants FOR SELECT USING (auth.uid() = user_id);

-- exams, posts, resources: 전체 공개 읽기
ALTER TABLE exams ENABLE ROW LEVEL SECURITY;
CREATE POLICY "exams_public_read" ON exams FOR SELECT USING (true);

ALTER TABLE questions ENABLE ROW LEVEL SECURITY;
ALTER TABLE choices ENABLE ROW LEVEL SECURITY;

CREATE OR REPLACE FUNCTION public.is_master()
RETURNS BOOLEAN LANGUAGE sql STABLE SECURITY DEFINER SET search_path = public AS $$
  SELECT EXISTS (
    SELECT 1 FROM public.users
    WHERE id = auth.uid() AND role = 'master'
  );
$$;

CREATE POLICY questions_master_select ON questions FOR SELECT
  USING (public.is_master());
CREATE POLICY choices_master_select ON choices FOR SELECT
  USING (public.is_master());
CREATE POLICY questions_master_update ON questions FOR UPDATE
  USING (public.is_master()) WITH CHECK (public.is_master());
CREATE POLICY choices_master_update ON choices FOR UPDATE
  USING (public.is_master()) WITH CHECK (public.is_master());

CREATE OR REPLACE FUNCTION public.update_written_question(
  p_question_id UUID,
  p_content TEXT,
  p_choices TEXT[],
  p_correct_numbers INT[],
  p_explanation TEXT,
  p_expected_updated_at TIMESTAMPTZ
)
RETURNS public.questions
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
DECLARE
  choice_count INT;
  updated_question public.questions%ROWTYPE;
BEGIN
  IF NOT public.is_master() THEN
    RAISE EXCEPTION 'master role required';
  END IF;

  IF COALESCE(cardinality(p_choices), 0) <> 4 THEN
    RAISE EXCEPTION 'exactly four choices are required';
  END IF;

  IF COALESCE(cardinality(p_correct_numbers), 0) < 1
    OR EXISTS (
      SELECT 1
      FROM unnest(p_correct_numbers) AS correct_number
      WHERE correct_number NOT BETWEEN 1 AND 4
    ) THEN
    RAISE EXCEPTION 'at least one valid correct choice is required';
  END IF;

  SELECT count(*)
  INTO choice_count
  FROM public.choices
  WHERE question_id = p_question_id;

  IF choice_count <> 4 THEN
    RAISE EXCEPTION 'question must have exactly four choices';
  END IF;

  UPDATE public.questions
  SET content = p_content,
      explanation = p_explanation,
      updated_at = NOW(),
      updated_by = auth.uid()
  WHERE id = p_question_id
    AND exam_type = 'written'
    AND updated_at = p_expected_updated_at
  RETURNING * INTO updated_question;

  IF NOT FOUND THEN
    IF EXISTS (
      SELECT 1
      FROM public.questions
      WHERE id = p_question_id AND exam_type = 'written'
    ) THEN
      RAISE EXCEPTION 'stale question';
    END IF;

    RAISE EXCEPTION 'written question not found';
  END IF;

  UPDATE public.choices
  SET content = p_choices[number],
      is_correct = (number = ANY (p_correct_numbers))
  WHERE question_id = p_question_id;

  RETURN updated_question;
END;
$$;

REVOKE ALL ON FUNCTION public.update_written_question(UUID, TEXT, TEXT[], INT[], TEXT, TIMESTAMPTZ) FROM PUBLIC;
GRANT EXECUTE ON FUNCTION public.update_written_question(UUID, TEXT, TEXT[], INT[], TEXT, TIMESTAMPTZ) TO authenticated;

ALTER TABLE posts ENABLE ROW LEVEL SECURITY;
CREATE POLICY "posts_public_read" ON posts FOR SELECT USING (is_published = true);

ALTER TABLE resources ENABLE ROW LEVEL SECURITY;
CREATE POLICY "resources_public_read" ON resources FOR SELECT USING (is_published = true);
