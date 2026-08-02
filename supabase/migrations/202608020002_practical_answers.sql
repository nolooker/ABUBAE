BEGIN;

-- Practical (실기) exam answers. Practical questions are short-answer, so
-- unlike written's fixed 4-choice `choices` table, each question can have
-- one or more blanks, each with one or more accepted phrasings.
CREATE TABLE IF NOT EXISTS public.practical_answers (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  question_id UUID REFERENCES public.questions(id) ON DELETE CASCADE,
  blank_number INT NOT NULL CHECK (blank_number >= 1),
  accepted_answers TEXT[] NOT NULL
);

CREATE UNIQUE INDEX IF NOT EXISTS practical_answers_question_blank_unique
  ON public.practical_answers(question_id, blank_number);

ALTER TABLE public.practical_answers ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS practical_answers_public_read ON public.practical_answers;
REVOKE SELECT ON TABLE public.practical_answers FROM PUBLIC, anon, authenticated;

COMMIT;
