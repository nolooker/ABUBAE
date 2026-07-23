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
RETURNS pg_catalog.boolean LANGUAGE sql STABLE SECURITY DEFINER SET search_path = '' AS $$
  SELECT EXISTS (
    SELECT 1 FROM public.users
    WHERE id = auth.uid() AND role = 'master'
  );
$$;

DROP POLICY IF EXISTS users_select_own ON public.users;
DROP POLICY IF EXISTS users_update_own ON public.users;
CREATE POLICY users_select_own ON public.users FOR SELECT USING (auth.uid() = id);

DROP POLICY IF EXISTS questions_public_read ON public.questions;
DROP POLICY IF EXISTS choices_public_read ON public.choices;
DROP POLICY IF EXISTS questions_master_select ON public.questions;
DROP POLICY IF EXISTS choices_master_select ON public.choices;
DROP POLICY IF EXISTS questions_master_update ON public.questions;
DROP POLICY IF EXISTS choices_master_update ON public.choices;

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

REVOKE ALL ON FUNCTION public.is_master() FROM PUBLIC;
GRANT EXECUTE ON FUNCTION public.is_master() TO authenticated;
REVOKE ALL ON FUNCTION public.get_written_question_for_edit(pg_catalog.uuid) FROM PUBLIC;
GRANT EXECUTE ON FUNCTION public.get_written_question_for_edit(pg_catalog.uuid) TO authenticated;
REVOKE ALL ON FUNCTION public.update_written_question(pg_catalog.uuid, pg_catalog.text, pg_catalog.text[], pg_catalog.int4[], pg_catalog.text, pg_catalog.timestamptz) FROM PUBLIC;
GRANT EXECUTE ON FUNCTION public.update_written_question(pg_catalog.uuid, pg_catalog.text, pg_catalog.text[], pg_catalog.int4[], pg_catalog.text, pg_catalog.timestamptz) TO authenticated;
