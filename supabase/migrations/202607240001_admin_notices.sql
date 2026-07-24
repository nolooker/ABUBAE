BEGIN;

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
REVOKE INSERT, UPDATE, DELETE ON TABLE public.posts FROM PUBLIC, anon, authenticated;
CREATE POLICY posts_public_read ON public.posts FOR SELECT USING (is_published = true);

COMMIT;
