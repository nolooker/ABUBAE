import { readFileSync } from 'node:fs'
import { describe, expect, it } from 'vitest'

const sql = readFileSync('supabase/migrations/202607230001_master_question_editing.sql', 'utf8')

describe('master question editing migration', () => {
  it('adds a protected role and atomic update function', () => {
    expect(sql).toContain("role TEXT NOT NULL DEFAULT 'user'")
    expect(sql).toContain("CHECK (role IN ('user', 'master'))")
    expect(sql).toContain('CREATE OR REPLACE FUNCTION public.is_master()')
    expect(sql).toContain('CREATE OR REPLACE FUNCTION public.update_written_question(')
    expect(sql).toContain("RAISE EXCEPTION 'stale question'")
  })

  it('blocks browser table reads and permits master-only writes', () => {
    expect(sql).not.toContain('questions_public_read')
    expect(sql).not.toContain('choices_public_read')
    expect(sql).toContain('questions_master_update')
    expect(sql).toContain('public.is_master()')
  })
})
