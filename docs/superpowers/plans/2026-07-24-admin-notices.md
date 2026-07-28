# Admin Notice Management Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Let a Master create, edit, and publish notices in `/admin/notices`, then show the latest three published notices on the homepage with public detail pages.

**Architecture:** Public notice reads use a server-only repository that selects only published `type = 'notice'` rows. Master management uses authenticated role checks plus server-side service-role persistence, strict validation, and optimistic concurrency. Admin UI, public homepage rendering, and detail rendering consume typed notice DTOs rather than raw Supabase rows.

**Tech Stack:** Next.js 16 App Router, React 19, TypeScript, Supabase/PostgreSQL, Vitest, Testing Library, Playwright.

## Global Constraints

- Only `public.users.role = 'master'` can list unpublished notices or create/update notices.
- Public paths return only `type = 'notice' AND is_published = true`.
- Never expose `SUPABASE_SERVICE_ROLE_KEY` or the service client to browser code.
- Title is trimmed and 1–120 characters.
- Slug is 1–120 lowercase ASCII letters, digits, or hyphens.
- Content is trimmed and 1–20,000 characters.
- Create fixes `type = 'notice'` and `is_premium = false`.
- Update requires the last observed `updated_at`; stale writes return 409.
- No delete, image upload, rich text, scheduled publish, or pinning.

---

### Task 1: Notice data, security, repository, and API

**Files:**
- Modify: `supabase-setup.sql`
- Create: `supabase/migrations/202607240001_admin_notices.sql`
- Create: `supabase/migrations/admin-notices.test.ts`
- Create: `src/lib/notice.ts`
- Create: `src/lib/notice.test.ts`
- Create: `src/lib/notice-repository.ts`
- Create: `src/lib/notice-repository.test.ts`
- Create: `src/app/api/admin/notices/route.ts`
- Create: `src/app/api/admin/notices/route.test.ts`
- Create: `src/app/api/admin/notices/[noticeId]/route.ts`
- Create: `src/app/api/admin/notices/[noticeId]/route.test.ts`
- Modify: `abubae.md`

**Interfaces:**
- Produces `PublicNoticeSummary`, `PublicNoticeDetail`, `AdminNotice`, and `NoticeInput`.
- Produces `listPublishedNotices(limit)`, `getPublishedNoticeBySlug(slug)`, `listAdminNotices()`, `getAdminNotice(id)`, `createNotice(input)`, and `updateNotice(id, input, expectedUpdatedAt)`.
- Produces `GET/POST /api/admin/notices` and `GET/PATCH /api/admin/notices/[noticeId]`.

- [ ] **Step 1: Write failing SQL and domain tests**

Test that SQL removes direct browser mutation policies on `posts`, revokes `INSERT/UPDATE/DELETE` from `PUBLIC`, `anon`, and `authenticated`, and grants no browser mutation path. Test:

```ts
expect(validateNoticeInput({
  title: ' 공지 ',
  slug: 'first-notice',
  content: ' 내용 ',
  isPublished: true,
})).toEqual({
  title: '공지',
  slug: 'first-notice',
  content: '내용',
  isPublished: true,
})
```

Also test empty/oversized fields, uppercase/space/duplicate-hyphen slug forms, unknown keys, invalid booleans, malformed UUID, and malformed timestamp.

- [ ] **Step 2: Run Task 1 tests and verify RED**

Run:

```bash
npm test -- supabase/migrations/admin-notices.test.ts src/lib/notice.test.ts
```

Expected: FAIL because the migration and validation module do not exist.

- [ ] **Step 3: Implement SQL security and typed validation**

Add a transaction that enables posts RLS, drops every non-SELECT posts policy dynamically, revokes `INSERT`, `UPDATE`, and `DELETE` on `public.posts` from `PUBLIC`, `anon`, and `authenticated`, then recreates only:

```sql
CREATE POLICY posts_public_read
ON public.posts
FOR SELECT
USING (is_published = true);
```

Implement strict object validation and the interfaces from this task.

- [ ] **Step 4: Implement repository scoping**

Public repository selects only:

```text
id,title,slug,content,created_at,updated_at
```

and always filters:

```text
type=notice, is_published=true
```

Admin repository uses the server-only service client, fixes `type='notice'` and `is_premium=false`, maps duplicate slug to a typed conflict, and updates only when both `id` and `updated_at` match.

- [ ] **Step 5: Implement authenticated API routes**

Every handler calls `requireMaster()` before the service repository. Return:

```text
401 unauthenticated
403 non-master
400 invalid input
404 missing notice
409 duplicate slug or stale update
500 redacted unexpected error
```

Successful responses contain only the typed Admin DTO.

- [ ] **Step 6: Verify and commit Task 1**

Run:

```bash
npm test -- supabase/migrations/admin-notices.test.ts src/lib/notice.test.ts src/lib/notice-repository.test.ts src/app/api/admin/notices/route.test.ts src/app/api/admin/notices/[noticeId]/route.test.ts
npm test -- --maxWorkers=4
npm run lint
npx tsc --noEmit --incremental false
git diff --check
```

Commit:

```bash
git add supabase-setup.sql supabase/migrations/202607240001_admin_notices.sql supabase/migrations/admin-notices.test.ts src/lib/notice.ts src/lib/notice.test.ts src/lib/notice-repository.ts src/lib/notice-repository.test.ts src/app/api/admin/notices src/app/api/admin/notices/[noticeId] abubae.md
git commit -m "feat: add secure notice management api"
```

---

### Task 2: Admin notice list and editor

**Files:**
- Modify: `src/app/admin/page.tsx`
- Create: `src/app/admin/notices/page.tsx`
- Create: `src/app/admin/notices/new/page.tsx`
- Create: `src/app/admin/notices/[noticeId]/edit/page.tsx`
- Create: `src/components/admin/NoticeForm.tsx`
- Create: `src/components/admin/NoticeForm.test.tsx`
- Create: `src/app/admin/notices/page.test.tsx`

**Interfaces:**
- Consumes Task 1 admin repository and API DTOs.
- Produces Master-only list, create form, and edit form.

- [ ] **Step 1: Write failing UI tests**

Test Master redirect boundaries, list status badges, create payload, edit payload with `expectedUpdatedAt`, pending lock, 400/409/500 messages, success redirect, and form reset behavior.

- [ ] **Step 2: Run tests and verify RED**

```bash
npm test -- src/components/admin/NoticeForm.test.tsx src/app/admin/notices/page.test.tsx
```

- [ ] **Step 3: Implement list and navigation**

Make the existing admin card a link to `/admin/notices`. The list displays title, slug, published status, updated date, `새 공지 작성`, and `수정`.

- [ ] **Step 4: Implement reusable form**

The form accepts:

```ts
type NoticeFormProps = {
  mode: 'create' | 'edit'
  initialNotice?: AdminNotice
}
```

It sends POST or PATCH, disables controls while saving, announces errors/success with accessible status regions, and navigates to `/admin/notices?status=saved`.

- [ ] **Step 5: Verify and commit Task 2**

Run focused/full tests, lint, TypeScript, and diff check. Commit:

```bash
git commit -m "feat: manage notices from admin"
```

---

### Task 3: Homepage latest notices and public detail

**Files:**
- Modify: `src/app/page.tsx`
- Create: `src/app/notices/[slug]/page.tsx`
- Create: `src/app/notices/[slug]/page.test.tsx`
- Create: `src/components/home/LatestNotices.tsx`
- Create: `src/components/home/LatestNotices.test.tsx`

**Interfaces:**
- Consumes Task 1 public repository DTOs.
- Produces latest-three homepage section and published-only detail route.

- [ ] **Step 1: Write failing public rendering tests**

Test newest-three ordering, unpublished exclusion at repository boundary, empty state, semantic links, date rendering, published detail, and 404 for missing/unpublished slug.

- [ ] **Step 2: Run tests and verify RED**

```bash
npm test -- src/components/home/LatestNotices.test.tsx src/app/notices/[slug]/page.test.tsx
```

- [ ] **Step 3: Implement homepage section**

Fetch exactly three summaries on the server and render title/date links to `/notices/<slug>`. Render `등록된 공지가 없습니다.` when empty.

- [ ] **Step 4: Implement public detail**

Fetch by slug through the published-only repository, call `notFound()` when absent, and render title, created date, and plain-text content preserving line breaks.

- [ ] **Step 5: Verify and commit Task 3**

Run focused/full tests, lint, TypeScript, build with configured environment, and diff check. Commit:

```bash
git commit -m "feat: publish notices on homepage"
```

---

### Task 4: End-to-end verification and operator documentation

**Files:**
- Create: `tests/e2e/admin-notices.spec.ts`
- Modify: `abubae.md`

**Interfaces:**
- Consumes all prior task routes and UI.
- Produces a restorable live-flow E2E and operator checklist.

- [ ] **Step 1: Write credential-gated E2E**

With Master credentials present: create a unique draft, verify it is absent publicly, publish it, verify homepage/detail, edit it, and restore or remove test data in `finally`. Without credentials, skip before starting a web server.

- [ ] **Step 2: Document operator flow**

Document the admin URL, fields, publish behavior, homepage limit of three, no-delete MVP scope, required environment variables, and E2E credentials.

- [ ] **Step 3: Run final verification**

```bash
npm test -- --maxWorkers=4
npm run lint
npx tsc --noEmit --incremental false
npm run validate:content
npm run test:e2e
npm run build
git diff --check
```

- [ ] **Step 4: Commit**

```bash
git commit -m "test: verify notice publishing flow"
```

