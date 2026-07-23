import { readFileSync } from 'node:fs'
import { describe, expect, it } from 'vitest'

const migrationSql = readFileSync('supabase/migrations/202607230001_master_question_editing.sql', 'utf8')
const setupSql = readFileSync('supabase-setup.sql', 'utf8')
const schemaSql = [migrationSql, setupSql]
const executableSql = (sql: string) => sql.replace(/--.*$/gm, '')
const usersRlsStatement = /^\s*ALTER TABLE users ENABLE ROW LEVEL SECURITY;\s*$/m

describe('master question editing migration', () => {
  it('adds a protected role and atomic update function', () => {
    expect(migrationSql).toContain("role TEXT NOT NULL DEFAULT 'user'")
    expect(migrationSql).toContain("CHECK (role IN ('user', 'master'))")
    expect(migrationSql).toContain('CREATE OR REPLACE FUNCTION public.is_master()')
    expect(migrationSql).toContain('CREATE OR REPLACE FUNCTION public.get_written_question_for_edit(')
    expect(migrationSql).toContain('CREATE OR REPLACE FUNCTION public.update_written_question(')
    expect(migrationSql).toContain("RAISE EXCEPTION 'stale question'")
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
    expect(executableSql('-- ALTER TABLE users ENABLE ROW LEVEL SECURITY;')).not.toMatch(usersRlsStatement)
  })
})
