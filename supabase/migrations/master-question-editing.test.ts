import { readFileSync } from 'node:fs'
import { describe, expect, it } from 'vitest'

const migrationSql = readFileSync('supabase/migrations/202607230001_master_question_editing.sql', 'utf8')
const setupSql = readFileSync('supabase-setup.sql', 'utf8')
const schemaSql = [migrationSql, setupSql]
const executableSql = (sql: string) => sql.replace(/--.*$/gm, '')
const usersRlsStatement = /^\s*ALTER TABLE public\.users ENABLE ROW LEVEL SECURITY;\s*$/m
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
      expect(sql).toContain('REVOKE ALL ON FUNCTION public.get_written_question_for_edit(pg_catalog.uuid) FROM PUBLIC;')
      expect(sql).toContain('GRANT EXECUTE ON FUNCTION public.get_written_question_for_edit(pg_catalog.uuid) TO authenticated;')
      expect(sql).toContain('REVOKE ALL ON FUNCTION public.update_written_question(pg_catalog.uuid, pg_catalog.text, pg_catalog.text[], pg_catalog.int4[], pg_catalog.text, pg_catalog.timestamptz) FROM PUBLIC;')
      expect(sql).toContain('GRANT EXECUTE ON FUNCTION public.update_written_question(pg_catalog.uuid, pg_catalog.text, pg_catalog.text[], pg_catalog.int4[], pg_catalog.text, pg_catalog.timestamptz) TO authenticated;')
    }

    expect(migrationSql).not.toContain('pg_policies')
    expect(migrationSql).toContain('DROP POLICY IF EXISTS questions_public_read ON public.questions;')
    expect(migrationSql).toContain('DROP POLICY IF EXISTS choices_public_read ON public.choices;')
  })

  it('does not mistake a SQL line comment for executable users RLS', () => {
    expect(executableSql('-- ALTER TABLE public.users ENABLE ROW LEVEL SECURITY;')).not.toMatch(usersRlsStatement)
  })

  it('makes the integrated setup safe to execute against fresh and existing projects', () => {
    for (const table of baseTables) {
      expect(setupSql).toMatch(new RegExp(`CREATE TABLE IF NOT EXISTS public\\.${table}\\s*\\(`))
    }

    for (const column of ['role', 'exam_type', 'reviewed', 'published', 'updated_at', 'updated_by']) {
      expect(setupSql).toMatch(new RegExp(`ADD COLUMN IF NOT EXISTS ${column}\\b`))
    }

    expect(setupSql).toMatch(/CREATE UNIQUE INDEX IF NOT EXISTS public\.questions_round_number_unique/)
    expect(setupSql).toMatch(/CREATE UNIQUE INDEX IF NOT EXISTS public\.choices_question_number_unique/)
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

  it('never deletes data or grants direct question and choice reads', () => {
    const sql = executableSql(setupSql)

    expect(sql).not.toMatch(/\bDROP TABLE\b/i)
    expect(sql).not.toMatch(/\bTRUNCATE\b/i)
    expect(sql).not.toMatch(/\bDELETE FROM\b/i)
    expect(sql).not.toMatch(/INSERT INTO public\.exams[\s\S]*ON CONFLICT[\s\S]*DO UPDATE/i)
    expect(sql).toContain('DROP POLICY IF EXISTS questions_public_read ON public.questions;')
    expect(sql).toContain('DROP POLICY IF EXISTS choices_public_read ON public.choices;')
    expect(sql).toContain('DROP POLICY IF EXISTS questions_master_select ON public.questions;')
    expect(sql).toContain('DROP POLICY IF EXISTS choices_master_select ON public.choices;')
    expect(sql).toContain('DROP POLICY IF EXISTS questions_master_update ON public.questions;')
    expect(sql).toContain('DROP POLICY IF EXISTS choices_master_update ON public.choices;')
    expect(sql).not.toMatch(/CREATE POLICY\s+"?questions_(public_read|master_(select|update))"?/i)
    expect(sql).not.toMatch(/CREATE POLICY\s+"?choices_(public_read|master_(select|update))"?/i)
  })
})
