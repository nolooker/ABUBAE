# Task 2: Admin Notice UI Report

## Scope completed

- Added Master-gated notice list, create, and edit pages under `/admin/notices`.
- Linked the existing `/admin` blog/notice management card to `/admin/notices`.
- Added a reusable `NoticeForm` with create and edit modes.
- Sent the exact API DTOs: create sends `NoticeInput`; edit sends `NoticeUpdateInput` with the initial `updatedAt` as `expectedUpdatedAt`.
- Disabled all editable controls while saving and added accessible error and status announcements.
- Redirected successful saves to `/admin/notices?status=saved`; create mode resets the draft before navigation.

## TDD evidence

### RED

Command:

```powershell
npm test -- src/components/admin/NoticeForm.test.tsx src/app/admin/notices/page.test.tsx
```

The initial sandboxed run could not start Vite (`spawn EPERM`), so the same command was rerun with approved elevated execution. It failed as expected because the new production modules did not yet exist:

- `Failed to resolve import "./NoticeForm"`
- `Failed to resolve import "./new/page"`

### GREEN

The same focused command passed after the minimal implementation:

```text
Test Files  2 passed (2)
Tests  9 passed (9)
```

## Files changed

- `src/app/admin/page.tsx`
- `src/app/admin/notices/page.tsx`
- `src/app/admin/notices/new/page.tsx`
- `src/app/admin/notices/[noticeId]/edit/page.tsx`
- `src/components/admin/NoticeForm.tsx`
- `src/components/admin/NoticeForm.test.tsx`
- `src/app/admin/notices/page.test.tsx`

## Test coverage

- Master redirects for list, create, and edit routes.
- List published/draft status badges, dates, create navigation, edit navigation, and admin card link.
- Create DTO, edit DTO with concurrency timestamp, successful redirect, and create-draft reset.
- Pending-state form lock for all controls.
- Accessible 400, 409, and 500 save errors.

## Verification

- Focused Vitest: 2 files, 9 tests passed.
- Full Vitest: 27 files, 182 tests passed.
- ESLint: passed with no warnings.
- `npx tsc --noEmit --incremental false`: passed.
- `git diff --check`: passed.

## Concerns

None. Tests requiring Vite were executed with approved elevated execution because the sandbox blocks Vite's child-process spawn on Windows. No Supabase instance, secrets, or external state were accessed.

## Review-fix TDD evidence

### RED

Command:

```powershell
npm test -- src/components/admin/NoticeForm.test.tsx src/app/admin/notices/page.test.tsx
```

Result: 3 failing tests (7 passing of 10), each for the intended missing behavior:

- The list did not render the exact `새 공지 작성` and `수정` labels.
- The destination list page rendered no `role="status"` confirmation for `?status=saved`.
- A forced second form submit while the first request was pending called `fetch` twice.

### GREEN

The same focused command passed after adding the destination-page status, Korean labels, and submit re-entry guard:

```text
Test Files  2 passed (2)
Tests  10 passed (10)
```

### Review-fix verification commands

```powershell
npm test
npm run lint
npx tsc --noEmit --incremental false
git diff --cached --check
```

Results:

- `npm test`: 27 files and 184 tests passed.
- `npm run lint`: passed with no warnings.
- `npx tsc --noEmit --incremental false`: passed (exit code 0).
- `git diff --cached --check`: passed before the second review-fix commit.

Results:

- `npm test`: 27 files and 183 tests passed.
- `npm run lint`: passed with no warnings.
- `npx tsc --noEmit --incremental false`: passed (exit code 0).
- `git diff --cached --check`: passed before the review-fix commit.

## Second review-fix TDD evidence

### RED

Command:

```powershell
npm test -- src/components/admin/NoticeForm.test.tsx src/app/admin/notices/page.test.tsx
```

Result: 2 failing tests (9 passing of 11): a successful save cleared the render-snapshot lock before navigation unmounted the form, and edit links had indistinguishable accessible names despite visible `수정` text.

### GREEN

The same focused command passed after adding a synchronous `useRef` mutex that remains locked on success and screen-reader-only notice titles in edit links:

```text
Test Files  2 passed (2)
Tests  11 passed (11)
```

### Second review-fix verification commands

```powershell
npm test
npm run lint
npx tsc --noEmit --incremental false
git diff --cached --check
```
