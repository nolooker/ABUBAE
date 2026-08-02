-- ABUBAE Supabase setup: repeatable for new and existing projects.
-- 기존 행을 삭제하지 않으며, 중복된 문제/선택지 키가 있으면 안전하게 실패합니다.

BEGIN;

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA extensions;

-- Base schema
CREATE TABLE IF NOT EXISTS public.exams (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  slug TEXT UNIQUE NOT NULL,
  name TEXT NOT NULL,
  description TEXT,
  thumbnail_url TEXT,
  is_active BOOLEAN DEFAULT TRUE,
  order_index INT DEFAULT 0,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS public.users (
  id UUID PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
  email TEXT UNIQUE NOT NULL,
  nickname TEXT,
  avatar_url TEXT,
  membership_type TEXT DEFAULT 'free' CHECK (membership_type IN ('free', 'standard', 'premium')),
  membership_expires_at TIMESTAMPTZ,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS public.questions (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  exam_id UUID REFERENCES public.exams(id) ON DELETE CASCADE,
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

CREATE TABLE IF NOT EXISTS public.choices (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  question_id UUID REFERENCES public.questions(id) ON DELETE CASCADE,
  number INT NOT NULL CHECK (number BETWEEN 1 AND 4),
  content TEXT NOT NULL,
  is_correct BOOLEAN DEFAULT FALSE
);

CREATE TABLE IF NOT EXISTS public.posts (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  exam_id UUID REFERENCES public.exams(id) ON DELETE SET NULL,
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

CREATE TABLE IF NOT EXISTS public.resources (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  exam_id UUID REFERENCES public.exams(id) ON DELETE SET NULL,
  title TEXT NOT NULL,
  description TEXT,
  file_url TEXT,
  preview_url TEXT,
  price INT DEFAULT 0,
  download_count INT DEFAULT 0,
  is_published BOOLEAN DEFAULT FALSE,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS public.bookmarks (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID REFERENCES public.users(id) ON DELETE CASCADE,
  target_type TEXT NOT NULL CHECK (target_type IN ('post', 'question', 'resource')),
  target_id UUID NOT NULL,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  UNIQUE(user_id, target_type, target_id)
);

CREATE TABLE IF NOT EXISTS public.download_grants (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID REFERENCES public.users(id) ON DELETE CASCADE,
  resource_id UUID REFERENCES public.resources(id) ON DELETE CASCADE,
  granted_at TIMESTAMPTZ DEFAULT NOW(),
  UNIQUE(user_id, resource_id)
);

-- 자유게시판: 글/댓글 작성자는 자신의 글만 수정·삭제한다.
CREATE TABLE IF NOT EXISTS public.board_posts (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID NOT NULL REFERENCES public.users(id) ON DELETE CASCADE,
  author_nickname TEXT NOT NULL,
  title TEXT NOT NULL,
  content TEXT NOT NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS public.board_comments (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  post_id UUID NOT NULL REFERENCES public.board_posts(id) ON DELETE CASCADE,
  user_id UUID NOT NULL REFERENCES public.users(id) ON DELETE CASCADE,
  author_nickname TEXT NOT NULL,
  content TEXT NOT NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- Additive: one level of replies (a reply's parent must itself be a top-level comment).
-- The single-level rule is enforced in the application layer, not by this column alone.
ALTER TABLE public.board_comments
  ADD COLUMN IF NOT EXISTS parent_comment_id UUID REFERENCES public.board_comments(id) ON DELETE CASCADE;

-- Additive: track edits to a comment's content.
ALTER TABLE public.board_comments
  ADD COLUMN IF NOT EXISTS updated_at TIMESTAMPTZ;

-- Reports: any member can report a post or comment; only masters can review them.
-- post_id lets a reported comment still be traced/cleaned up even if reviewed later,
-- and cascades away if the underlying post is removed.
CREATE TABLE IF NOT EXISTS public.board_reports (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  target_type TEXT NOT NULL CHECK (target_type IN ('post', 'comment')),
  target_id UUID NOT NULL,
  post_id UUID NOT NULL REFERENCES public.board_posts(id) ON DELETE CASCADE,
  reporter_user_id UUID NOT NULL REFERENCES public.users(id) ON DELETE CASCADE,
  reporter_nickname TEXT NOT NULL,
  reason TEXT NOT NULL,
  status TEXT NOT NULL DEFAULT 'pending' CHECK (status IN ('pending', 'resolved')),
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- Additive Master question editing fields for existing projects.
ALTER TABLE public.users
  ADD COLUMN IF NOT EXISTS role TEXT NOT NULL DEFAULT 'user'
  CHECK (role IN ('user', 'master'));

ALTER TABLE public.questions
  ADD COLUMN IF NOT EXISTS exam_type TEXT NOT NULL DEFAULT 'written',
  ADD COLUMN IF NOT EXISTS reviewed BOOLEAN NOT NULL DEFAULT FALSE,
  ADD COLUMN IF NOT EXISTS published BOOLEAN NOT NULL DEFAULT FALSE,
  ADD COLUMN IF NOT EXISTS updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  ADD COLUMN IF NOT EXISTS updated_by UUID REFERENCES public.users(id);

-- Do not merge duplicates: index creation stops the transaction for cleanup.
CREATE UNIQUE INDEX IF NOT EXISTS questions_round_number_unique
  ON public.questions(exam_id, exam_type, year, round, number);
CREATE UNIQUE INDEX IF NOT EXISTS choices_question_number_unique
  ON public.choices(question_id, number);

-- IF NOT EXISTS skips a same-named index, so verify its complete definition.
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1
    FROM pg_catalog.pg_index AS index_definition
    JOIN pg_catalog.pg_class AS index_relation
      ON index_relation.oid = index_definition.indexrelid
    WHERE index_relation.relnamespace = 'public'::pg_catalog.regnamespace
      AND index_relation.relname = 'questions_round_number_unique'
      AND index_definition.indrelid = 'public.questions'::pg_catalog.regclass
      AND index_definition.indisunique
      AND index_definition.indisvalid
      AND index_definition.indisready
      AND index_definition.indislive
      AND index_definition.indpred IS NULL
      AND index_definition.indnatts = index_definition.indnkeyatts
      AND index_definition.indnkeyatts = 5
      AND (
        SELECT pg_catalog.array_agg(attribute.attname ORDER BY index_key.ordinality)
        FROM pg_catalog.unnest(index_definition.indkey) WITH ORDINALITY AS index_key(attnum, ordinality)
        JOIN pg_catalog.pg_attribute AS attribute
          ON attribute.attrelid = index_definition.indrelid
         AND attribute.attnum = index_key.attnum
      ) = ARRAY['exam_id', 'exam_type', 'year', 'round', 'number']::pg_catalog.name[]
  ) THEN
    RAISE EXCEPTION 'questions_round_number_unique has an unexpected definition';
  END IF;

  IF NOT EXISTS (
    SELECT 1
    FROM pg_catalog.pg_index AS index_definition
    JOIN pg_catalog.pg_class AS index_relation
      ON index_relation.oid = index_definition.indexrelid
    WHERE index_relation.relnamespace = 'public'::pg_catalog.regnamespace
      AND index_relation.relname = 'choices_question_number_unique'
      AND index_definition.indrelid = 'public.choices'::pg_catalog.regclass
      AND index_definition.indisunique
      AND index_definition.indisvalid
      AND index_definition.indisready
      AND index_definition.indislive
      AND index_definition.indpred IS NULL
      AND index_definition.indnatts = index_definition.indnkeyatts
      AND index_definition.indnkeyatts = 2
      AND (
        SELECT pg_catalog.array_agg(attribute.attname ORDER BY index_key.ordinality)
        FROM pg_catalog.unnest(index_definition.indkey) WITH ORDINALITY AS index_key(attnum, ordinality)
        JOIN pg_catalog.pg_attribute AS attribute
          ON attribute.attrelid = index_definition.indrelid
         AND attribute.attnum = index_key.attnum
      ) = ARRAY['question_id', 'number']::pg_catalog.name[]
  ) THEN
    RAISE EXCEPTION 'choices_question_number_unique has an unexpected definition';
  END IF;
END;
$$;

-- Promote only the already-existing designated profile.
DO $$
BEGIN
  IF (
    SELECT pg_catalog.count(*)
    FROM public.users
    WHERE pg_catalog.lower(email) = 'seoteang@gmail.com'
  ) > 1 THEN
    RAISE EXCEPTION 'multiple profiles match seoteang@gmail.com';
  END IF;
END;
$$;

UPDATE public.users
SET role = 'master'
WHERE pg_catalog.lower(email) = 'seoteang@gmail.com';

CREATE OR REPLACE FUNCTION public.handle_new_user()
RETURNS pg_catalog.trigger
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = ''
AS $$
BEGIN
  INSERT INTO public.users (id, email, nickname, avatar_url)
  VALUES (
    NEW.id,
    NEW.email,
    COALESCE(NEW.raw_user_meta_data->>'nickname', pg_catalog.split_part(NEW.email, '@', 1)),
    NEW.raw_user_meta_data->>'avatar_url'
  )
  ON CONFLICT (id) DO NOTHING;

  RETURN NEW;
END;
$$;

DROP TRIGGER IF EXISTS on_auth_user_created ON auth.users;
CREATE TRIGGER on_auth_user_created
AFTER INSERT ON auth.users
FOR EACH ROW EXECUTE FUNCTION public.handle_new_user();

-- Starter exams keep any pre-existing row with the same slug unchanged.
INSERT INTO public.exams (slug, name, description, order_index) VALUES
  ('jeongchogi', '정보처리기사', 'IT 분야 대표 국가기술자격증. 소프트웨어 설계부터 실기까지', 1),
  ('sqld', 'SQLD', '데이터베이스 SQL 개발자 자격증', 2),
  ('comhwal', '컴퓨터활용능력 1급', '스프레드시트와 데이터베이스 활용 능력 검증', 3)
ON CONFLICT (slug) DO NOTHING;

-- RLS policies are recreated so the final definitions are deterministic.
ALTER TABLE public.users ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS users_select_own ON public.users;
DROP POLICY IF EXISTS users_update_own ON public.users;
DO $$
DECLARE
  policy_definition record;
BEGIN
  FOR policy_definition IN
    SELECT schemaname, tablename, policyname
    FROM pg_catalog.pg_policies
    WHERE schemaname = 'public'
      AND tablename = 'users'
      AND cmd <> 'SELECT'
  LOOP
    EXECUTE pg_catalog.format(
      'DROP POLICY IF EXISTS %I ON %I.%I',
      policy_definition.policyname,
      policy_definition.schemaname,
      policy_definition.tablename
    );
  END LOOP;
END;
$$;
REVOKE UPDATE ON TABLE public.users FROM PUBLIC, anon, authenticated;
CREATE POLICY users_select_own ON public.users FOR SELECT USING (auth.uid() = id);

ALTER TABLE public.bookmarks ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS bookmarks_all_own ON public.bookmarks;
CREATE POLICY bookmarks_all_own ON public.bookmarks USING (auth.uid() = user_id);

ALTER TABLE public.download_grants ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS grants_select_own ON public.download_grants;
CREATE POLICY grants_select_own ON public.download_grants FOR SELECT USING (auth.uid() = user_id);

ALTER TABLE public.board_posts ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS board_posts_public_read ON public.board_posts;
DROP POLICY IF EXISTS board_posts_insert_own ON public.board_posts;
DROP POLICY IF EXISTS board_posts_update_own ON public.board_posts;
DROP POLICY IF EXISTS board_posts_delete_own ON public.board_posts;
CREATE POLICY board_posts_public_read ON public.board_posts FOR SELECT USING (true);
CREATE POLICY board_posts_insert_own ON public.board_posts FOR INSERT WITH CHECK (auth.uid() = user_id);
CREATE POLICY board_posts_update_own ON public.board_posts FOR UPDATE USING (auth.uid() = user_id) WITH CHECK (auth.uid() = user_id);
CREATE POLICY board_posts_delete_own ON public.board_posts FOR DELETE USING (auth.uid() = user_id);

ALTER TABLE public.board_comments ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS board_comments_public_read ON public.board_comments;
DROP POLICY IF EXISTS board_comments_insert_own ON public.board_comments;
DROP POLICY IF EXISTS board_comments_update_own ON public.board_comments;
DROP POLICY IF EXISTS board_comments_delete_own ON public.board_comments;
CREATE POLICY board_comments_public_read ON public.board_comments FOR SELECT USING (true);
CREATE POLICY board_comments_update_own ON public.board_comments FOR UPDATE USING (auth.uid() = user_id) WITH CHECK (auth.uid() = user_id);
CREATE POLICY board_comments_insert_own ON public.board_comments FOR INSERT WITH CHECK (auth.uid() = user_id);
CREATE POLICY board_comments_delete_own ON public.board_comments FOR DELETE USING (auth.uid() = user_id);

-- Reporters can only ever insert their own report; only masters may read or
-- resolve reports (policies added after is_master() is defined, below).
ALTER TABLE public.board_reports ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS board_reports_insert_own ON public.board_reports;
CREATE POLICY board_reports_insert_own ON public.board_reports FOR INSERT WITH CHECK (auth.uid() = reporter_user_id);

ALTER TABLE public.exams ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS exams_public_read ON public.exams;
CREATE POLICY exams_public_read ON public.exams FOR SELECT USING (true);

ALTER TABLE public.questions ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.choices ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS questions_public_read ON public.questions;
DROP POLICY IF EXISTS choices_public_read ON public.choices;
DROP POLICY IF EXISTS questions_master_select ON public.questions;
DROP POLICY IF EXISTS choices_master_select ON public.choices;
DROP POLICY IF EXISTS questions_master_update ON public.questions;
DROP POLICY IF EXISTS choices_master_update ON public.choices;
DO $$
DECLARE
  policy_definition record;
BEGIN
  FOR policy_definition IN
    SELECT schemaname, tablename, policyname
    FROM pg_catalog.pg_policies
    WHERE schemaname = 'public'
      AND tablename IN ('questions', 'choices')
  LOOP
    EXECUTE pg_catalog.format(
      'DROP POLICY IF EXISTS %I ON %I.%I',
      policy_definition.policyname,
      policy_definition.schemaname,
      policy_definition.tablename
    );
  END LOOP;
END;
$$;
REVOKE SELECT ON TABLE public.questions FROM PUBLIC, anon, authenticated;
REVOKE SELECT ON TABLE public.choices FROM PUBLIC, anon, authenticated;

ALTER TABLE public.posts ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS posts_public_read ON public.posts;
DO $$
DECLARE
  policy_definition record;
BEGIN
  FOR policy_definition IN
    SELECT schemaname, tablename, policyname
    FROM pg_catalog.pg_policies
    WHERE schemaname = 'public'
      AND tablename = 'posts'
  LOOP
    EXECUTE pg_catalog.format(
      'DROP POLICY IF EXISTS %I ON %I.%I',
      policy_definition.policyname,
      policy_definition.schemaname,
      policy_definition.tablename
    );
  END LOOP;
END;
$$;
REVOKE INSERT, UPDATE, DELETE ON TABLE public.posts FROM PUBLIC, anon, authenticated;
CREATE POLICY posts_public_read ON public.posts FOR SELECT USING (is_published = true);

ALTER TABLE public.resources ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS resources_public_read ON public.resources;
CREATE POLICY resources_public_read ON public.resources FOR SELECT USING (is_published = true);

CREATE OR REPLACE FUNCTION public.is_master()
RETURNS pg_catalog.bool LANGUAGE sql STABLE SECURITY DEFINER SET search_path = '' AS $$
  SELECT EXISTS (
    SELECT 1 FROM public.users
    WHERE id = auth.uid() AND role = 'master'
  );
$$;

-- Masters can moderate (force-delete) any board post or comment,
-- in addition to each author's own-row delete policy above.
DROP POLICY IF EXISTS board_posts_delete_master ON public.board_posts;
CREATE POLICY board_posts_delete_master ON public.board_posts FOR DELETE USING (public.is_master());
DROP POLICY IF EXISTS board_comments_delete_master ON public.board_comments;
CREATE POLICY board_comments_delete_master ON public.board_comments FOR DELETE USING (public.is_master());

DROP POLICY IF EXISTS board_reports_master_read ON public.board_reports;
CREATE POLICY board_reports_master_read ON public.board_reports FOR SELECT USING (public.is_master());
DROP POLICY IF EXISTS board_reports_master_resolve ON public.board_reports;
CREATE POLICY board_reports_master_resolve ON public.board_reports FOR UPDATE USING (public.is_master()) WITH CHECK (public.is_master());

CREATE OR REPLACE FUNCTION public.get_written_question_for_edit(
  p_question_id pg_catalog.uuid
)
RETURNS pg_catalog.jsonb
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = ''
AS $$
DECLARE
  question_for_edit pg_catalog.jsonb;
BEGIN
  IF NOT public.is_master() THEN
    RAISE EXCEPTION 'master role required';
  END IF;

  SELECT pg_catalog.jsonb_build_object(
    'question', pg_catalog.to_jsonb(question_row),
    'choices', (
      SELECT COALESCE(
        pg_catalog.jsonb_agg(pg_catalog.to_jsonb(choice_row) ORDER BY choice_row.number),
        '[]'::pg_catalog.jsonb
      )
      FROM public.choices AS choice_row
      WHERE choice_row.question_id = question_row.id
    )
  )
  INTO question_for_edit
  FROM public.questions AS question_row
  WHERE question_row.id = p_question_id
    AND question_row.exam_type = 'written';

  IF question_for_edit IS NULL THEN
    RAISE EXCEPTION 'written question not found';
  END IF;

  RETURN question_for_edit;
END;
$$;

CREATE OR REPLACE FUNCTION public.update_written_question(
  p_question_id pg_catalog.uuid,
  p_content pg_catalog.text,
  p_choices pg_catalog.text[],
  p_correct_numbers pg_catalog.int4[],
  p_explanation pg_catalog.text,
  p_expected_updated_at pg_catalog.timestamptz
)
RETURNS public.questions
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = ''
AS $$
DECLARE
  choice_count pg_catalog.int4;
  updated_question public.questions%ROWTYPE;
BEGIN
  IF NOT public.is_master() THEN
    RAISE EXCEPTION 'master role required';
  END IF;

  IF COALESCE(pg_catalog.cardinality(p_choices), 0) <> 4 THEN
    RAISE EXCEPTION 'exactly four choices are required';
  END IF;

  IF COALESCE(pg_catalog.cardinality(p_correct_numbers), 0) < 1
    OR EXISTS (
      SELECT 1
      FROM pg_catalog.unnest(p_correct_numbers) AS correct_number
      WHERE correct_number NOT BETWEEN 1 AND 4
    ) THEN
    RAISE EXCEPTION 'at least one valid correct choice is required';
  END IF;

  SELECT pg_catalog.count(*)
  INTO choice_count
  FROM public.choices
  WHERE question_id = p_question_id;

  IF choice_count <> 4 THEN
    RAISE EXCEPTION 'question must have exactly four choices';
  END IF;

  UPDATE public.questions
  SET content = p_content,
      explanation = p_explanation,
      reviewed = TRUE,
      updated_at = pg_catalog.now(),
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

CREATE OR REPLACE FUNCTION public.create_written_question(
  p_exam_slug pg_catalog.text,
  p_year pg_catalog.int4,
  p_round pg_catalog.int4,
  p_subject pg_catalog.text,
  p_number pg_catalog.int4,
  p_content pg_catalog.text,
  p_choices pg_catalog.text[],
  p_correct_numbers pg_catalog.int4[],
  p_explanation pg_catalog.text
)
RETURNS public.questions
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = ''
AS $$
DECLARE
  target_exam_id pg_catalog.uuid;
  new_question public.questions%ROWTYPE;
  choice_index pg_catalog.int4;
BEGIN
  IF NOT public.is_master() THEN
    RAISE EXCEPTION 'master role required';
  END IF;

  IF p_year IS NULL OR p_round IS NULL OR p_number IS NULL
    OR p_year < 2000 OR p_round < 1 OR p_number < 1 THEN
    RAISE EXCEPTION 'year, round, and number must be valid positive integers';
  END IF;

  IF COALESCE(pg_catalog.length(pg_catalog.btrim(p_subject)), 0) = 0
    OR COALESCE(pg_catalog.length(pg_catalog.btrim(p_content)), 0) = 0 THEN
    RAISE EXCEPTION 'subject and content must not be blank';
  END IF;

  IF COALESCE(pg_catalog.cardinality(p_choices), 0) <> 4
    OR EXISTS (
      SELECT 1
      FROM pg_catalog.unnest(p_choices) AS choice_text
      WHERE COALESCE(pg_catalog.length(pg_catalog.btrim(choice_text)), 0) = 0
    ) THEN
    RAISE EXCEPTION 'exactly four non-blank choices are required';
  END IF;

  IF COALESCE(pg_catalog.cardinality(p_correct_numbers), 0) < 1
    OR EXISTS (
      SELECT 1
      FROM pg_catalog.unnest(p_correct_numbers) AS correct_number
      WHERE correct_number NOT BETWEEN 1 AND 4
    ) THEN
    RAISE EXCEPTION 'at least one valid correct choice is required';
  END IF;

  SELECT id INTO target_exam_id FROM public.exams WHERE slug = p_exam_slug;
  IF target_exam_id IS NULL THEN
    RAISE EXCEPTION 'exam not found';
  END IF;

  INSERT INTO public.questions (
    exam_id, exam_type, year, round, subject, number, content, explanation,
    reviewed, published, updated_by
  ) VALUES (
    target_exam_id, 'written', p_year, p_round, pg_catalog.btrim(p_subject), p_number,
    p_content, p_explanation, TRUE, TRUE, auth.uid()
  )
  RETURNING * INTO new_question;

  FOR choice_index IN 1..4 LOOP
    INSERT INTO public.choices (question_id, number, content, is_correct)
    VALUES (
      new_question.id,
      choice_index,
      p_choices[choice_index],
      choice_index = ANY (p_correct_numbers)
    );
  END LOOP;

  RETURN new_question;
EXCEPTION
  WHEN unique_violation THEN
    RAISE EXCEPTION 'a question with this year, round, and number already exists';
END;
$$;

REVOKE ALL ON FUNCTION public.is_master() FROM PUBLIC, anon, authenticated;
GRANT EXECUTE ON FUNCTION public.is_master() TO authenticated;
REVOKE ALL ON FUNCTION public.get_written_question_for_edit(pg_catalog.uuid) FROM PUBLIC, anon, authenticated;
GRANT EXECUTE ON FUNCTION public.get_written_question_for_edit(pg_catalog.uuid) TO authenticated;
REVOKE ALL ON FUNCTION public.update_written_question(pg_catalog.uuid, pg_catalog.text, pg_catalog.text[], pg_catalog.int4[], pg_catalog.text, pg_catalog.timestamptz) FROM PUBLIC, anon, authenticated;
GRANT EXECUTE ON FUNCTION public.update_written_question(pg_catalog.uuid, pg_catalog.text, pg_catalog.text[], pg_catalog.int4[], pg_catalog.text, pg_catalog.timestamptz) TO authenticated;
REVOKE ALL ON FUNCTION public.create_written_question(pg_catalog.text, pg_catalog.int4, pg_catalog.int4, pg_catalog.text, pg_catalog.int4, pg_catalog.text, pg_catalog.text[], pg_catalog.int4[], pg_catalog.text) FROM PUBLIC, anon, authenticated;
GRANT EXECUTE ON FUNCTION public.create_written_question(pg_catalog.text, pg_catalog.int4, pg_catalog.int4, pg_catalog.text, pg_catalog.int4, pg_catalog.text, pg_catalog.text[], pg_catalog.int4[], pg_catalog.text) TO authenticated;

CREATE OR REPLACE FUNCTION public.delete_written_question(
  p_question_id pg_catalog.uuid
)
RETURNS pg_catalog.void
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = ''
AS $$
BEGIN
  IF NOT public.is_master() THEN
    RAISE EXCEPTION 'master role required';
  END IF;

  DELETE FROM public.questions
  WHERE id = p_question_id
    AND exam_type = 'written';

  IF NOT FOUND THEN
    RAISE EXCEPTION 'written question not found';
  END IF;
END;
$$;

CREATE OR REPLACE FUNCTION public.delete_written_round(
  p_exam_slug pg_catalog.text,
  p_year pg_catalog.int4,
  p_round pg_catalog.int4
)
RETURNS pg_catalog.int4
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = ''
AS $$
DECLARE
  target_exam_id pg_catalog.uuid;
  deleted_count pg_catalog.int4;
BEGIN
  IF NOT public.is_master() THEN
    RAISE EXCEPTION 'master role required';
  END IF;

  SELECT id INTO target_exam_id FROM public.exams WHERE slug = p_exam_slug;
  IF target_exam_id IS NULL THEN
    RAISE EXCEPTION 'exam not found';
  END IF;

  DELETE FROM public.questions
  WHERE exam_id = target_exam_id
    AND exam_type = 'written'
    AND year = p_year
    AND round = p_round;

  GET DIAGNOSTICS deleted_count = ROW_COUNT;

  IF deleted_count = 0 THEN
    RAISE EXCEPTION 'written round not found';
  END IF;

  RETURN deleted_count;
END;
$$;

REVOKE ALL ON FUNCTION public.delete_written_question(pg_catalog.uuid) FROM PUBLIC, anon, authenticated;
GRANT EXECUTE ON FUNCTION public.delete_written_question(pg_catalog.uuid) TO authenticated;
REVOKE ALL ON FUNCTION public.delete_written_round(pg_catalog.text, pg_catalog.int4, pg_catalog.int4) FROM PUBLIC, anon, authenticated;
GRANT EXECUTE ON FUNCTION public.delete_written_round(pg_catalog.text, pg_catalog.int4, pg_catalog.int4) TO authenticated;

COMMIT;
