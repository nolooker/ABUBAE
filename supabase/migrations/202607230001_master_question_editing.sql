CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA extensions;

ALTER TABLE public.users
  ADD COLUMN IF NOT EXISTS role TEXT NOT NULL DEFAULT 'user'
  CHECK (role IN ('user', 'master'));

ALTER TABLE public.questions
  ADD COLUMN IF NOT EXISTS exam_type TEXT NOT NULL DEFAULT 'written',
  ADD COLUMN IF NOT EXISTS reviewed BOOLEAN NOT NULL DEFAULT FALSE,
  ADD COLUMN IF NOT EXISTS published BOOLEAN NOT NULL DEFAULT FALSE,
  ADD COLUMN IF NOT EXISTS updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  ADD COLUMN IF NOT EXISTS updated_by UUID REFERENCES public.users(id);

CREATE UNIQUE INDEX IF NOT EXISTS questions_round_number_unique
  ON public.questions(exam_id, exam_type, year, round, number);
CREATE UNIQUE INDEX IF NOT EXISTS choices_question_number_unique
  ON public.choices(question_id, number);

ALTER TABLE public.users ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.questions ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.choices ENABLE ROW LEVEL SECURITY;

CREATE OR REPLACE FUNCTION public.is_master()
RETURNS BOOLEAN LANGUAGE sql STABLE SECURITY DEFINER SET search_path = public AS $$
  SELECT EXISTS (
    SELECT 1 FROM public.users
    WHERE id = auth.uid() AND role = 'master'
  );
$$;

DROP POLICY IF EXISTS users_select_own ON public.users;
DROP POLICY IF EXISTS users_update_own ON public.users;
CREATE POLICY users_select_own ON public.users FOR SELECT USING (auth.uid() = id);

DO $$
DECLARE
  existing_policy RECORD;
BEGIN
  FOR existing_policy IN
    SELECT policyname, tablename
    FROM pg_policies
    WHERE schemaname = 'public'
      AND tablename IN ('questions', 'choices')
  LOOP
    EXECUTE format(
      'DROP POLICY IF EXISTS %I ON public.%I',
      existing_policy.policyname,
      existing_policy.tablename
    );
  END LOOP;
END;
$$;

CREATE POLICY questions_master_select ON public.questions FOR SELECT
  USING (public.is_master());
CREATE POLICY choices_master_select ON public.choices FOR SELECT
  USING (public.is_master());
CREATE POLICY questions_master_update ON public.questions FOR UPDATE
  USING (public.is_master()) WITH CHECK (public.is_master());
CREATE POLICY choices_master_update ON public.choices FOR UPDATE
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
