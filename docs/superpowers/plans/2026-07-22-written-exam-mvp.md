# Information Processing Engineer Written Exam MVP Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Deliver a guest-accessible Information Processing Engineer written-exam experience with 2021 rounds 1-3 imported from the licensed PDFs, batch grading, results, and newly authored ABUBAE explanations.

**Architecture:** Build and validate a deterministic JSON content package before importing it into Supabase. Public pages read published round and question rows through the existing server data boundary, with the JSON package as a build-safe fallback. A client-side round runner owns temporary answers and batch grading without storing guest history.

**Tech Stack:** Next.js 16.2 App Router, React 19.2, TypeScript 5, Supabase Postgres/SSR, Vitest, Testing Library, Playwright, Python with pypdf

## Global Constraints

- Current launch content is 2021 rounds 1-3; 2022-2025 require separately supplied licensed source files.
- All written-exam pages work without login.
- Guest answers and results are never persisted in cookies, browser storage, or Supabase.
- Answers and explanations are absent from the pre-submission rendered UI.
- Only `reviewed: true` and `published: true` questions are served.
- Original PDF branding, artwork, layout, watermarks, and explanation text are not copied.
- ABUBAE explanations are newly authored and follow the approved five-part explanation format.
- Source PDFs remain unchanged in `C:/Users/IOI/Downloads/2021년_정보처리기사_필기/`.

---

## File Structure

- Modify `package.json` and `package-lock.json`: add test commands and dependencies.
- Create `vitest.config.ts` and `src/test/setup.ts`: configure unit and component tests.
- Create `scripts/extract-written-exam.py`: extract candidate question blocks from PDFs.
- Create `scripts/validate-written-exam.mjs`: reject incomplete or inconsistent content.
- Create `content/written/jeongchogi/2021-{1,2,3}.json`: reviewed source packages.
- Create `content/written/schema.ts`: TypeScript content contracts and validators.
- Modify `supabase-setup.sql`: add written exam round/question fields and public-read policies.
- Create `supabase-written-2021-seed.sql`: idempotent 2021 round/question/choice seed.
- Modify `src/lib/data.ts`: expose round discovery and complete round question queries.
- Create `src/lib/written-exam.ts`: scoring, progress, and result functions.
- Create `src/components/quiz/WrittenRoundRunner.tsx`: temporary guest answer state and navigation.
- Create `src/components/quiz/SubmitRoundDialog.tsx`: unanswered-question warning.
- Create `src/components/quiz/WrittenRoundResult.tsx`: aggregate and per-question results.
- Create `src/app/exam/[slug]/written/page.tsx`: year/round selection.
- Create `src/app/exam/[slug]/written/[year]/[round]/page.tsx`: round runner route.
- Modify `src/app/exam/[slug]/page.tsx`: link to the written-exam route.
- Create `tests/e2e/written-exam.spec.ts`: browser-level learning flow.
- Modify `README.md`: setup, import, and verification instructions.

### Task 1: Establish the Test and Content Validation Gate

**Files:**
- Modify: `package.json`
- Modify: `package-lock.json`
- Create: `vitest.config.ts`
- Create: `src/test/setup.ts`
- Create: `content/written/schema.ts`
- Create: `content/written/schema.test.ts`

**Interfaces:**
- Produces: `validateWrittenRound(input: unknown): WrittenRoundContent`.
- Consumes: raw JSON parsed from `content/written/jeongchogi/*.json`.

- [ ] **Step 1: Install the test dependencies**

Run: `npm install -D vitest jsdom @testing-library/react @testing-library/jest-dom @testing-library/user-event @playwright/test`

Expected: dependencies are added to `package.json` and `package-lock.json` without removing existing packages.

- [ ] **Step 2: Add deterministic test scripts**

```json
{
  "scripts": {
    "test": "vitest run",
    "test:watch": "vitest",
    "test:e2e": "playwright test",
    "validate:content": "node scripts/validate-written-exam.mjs",
    "check": "npm run lint && npm test && npm run validate:content && npm run build"
  }
}
```

- [ ] **Step 3: Write a failing content-contract test**

```ts
it('rejects a question without exactly four choices', () => {
  expect(() => validateWrittenRound({
    examSlug: 'jeongchogi',
    examType: 'written',
    year: 2021,
    round: 1,
    questions: [{ number: 1, choices: ['a', 'b', 'c'] }],
  })).toThrow('question 1 must have exactly four choices')
})
```

- [ ] **Step 4: Run the test and verify RED**

Run: `npm test -- content/written/schema.test.ts`

Expected: FAIL because `validateWrittenRound` does not exist.

- [ ] **Step 5: Implement the minimal content contract**

```ts
export type WrittenExplanation = {
  summary: string
  choiceNotes: [string, string, string, string]
  keyPoint: string
  memoryTip?: string
}

export type WrittenQuestionContent = {
  id: string
  subject: string
  number: number
  content: string
  choices: [string, string, string, string]
  answerIndex: 0 | 1 | 2 | 3
  explanation: WrittenExplanation
  reviewed: boolean
  published: boolean
  asset?: { src: string; alt: string }
}
```

`validateWrittenRound` must validate the exam identity, positive year and round, unique sequential problem numbers, four non-empty choices, answer range 0-3, complete explanation fields, and asset alt text.

- [ ] **Step 6: Run the test and verify GREEN**

Run: `npm test -- content/written/schema.test.ts`

Expected: PASS with malformed choices, duplicate numbers, invalid answers, and missing explanations rejected.

- [ ] **Step 7: Commit**

```bash
git add package.json package-lock.json vitest.config.ts src/test content/written
git commit -m "test: add written exam content validation"
```

### Task 2: Extract and Review the 2021 PDF Question Data

**Files:**
- Create: `scripts/extract-written-exam.py`
- Create: `scripts/extract-written-exam.test.py`
- Create: `scripts/validate-written-exam.mjs`
- Create: `content/written/jeongchogi/2021-1.json`
- Create: `content/written/jeongchogi/2021-2.json`
- Create: `content/written/jeongchogi/2021-3.json`
- Create: `docs/content-review/2021-written-review.md`
- Create: `public/images/questions/jeongchogi/written/2021/.gitkeep`

**Interfaces:**
- Consumes: the three approved PDF paths listed in Global Constraints.
- Produces: UTF-8 JSON matching `WrittenRoundContent` and a review report listing every uncertain extraction.

- [ ] **Step 1: Write parser fixture tests before the extractor**

```py
def test_extracts_number_stem_and_four_choices():
    page_text = "1. 미들웨어에 대한 설명은? ① 보기A ② 보기B ③ 보기C ④ 보기D"
    questions = extract_questions(page_text)
    assert questions[0]["number"] == 1
    assert questions[0]["choices"] == ["보기A", "보기B", "보기C", "보기D"]
```

- [ ] **Step 2: Run the parser fixture and verify RED**

Run: `python -m unittest scripts/extract-written-exam.test.py`

Expected: FAIL because `extract_questions` does not exist.

- [ ] **Step 3: Implement candidate extraction without publishing**

The extractor must use `pypdf`, normalize circled choice markers, preserve Korean and code text, detect subject headings, and mark uncertain page splits with `reviewed: false` and `published: false`. It must never invent a missing choice or answer.

- [ ] **Step 4: Extract the three rounds**

Run: `python scripts/extract-written-exam.py --input "C:/Users/IOI/Downloads/2021년_정보처리기사_필기" --output content/written/jeongchogi`

Expected: three JSON files plus a report showing page count, extracted question count, missing numbers, and questions requiring visual review.

- [ ] **Step 5: Review every question against the rendered PDF**

For each round, confirm problem text, four choices, subject, answer, and any diagram. Record each confirmation in `docs/content-review/2021-written-review.md` using one row per question. A round cannot be published until all expected question numbers are accounted for.

- [ ] **Step 6: Author the ABUBAE explanations**

For each reviewed question, write a new `summary`, four `choiceNotes`, `keyPoint`, and optional `memoryTip`. Do not copy the PDF explanation. Set `reviewed` and `published` to `true` only after factual review.

- [ ] **Step 7: Validate all three content packages**

Run: `npm run validate:content`

Expected: PASS with 2021 rounds 1-3 accepted, zero duplicate IDs, zero missing choices, zero invalid answers, and zero published questions lacking an ABUBAE explanation.

- [ ] **Step 8: Commit**

```bash
git add scripts content/written docs/content-review public/images/questions
git commit -m "content: add reviewed 2021 written exam rounds"
```

### Task 3: Add the Supabase Written-Exam Schema and Seed

**Files:**
- Modify: `supabase-setup.sql`
- Create: `supabase-written-2021-seed.sql`
- Create: `scripts/generate-written-seed.mjs`
- Create: `scripts/generate-written-seed.test.ts`

**Interfaces:**
- Consumes: validated 2021 JSON content.
- Produces: idempotent SQL for `exam_rounds`, `questions`, and `choices`.

- [ ] **Step 1: Test deterministic SQL generation**

```ts
it('generates an idempotent round and question upsert', () => {
  const sql = generateWrittenSeed(roundFixture)
  expect(sql).toContain('ON CONFLICT (exam_id, exam_type, year, round) DO UPDATE')
  expect(sql).toContain("'jeongchogi-written-2021-1-001'")
})
```

- [ ] **Step 2: Run the generator test and verify RED**

Run: `npm test -- scripts/generate-written-seed.test.ts`

Expected: FAIL because `generateWrittenSeed` does not exist.

- [ ] **Step 3: Extend the database schema**

Add `exam_rounds` with a unique `(exam_id, exam_type, year, round)` key. Add stable `content_id`, `exam_type`, `reviewed`, and `published` fields to questions. Add public SELECT policies that require both flags. Keep all anonymous INSERT, UPDATE, and DELETE operations denied.

- [ ] **Step 4: Generate the idempotent seed**

Run: `node scripts/generate-written-seed.mjs content/written/jeongchogi supabase-written-2021-seed.sql`

Expected: the SQL upserts three rounds, questions, and four choices per question without embedding PDF images or credentials.

- [ ] **Step 5: Verify the SQL locally**

Run: `npm test -- scripts/generate-written-seed.test.ts && npm run validate:content`

Expected: PASS and repeated SQL generation produces a byte-identical file.

- [ ] **Step 6: Commit**

```bash
git add supabase-setup.sql supabase-written-2021-seed.sql scripts/generate-written-seed.mjs scripts/generate-written-seed.test.ts
git commit -m "feat: add written exam database seed"
```

### Task 4: Implement Round Discovery and Batch Scoring

**Files:**
- Modify: `src/lib/data.ts`
- Create: `src/lib/written-exam.ts`
- Create: `src/lib/written-exam.test.ts`

**Interfaces:**
- Produces: `getWrittenRounds(slug: string)`, `getWrittenRound(slug: string, year: number, round: number)`, and `gradeWrittenRound(questions, answers)`.
- Consumes: published Supabase rows or validated JSON fallback packages.

- [ ] **Step 1: Write failing scoring tests**

```ts
it('counts unanswered questions as incorrect', () => {
  const result = gradeWrittenRound(questions, { 'q-1': 0 })
  expect(result).toMatchObject({ total: 2, correct: 1, incorrect: 1, unanswered: 1, score: 50 })
})
```

- [ ] **Step 2: Run the tests and verify RED**

Run: `npm test -- src/lib/written-exam.test.ts`

Expected: FAIL because the written-exam query and grading functions do not exist.

- [ ] **Step 3: Implement the pure grading boundary**

Return totals, rounded score, unanswered IDs, per-subject totals, and per-question selected/correct values. Do not read authentication or storage APIs in this module.

- [ ] **Step 4: Implement Supabase-first queries with JSON fallback**

When Supabase is configured, read only published and reviewed rounds/questions. If configuration or tables are unavailable, load the validated bundled JSON. Never merge the two sources in one response.

- [ ] **Step 5: Run data and scoring tests**

Run: `npm test -- src/lib/written-exam.test.ts && npm run validate:content`

Expected: PASS for unanswered scoring, subject totals, sorted rounds, invalid round lookup, and fallback behavior.

- [ ] **Step 6: Commit**

```bash
git add src/lib
git commit -m "feat: add written exam data and grading"
```

### Task 5: Build the Guest Written-Exam Experience

**Files:**
- Create: `src/components/quiz/WrittenRoundRunner.tsx`
- Create: `src/components/quiz/WrittenRoundRunner.test.tsx`
- Create: `src/components/quiz/SubmitRoundDialog.tsx`
- Create: `src/components/quiz/WrittenRoundResult.tsx`
- Create: `src/app/exam/[slug]/written/page.tsx`
- Create: `src/app/exam/[slug]/written/[year]/[round]/page.tsx`
- Modify: `src/app/exam/[slug]/page.tsx`

**Interfaces:**
- Consumes: a complete public `WrittenRoundContent` without user state.
- Produces: answer navigation, unanswered warning, immutable submitted result, filters, and reset.

- [ ] **Step 1: Write the guest flow component test**

```tsx
it('warns about unanswered questions and grades after confirmation', async () => {
  render(<WrittenRoundRunner round={roundFixture} />)
  await user.click(screen.getByLabelText('1번 선택지 1'))
  await user.click(screen.getByRole('button', { name: '최종 제출' }))
  expect(screen.getByText('미응답 1문제: 2번')).toBeInTheDocument()
  await user.click(screen.getByRole('button', { name: '미응답을 오답 처리하고 제출' }))
  expect(screen.getByText('50점')).toBeInTheDocument()
})
```

- [ ] **Step 2: Run the test and verify RED**

Run: `npm test -- src/components/quiz/WrittenRoundRunner.test.tsx`

Expected: FAIL because the round runner does not exist.

- [ ] **Step 3: Implement answer navigation and submission**

Keep answers in `useState`; provide previous, next, and numbered navigation; identify unanswered questions; freeze answers after confirmation; and render `WrittenRoundResult`. Do not use Supabase mutation APIs or browser storage.

- [ ] **Step 4: Implement the routes and metadata**

The round-selection route lists available rounds by year. The runner route validates numeric params, calls `notFound()` for unavailable rounds, and renders the client runner. Link the existing exam hub to `/exam/jeongchogi/written`.

- [ ] **Step 5: Verify component and route builds**

Run: `npm test -- src/components/quiz/WrittenRoundRunner.test.tsx && npm run build`

Expected: PASS; submission reveals results only after confirmation; invalid rounds are 404; the production build succeeds without login.

- [ ] **Step 6: Commit**

```bash
git add src/components/quiz src/app/exam
git commit -m "feat: add guest written exam runner"
```

### Task 6: Verify the Complete 2021 Learning Journey

**Files:**
- Create: `playwright.config.ts`
- Create: `tests/e2e/written-exam.spec.ts`
- Modify: `README.md`
- Modify: `src/components/layout/Header.tsx`

**Interfaces:**
- Produces: a reproducible release gate for content, browser behavior, and builds.
- Consumes: the local Next.js server and bundled 2021 content fallback.

- [ ] **Step 1: Write the browser smoke test**

```ts
test('guest completes a 2021 written round', async ({ page }) => {
  await page.goto('/exam/jeongchogi/written')
  await page.getByRole('link', { name: '2021년 1회 풀기' }).click()
  await expect(page.getByText('정답 해설')).toHaveCount(0)
  await page.getByLabel('1번 선택지 1').check()
  await page.getByRole('button', { name: '최종 제출' }).click()
  await page.getByRole('button', { name: '미응답을 오답 처리하고 제출' }).click()
  await expect(page.getByText('이 결과는 저장되지 않습니다')).toBeVisible()
})
```

- [ ] **Step 2: Remove the existing lint warning**

Delete the unused `BookOpen` import from `src/components/layout/Header.tsx`.

- [ ] **Step 3: Document the operator workflow**

README must document the current 2021 content scope, licensed-source handling, extraction command, review gate, Supabase schema and seed execution order, local fallback, test commands, and the requirement to supply licensed 2022-2025 source files.

- [ ] **Step 4: Run the complete release gate**

Run: `npm run check && npm run test:e2e && npm audit --audit-level=high`

Expected: zero lint warnings, all unit/component/browser tests pass, all content packages validate, production build succeeds, and audit reports zero high or critical vulnerabilities.

- [ ] **Step 5: Commit**

```bash
git add playwright.config.ts tests README.md src/components/layout/Header.tsx
git commit -m "test: verify written exam MVP journey"
```

## Content Expansion After the Initial Release

For each licensed 2022-2025 source set, run the same Task 2 extraction, visual review, ABUBAE explanation authoring, validation, and seed generation process. Do not display an empty year or fabricate a missing round while source material is unavailable.

