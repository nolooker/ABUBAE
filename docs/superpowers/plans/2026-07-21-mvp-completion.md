# ABUBAE MVP Completion Implementation Plan

> [!WARNING]
> **Superseded historical plan — do not execute.** This document predates the unified Supabase Master authorization design. Follow [the Master inline-question-edit design](../specs/2026-07-23-master-inline-question-edit-design.md) and [its implementation plan](2026-07-23-master-inline-question-edit.md) for current guidance. In particular, **do not execute any legacy admin-code instructions in this document**: do not restore `src/lib/admin-auth.ts`, `ADMIN_MASTER_KEY`, cookie sessions, or the `master` fallback.

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Make the documented ABUBAE MVP build reliably without Supabase credentials and complete authentication, question practice, resource delivery, and launch-quality navigation.

**Architecture:** Keep public catalog pages server-rendered with the existing mock fallback, but expose Supabase availability explicitly instead of constructing clients with missing configuration. Put interactive quiz/auth/download behavior in focused client components and Server Actions, backed by Supabase tables with RLS. Retain Supabase Studio as the initial content editor; the current admin page remains an operational status dashboard rather than growing a second CMS during MVP completion.

**Tech Stack:** Next.js 16.2 App Router, React 19.2, TypeScript 5, Supabase SSR/Auth/Postgres, Tailwind CSS 4, Vitest, Testing Library, Playwright

## Historical Constraints (superseded; do not execute)

- Node.js must be 20.9 or newer; the audited machine uses Node.js 24.12.0.
- Public exam, question, and resource pages must render from mock data when Supabase variables are absent.
- Authentication, bookmarks, attempt history, and downloads must never silently fall back to mock user data.
- Keep authorization checks in Server Components or Server Actions, not only in routing middleware.
- Do not expose answer correctness before the learner submits a choice.
- Replace the production admin default code; `ADMIN_MASTER_KEY` is mandatory when `NODE_ENV=production`.

---

## File Structure

- Modify `src/lib/supabase/client.ts`: validate browser configuration and return a nullable client.
- Modify `src/lib/supabase/server.ts`: provide an availability check and build a server client only when configured.
- Modify `src/components/auth/AuthForm.tsx`: render a configured/unconfigured state and create the client on submission.
- Modify `src/app/mypage/page.tsx`: redirect to login when configured and show setup guidance when local credentials are absent.
- Create `src/components/quiz/QuestionPractice.tsx`: own answer selection, submission, feedback, and bookmark controls.
- Modify `src/app/quiz/daily/page.tsx` and `src/app/exam/[slug]/questions/[id]/page.tsx`: render `QuestionPractice` instead of revealing the answer immediately.
- Create `src/app/exam/[slug]/questions/[id]/actions.ts`: persist authenticated attempts and bookmarks.
- Modify `supabase-setup.sql`: add attempt history and tighten write policies.
- Create `src/app/resources/[id]/actions.ts`: grant or validate access and return a signed download URL.
- Create `src/components/resources/ResourceAccessButton.tsx`: drive free-download and paid-unavailable UI.
- Modify `src/lib/data.ts`: include resource file, preview, page-count, and publication fields.
- Modify `src/components/layout/Footer.tsx` and `src/app/page.tsx`: remove dead `#` links and use real destinations.
- Create `src/app/not-found.tsx`, `src/app/error.tsx`, and route-level loading states.
- Create `vitest.config.ts`, `src/test/setup.ts`, and focused unit/component tests.
- Create `tests/e2e/mvp.spec.ts` and `playwright.config.ts`: cover public, auth-degraded, and admin smoke flows.
- Modify `README.md`: document environment variables, database setup, test commands, and degraded local behavior.

### Historical Task 1: Make Supabase Optional for Public and Build-Time Rendering (superseded; do not execute)

**Files:**
- Modify: `src/lib/supabase/client.ts`
- Modify: `src/lib/supabase/server.ts`
- Modify: `src/components/auth/AuthForm.tsx`
- Modify: `src/app/mypage/page.tsx`
- Modify: `src/lib/admin-auth.ts`
- Create: `src/lib/supabase/config.test.ts`

**Interfaces:**
- Produces: `hasSupabaseConfig(): boolean`, `createClient(): SupabaseClient | null`, and `createServerClientOrNull(): Promise<SupabaseClient | null>`.
- Consumes: `NEXT_PUBLIC_SUPABASE_URL`, `NEXT_PUBLIC_SUPABASE_ANON_KEY`, and `ADMIN_MASTER_KEY`.

- [ ] **Step 1: Add tests for configured and unconfigured environments**

```ts
import { afterEach, describe, expect, it, vi } from 'vitest'

describe('Supabase configuration', () => {
  afterEach(() => vi.unstubAllEnvs())

  it('reports unavailable when either public value is missing', async () => {
    vi.stubEnv('NEXT_PUBLIC_SUPABASE_URL', '')
    vi.stubEnv('NEXT_PUBLIC_SUPABASE_ANON_KEY', '')
    const { hasSupabaseConfig } = await import('./client')
    expect(hasSupabaseConfig()).toBe(false)
  })

  it('reports available when both public values exist', async () => {
    vi.stubEnv('NEXT_PUBLIC_SUPABASE_URL', 'https://example.supabase.co')
    vi.stubEnv('NEXT_PUBLIC_SUPABASE_ANON_KEY', 'public-anon-key')
    const { hasSupabaseConfig } = await import('./client')
    expect(hasSupabaseConfig()).toBe(true)
  })
})
```

- [ ] **Step 2: Run the focused test and confirm it fails before implementation**

Run: `npm test -- src/lib/supabase/config.test.ts`

Expected: FAIL because `hasSupabaseConfig` is not exported.

- [ ] **Step 3: Implement explicit configuration guards**

```ts
export function hasSupabaseConfig() {
  return Boolean(
    process.env.NEXT_PUBLIC_SUPABASE_URL &&
    process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY,
  )
}

export function createClient() {
  if (!hasSupabaseConfig()) return null
  return createBrowserClient(
    process.env.NEXT_PUBLIC_SUPABASE_URL!,
    process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!,
  )
}
```

Apply the same guard in `server.ts`, then update every caller to handle `null`. `AuthForm` must show `로컬 인증 설정이 필요합니다.` and disable submit; `mypage` must redirect to `/login?setup=required`. In `getAdminMasterKey`, throw during production when `ADMIN_MASTER_KEY` is absent and allow `master` only outside production.

- [ ] **Step 4: Verify the original failure is gone**

Run: `npm test -- src/lib/supabase/config.test.ts && npm run lint && npm run build`

Expected: tests pass, lint has no warnings, and all routes are generated without a Supabase prerender exception.

- [ ] **Step 5: Commit**

```bash
git add src/lib/supabase src/components/auth/AuthForm.tsx src/app/mypage/page.tsx src/lib/admin-auth.ts
git commit -m "fix: support builds without Supabase credentials"
```

### Task 2: Open Every Exam Round and Save Member Learning History

**Files:**
- Modify: `src/lib/data.ts`
- Create: `src/lib/attempts.ts`
- Create: `src/lib/attempts.test.ts`
- Create: `src/app/exam/[slug]/rounds/page.tsx`
- Create: `src/app/exam/[slug]/rounds/[year]/[round]/page.tsx`
- Create: `src/components/quiz/RoundPractice.tsx`
- Create: `src/components/quiz/RoundPractice.test.tsx`
- Create: `src/components/quiz/QuestionPractice.tsx`
- Create: `src/components/quiz/QuestionPractice.test.tsx`
- Create: `src/app/exam/[slug]/questions/[id]/actions.ts`
- Modify: `src/app/exam/[slug]/questions/[id]/page.tsx`
- Modify: `src/app/quiz/daily/page.tsx`
- Create: `src/app/mypage/history/page.tsx`
- Create: `src/app/mypage/wrong-answers/page.tsx`
- Create: `src/app/mypage/bookmarks/page.tsx`
- Modify: `src/app/mypage/page.tsx`
- Modify: `supabase-setup.sql`

**Interfaces:**
- Consumes: `QuestionView` with zero-based `answer`.
- Produces: `getExamRounds(slug: string): Promise<ExamRoundView[]>`, `getRoundQuestions(slug: string, year: number, round: number): Promise<QuestionView[]>`, `saveAttempt(input: { requestId: string; questionId: string; selectedIndex: number }): Promise<{ saved: boolean; reason?: 'anonymous' | 'session-expired' | 'storage-error' }>`, `getRoundProgress(userId: string, slug: string, year: number, round: number): Promise<RoundProgressView>`, and `toggleQuestionBookmark(questionId: string): Promise<{ bookmarked: boolean; reason?: 'anonymous' }>`.

- [ ] **Step 1: Write guest-access and answer-reveal tests**

```tsx
it('lets a guest submit and read the explanation without saving', async () => {
  const saveAttempt = vi.fn()
  render(<QuestionPractice question={question} user={null} saveAttempt={saveAttempt} />)
  expect(screen.queryByText('정답 해설')).not.toBeInTheDocument()
  await user.click(screen.getByRole('radio', { name: '3 유스케이스 다이어그램' }))
  await user.click(screen.getByRole('button', { name: '정답 확인' }))
  expect(screen.getByText('정답입니다.')).toBeInTheDocument()
  expect(screen.getByText('정답 해설')).toBeInTheDocument()
  expect(screen.getByText('로그인하면 풀이 기록과 오답노트를 저장할 수 있어요')).toBeInTheDocument()
  expect(saveAttempt).not.toHaveBeenCalled()
})

it('saves a signed-in member attempt after submission', async () => {
  const saveAttempt = vi.fn().mockResolvedValue({ saved: true })
  render(<QuestionPractice question={question} user={{ id: 'user-1' }} saveAttempt={saveAttempt} />)
  await user.click(screen.getByRole('radio', { name: '3 유스케이스 다이어그램' }))
  await user.click(screen.getByRole('button', { name: '정답 확인' }))
  expect(saveAttempt).toHaveBeenCalledWith(expect.objectContaining({
    questionId: 'q-001',
    selectedIndex: 2,
  }))
})
```

- [ ] **Step 2: Confirm the guest and member tests fail against the current static markup**

Run: `npm test -- src/components/quiz/QuestionPractice.test.tsx`

Expected: FAIL because selectable controls, guest save prompts, and member attempt persistence do not exist.

- [ ] **Step 3: Add the complete exam-round query boundary**

```ts
export type ExamRoundView = {
  examSlug: string
  year: number
  round: number
  questionCount: number
}

export async function getRoundQuestions(
  slug: string,
  year: number,
  round: number,
): Promise<QuestionView[]> {
  const questions = await getQuestionsByExam(slug)
  return questions
    .filter((question) => question.year === year && question.round === round)
    .sort((a, b) => a.number - b.number)
}
```

Group every published question by `year` and `round` in `getExamRounds`. The round-selection page must list every group returned by the data source instead of maintaining a hard-coded release list.

- [ ] **Step 4: Test complete round discovery and ordering**

```ts
it('groups every published question into a year and round', async () => {
  const rounds = groupExamRounds([
    question({ year: 2024, round: 2, number: 2 }),
    question({ year: 2023, round: 1, number: 1 }),
    question({ year: 2024, round: 2, number: 1 }),
  ])
  expect(rounds).toEqual([
    { year: 2024, round: 2, questionCount: 2 },
    { year: 2023, round: 1, questionCount: 1 },
  ])
})
```

Run: `npm test -- src/lib/attempts.test.ts src/components/quiz/RoundPractice.test.tsx`

Expected: PASS with every available year/round listed and questions ordered by their exam number.

- [ ] **Step 5: Add member-only attempt storage**

Add this table and policy shape to `supabase-setup.sql`:

```sql
CREATE TABLE question_attempts (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  request_id UUID NOT NULL UNIQUE,
  user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  question_id UUID NOT NULL REFERENCES questions(id) ON DELETE CASCADE,
  exam_year INT NOT NULL,
  exam_round INT NOT NULL,
  selected_number INT NOT NULL CHECK (selected_number BETWEEN 1 AND 4),
  is_correct BOOLEAN NOT NULL,
  attempted_at TIMESTAMPTZ DEFAULT NOW()
);
ALTER TABLE question_attempts ENABLE ROW LEVEL SECURITY;
CREATE POLICY "attempts_own" ON question_attempts
  FOR ALL USING (auth.uid() = user_id) WITH CHECK (auth.uid() = user_id);
```

`saveAttempt` must authenticate on the server, load the correct choice from `choices`, calculate `is_correct` without trusting the browser, and insert using `request_id` for idempotency. Anonymous submissions return `{ saved: false, reason: 'anonymous' }` without writing an attempt, cookie, local storage item, or anonymous identifier.

- [ ] **Step 6: Implement round practice, result, and continuation behavior**

`RoundPractice` must keep guest selections only in React memory, show current position, allow answer submission and explanation viewing, and calculate the current session result. Members receive saved progress from the server and can continue at the first question without a latest attempt. Guest refresh must start a new session with no restored results.

- [ ] **Step 7: Build latest-result history, wrong answers, and bookmarks**

Use a window query ordered by `attempted_at DESC` to select the latest attempt for each `(user_id, question_id)`. `/mypage/wrong-answers` lists only questions whose latest attempt is incorrect; a later correct attempt removes the question from that view. `/mypage/history` groups attempts by exam, year, and round. `/mypage/bookmarks` uses the existing `bookmarks` table with `target_type = 'question'`.

- [ ] **Step 8: Verify public access, member persistence, and data isolation**

Run: `npm test -- src/lib/attempts.test.ts src/components/quiz/QuestionPractice.test.tsx src/components/quiz/RoundPractice.test.tsx && npm run build`

Expected: guests can access and complete every available round without network persistence; members restore progress and see latest-result wrong answers; cross-user attempt access is rejected; `/quiz/daily`, `/exam/jeongchogi/rounds`, `/exam/jeongchogi/rounds/2023/2`, and `/exam/jeongchogi/questions/q-001` build.

- [ ] **Step 9: Commit**

```bash
git add src/lib src/components/quiz src/app/quiz src/app/exam src/app/mypage supabase-setup.sql
git commit -m "feat: open all exam rounds and save member history"
```

### Task 3: Complete Resource Delivery and Define the Paid Boundary

**Files:**
- Modify: `src/lib/data.ts`
- Modify: `src/types/index.ts`
- Create: `src/app/resources/[id]/actions.ts`
- Create: `src/components/resources/ResourceAccessButton.tsx`
- Create: `src/components/resources/ResourceAccessButton.test.tsx`
- Modify: `src/app/resources/[id]/page.tsx`
- Modify: `supabase-setup.sql`

**Interfaces:**
- Produces: `getResourceDownloadUrl(resourceId: string): Promise<{ url?: string; reason?: 'login' | 'unavailable' | 'forbidden' }>`.
- Consumes: authenticated user, `resources.file_url`, price, and `download_grants`.

- [ ] **Step 1: Test free, paid-unavailable, and signed-out states**

```tsx
it.each([
  [{ price: 0, configured: true, signedIn: true }, '무료 PDF 받기'],
  [{ price: 4900, configured: true, signedIn: true }, '구매 기능 준비 중'],
  [{ price: 0, configured: true, signedIn: false }, '로그인하고 받기'],
])('renders the correct access action', (state, label) => {
  render(<ResourceAccessButton resourceId="1" {...state} />)
  expect(screen.getByRole('button', { name: label })).toBeInTheDocument()
})
```

- [ ] **Step 2: Confirm the test fails before the component exists**

Run: `npm test -- src/components/resources/ResourceAccessButton.test.tsx`

Expected: FAIL because resource access is currently a link back to signup or the resource list.

- [ ] **Step 3: Implement secure free delivery**

Read `file_url`, `preview_url`, and page count in `data.ts`. In the Server Action, require a user, verify `price === 0` or a matching `download_grants` row, and create a 60-second Supabase Storage signed URL. Keep paid resources explicitly disabled until a payment provider and webhook are selected; do not simulate a purchase.

- [ ] **Step 4: Verify access rules**

Run: `npm test -- src/components/resources/ResourceAccessButton.test.tsx && npm run build`

Expected: free signed-in access returns a signed URL, signed-out access requests login, and paid access cannot grant a file.

- [ ] **Step 5: Commit**

```bash
git add src/lib/data.ts src/types/index.ts src/app/resources src/components/resources supabase-setup.sql
git commit -m "feat: deliver authorized free resources"
```

### Task 4: Remove Dead Navigation and Add Failure States

**Files:**
- Modify: `src/app/page.tsx`
- Modify: `src/components/layout/Footer.tsx`
- Modify: `src/components/layout/Header.tsx`
- Create: `src/app/not-found.tsx`
- Create: `src/app/error.tsx`
- Create: `src/app/loading.tsx`
- Create: `src/app/exam/[slug]/loading.tsx`

**Interfaces:**
- Produces: valid internal destinations only; accessible global 404, error, and loading states.
- Consumes: the currently implemented `/exam`, `/resources`, `/quiz/daily`, `/login`, and `/signup` routes.

- [ ] **Step 1: Add a source-level navigation assertion**

```ts
it('does not ship placeholder anchors', () => {
  const links = Array.from(document.querySelectorAll('a'))
  expect(links.filter((link) => link.getAttribute('href') === '#')).toHaveLength(0)
})
```

- [ ] **Step 2: Replace every `href="#"` and remove the unused `BookOpen` import**

Map `공지사항` to `/exam/jeongchogi`, `합격후기` to `/resources`, and render 이용약관/개인정보처리방침 as non-links until real policy routes are written. Add branded, keyboard-accessible error and not-found pages with links to `/` and `/exam`.

- [ ] **Step 3: Verify invalid and valid detail URLs**

Run: `npm run lint && npm run build`

Expected: zero lint warnings; `/exam/jeongchogi/questions/q-001` renders content; `/exam/jeongchogi/questions/1` and `/resources/unknown` render the branded 404.

- [ ] **Step 4: Commit**

```bash
git add src/app src/components/layout
git commit -m "fix: complete navigation and route failure states"
```

### Task 5: Add Repeatable Release Verification and Documentation

**Files:**
- Modify: `package.json`
- Create: `vitest.config.ts`
- Create: `src/test/setup.ts`
- Create: `playwright.config.ts`
- Create: `tests/e2e/mvp.spec.ts`
- Modify: `README.md`

**Interfaces:**
- Produces: `npm test`, `npm run test:e2e`, and `npm run check`.
- Consumes: a local server started by Playwright and optional Supabase environment variables.

- [ ] **Step 1: Add deterministic scripts**

```json
{
  "scripts": {
    "test": "vitest run",
    "test:e2e": "playwright test",
    "check": "npm run lint && npm test && npm run build"
  }
}
```

- [ ] **Step 2: Add the MVP smoke suite**

```ts
test('public learning journey works without Supabase', async ({ page }) => {
  await page.goto('/')
  await expect(page.getByRole('heading', { level: 1 })).toBeVisible()
  await page.goto('/exam/jeongchogi/questions/q-001')
  await expect(page.getByRole('button', { name: '정답 확인' })).toBeVisible()
  await page.goto('/login')
  await expect(page.getByText('로컬 인증 설정이 필요합니다.')).toBeVisible()
})
```

- [ ] **Step 3: Document setup and product boundaries**

README must list `NEXT_PUBLIC_SUPABASE_URL`, `NEXT_PUBLIC_SUPABASE_ANON_KEY`, and `ADMIN_MASTER_KEY`; describe mock-only public mode; give `supabase-setup.sql` application steps; and state that paid checkout, blog, reviews, premium, editable wrong-answer memos, mock exams, and study plans are outside the current MVP.

- [ ] **Step 4: Run the full release gate**

Run: `npm run check && npm run test:e2e && npm audit --audit-level=high`

Expected: lint has zero warnings, all unit and browser tests pass, production build succeeds, and audit reports zero high or critical vulnerabilities.

- [ ] **Step 5: Commit**

```bash
git add package.json package-lock.json vitest.config.ts playwright.config.ts src/test tests README.md
git commit -m "test: add ABUBAE MVP release gate"
```

## Deferred Product Work

Create separate specifications after the MVP release gate passes for payment checkout and webhooks, `/blog`, `/reviews`, `/premium`, editable wrong-answer memos, `/quiz/mock`, `/mypage/study-plan`, and a full Admin CMS. Each subsystem requires its own data model, authorization rules, analytics events, and acceptance tests; combining them into the reliability work above would prevent an independently releasable MVP.
