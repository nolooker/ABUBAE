import { readFileSync } from 'node:fs'
import { describe, expect, it } from 'vitest'

const migrationSql = readFileSync('supabase/migrations/202607230001_master_question_editing.sql', 'utf8')
const setupSql = readFileSync('supabase-setup.sql', 'utf8')
const docs = readFileSync('abubae.md', 'utf8')
const schemaSql = [migrationSql, setupSql]
const executableSql = (sql: string) => sql
  .replace(/\/\*[\s\S]*?\*\//g, ' ')
  .replace(/--.*$/gm, ' ')
  .replace(/"([^"]+)"/g, '$1')
const usersRlsStatement = /^\s*ALTER TABLE public\.users ENABLE ROW LEVEL SECURITY;\s*$/m
const destructiveDelete = /\bDELETE(?:(?:\s+)|(?:\/\*[\s\S]*?\*\/))+FROM\b/i
const destructiveDropTable = /\bDROP\s+TABLE\b/i
const directReadPolicy = (table: 'questions' | 'choices') => new RegExp(
  `CREATE\\s+POLICY\\s+(?:"[^"]+"|\\S+)\\s+ON\\s+public\\.${table}\\b`,
  'i',
)
const unsafeUsersPolicy = /CREATE\s+POLICY\s+(?:"[^"]+"|\S+)\s+ON\s+public\.users\b(?:\s+AS\s+(?:PERMISSIVE|RESTRICTIVE))?(?:\s+FOR\s+(?:UPDATE|ALL)\b|\s+(?:USING|WITH\s+CHECK)\b|\s*;)/i
const baseTables = [
  'exams',
  'users',
  'questions',
  'choices',
  'posts',
  'resources',
  'bookmarks',
  'download_grants',
]
const expectedUniqueIndexes = [
  {
    name: 'questions_round_number_unique',
    table: 'questions',
    columns: ['exam_id', 'exam_type', 'year', 'round', 'number'],
  },
  {
    name: 'choices_question_number_unique',
    table: 'choices',
    columns: ['question_id', 'number'],
  },
]

describe('master question editing migration', () => {
  it('adds a protected role and atomic update function', () => {
    expect(migrationSql).toContain("role TEXT NOT NULL DEFAULT 'user'")
    expect(migrationSql).toContain("CHECK (role IN ('user', 'master'))")
    expect(migrationSql).toContain('CREATE OR REPLACE FUNCTION public.is_master()')
    expect(migrationSql).toContain('CREATE OR REPLACE FUNCTION public.get_written_question_for_edit(')
    expect(migrationSql).toContain('CREATE OR REPLACE FUNCTION public.update_written_question(')
    expect(migrationSql).toContain("RAISE EXCEPTION 'stale question'")
    expect(migrationSql).toMatch(/UPDATE public\.questions\s+SET content = p_content,\s+explanation = p_explanation,\s+reviewed = TRUE,/)
    expect(setupSql).toMatch(/UPDATE public\.questions\s+SET content = p_content,\s+explanation = p_explanation,\s+reviewed = TRUE,/)
  })

  it('uses PostgreSQL built-in type names that exist', () => {
    for (const sql of schemaSql) {
      expect(sql).not.toContain('pg_catalog.boolean')
      expect(sql).toMatch(/RETURNS pg_catalog\.bool/)
    }
  })

  it('keeps user RLS executable and routes all question editing through RPCs', () => {
    expect(migrationSql).toContain('ALTER TABLE public.users ENABLE ROW LEVEL SECURITY;')
    expect(executableSql(setupSql)).toMatch(usersRlsStatement)

    for (const sql of schemaSql) {
      expect(sql).toContain('CREATE OR REPLACE FUNCTION public.get_written_question_for_edit(')
      expect(sql).toContain('CREATE OR REPLACE FUNCTION public.update_written_question(')
      expect(sql).not.toMatch(/CREATE POLICY\s+"?questions_public_read"?/i)
      expect(sql).not.toMatch(/CREATE POLICY\s+"?choices_public_read"?/i)
      expect(sql).not.toMatch(/CREATE POLICY\s+questions_master_(select|update)/i)
      expect(sql).not.toMatch(/CREATE POLICY\s+choices_master_(select|update)/i)
      expect(sql).toContain("SET search_path = ''")
      expect(sql).not.toContain('SET search_path = public')
      expect(sql).toContain('REVOKE ALL ON FUNCTION public.is_master() FROM PUBLIC, anon, authenticated;')
      expect(sql).toContain('GRANT EXECUTE ON FUNCTION public.is_master() TO authenticated;')
      expect(sql).toContain('REVOKE ALL ON FUNCTION public.get_written_question_for_edit(pg_catalog.uuid) FROM PUBLIC, anon, authenticated;')
      expect(sql).toContain('GRANT EXECUTE ON FUNCTION public.get_written_question_for_edit(pg_catalog.uuid) TO authenticated;')
      expect(sql).toContain('REVOKE ALL ON FUNCTION public.update_written_question(pg_catalog.uuid, pg_catalog.text, pg_catalog.text[], pg_catalog.int4[], pg_catalog.text, pg_catalog.timestamptz) FROM PUBLIC, anon, authenticated;')
      expect(sql).toContain('GRANT EXECUTE ON FUNCTION public.update_written_question(pg_catalog.uuid, pg_catalog.text, pg_catalog.text[], pg_catalog.int4[], pg_catalog.text, pg_catalog.timestamptz) TO authenticated;')
    }

    expect(migrationSql).toContain('FROM pg_catalog.pg_policies')
    expect(migrationSql).toContain('DROP POLICY IF EXISTS questions_public_read ON public.questions;')
    expect(migrationSql).toContain('DROP POLICY IF EXISTS choices_public_read ON public.choices;')
  })

  it('does not mistake a SQL line comment for executable users RLS', () => {
    expect(executableSql('-- ALTER TABLE public.users ENABLE ROW LEVEL SECURITY;')).not.toMatch(usersRlsStatement)
  })

  it('recognizes question and choice policies even when they omit a command clause', () => {
    expect('CREATE POLICY future_question_policy ON public.questions TO authenticated;').toMatch(directReadPolicy('questions'))
    expect('CREATE POLICY future_choice_policy ON public.choices WITH CHECK (true);').toMatch(directReadPolicy('choices'))
  })

  it('normalizes comments and quoted identifiers before checking destructive SQL and policies', () => {
    expect(executableSql('DELETE/**/FROM public.questions;')).toMatch(destructiveDelete)
    expect(executableSql('DROP\nTABLE public.questions;')).toMatch(destructiveDropTable)
    expect(executableSql('DROP/**/TABLE public.questions;')).toMatch(destructiveDropTable)
    expect(executableSql('CREATE/**/POLICY read_questions ON "public"."questions" FOR SELECT USING (true);')).toMatch(directReadPolicy('questions'))
  })

  it('keeps profiles server-managed and removes every direct question and choice policy', () => {
    for (const schema of schemaSql) {
      const sql = executableSql(schema)

      expect(sql).toContain('DROP POLICY IF EXISTS users_update_own ON public.users;')
      expect(sql).toContain('REVOKE UPDATE ON TABLE public.users FROM PUBLIC, anon, authenticated;')
      expect(sql).toContain('REVOKE SELECT ON TABLE public.questions FROM PUBLIC, anon, authenticated;')
      expect(sql).toContain('REVOKE SELECT ON TABLE public.choices FROM PUBLIC, anon, authenticated;')
      expect(sql).toMatch(/DO \$\$[\s\S]*?FROM pg_catalog\.pg_policies[\s\S]*?tablename = 'users'[\s\S]*?cmd <> 'SELECT'[\s\S]*?EXECUTE pg_catalog\.format\(\s*'DROP POLICY IF EXISTS %I ON %I\.%I'/)
      expect(sql).toMatch(/DO \$\$[\s\S]*?FROM pg_catalog\.pg_policies[\s\S]*?tablename IN \('questions', 'choices'\)[\s\S]*?EXECUTE pg_catalog\.format\(\s*'DROP POLICY IF EXISTS %I ON %I\.%I'/)
      expect(sql).not.toMatch(unsafeUsersPolicy)
    }
  })

  it('documents the integrated setup as the sole operator path', () => {
    expect(docs).toContain('sole canonical operator path')
    expect(docs).toContain('superseded for operator use')
    expect(docs).toContain('supabase-setup.sql')
    expect(docs).not.toContain("UPDATE public.users SET role = 'master' WHERE email = '<운영자 이메일>';")
    expect(docs).not.toContain('1. `supabase/migrations/202607230001_master_question_editing.sql`')
  })

  it('makes the integrated setup safe to execute against fresh and existing projects', () => {
    for (const table of baseTables) {
      expect(setupSql).toMatch(new RegExp(`CREATE TABLE IF NOT EXISTS public\\.${table}\\s*\\(`))
    }

    for (const column of ['role', 'exam_type', 'reviewed', 'published', 'updated_at', 'updated_by']) {
      expect(setupSql).toMatch(new RegExp(`ADD COLUMN IF NOT EXISTS ${column}\\b`))
    }

    expect(setupSql).toMatch(/INSERT INTO public\.exams[\s\S]*ON CONFLICT \(slug\) DO NOTHING;/)
    expect(setupSql).toContain('BEGIN;')
    expect(setupSql).toContain('COMMIT;')
    expect(setupSql).toMatch(/UPDATE public\.users\s+SET role = 'master'\s+WHERE pg_catalog\.lower\(email\) = 'seoteang@gmail\.com';/)

    for (const [policy, table] of [
      ['users_select_own', 'users'],
      ['bookmarks_all_own', 'bookmarks'],
      ['grants_select_own', 'download_grants'],
      ['exams_public_read', 'exams'],
      ['posts_public_read', 'posts'],
      ['resources_public_read', 'resources'],
    ]) {
      expect(setupSql).toContain(`DROP POLICY IF EXISTS ${policy} ON public.${table};`)
      expect(setupSql).toMatch(new RegExp(`CREATE POLICY ${policy} ON public\\.${table}`))
    }
  })

  it('validates expected unique index definitions after repeatable creation', () => {
    expect(setupSql).not.toMatch(/CREATE UNIQUE INDEX IF NOT EXISTS public\./)

    for (const { name, table, columns } of expectedUniqueIndexes) {
      expect(setupSql).toMatch(new RegExp(
        `CREATE UNIQUE INDEX IF NOT EXISTS ${name}\\s+ON public\\.${table}\\(${columns.join('\\s*,\\s*')}\\);`,
      ))
      expect(setupSql).toMatch(new RegExp(
        `index_relation\\.relname = '${name}'[\\s\\S]*?index_definition\\.indrelid = 'public\\.${table}'::pg_catalog\\.regclass[\\s\\S]*?index_definition\\.indisunique[\\s\\S]*?index_definition\\.indisvalid[\\s\\S]*?index_definition\\.indisready[\\s\\S]*?index_definition\\.indislive[\\s\\S]*?index_definition\\.indpred IS NULL[\\s\\S]*?index_definition\\.indnatts = index_definition\\.indnkeyatts[\\s\\S]*?ARRAY\\[${columns.map((column) => `'${column}'`).join(', ')}\\]::pg_catalog\\.name\\[\\]`,
      ))
    }

    expect(setupSql).toMatch(/DO \$\$[\s\S]*RAISE EXCEPTION 'questions_round_number_unique has an unexpected definition';[\s\S]*RAISE EXCEPTION 'choices_question_number_unique has an unexpected definition';[\s\S]*END;\s*\$\$;/)
  })

  it('never deletes data or grants direct question and choice reads', () => {
    const sql = executableSql(setupSql)

    expect(sql).not.toMatch(destructiveDropTable)
    expect(sql).not.toMatch(/\bTRUNCATE\b/i)
    expect(sql).not.toMatch(destructiveDelete)
    expect('DELETE /* preserve rows */\n FROM public.questions;').toMatch(destructiveDelete)
    expect(sql).not.toMatch(/INSERT INTO public\.exams[\s\S]*ON CONFLICT[\s\S]*DO UPDATE/i)
    expect(sql).toContain('DROP POLICY IF EXISTS questions_public_read ON public.questions;')
    expect(sql).toContain('DROP POLICY IF EXISTS choices_public_read ON public.choices;')
    expect(sql).toContain('DROP POLICY IF EXISTS questions_master_select ON public.questions;')
    expect(sql).toContain('DROP POLICY IF EXISTS choices_master_select ON public.choices;')
    expect(sql).toContain('DROP POLICY IF EXISTS questions_master_update ON public.questions;')
    expect(sql).toContain('DROP POLICY IF EXISTS choices_master_update ON public.choices;')
    expect(sql).toContain('REVOKE SELECT ON TABLE public.questions FROM PUBLIC, anon, authenticated;')
    expect(sql).toContain('REVOKE SELECT ON TABLE public.choices FROM PUBLIC, anon, authenticated;')
    expect(sql).toMatch(/DO \$\$[\s\S]*?FROM pg_catalog\.pg_policies[\s\S]*?tablename IN \('questions', 'choices'\)[\s\S]*?EXECUTE pg_catalog\.format\(\s*'DROP POLICY IF EXISTS %I ON %I\.%I'/)
    for (const schema of schemaSql) {
      expect(executableSql(schema)).not.toMatch(directReadPolicy('questions'))
      expect(executableSql(schema)).not.toMatch(directReadPolicy('choices'))
    }
  })

  it('promotes exactly the designated existing profile and nothing else', () => {
    const sql = executableSql(setupSql)
    const masterAssignments = sql.match(/\bSET\s+role\s*=\s*'master'/gi) ?? []

    expect(masterAssignments).toHaveLength(1)
    expect(sql).toMatch(/DO \$\$[\s\S]*?SELECT pg_catalog\.count\(\*\)[\s\S]*?FROM public\.users[\s\S]*?WHERE pg_catalog\.lower\(email\) = 'seoteang@gmail\.com'[\s\S]*?> 1[\s\S]*?RAISE EXCEPTION 'multiple profiles match seoteang@gmail\.com';[\s\S]*?END;\s*\$\$;/)
    expect(sql).toMatch(/UPDATE\s+public\.users\s+SET\s+role\s*=\s*'master'\s+WHERE\s+pg_catalog\.lower\(email\)\s*=\s*'seoteang@gmail\.com';/i)
    expect(sql).not.toMatch(/INSERT\s+INTO\s+(?:public\.users|auth\.users)[\s\S]*seoteang@gmail\.com/i)
    expect(sql).not.toMatch(/INSERT\s+INTO\s+public\.users\s*\([^)]*\brole\b[^)]*\)[\s\S]*'master'/i)
  })
})
