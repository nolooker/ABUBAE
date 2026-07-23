# Master Inline Question Editing Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Supabase Master 계정이 필기 문제풀이 화면에서 질문·보기·복수 정답·해설을 수정하고 저장 즉시 공개 풀이와 채점에 반영되게 한다.

**Architecture:** Supabase PostgreSQL을 문제의 단일 원본으로 전환하고 서버 전용 저장소 계층이 공개 조회, 채점 조회, Master 편집을 분리한다. Supabase Auth 사용자와 `public.users.role`을 결합해 서버와 RLS에서 권한을 이중 검증하며, 편집 API는 RPC 트랜잭션으로 질문과 보기 4개를 원자적으로 갱신한다.

**Tech Stack:** Next.js 16 App Router, React 19, TypeScript, Supabase Auth/PostgreSQL/RLS/RPC, Vitest, Testing Library

## Global Constraints

- 일반 회원과 Master는 동일한 Supabase Auth 로그인을 사용한다.
- 역할은 서버 관리 `public.users.role`의 `user | master`만 허용하며 기본값은 `user`다.
- Master만 질문, 보기 4개, 단일·복수 정답, 해설을 수정한다.
- 저장은 승인 단계 없이 즉시 반영하되 `updated_at` 충돌 검사를 수행한다.
- 공개 문제 응답에는 제출 전 정답을 포함하지 않는다.
- 브라우저의 `questions`, `choices` 직접 조회를 허용하지 않으며 공개 문제는 서버 API/Server Component를 통해서만 제공한다.
- 공개 조회와 채점용 DB 접근은 브라우저에 노출되지 않는 `SUPABASE_SERVICE_ROLE_KEY`를 사용한다.
- 질문과 보기 저장은 하나의 DB 트랜잭션이며 부분 성공을 허용하지 않는다.
- 서비스 역할 키를 브라우저에 전달하지 않는다.
- 기존 미커밋 `src/app/page.tsx` 변경을 스테이징하거나 덮어쓰지 않는다.

---

### Task 1: 역할·문제 스키마와 RLS 마이그레이션

**Files:**
- Create: `supabase/migrations/202607230001_master_question_editing.sql`
- Modify: `supabase-setup.sql`
- Create: `supabase/migrations/master-question-editing.test.ts`

**Interfaces:**
- Produces: `public.users.role`, 확장된 `questions`, 문제별 고유한 `choices`, `public.is_master()`, `public.update_written_question(...)`
- Consumes: 기존 `auth.users`, `public.users`, `questions`, `choices`

- [ ] **Step 1: 마이그레이션 계약 실패 테스트 작성**

```ts
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
```

- [ ] **Step 2: 테스트가 마이그레이션 파일 부재로 실패하는지 확인**

Run: `npm test -- supabase/migrations/master-question-editing.test.ts`
Expected: FAIL with `ENOENT`.

- [ ] **Step 3: 마이그레이션과 재실행 가능한 setup SQL 작성**

마이그레이션에는 아래 계약을 완전한 SQL로 작성한다.

```sql
CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA extensions;

ALTER TABLE public.users
  ADD COLUMN IF NOT EXISTS role TEXT NOT NULL DEFAULT 'user'
  CHECK (role IN ('user', 'master'));

ALTER TABLE public.questions
  ADD COLUMN IF NOT EXISTS exam_type TEXT NOT NULL DEFAULT 'written',
  ADD COLUMN IF NOT EXISTS reviewed BOOLEAN NOT NULL DEFAULT FALSE,
  ADD COLUMN IF NOT EXISTS published BOOLEAN NOT NULL DEFAULT FALSE,
  ADD COLUMN IF NOT EXISTS updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  ADD COLUMN IF NOT EXISTS updated_by UUID REFERENCES public.users(id);

CREATE UNIQUE INDEX IF NOT EXISTS questions_round_number_unique
  ON public.questions(exam_id, exam_type, year, round, number);
CREATE UNIQUE INDEX IF NOT EXISTS choices_question_number_unique
  ON public.choices(question_id, number);

CREATE OR REPLACE FUNCTION public.is_master()
RETURNS BOOLEAN LANGUAGE sql STABLE SECURITY DEFINER SET search_path = public AS $$
  SELECT EXISTS (
    SELECT 1 FROM public.users
    WHERE id = auth.uid() AND role = 'master'
  );
$$;

DROP POLICY IF EXISTS users_select_own ON public.users;
DROP POLICY IF EXISTS users_update_own ON public.users;
CREATE POLICY users_select_own ON public.users FOR SELECT USING (auth.uid() = id);
DROP POLICY IF EXISTS questions_public_read ON public.questions;
DROP POLICY IF EXISTS choices_public_read ON public.choices;
CREATE POLICY questions_master_select ON public.questions FOR SELECT USING (public.is_master());
CREATE POLICY choices_master_select ON public.choices FOR SELECT USING (public.is_master());
CREATE POLICY questions_master_update ON public.questions FOR UPDATE
  USING (public.is_master()) WITH CHECK (public.is_master());
CREATE POLICY choices_master_update ON public.choices FOR UPDATE
  USING (public.is_master()) WITH CHECK (public.is_master());
```

`update_written_question`은 `p_question_id uuid`, `p_content text`, `p_choices text[]`, `p_correct_numbers int[]`, `p_explanation text`, `p_expected_updated_at timestamptz`를 받고 Master 확인, 4개 보기·1개 이상 정답 검증, stale 검사, 질문/선택지 갱신, 수정된 행 반환을 한 함수에서 수행한다. `supabase-setup.sql`에도 신규 설치용 동일 최종 스키마를 반영한다.

- [ ] **Step 4: SQL 계약 테스트 통과 확인**

Run: `npm test -- supabase/migrations/master-question-editing.test.ts`
Expected: 2 tests PASS.

- [ ] **Step 5: 커밋**

```powershell
git add supabase/migrations/202607230001_master_question_editing.sql supabase/migrations/master-question-editing.test.ts supabase-setup.sql
git commit -m "feat: add master question schema"
```

---

### Task 2: 300문항 Supabase 시드 생성기

**Files:**
- Create: `scripts/generate-written-seed.mjs`
- Create: `scripts/generate-written-seed.test.ts`
- Create: `supabase/seeds/2021-written.sql`
- Modify: `scripts/validate-written-exam.mjs`
- Modify: `scripts/validate-written-exam.test.ts`
- Modify: `package.json`

**Interfaces:**
- Produces: `npm run seed:written`, 안정적인 UUID와 300문항/1,200선택지 SQL
- Consumes: `content/written/jeongchogi/*.candidates.json`, 시험 slug `jeongchogi`

- [ ] **Step 1: 시드 변환 실패 테스트 작성**

```ts
import { describe, expect, it } from 'vitest'
import { renderWrittenSeed } from './generate-written-seed.mjs'

describe('renderWrittenSeed', () => {
  it('renders one question, four choices, multiple answers, and review flags', () => {
    const sql = renderWrittenSeed({ year: 2021, round: 1, title: 'test', questions: [{
      id: '2021-1-1', number: 1, subject: '설계', content: "질문 'A'", choices: ['가', '나', '다', '라'],
      acceptedAnswerIndexes: [1, 3], explanation: null, reviewed: false, published: false,
    }] })
    expect(sql).toContain("'written', 2021, 1, '설계', 1")
    expect(sql.match(/is_correct/g)).toHaveLength(4)
    expect(sql).toContain('TRUE')
    expect(sql).toContain('FALSE, TRUE')
  })
})
```

- [ ] **Step 2: 모듈 부재 실패 확인**

Run: `npm test -- scripts/generate-written-seed.test.ts`
Expected: FAIL resolving `generate-written-seed.mjs`.

- [ ] **Step 3: 결정적 시드 생성기 구현**

`renderWrittenSeed(round)`과 CLI `main()`을 export한다. SQL 문자열은 작은따옴표를 `''`로 escape하고 `uuid_generate_v5(uuid_ns_url(), 'abubae:written:<id>')`로 반복 실행 가능한 ID를 만든다. 기존 공개 경로의 접근성을 보존하기 위해 DB 시드는 `published = TRUE`, `reviewed = FALSE`로 생성한다. validator의 `published && !reviewed` 금지 규칙은 제거하고 두 플래그의 boolean 타입만 검사한다.

```json
{
  "scripts": {
    "seed:written": "node scripts/generate-written-seed.mjs",
    "validate:content": "node scripts/validate-written-exam.mjs"
  }
}
```

- [ ] **Step 4: 시드 생성·검증**

Run: `npm test -- scripts/generate-written-seed.test.ts scripts/validate-written-exam.test.ts`
Expected: all PASS.

Run: `npm run seed:written`
Expected: `generated 300 questions and 1200 choices` and `supabase/seeds/2021-written.sql` created.

- [ ] **Step 5: 커밋**

```powershell
git add scripts/generate-written-seed.mjs scripts/generate-written-seed.test.ts scripts/validate-written-exam.mjs scripts/validate-written-exam.test.ts supabase/seeds/2021-written.sql package.json
git commit -m "feat: generate written question seed"
```

---

### Task 3: Supabase 문제 저장소와 DB 기반 채점

**Files:**
- Create: `src/lib/supabase/service.ts`
- Modify: `src/lib/supabase/client.ts`
- Modify: `src/lib/supabase/server.ts`
- Create: `src/lib/written-question-repository.ts`
- Create: `src/lib/written-question-repository.test.ts`
- Modify: `src/lib/written-content.ts`
- Modify: `src/app/api/exam/jeongchogi/questions/written/[year]/[round]/grade/route.ts`
- Modify: `src/app/api/exam/jeongchogi/questions/written/[year]/[round]/grade/route.test.ts`
- Modify: `src/app/exam/[slug]/questions/written/[year]/[round]/page.tsx`

**Interfaces:**
- Produces: `getPublicWrittenRound(year, round)`, `gradeWrittenSubmission(year, round, answers)` 비동기 함수
- Consumes: `createServiceClient()` server-only client, 기존 `gradeWrittenRound`

- [ ] **Step 1: 저장소 매핑과 정답 은닉 실패 테스트 작성**

```ts
it('maps joined rows without exposing correctness publicly', async () => {
  const round = await repository.getPublicWrittenRound(2021, 1)
  expect(round?.questions[0]).toEqual({
    id: 'q1', number: 1, subject: '설계', content: '질문', choices: ['A', 'B', 'C', 'D'], updatedAt: '2026-07-23T00:00:00Z',
  })
  expect(round?.questions[0]).not.toHaveProperty('acceptedAnswerIndexes')
})

it('loads correct choices only inside grading', async () => {
  const result = await repository.gradeWrittenSubmission(2021, 1, { q1: 1 })
  expect(result?.correct).toBe(1)
})
```

- [ ] **Step 2: 새 모듈 부재 실패 확인**

Run: `npm test -- src/lib/written-question-repository.test.ts`
Expected: FAIL resolving repository.

- [ ] **Step 3: 의존성 주입 가능한 저장소 구현**

```ts
export type PublicWrittenQuestion = {
  id: string; number: number; subject: string; content: string; choices: string[]; updatedAt: string
}

export function createWrittenQuestionRepository(supabase: SupabaseClient) {
  return {
    async getPublicWrittenRound(year: number, round: number) {
      const { data, error } = await supabase
        .from('questions')
        .select('id,number,subject,content,updated_at,choices(number,content)')
        .eq('exam_type', 'written').eq('year', year).eq('round', round).eq('published', true)
        .order('number')
      if (error) throw new WrittenContentUnavailableError(error.message)
      if (!data?.length) return undefined
      return {
        year, round, title: `${year}년 ${round}회 정보처리기사 필기`,
        questions: data.map((row) => ({
          id: row.id, number: row.number, subject: row.subject, content: row.content,
          updatedAt: row.updated_at,
          choices: [...row.choices].sort((a, b) => a.number - b.number).map((choice) => choice.content),
        })),
      }
    },
    async gradeWrittenSubmission(year: number, round: number, answers: WrittenAnswers) {
      const { data, error } = await supabase
        .from('questions')
        .select('id,number,subject,choices(number,is_correct)')
        .eq('exam_type', 'written').eq('year', year).eq('round', round).eq('published', true)
        .order('number')
      if (error) throw new WrittenContentUnavailableError(error.message)
      if (!data?.length) return undefined
      return gradeWrittenRound(data.map((row) => ({
        id: row.id, number: row.number, subject: row.subject,
        acceptedAnswerIndexes: row.choices.filter((choice) => choice.is_correct).map((choice) => choice.number - 1),
      })), answers)
    },
  }
}
```

`src/lib/supabase/service.ts`에 `SUPABASE_SERVICE_ROLE_KEY`를 사용하는 `server-only` 클라이언트를 만들고 `written-content.ts`가 이를 저장소에 주입한다. 기존 browser/server Auth 클라이언트는 사용자가 제공한 `NEXT_PUBLIC_SUPABASE_PUBLISHABLE_KEY`를 사용하도록 변수명을 통일한다. 페이지와 grade route는 Promise를 `await`한다. DB 오류는 `WrittenContentUnavailableError`로 정규화하고 JSON fallback을 사용하지 않는다. 서비스 클라이언트 모듈은 Client Component에서 import할 수 없어야 한다.

- [ ] **Step 4: 저장소·route 테스트 통과 확인**

Run: `npm test -- src/lib/written-question-repository.test.ts "src/app/api/exam/jeongchogi/questions/written/[year]/[round]/grade/route.test.ts"`
Expected: all PASS.

- [ ] **Step 5: 커밋**

```powershell
git add src/lib/written-question-repository.ts src/lib/written-question-repository.test.ts src/lib/written-content.ts "src/app/api/exam/jeongchogi/questions/written/[year]/[round]/grade" "src/app/exam/[slug]/questions/written/[year]/[round]/page.tsx"
git commit -m "feat: read written questions from supabase"
```

---

### Task 4: Supabase Master 역할 검사와 기존 Admin 통합

**Files:**
- Create: `src/lib/master-auth.ts`
- Create: `src/lib/master-auth.test.ts`
- Modify: `src/app/admin/page.tsx`
- Delete: `src/lib/admin-auth.ts`
- Delete: `src/app/admin/login/actions.ts`
- Modify: `src/app/admin/login/page.tsx`
- Modify: `src/components/auth/AuthForm.tsx`

**Interfaces:**
- Produces: `getCurrentUserRole(): Promise<'anonymous' | 'user' | 'master'>`, `requireMaster()`
- Consumes: Supabase server `auth.getUser()`와 `users.role`

- [ ] **Step 1: 역할 검사 실패 테스트 작성**

```ts
function makeSupabase(user: { id: string } | null, role: string | null) {
  return {
    auth: { getUser: vi.fn().mockResolvedValue({ data: { user } }) },
    from: vi.fn().mockReturnValue({
      select: vi.fn().mockReturnValue({
        eq: vi.fn().mockReturnValue({ single: vi.fn().mockResolvedValue({ data: role ? { role } : null }) }),
      }),
    }),
  }
}

it.each([
  [null, null, 'anonymous'],
  [{ id: 'u1' }, 'user', 'user'],
  [{ id: 'u1' }, 'master', 'master'],
])('returns the server-managed role', async (user, dbRole, expected) => {
  expect(await getCurrentUserRole(makeSupabase(user, dbRole))).toBe(expected)
})
```

- [ ] **Step 2: 새 helper 부재 실패 확인**

Run: `npm test -- src/lib/master-auth.test.ts`
Expected: FAIL resolving `master-auth`.

- [ ] **Step 3: 서버 권한 helper와 Admin 전환 구현**

```ts
export async function getCurrentUserRole(client = await createClient()) {
  const { data: { user } } = await client.auth.getUser()
  if (!user) return 'anonymous' as const
  const { data } = await client.from('users').select('role').eq('id', user.id).single()
  return data?.role === 'master' ? 'master' as const : 'user' as const
}

export async function requireMaster(client?: SupabaseClient) {
  const role = await getCurrentUserRole(client)
  if (role !== 'master') throw new MasterAuthorizationError(role)
}
```

`/admin`은 `getCurrentUserRole()`이 master가 아니면 `/login?next=/admin`으로 redirect한다. `/admin/login`은 같은 AuthForm을 `nextPath="/admin"`으로 사용한다. 기존 코드 쿠키와 기본 `master` 키는 삭제한다.

- [ ] **Step 4: 역할·AuthForm 테스트 통과 확인**

Run: `npm test -- src/lib/master-auth.test.ts src/components/auth/AuthForm.test.tsx`
Expected: all PASS.

- [ ] **Step 5: 커밋**

```powershell
git add src/lib/master-auth.ts src/lib/master-auth.test.ts src/app/admin src/components/auth/AuthForm.tsx src/components/auth/AuthForm.test.tsx
git commit -m "feat: unify master authentication"
```

---

### Task 5: Master 문제 수정 API

**Files:**
- Create: `src/lib/written-question-edit.ts`
- Create: `src/lib/written-question-edit.test.ts`
- Create: `src/app/api/admin/written-questions/[questionId]/route.ts`
- Create: `src/app/api/admin/written-questions/[questionId]/route.test.ts`

**Interfaces:**
- Produces: `validateWrittenQuestionEdit(input)`, `PATCH /api/admin/written-questions/:questionId`
- Consumes: `requireMaster`, RPC `update_written_question`

- [ ] **Step 1: validation·권한·충돌 실패 테스트 작성**

```ts
const valid = { content: '질문', choices: ['A', 'B', 'C', 'D'], acceptedAnswerIndexes: [1, 3], explanation: '해설', expectedUpdatedAt: '2026-07-23T00:00:00Z' }

it('rejects empty content, non-four choices, and no answers', () => {
  expect(() => validateWrittenQuestionEdit({ ...valid, content: '' })).toThrow('질문')
  expect(() => validateWrittenQuestionEdit({ ...valid, choices: ['A'] })).toThrow('4개')
  expect(() => validateWrittenQuestionEdit({ ...valid, acceptedAnswerIndexes: [] })).toThrow('정답')
})

it('returns 403 for a signed-in non-master', async () => {
  expect((await PATCH(request(valid), context('q1'), userClient)).status).toBe(403)
})
```

- [ ] **Step 2: route 부재 실패 확인**

Run: `npm test -- src/lib/written-question-edit.test.ts "src/app/api/admin/written-questions/[questionId]/route.test.ts"`
Expected: FAIL resolving modules.

- [ ] **Step 3: strict validator와 PATCH route 구현**

```ts
export type WrittenQuestionEditInput = {
  content: string
  choices: [string, string, string, string]
  acceptedAnswerIndexes: number[]
  explanation: string
  expectedUpdatedAt: string
}
```

route는 JSON parse → `requireMaster` → validation → `supabase.rpc('update_written_question', { p_question_id, p_content, p_choices, p_correct_numbers: indexes.map(i => i + 1), p_explanation, p_expected_updated_at })` 순서로 실행한다. 인증 오류를 `401/403`, PostgreSQL stale 메시지를 `409`, validation을 `400`, 대상 없음은 `404`, 그 외는 `500`으로 매핑한다. 성공 시 수정된 `PublicWrittenQuestion`과 `acceptedAnswerIndexes`, `explanation`을 반환한다.

- [ ] **Step 4: API 테스트 통과 확인**

Run: `npm test -- src/lib/written-question-edit.test.ts "src/app/api/admin/written-questions/[questionId]/route.test.ts"`
Expected: all PASS.

- [ ] **Step 5: 커밋**

```powershell
git add src/lib/written-question-edit.ts src/lib/written-question-edit.test.ts "src/app/api/admin/written-questions/[questionId]"
git commit -m "feat: add master question edit api"
```

---

### Task 6: Master 편집 모달과 즉시 갱신

**Files:**
- Create: `src/components/quiz/WrittenQuestionEditDialog.tsx`
- Create: `src/components/quiz/WrittenQuestionEditDialog.test.tsx`
- Modify: `src/components/quiz/WrittenRoundRunner.tsx`
- Modify: `src/components/quiz/WrittenRoundRunner.test.tsx`
- Modify: `src/app/exam/[slug]/questions/written/[year]/[round]/page.tsx`

**Interfaces:**
- Produces: `WrittenQuestionEditDialog`, runner의 `canEdit`와 `editableQuestions`
- Consumes: PATCH API, 공개 문항 `updatedAt`, Master 전용 정답·해설 데이터

- [ ] **Step 1: 버튼 노출·편집·갱신 실패 테스트 작성**

```tsx
it('shows editing only to master and replaces the current question after saving', async () => {
  render(<WrittenRoundRunner canEdit year={2021} round={1} title="1회" questions={questions} editableQuestions={editable} />)
  await user.click(screen.getByRole('button', { name: '문제 수정' }))
  await user.clear(screen.getByLabelText('질문'))
  await user.type(screen.getByLabelText('질문'), '수정된 질문')
  await user.click(screen.getByRole('button', { name: '저장' }))
  expect(await screen.findByRole('heading', { name: '1. 수정된 질문' })).toBeInTheDocument()
})

it('does not render editing for normal users', () => {
  render(<WrittenRoundRunner canEdit={false} year={2021} round={1} title="1회" questions={questions} />)
  expect(screen.queryByRole('button', { name: '문제 수정' })).not.toBeInTheDocument()
})
```

- [ ] **Step 2: 컴포넌트 부재/버튼 부재 실패 확인**

Run: `npm test -- src/components/quiz/WrittenQuestionEditDialog.test.tsx src/components/quiz/WrittenRoundRunner.test.tsx`
Expected: FAIL.

- [ ] **Step 3: 접근 가능한 모달과 runner 상태 갱신 구현**

모달은 `role="dialog"`, `aria-modal`, 질문 textarea, 보기 textarea 4개, 정답 checkbox 4개, 해설 textarea, 취소/저장을 제공한다. dirty 상태에서 취소·배경 닫기 시 `변경 내용을 버릴까요?` 내부 확인 UI를 표시한다. 저장 중 버튼을 비활성화하고 오류 시 입력을 유지한다.

페이지는 `getCurrentUserRole()`을 호출한다. Master일 때만 서버 전용 편집 데이터를 별도로 조회해 runner에 전달한다. runner는 공개 문항을 로컬 state로 보관하고 성공 응답으로 해당 ID만 교체한다.

- [ ] **Step 4: UI 테스트 통과 확인**

Run: `npm test -- src/components/quiz/WrittenQuestionEditDialog.test.tsx src/components/quiz/WrittenRoundRunner.test.tsx`
Expected: all PASS.

- [ ] **Step 5: 커밋**

```powershell
git add src/components/quiz/WrittenQuestionEditDialog.tsx src/components/quiz/WrittenQuestionEditDialog.test.tsx src/components/quiz/WrittenRoundRunner.tsx src/components/quiz/WrittenRoundRunner.test.tsx "src/app/exam/[slug]/questions/written/[year]/[round]/page.tsx"
git commit -m "feat: edit questions from written runner"
```

---

### Task 7: 수정 후 채점 일관성과 브라우저 흐름

**Files:**
- Create: `tests/e2e/master-question-edit.spec.ts`
- Create: `playwright.config.ts`
- Modify: `abubae.md`

**Interfaces:**
- Verifies: Master 수정 → 새로고침 지속 → 새 정답 기준 채점
- Consumes: Supabase 테스트 프로젝트의 `MASTER_TEST_EMAIL`, `MASTER_TEST_PASSWORD`

- [ ] **Step 1: E2E 시나리오 작성**

```ts
async function loginAsMaster(page: Page) {
  await page.goto('/login')
  await page.getByLabel('이메일').fill(process.env.MASTER_TEST_EMAIL!)
  await page.getByLabel('비밀번호').fill(process.env.MASTER_TEST_PASSWORD!)
  await page.getByRole('button', { name: '로그인하기' }).click()
  await page.waitForURL('**/mypage')
}

test('master edits a question and grading uses the new answer', async ({ page }) => {
  await loginAsMaster(page)
  await page.goto('/exam/jeongchogi/questions/written/2021/1')
  await page.getByRole('button', { name: '문제 수정' }).click()
  await page.getByLabel('질문').fill('[E2E] 수정 질문')
  await page.getByLabel('정답 ①').uncheck()
  await page.getByLabel('정답 ②').check()
  await page.getByRole('button', { name: '저장' }).click()
  await page.reload()
  await expect(page.getByRole('heading', { name: '1. [E2E] 수정 질문' })).toBeVisible()
})
```

테스트 종료 시 원래 질문·정답으로 복원하는 `finally`를 포함해 테스트가 운영 콘텐츠를 오염시키지 않게 한다.

- [ ] **Step 2: 환경변수 없이 명시적 skip, 테스트 환경에서는 실행 확인**

Run: `npm run test:e2e -- tests/e2e/master-question-edit.spec.ts`
Expected without test credentials: one explicit SKIP. Expected with credentials: PASS and restored content.

- [ ] **Step 3: 문서 갱신**

`abubae.md`에 Supabase Master 역할 통합, 문제 즉시 수정, 운영자가 해야 할 SQL 순서를 추가하고 기존 코드형 Admin 인증 설명을 제거한다.

- [ ] **Step 4: 관련 회귀 테스트**

Run: `npm test`
Expected: all test files PASS.

- [ ] **Step 5: 커밋**

```powershell
git add tests/e2e/master-question-edit.spec.ts playwright.config.ts abubae.md
git commit -m "test: verify master question editing flow"
```

---

### Task 8: 전체 검증과 배포 준비

**Files:**
- Modify only if validation reveals a defect; do not add unrelated cleanup.

**Interfaces:**
- Produces: release-ready branch and exact operator handoff
- Consumes: all previous tasks

- [ ] **Step 1: 전체 로컬 검증**

Run: `npm run check`
Expected: ESLint 0 errors, Vitest 0 failures, 300 candidate validation success, Next production build success.

- [ ] **Step 2: SQL 적용 순서 검증**

Supabase 테스트 프로젝트에서 다음 순서로 실행한다.

```text
1. supabase/migrations/202607230001_master_question_editing.sql
2. supabase/seeds/2021-written.sql
3. UPDATE public.users SET role = 'master' WHERE email = '<운영자 이메일>';
```

확인 쿼리:

```sql
SELECT role FROM public.users WHERE email = '<운영자 이메일>';
SELECT count(*) FROM public.questions WHERE exam_type = 'written' AND year = 2021;
SELECT count(*) FROM public.choices c JOIN public.questions q ON q.id = c.question_id WHERE q.year = 2021;
```

Expected: `master`, `300`, `1200`.

- [ ] **Step 3: 실제 브라우저 검증**

Master/일반 회원/비회원 각각으로 버튼 노출을 확인하고, 임시 문구 수정 → 즉시 반영 → 새로고침 유지 → 원복 → 변경된 정답 채점을 확인한다. 브라우저 콘솔 오류와 실패 네트워크 요청이 없어야 한다.

- [ ] **Step 4: Vercel 환경 확인**

Vercel 프로젝트 `abubae`에 `NEXT_PUBLIC_SUPABASE_URL`, `NEXT_PUBLIC_SUPABASE_PUBLISHABLE_KEY`, `SUPABASE_SERVICE_ROLE_KEY`가 Production/Preview에 정확히 존재하는지 값 노출 없이 확인한다. `SUPABASE_SERVICE_ROLE_KEY`는 브라우저 번들에 포함하지 않는다.

- [ ] **Step 5: 최종 상태 커밋과 통합 선택**

검증 과정에서 수정한 파일이 있을 때만 명시적으로 stage하고 커밋한다. 이후 `superpowers:finishing-a-development-branch`로 로컬 병합, PR, 유지 중 하나를 선택한다.
