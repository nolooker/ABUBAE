# Idempotent Supabase Setup Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Replace `supabase-setup.sql` with one non-destructive script that initializes a new ABUBAE database or upgrades the existing database repeatedly, including Master question editing and designation of `seoteang@gmail.com`.

**Architecture:** The script runs inside one explicit transaction. Base tables use `CREATE TABLE IF NOT EXISTS`; additive schema upgrades use `ALTER TABLE ... ADD COLUMN IF NOT EXISTS`; sample rows use conflict-safe inserts; policies and triggers are deterministically dropped and recreated; functions use `CREATE OR REPLACE`. Existing application rows are never deleted or overwritten.

**Tech Stack:** PostgreSQL/Supabase SQL, Supabase Auth, Row Level Security, Vitest static SQL contract tests.

## Global Constraints

- Preserve every existing user, question, choice, post, resource, bookmark, and download grant row.
- Never expose direct browser `SELECT` policies for `questions` or `choices`.
- Promote only an existing profile whose lower-cased email equals `seoteang@gmail.com`.
- Do not create an Auth user or profile for the Master email.
- A uniqueness conflict caused by existing duplicate questions or choices must abort instead of deleting or merging rows.
- The complete script must be safe to run twice.

---

### Task 1: Build and verify the idempotent integrated setup

**Files:**
- Modify: `supabase-setup.sql`
- Modify: `supabase/migrations/master-question-editing.test.ts`
- Modify: `abubae.md`

**Interfaces:**
- Consumes: existing ABUBAE base table shapes and the RPC definitions in `supabase/migrations/202607230001_master_question_editing.sql`.
- Produces: a single `supabase-setup.sql` for both fresh initialization and additive existing-project upgrade.

- [ ] **Step 1: Add failing static contract tests**

Add assertions that every base table uses `CREATE TABLE IF NOT EXISTS`, every additive Master column uses `ADD COLUMN IF NOT EXISTS`, sample exams use `ON CONFLICT (slug) DO NOTHING`, unique indexes use `IF NOT EXISTS`, and the SQL contains:

```sql
BEGIN;
UPDATE public.users
SET role = 'master'
WHERE lower(email) = 'seoteang@gmail.com';
COMMIT;
```

Also assert the executable SQL contains no `DROP TABLE`, `TRUNCATE`, `DELETE FROM`, `ON CONFLICT ... DO UPDATE` for sample/seed data, `questions_public_read`, or `choices_public_read`.

- [ ] **Step 2: Run the focused test and verify RED**

Run:

```bash
npm test -- supabase/migrations/master-question-editing.test.ts
```

Expected: FAIL because the current setup uses non-idempotent `CREATE TABLE`, `CREATE POLICY`, `CREATE TRIGGER`, and sample insertion.

- [ ] **Step 3: Replace the setup preamble and base schema**

Wrap the complete script in:

```sql
BEGIN;
CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA extensions;
```

Create the eight base tables with schema-qualified `CREATE TABLE IF NOT EXISTS public.<name>`. Follow them with `ALTER TABLE public.users` and `ALTER TABLE public.questions` statements that add all Master-related columns using `ADD COLUMN IF NOT EXISTS`. Add question and choice unique indexes using `CREATE UNIQUE INDEX IF NOT EXISTS`.

- [ ] **Step 4: Make trigger, samples, and policies repeatable**

Recreate the Auth trigger using:

```sql
DROP TRIGGER IF EXISTS on_auth_user_created ON auth.users;
CREATE TRIGGER on_auth_user_created
AFTER INSERT ON auth.users
FOR EACH ROW EXECUTE FUNCTION public.handle_new_user();
```

Insert the three sample exams with:

```sql
ON CONFLICT (slug) DO NOTHING;
```

For every named RLS policy, issue a schema-qualified `DROP POLICY IF EXISTS ... ON public.<table>` before its `CREATE POLICY`. Do not create direct question or choice read policies.

- [ ] **Step 5: Add Master promotion and secure RPCs**

Keep the final `is_master`, `get_written_question_for_edit`, and `update_written_question` definitions and their explicit grants. After the profile schema exists, add:

```sql
UPDATE public.users
SET role = 'master'
WHERE pg_catalog.lower(email) = 'seoteang@gmail.com';
```

Do not insert a missing profile. End the complete script with `COMMIT;`.

- [ ] **Step 6: Document execution and duplicate-data failure**

Update `abubae.md` to state that `supabase-setup.sql` is repeatable, preserves existing rows, promotes the specified existing profile, and intentionally stops if pre-existing duplicate question/choice keys prevent unique-index creation.

- [ ] **Step 7: Run focused and full verification**

Run:

```bash
npm test -- supabase/migrations/master-question-editing.test.ts
npm test -- --maxWorkers=4
npm run lint
npx tsc --noEmit --incremental false
npm run validate:content
git diff --check
```

Expected: focused SQL tests pass, full suite passes, 300 candidates validate, and the working diff has no whitespace errors.

- [ ] **Step 8: Commit**

```bash
git add supabase-setup.sql supabase/migrations/master-question-editing.test.ts abubae.md
git commit -m "feat: make supabase setup safely repeatable"
```

