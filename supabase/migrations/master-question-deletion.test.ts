import { readFileSync } from 'node:fs'
import { describe, expect, it } from 'vitest'

const migrationSql = readFileSync('supabase/migrations/202608020001_master_question_deletion.sql', 'utf8')
const setupSql = readFileSync('supabase-setup.sql', 'utf8')
const schemaSql = [migrationSql, setupSql]

describe('master question deletion migration', () => {
  it('adds master-gated delete functions for a single question and a whole round', () => {
    for (const sql of schemaSql) {
      expect(sql).toContain('CREATE OR REPLACE FUNCTION public.delete_written_question(')
      expect(sql).toContain('CREATE OR REPLACE FUNCTION public.delete_written_round(')
      expect(sql).toMatch(/delete_written_question[\s\S]*?IF NOT public\.is_master\(\) THEN/)
      expect(sql).toMatch(/delete_written_round[\s\S]*?IF NOT public\.is_master\(\) THEN/)
      expect(sql).toContain("SET search_path = ''")
    }
  })

  it('scopes both deletes to written questions and raises when nothing matched', () => {
    for (const sql of schemaSql) {
      expect(sql).toMatch(
        /DELETE FROM public\.questions\s+WHERE id = p_question_id\s+AND exam_type = 'written';/,
      )
      expect(sql).toContain("RAISE EXCEPTION 'written question not found'")

      expect(sql).toMatch(
        /DELETE FROM public\.questions\s+WHERE exam_id = target_exam_id\s+AND exam_type = 'written'\s+AND year = p_year\s+AND round = p_round;/,
      )
      expect(sql).toContain("RAISE EXCEPTION 'written round not found'")
      expect(sql).toContain("RAISE EXCEPTION 'exam not found'")
    }
  })

  it('relies on the choices ON DELETE CASCADE instead of deleting choices directly', () => {
    for (const sql of schemaSql) {
      expect(sql).not.toMatch(/DELETE FROM public\.choices/)
    }
  })

  it('revokes public execute and grants only authenticated', () => {
    for (const sql of schemaSql) {
      expect(sql).toContain(
        'REVOKE ALL ON FUNCTION public.delete_written_question(pg_catalog.uuid) FROM PUBLIC, anon, authenticated;',
      )
      expect(sql).toContain(
        'GRANT EXECUTE ON FUNCTION public.delete_written_question(pg_catalog.uuid) TO authenticated;',
      )
      expect(sql).toContain(
        'REVOKE ALL ON FUNCTION public.delete_written_round(pg_catalog.text, pg_catalog.int4, pg_catalog.int4) FROM PUBLIC, anon, authenticated;',
      )
      expect(sql).toContain(
        'GRANT EXECUTE ON FUNCTION public.delete_written_round(pg_catalog.text, pg_catalog.int4, pg_catalog.int4) TO authenticated;',
      )
    }
  })

  it('is wrapped in its own transaction', () => {
    expect(migrationSql).toContain('BEGIN;')
    expect(migrationSql).toContain('COMMIT;')
  })
})
