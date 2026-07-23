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
    pg_catalog.coalesce(NEW.raw_user_meta_data->>'nickname', pg_catalog.split_part(NEW.email, '@', 1)),
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
      SELECT pg_catalog.coalesce(
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

  IF pg_catalog.coalesce(pg_catalog.cardinality(p_choices), 0) <> 4 THEN
    RAISE EXCEPTION 'exactly four choices are required';
  END IF;

  IF pg_catalog.coalesce(pg_catalog.cardinality(p_correct_numbers), 0) < 1
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

REVOKE ALL ON FUNCTION public.is_master() FROM PUBLIC, anon, authenticated;
GRANT EXECUTE ON FUNCTION public.is_master() TO authenticated;
REVOKE ALL ON FUNCTION public.get_written_question_for_edit(pg_catalog.uuid) FROM PUBLIC, anon, authenticated;
GRANT EXECUTE ON FUNCTION public.get_written_question_for_edit(pg_catalog.uuid) TO authenticated;
REVOKE ALL ON FUNCTION public.update_written_question(pg_catalog.uuid, pg_catalog.text, pg_catalog.text[], pg_catalog.int4[], pg_catalog.text, pg_catalog.timestamptz) FROM PUBLIC, anon, authenticated;
GRANT EXECUTE ON FUNCTION public.update_written_question(pg_catalog.uuid, pg_catalog.text, pg_catalog.text[], pg_catalog.int4[], pg_catalog.text, pg_catalog.timestamptz) TO authenticated;

COMMIT;
