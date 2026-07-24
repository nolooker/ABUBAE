import { readFileSync } from 'node:fs'

import { describe, expect, it } from 'vitest'

const migrationSql = readFileSync('supabase/migrations/202607240001_admin_notices.sql', 'utf8')
const setupSql = readFileSync('supabase-setup.sql', 'utf8')

function executableSql(sql: string) {
  return sql
    .replace(/\/\*[\s\S]*?\*\//g, ' ')
    .replace(/--.*$/gm, ' ')
    .replace(/"([^"]+)"/g, '$1')
}

describe('admin notices migration', () => {
  it('removes every direct posts mutation policy and browser mutation grant', () => {
    for (const sql of [migrationSql, setupSql]) {
      const executable = executableSql(sql)

      expect(executable).toContain('ALTER TABLE public.posts ENABLE ROW LEVEL SECURITY;')
      expect(executable).toMatch(/FROM pg_catalog\.pg_policies[\s\S]*?tablename = 'posts'[\s\S]*?DROP POLICY IF EXISTS %I ON %I\.%I/)
      expect(executable).not.toMatch(/tablename = 'posts'[\s\S]*?cmd <> 'SELECT'/)
      expect(executable).toContain('REVOKE INSERT, UPDATE, DELETE ON TABLE public.posts FROM PUBLIC, anon, authenticated;')
      expect(executable).not.toMatch(/CREATE\s+POLICY\s+[^;]+\s+ON\s+public\.posts[\s\S]*?\sFOR\s+(?:INSERT|UPDATE|DELETE|ALL)\b/i)
    }
  })

  it('would remove a permissive SELECT policy introduced after deployment', () => {
    const drift = "CREATE POLICY posts_future_browser_read ON public.posts FOR SELECT USING (true);"
    expect(drift).toMatch(/CREATE POLICY\s+\S+\s+ON public\.posts\s+FOR SELECT/i)

    for (const sql of [migrationSql, setupSql]) {
      expect(executableSql(sql)).toMatch(/FROM pg_catalog\.pg_policies[\s\S]*?tablename = 'posts'[\s\S]*?EXECUTE pg_catalog\.format\(/)
      expect(executableSql(sql)).not.toMatch(/tablename = 'posts'[\s\S]*?cmd\s*(?:<>|=)/)
    }
  })

  it('keeps a published-only public posts read policy', () => {
    for (const sql of [migrationSql, setupSql]) {
      const executable = executableSql(sql)

      expect(executable).toContain('DROP POLICY IF EXISTS posts_public_read ON public.posts;')
      expect(executable).toMatch(/CREATE POLICY posts_public_read\s+ON public\.posts\s+FOR SELECT\s+USING \(is_published = true\);/)
    }
  })
})
