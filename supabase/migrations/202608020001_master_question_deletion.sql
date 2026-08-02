BEGIN;

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
