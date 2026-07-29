# ABUBAE Implementation Audit Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** 현재 `main`의 코드, 테스트, 로컬 실행, Supabase 데이터와 주요 사용자 흐름을 기능 ID별로 감사해 완료·부분 완료·미구현·오류를 증거와 함께 판정하고 8월 실행 순서를 확정한다.

**Architecture:** 감사 작업은 기준선, 정적·자동 검증, 데이터·콘텐츠, 실제 브라우저, 종합 판정의 다섯 검증 단위로 분리한다. 각 단위는 독립 문서를 만들고 마지막 마스터 감사 보고서가 이를 요약한다. 이 계획에서는 제품 기능을 수정하지 않으며, 발견한 결함은 재현 증거와 후속 계획 경계만 기록한다.

**Tech Stack:** Next.js 16.2.4, React 19.2.4, TypeScript 5, Supabase Auth/PostgreSQL/RLS, Vitest 4.1.10, Playwright 1.61.1, PowerShell, Git

## Global Constraints

- 기준 설계서는 `docs/superpowers/specs/2026-07-29-integrated-project-design.md`다.
- 감사 대상 브랜치는 `main`, 기준 목표일은 `2026-12-31`, 사용자 가용 시간은 주 10시간이다.
- 무료 MVP는 정보처리기사 필기 최근 5개년의 문제풀이, 미응답 경고, 일괄 채점, 정답·해설과 회차 결과까지다.
- 문제·정답·해설은 비회원도 볼 수 있고, 응시 이력과 오답노트만 로그인을 요구한다.
- 초기 유료 상품은 `정보처리기사 필기 핵심 요약 PDF`, 가격은 4,900원, 판매 채널은 스마트스토어다.
- `SUPABASE_SERVICE_ROLE_KEY`의 값은 문서, 명령 출력, Git, 브라우저 또는 로그에 기록하지 않는다.
- 기존 수정·추가 파일은 사용자 작업으로 간주한다. 감사 산출물 외 파일을 수정·스테이징·복원하지 않는다.
- 감사 중 결함을 발견해도 이 계획에서는 수정하지 않는다. P0 보안·데이터 유실 위험은 즉시 보고하고 실행을 중단한다.
- 현재 설계서가 여러 하위 시스템을 포함하므로 감사 후 `회원 기록`, `5개년 콘텐츠`, `배포·운영`, `PDF 판매`를 별도 구현 계획으로 만든다.

---

## File Map

### Existing sources to inspect

- `package.json`: 표준 검증 명령과 의존성
- `src/app/exam/[slug]/questions/page.tsx`: 필기·실기 선택 진입
- `src/app/exam/[slug]/questions/written/page.tsx`: 연도·회차 목록
- `src/app/exam/[slug]/questions/written/[year]/[round]/page.tsx`: 문제풀이 서버 경계
- `src/components/quiz/WrittenRoundRunner.tsx`: 답 선택, 이동, 제출 흐름
- `src/components/quiz/WrittenRoundResult.tsx`: 회차 결과와 해설
- `src/app/api/exam/jeongchogi/questions/written/[year]/[round]/grade/route.ts`: 서버 채점
- `src/app/login/page.tsx`, `src/app/signup/page.tsx`, `src/app/api/auth/login/route.ts`: 인증 흐름
- `src/app/mypage/page.tsx`: 현재 회원 기능 진입점
- `src/app/admin/**`: Master 문제·공지 관리 화면
- `src/app/api/admin/**`: Master 변경 API
- `src/app/notices/**`, `src/lib/notice-repository.ts`: 공개 공지
- `src/lib/written-question-repository.ts`: 공개·관리 문제 조회
- `src/lib/master-auth.ts`: 역할 판정
- `src/lib/supabase/*.ts`: 브라우저·서버·서비스 역할 클라이언트
- `supabase-setup.sql`: 운영 Supabase 단일 설정 경로
- `supabase/seeds/2021-written.sql`: 현재 생성된 2021 필기 seed
- `scripts/validate-written-exam.mjs`: 로컬 콘텐츠 검증
- `tests/e2e/master-question-edit.spec.ts`: 현재 Master 실제 브라우저 검증
- `abubae.md`: 기존 프로젝트 운영 기록

### Audit artifacts to create

- `docs/audits/2026-07-29-baseline.md`: Git·환경·명령·자동 검사 기준선
- `docs/audits/2026-07-29-feature-matrix.md`: 기능 ID별 코드·테스트·상태 증거
- `docs/audits/2026-07-29-data-content.md`: Supabase 보안과 실제 문제·회차·검수 수량
- `docs/audits/2026-07-29-browser-qa.md`: 비회원·회원·Master 실제 흐름 결과
- `docs/audits/2026-07-29-implementation-audit.md`: 오류 우선순위, 미완성 목록, 8월 실행 순서

### Interface between tasks

모든 하위 보고서는 아래 상태 값과 증거 형식을 사용한다.

```ts
type AuditStatus = 'complete' | 'partial' | 'missing' | 'error' | 'blocked'
type Severity = 'P0' | 'P1' | 'P2' | 'P3'

type AuditEvidence = {
  featureId: string
  status: AuditStatus
  evidence: string
  commandOrUrl: string
  severity?: Severity
  nextAction: string
}
```

Markdown 표에서는 동일한 이름을 사용한다.

```markdown
| 기능 ID | 상태 | 증거 | 명령 또는 URL | 심각도 | 다음 행동 |
```

---

### Task 1: Freeze the Audit Baseline

**Files:**
- Create: `docs/audits/2026-07-29-baseline.md`
- Inspect: `package.json`
- Inspect: `.gitignore`
- Inspect: `.env.local` (이름 존재 여부만 검사하고 값은 읽거나 출력하지 않음)

**Interfaces:**
- Consumes: `AuditStatus`, `AuditEvidence` 공통 형식
- Produces: 기준 커밋, 브랜치, 작업트리 목록, 환경 변수 존재 여부, 표준 검증 명령

- [ ] **Step 1: Capture Git identity without modifying the worktree**

Run:

```powershell
git branch --show-current
git rev-parse HEAD
git log -1 --format="%h %cI %s"
git status --short
git remote -v
```

Expected:

- 브랜치는 `main`이다.
- 설계서 커밋 `99344ad` 이후의 실제 HEAD가 출력된다.
- 수정·추가 파일은 그대로 남으며 어떤 파일도 스테이징되지 않는다.
- 원격 주소에 토큰이나 자격 증명이 포함돼 있으면 보고서에는 호스트와 저장소 이름만 적고 전체 문자열을 기록하지 않는다.

- [ ] **Step 2: Verify required environment variable names without printing values**

Run:

```powershell
$required = @(
  'NEXT_PUBLIC_SUPABASE_URL',
  'NEXT_PUBLIC_SUPABASE_PUBLISHABLE_KEY',
  'SUPABASE_SERVICE_ROLE_KEY'
)
$lines = Get-Content -LiteralPath '.env.local' -ErrorAction SilentlyContinue
$required | ForEach-Object {
  $name = $_
  [pscustomobject]@{
    Name = $name
    Present = [bool]($lines | Where-Object { $_ -match "^$([regex]::Escape($name))=" })
  }
}
```

Expected:

- 출력에는 변수 이름과 `Present=True|False`만 있다.
- 키 값, URL 값, 비밀번호는 출력되지 않는다.

- [ ] **Step 3: Create the baseline report with exact captured results**

Create `docs/audits/2026-07-29-baseline.md` with these headings and fields. Write the exact branch and commit outputs captured in Step 1 after the colons; do not copy a remote URL containing credentials:

```markdown
# ABUBAE 구현 감사 기준선

- 감사 시각: 2026-07-29 Asia/Seoul
- 브랜치:
- 기준 커밋:
- 원격 저장소: github.com/nolooker/ABUBAE

## 작업트리

Under this heading, add a fenced `text` block containing the exact `git status --short` output. If the worktree is clean, write `clean`.

기존 변경은 사용자 작업으로 보존하며 감사 산출물 외에는 스테이징하지 않는다.

## 환경 변수 존재 여부

| 이름 | 존재 |
|---|---|
| NEXT_PUBLIC_SUPABASE_URL | Step 2의 True 또는 False 결과 |
| NEXT_PUBLIC_SUPABASE_PUBLISHABLE_KEY | Step 2의 True 또는 False 결과 |
| SUPABASE_SERVICE_ROLE_KEY | Step 2의 True 또는 False 결과 |

값은 보안상 기록하지 않는다.

## 표준 검증 명령

| 구분 | 명령 |
|---|---|
| Lint | `npm run lint` |
| Unit/Component/API | `npm test` |
| Content | `npm run validate:content` |
| Production build | `npm run build` |
| Combined | `npm run check` |
| E2E | `npm run test:e2e` |
```

- [ ] **Step 4: Verify the report contains no secret-like value**

Run:

```powershell
rg -n "sb_secret_|sb_publishable_|service_role|SUPABASE_SERVICE_ROLE_KEY=" docs/audits/2026-07-29-baseline.md
```

Expected: no matches and exit code `1`.

- [ ] **Step 5: Commit only the baseline report**

Run:

```powershell
git add -- docs/audits/2026-07-29-baseline.md
git diff --cached --check
git diff --cached --name-only
git commit -m "docs: capture implementation audit baseline"
```

Expected: the cached name list contains only `docs/audits/2026-07-29-baseline.md`.

---

### Task 2: Run Automated Checks and Build the Feature Matrix

**Files:**
- Create: `docs/audits/2026-07-29-feature-matrix.md`
- Inspect: files listed under `Existing sources to inspect`
- Inspect: `src/**/*.test.ts`
- Inspect: `src/**/*.test.tsx`
- Inspect: `supabase/migrations/*.test.ts`
- Inspect: `scripts/*.test.ts`

**Interfaces:**
- Consumes: baseline commit and worktree record from Task 1
- Produces: EXAM, AUTH, LEARN, NOTICE, CONTENT, SALE, ADMIN feature status with code and test evidence

- [ ] **Step 1: Run each automated gate separately and retain the exit status**

Run:

```powershell
npm run lint
npm test
npm run validate:content
npm run build
```

Expected:

- 각 명령의 전체 통과·실패가 독립적으로 식별된다.
- 실패가 발생해도 다음 명령을 별도로 실행한다.
- 실패한 명령은 첫 오류, 관련 파일, exit code를 기록하며 코드를 수정하지 않는다.

- [ ] **Step 2: Inventory routes and tests**

Run:

```powershell
rg --files src/app | Sort-Object
rg --files src tests scripts supabase -g '*.test.ts' -g '*.test.tsx' -g '*.spec.ts' | Sort-Object
rg -n "attempt|wrong.answer|wrongAnswer|history|exam_result|submitted_at" src supabase-setup.sql
```

Expected:

- 현재 App Router 경로와 자동 테스트 파일 목록을 얻는다.
- 회원 응시 이력·오답노트 구현 단서가 없으면 `LEARN-01`, `LEARN-02`를 `missing`으로 판정한다.
- 이름만 존재하는 페이지는 동작 증거로 간주하지 않는다.

- [ ] **Step 3: Trace every feature ID to exact files and tests**

For each ID, inspect with:

```powershell
rg -n "ExamTypeSelector|WrittenRoundList|WrittenRoundRunner|WrittenRoundResult" src
rg -n "signup|login|signOut|resetPasswordForEmail|updateUser" src
rg -n "admin/notices|NoticeForm|noticeRepository|posts_public_read" src supabase-setup.sql
rg -n "requireMaster|getCurrentUserRole|master_update_written_question|master_create_written_question" src supabase-setup.sql
rg -n "resources|blog|Smart|4,900|4900" src
```

Expected classifications:

- `complete`: code, relevant automated test, and automated gate evidence all exist.
- `partial`: route or code exists but test, error path, data, or required behavior is missing.
- `missing`: no working route or core implementation exists.
- `error`: an existing automated check proves required behavior fails.
- `blocked`: code cannot be judged without live environment or user decision.

- [ ] **Step 4: Create the feature matrix**

Create `docs/audits/2026-07-29-feature-matrix.md` with all rows below; do not omit any ID:

```markdown
# ABUBAE 기능 구현 매트릭스

| 기능 ID | 상태 | 코드 증거 | 테스트 증거 | 자동 검사 | 누락 또는 오류 |
|---|---|---|---|---|---|
| EXAM-01 | complete/partial/missing/error/blocked | 파일:라인 | 테스트 파일 또는 없음 | PASS/FAIL/BLOCKED | 구체적인 한 문장 |
| EXAM-02 | 허용 상태값 중 하나 | 파일:라인 | 테스트 파일 또는 없음 | PASS/FAIL/BLOCKED | 관찰한 공백을 한 문장으로 기록 |
| EXAM-03 | 허용 상태값 중 하나 | 파일:라인 | 테스트 파일 또는 없음 | PASS/FAIL/BLOCKED | 관찰한 공백을 한 문장으로 기록 |
| EXAM-04 | 허용 상태값 중 하나 | 파일:라인 | 테스트 파일 또는 없음 | PASS/FAIL/BLOCKED | 관찰한 공백을 한 문장으로 기록 |
| AUTH-01 | 허용 상태값 중 하나 | 파일:라인 | 테스트 파일 또는 없음 | PASS/FAIL/BLOCKED | 관찰한 공백을 한 문장으로 기록 |
| LEARN-01 | 허용 상태값 중 하나 | 파일:라인 또는 없음 | 테스트 파일 또는 없음 | PASS/FAIL/BLOCKED | 관찰한 공백을 한 문장으로 기록 |
| LEARN-02 | 허용 상태값 중 하나 | 파일:라인 또는 없음 | 테스트 파일 또는 없음 | PASS/FAIL/BLOCKED | 관찰한 공백을 한 문장으로 기록 |
| NOTICE-01 | 허용 상태값 중 하나 | 파일:라인 | 테스트 파일 또는 없음 | PASS/FAIL/BLOCKED | 관찰한 공백을 한 문장으로 기록 |
| CONTENT-01 | 허용 상태값 중 하나 | 파일:라인 또는 없음 | 테스트 파일 또는 없음 | PASS/FAIL/BLOCKED | 관찰한 공백을 한 문장으로 기록 |
| SALE-01 | 허용 상태값 중 하나 | 파일:라인 또는 없음 | 테스트 파일 또는 없음 | PASS/FAIL/BLOCKED | 관찰한 공백을 한 문장으로 기록 |
| ADMIN-01 | 허용 상태값 중 하나 | 파일:라인 | 테스트 파일 또는 없음 | PASS/FAIL/BLOCKED | 관찰한 공백을 한 문장으로 기록 |
| ADMIN-02 | 허용 상태값 중 하나 | 파일:라인 | 테스트 파일 또는 없음 | PASS/FAIL/BLOCKED | 관찰한 공백을 한 문장으로 기록 |
| ADMIN-03 | 허용 상태값 중 하나 | 파일:라인 | 테스트 파일 또는 없음 | PASS/FAIL/BLOCKED | 관찰한 공백을 한 문장으로 기록 |
| ADMIN-04 | 허용 상태값 중 하나 | 파일:라인 | 테스트 파일 또는 없음 | PASS/FAIL/BLOCKED | 관찰한 공백을 한 문장으로 기록 |

## 자동 검사

| 명령 | 결과 | 첫 실패 증거 |
|---|---|---|
| `npm run lint` | PASS 또는 FAIL | 없음 또는 파일:라인과 메시지 |
| `npm test` | PASS 또는 FAIL | 없음 또는 테스트 이름과 메시지 |
| `npm run validate:content` | PASS 또는 FAIL | 없음 또는 검증 오류 |
| `npm run build` | PASS 또는 FAIL | 없음 또는 빌드 오류 |
```

- [ ] **Step 5: Verify matrix completeness**

Run:

```powershell
$ids = @(
  'EXAM-01','EXAM-02','EXAM-03','EXAM-04',
  'AUTH-01','LEARN-01','LEARN-02',
  'NOTICE-01','CONTENT-01','SALE-01',
  'ADMIN-01','ADMIN-02','ADMIN-03','ADMIN-04'
)
$text = Get-Content -Raw -LiteralPath 'docs/audits/2026-07-29-feature-matrix.md'
$ids | ForEach-Object {
  if ($text -notmatch [regex]::Escape($_)) { throw "Missing feature ID: $_" }
}
```

Expected: no output and exit code `0`.

- [ ] **Step 6: Commit only the feature matrix**

Run:

```powershell
git add -- docs/audits/2026-07-29-feature-matrix.md
git diff --cached --check
git diff --cached --name-only
git commit -m "docs: map current feature implementation"
```

Expected: the cached name list contains only the feature matrix.

---

### Task 3: Audit Supabase Security and Content Inventory

**Files:**
- Create: `docs/audits/2026-07-29-data-content.md`
- Inspect: `supabase-setup.sql`
- Inspect: `supabase/migrations/202607230001_master_question_editing.sql`
- Inspect: `supabase/migrations/202607240001_admin_notices.sql`
- Inspect: `supabase/seeds/2021-written.sql`
- Inspect: `src/lib/supabase/client.ts`
- Inspect: `src/lib/supabase/server.ts`
- Inspect: `src/lib/supabase/service.ts`
- Inspect: `src/lib/master-auth.ts`
- Inspect: `src/lib/written-question-repository.ts`
- Inspect: `src/lib/notice-repository.ts`

**Interfaces:**
- Consumes: feature matrix from Task 2
- Produces: schema/policy/RPC evidence and actual year·round·question·review status inventory

- [ ] **Step 1: Verify local SQL contains the required repeatable and security boundaries**

Run:

```powershell
rg -n "CREATE TABLE IF NOT EXISTS|ADD COLUMN IF NOT EXISTS|ON CONFLICT.*DO NOTHING" supabase-setup.sql
rg -n "ENABLE ROW LEVEL SECURITY|CREATE POLICY|DROP POLICY|REVOKE|GRANT" supabase-setup.sql
rg -n "is_master|master_update_written_question|master_create_written_question" supabase-setup.sql
rg -n "seoteang@gmail.com|role = 'master'" supabase-setup.sql
```

Expected:

- 재실행 가능한 테이블·컬럼·샘플 시험 설정이 존재한다.
- 공개 읽기와 Master 변경 경계가 명시된다.
- Master RPC가 역할을 DB에서 재검증한다.
- 이메일은 기존 프로필 승격에만 사용되고 권한 판정 함수는 역할 값을 사용한다.

- [ ] **Step 2: Verify secret separation in application code**

Run:

```powershell
rg -n "SUPABASE_SERVICE_ROLE_KEY" src
rg -n "NEXT_PUBLIC_SUPABASE_(URL|PUBLISHABLE_KEY)" src
rg -n "createServiceClient" src
```

Expected:

- Service Role Key는 `src/lib/supabase/service.ts`와 서버 전용 호출 경로에만 나타난다.
- 클라이언트 컴포넌트에서 Service Role Key를 참조하면 P0으로 기록하고 중단한다.

- [ ] **Step 3: Run local content validation and count generated content**

Run:

```powershell
npm run validate:content
rg -c "INSERT INTO public.questions|INSERT INTO questions" supabase/seeds/2021-written.sql
rg -n "2021|2022|2023|2024|2025" content src/lib/written-content.ts supabase/seeds/2021-written.sql
```

Expected:

- 로컬 콘텐츠 검증 결과가 PASS 또는 구체적인 오류로 기록된다.
- 단순 INSERT 문 개수는 실제 문항 수로 단정하지 않는다.
- 현재 저장소에 존재하는 연도와 회차만 로컬 수량으로 기록한다.

- [ ] **Step 4: Query live Supabase with read-only SQL**

Run the following in Supabase SQL Editor. These are read-only queries:

```sql
select
  q.year,
  q.round,
  count(*) as question_count,
  count(*) filter (where coalesce(q.reviewed, false)) as reviewed_count,
  count(*) filter (where coalesce(q.published, false)) as published_count
from public.questions q
join public.exams e on e.id = q.exam_id
where e.slug = 'jeongchogi'
group by q.year, q.round
order by q.year, q.round;

select
  count(*) filter (where type = 'notice') as notice_count,
  count(*) filter (where type = 'notice' and is_published) as published_notice_count,
  count(*) filter (where type = 'blog') as blog_count,
  count(*) filter (where type = 'blog' and is_published) as published_blog_count
from public.posts;

select role, count(*)
from public.users
group by role
order by role;

select role
from public.users
where lower(email) = 'seoteang@gmail.com';
```

Expected:

- 쿼리가 성공하면 실제 수량을 보고서에 기록한다.
- 접근 권한이나 연결이 없으면 `blocked`로 기록하고 필요한 사용자 행동을 `Supabase SQL Editor에서 위 네 쿼리 실행 후 결과 제공`으로 한정한다.
- 사용자 이메일 목록이나 다른 개인 정보는 보고서에 복사하지 않는다.

- [ ] **Step 5: Create the data and content report**

Create `docs/audits/2026-07-29-data-content.md` with these exact sections:

```markdown
# ABUBAE 데이터·콘텐츠 감사

## Supabase 설정

| 항목 | 상태 | 파일 또는 SQL 증거 | 위험 |
|---|---|---|---|
| 재실행 가능한 통합 SQL | 허용 상태값 중 하나 | 파일:라인 | 관찰한 위험 또는 없음 |
| 공개 문제 읽기 | 허용 상태값 중 하나 | 파일:라인 | 관찰한 위험 또는 없음 |
| 본인 데이터 RLS | 허용 상태값 중 하나 | 파일:라인 | 관찰한 위험 또는 없음 |
| Master 역할 검증 | 허용 상태값 중 하나 | 파일:라인 | 관찰한 위험 또는 없음 |
| 문제 수정 RPC | 허용 상태값 중 하나 | 파일:라인 | 관찰한 위험 또는 없음 |
| 공지 변경 권한 | 허용 상태값 중 하나 | 파일:라인 | 관찰한 위험 또는 없음 |
| Service Role 서버 격리 | 허용 상태값 중 하나 | 파일:라인 | 관찰한 위험 또는 없음 |

## 실제 콘텐츠 수량

| 연도 | 회차 | 전체 | 검수 완료 | 공개 | 판정 |
|---:|---:|---:|---:|---:|---|

## 공개 콘텐츠

| 종류 | 전체 | 공개 | 판정 |
|---|---:|---:|---|
| 공지 | SQL 결과의 전체 수 | SQL 결과의 공개 수 | 허용 상태값 중 하나 |
| 블로그 | SQL 결과의 전체 수 | SQL 결과의 공개 수 | 허용 상태값 중 하나 |

## 차단 조건과 사용자 행동

- 차단이 없으면 `없음`이라고 기록한다.
- 차단이 있으면 사용자가 수행할 한 가지 구체적 행동만 기록한다.
```

- [ ] **Step 6: Scan the report for secret material**

Run:

```powershell
rg -n "sb_secret_|sb_publishable_|SUPABASE_SERVICE_ROLE_KEY=|password" docs/audits/2026-07-29-data-content.md
```

Expected: no matches and exit code `1`.

- [ ] **Step 7: Commit only the data report**

Run:

```powershell
git add -- docs/audits/2026-07-29-data-content.md
git diff --cached --check
git diff --cached --name-only
git commit -m "docs: audit supabase and exam content"
```

Expected: the cached name list contains only the data report.

---

### Task 4: Verify Critical Flows in a Real Browser

**Files:**
- Create: `docs/audits/2026-07-29-browser-qa.md`
- Inspect only: application files related to a failed route

**Interfaces:**
- Consumes: route expectations from Task 2 and live data availability from Task 3
- Produces: URL, role, expected result, actual result and visual/reproduction evidence

- [ ] **Step 1: Start the application on the canonical local port**

Run:

```powershell
npm run dev
```

Expected:

- use the actual port printed by Next.js.
- If port 3000 is free, the canonical base URL is `http://127.0.0.1:3000`.
- If Next.js selects another port, record it and do not test a different running copy.

- [ ] **Step 2: Verify anonymous public flows**

Open these URLs in order:

```text
/
/exam/jeongchogi/questions
/exam/jeongchogi/questions/written
/exam/jeongchogi/questions/written/2021/1
/notices
```

For the available written round:

1. Select an answer.
2. Move with `다음 문제`.
3. Return with `이전 문제`.
4. Confirm the selection remains.
5. Use a numbered direct-navigation control.
6. Leave at least one question unanswered.
7. Submit and confirm the warning identifies unanswered question numbers.
8. Choose the option that submits unanswered questions as incorrect.
9. Confirm score, counts, chosen answer, accepted answer and explanation.
10. Confirm the page explains that an anonymous result is not saved.

Expected:

- public pages do not redirect to login.
- answers and explanations are absent before final submission.
- all navigation controls and the submission warning work.
- failures are recorded with exact URL, action and visible result.

- [ ] **Step 3: Verify authentication flow**

Open:

```text
/signup
/login?next=/mypage
```

Verify:

1. Signup form renders without missing Supabase configuration error.
2. Login rejects an invalid password with a user-facing message.
3. Valid login returns to `/mypage`.
4. Logout clears the session and protected navigation no longer identifies the user.
5. Password recovery entry and callback destination exist; if no recovery UI exists, record `AUTH-01` as `partial`.

Expected:

- do not record passwords, tokens, callback query values or session cookies.
- if a test account is unavailable, valid login and logout are `blocked`, not `complete`.

- [ ] **Step 4: Verify Master flows with the approved account**

Using the existing Master session for `seoteang@gmail.com`, open:

```text
/admin
/admin/questions
/admin/notices
/exam/jeongchogi/questions/written/2021/1
```

Verify:

1. Admin pages are unavailable to an anonymous session.
2. Master sees problem and notice management.
3. Problem edit control appears only for Master.
4. Open a problem edit form but do not save during the audit.
5. Open new/edit notice forms but do not save during the audit.

Expected:

- this task is read-only and creates no database mutations.
- absent Master credentials make this portion `blocked`.

- [ ] **Step 5: Verify public notice behavior**

Verify:

1. `/notices` shows only published notices.
2. A published notice opens at `/notices/[slug]`.
3. A known draft slug returns not found or otherwise remains unavailable publicly.
4. The home page notice section agrees with the published list.

Expected: no draft content is exposed.

- [ ] **Step 6: Create the browser QA report**

Create `docs/audits/2026-07-29-browser-qa.md`. After the first two colons, write the exact commit hash and local base URL used in this task:

```markdown
# ABUBAE 실제 브라우저 QA

- 실행 기준 커밋:
- 실행 URL:
- 실행 시각: 2026-07-29 Asia/Seoul

| 기능 ID | 역할 | URL | 검증 행동 | 기대 결과 | 실제 결과 | 상태 | 심각도 |
|---|---|---|---|---|---|---|---|

## 재현 가능한 오류

각 오류는 실제 심각도와 현상을 사용한 `h3` 제목으로 시작한다. 예: `P1 제출 후 점수가 계산되지 않음`.

1. 시작 URL
2. 수행한 행동
3. 실제 결과
4. 기대 결과
5. 반복 재현 여부
6. 관련 콘솔 또는 서버 오류의 비밀 값이 제거된 한 줄 요약

## 차단된 검증

차단이 없으면 `없음`이라고 기록한다.
```

- [ ] **Step 7: Commit only the browser QA report**

Run:

```powershell
git add -- docs/audits/2026-07-29-browser-qa.md
git diff --cached --check
git diff --cached --name-only
git commit -m "docs: record critical browser flow audit"
```

Expected: the cached name list contains only the browser QA report.

---

### Task 5: Synthesize Findings and Fix the August Execution Order

**Files:**
- Create: `docs/audits/2026-07-29-implementation-audit.md`
- Modify: `abubae.md`
- Read: all four audit artifacts from Tasks 1–4
- Read: `docs/superpowers/specs/2026-07-29-integrated-project-design.md`

**Interfaces:**
- Consumes: all `AuditEvidence` rows from Tasks 1–4
- Produces: one master status report and an ordered set of follow-up implementation plans

- [ ] **Step 1: Merge evidence without upgrading unsupported status**

Apply these rules:

```text
P0 or P1 error evidence → error
required live check blocked → blocked
code exists but any DoD category lacks evidence → partial
no core code path → missing
all five DoD categories proven → complete
```

The five DoD categories are:

```text
동작 · 권한 · 데이터 · 테스트 · 문서
```

Expected: no feature is marked `complete` from code existence alone.

- [ ] **Step 2: Rank findings**

Use this ordering:

```text
1. P0 security or data-loss defects
2. P1 grading, answer, authentication, or core navigation defects
3. Missing free-member retention: LEARN-01, LEARN-02
4. Five-year content acquisition and human review gap
5. Deployment, monitoring, and operating documentation
6. PDF product and traffic work
7. P2/P3 design and convenience improvements
```

Expected: each finding has one owner (`Codex`, `사용자`, or `공동`) and one next action.

- [ ] **Step 3: Create the master audit report**

Create `docs/audits/2026-07-29-implementation-audit.md`:

```markdown
# ABUBAE 전체 구현 감사 보고서

## 결론

- 운영 가능 여부: 가능 / 조건부 가능 / 불가
- 무료 MVP 상태: 완료 / 부분 완료 / 미완성
- 가장 높은 오류 등급: P0 / P1 / P2 / P3 / 없음
- 실제 공개 문제 범위: 연도·회차·문항 수
- 8월 첫 작업: 기능 ID와 한 문장

## 기능별 상태

| 기능 ID | 상태 | DoD 충족 수 | 핵심 증거 | 가장 큰 공백 | 다음 행동 | 담당 |
|---|---|---:|---|---|---|---|

## 오류

| 우선순위 | 기능 ID | 재현 요약 | 사용자 영향 | 수정 계획 |
|---|---|---|---|---|

오류가 없으면 `자동 검사와 수행 가능한 실제 흐름에서 재현된 오류 없음`이라고 기록한다.

## 미완성 기능

| 순서 | 기능 ID | 필요한 결과 | 예상 주간 | 선행 조건 |
|---:|---|---|---:|---|

## 8월 실행 순서

1. P0/P1이 있으면 해당 오류 수정 계획
2. 회원 응시 이력·오답노트 구현 계획
3. 2021 검수 완료와 2022~2025 콘텐츠 파이프라인 계획
4. Preview·Production 배포와 운영 기준선 계획
5. PDF 목차와 제작 파이프라인 계획

## 사용자가 해야 할 일

기술 작업과 구분해 문제·해설 승인, 외부 계정, 비밀 값, 판매 정책에 필요한 행동만 적는다.

## 후속 계획 파일

| 순서 | 계획 파일 | 범위 | 시작 조건 |
|---:|---|---|---|
| 1 | `docs/superpowers/plans/2026-08-03-critical-fixes.md` | 확인된 P0/P1 | 해당 오류가 있을 때만 |
| 2 | `docs/superpowers/plans/2026-08-03-member-learning-history.md` | 응시 이력·오답노트 | 감사 승인 |
| 3 | `docs/superpowers/plans/2026-08-03-five-year-content-pipeline.md` | 2021~2025 문제·해설 | 실제 수량 확정 |
| 4 | `docs/superpowers/plans/2026-08-03-deployment-operations.md` | Preview·Production·모니터링 | 핵심 P1 해결 |
| 5 | `docs/superpowers/plans/2026-08-03-pdf-product.md` | 4,900원 PDF와 상품 안내 | 목차 승인 |
```

- [ ] **Step 4: Update the project handoff**

Append a Korean UTF-8 section to `abubae.md`. Copy the exact 무료 MVP status, first priority, and required user action from the master report rather than paraphrasing them:

```markdown
## 2026-07-29 전체 구현 감사

- 통합 설계서: `docs/superpowers/specs/2026-07-29-integrated-project-design.md`
- 감사 보고서: `docs/audits/2026-07-29-implementation-audit.md`
- 무료 MVP 상태:
- 최우선 작업:
- 사용자 확인 필요:
```

If `abubae.md` remains mojibake when decoded as UTF-8, do not rewrite the file. Instead create `docs/update-log.md` entry with the same content so unrelated historical text is preserved.

- [ ] **Step 5: Run the final documentation checks**

Run:

```powershell
rg -n "T[B]D|T[O]DO|implement\s+lat[e]r|fill\s+[i]n|\x3c[^\x3e]+\x3e" docs/audits/2026-07-29-*.md
rg -n "sb_secret_|sb_publishable_|SUPABASE_SERVICE_ROLE_KEY=|MASTER_TEST_PASSWORD=" docs/audits/2026-07-29-*.md
git diff --check
git status --short
```

Expected:

- placeholder and secret scans return no matches.
- only the master report and one handoff document are intended for the final task commit.
- user-owned changes remain present and unstaged.

- [ ] **Step 6: Commit the synthesis**

Run:

```powershell
git add -- docs/audits/2026-07-29-implementation-audit.md
git add -- abubae.md
git diff --cached --check
git diff --cached --name-only
git commit -m "docs: finalize implementation audit and august priorities"
```

If `docs/update-log.md` was used instead of `abubae.md`, stage only that file with the master report:

```powershell
git add -- docs/audits/2026-07-29-implementation-audit.md docs/update-log.md
git diff --cached --check
git diff --cached --name-only
git commit -m "docs: finalize implementation audit and august priorities"
```

Expected: the commit contains the master report and exactly one handoff log.

- [ ] **Step 7: Present the audit for approval before feature implementation**

Report:

```text
무료 MVP 상태
P0/P1 오류
실제 공개 문제 범위
미완성 기능 상위 3개
사용자에게 필요한 다음 행동
추천 후속 구현 계획
```

Expected: no product code is implemented until the user approves the audit result and first follow-up plan.
