# 시험 일정 관리 · 관리자 유저 생성 · 실기 문제풀이 실행 기록

> 새 작업 지시서가 아니라 2026-08-01~08-04에 끝난 작업의 실행 기록이다.

**기준 설계서:** `docs/superpowers/specs/2026-08-04-exam-schedule-practical-quiz-design.md`

## Task 1: 시험 일정 관리

- [x] `public.exam_schedules` 테이블 + 공개 SELECT RLS + 관리자 전용 쓰기 (`supabase-setup.sql`)
- [x] `src/lib/exam-schedule.ts`, `exam-schedule-repository.ts` + 테스트
- [x] `POST/PATCH/DELETE /api/admin/exam-schedules[/[scheduleId]]` + 테스트
- [x] `/admin/exam-schedules` 목록 + 생성 폼 + 행별 인라인 수정/삭제
- [x] `/exam/jeongchogi/schedule` 공개 페이지 (`force-dynamic`으로 빌드 타임 DB 의존 제거)
- [x] 푸터·시험 허브 페이지에 링크 연결
- [x] 커밋: `cfceff7`

## Task 2: 관리자 유저 생성 (Role 지정)

- [x] `validateCreateUserInput` (이메일/비밀번호 6자 이상/닉네임 선택/Role)
- [x] `createUser()`: Auth Admin API 생성 → `role='master'`면 프로필 후속 승격 → 최신 프로필 반환
- [x] `UserAlreadyExistsError` → 409 구분
- [x] `POST /api/admin/users` + 테스트 (401/403/400/409/500)
- [x] `/admin/users`에 "새 유저 추가" 폼(`UserCreateForm.tsx`)
- [x] 커밋: `a77069d`

## Task 3: 실기 문제풀이 연결

- [x] `src/lib/practical-exam.ts` 채점 로직 (빈칸별 대소문자 무시 비교, 전체 빈칸 정답이어야 정답)
- [x] `src/lib/practical-question-repository.ts` (공개 조회 시 정답 미노출) + `practical-content.ts` 래퍼
- [x] `POST /api/exam/jeongchogi/questions/practical/[year]/[round]/grade` + 테스트
- [x] `PracticalRoundList`/`PracticalRoundRunner`/`PracticalRoundResult` 컴포넌트 + 테스트
- [x] `/exam/[slug]/questions/practical[/[year]/[round]]` 페이지
- [x] `ExamTypeSelector`에서 실기 카드를 "준비 중"에서 실제 링크로 전환
- [x] 마스터 인라인 편집은 이번 범위에서 의도적으로 제외 (필요 시 후속 작업)
- [x] 커밋: `8edc93f`

## Task 4: 모바일 헤더 반응형 + 로고 투명화

- [x] `lg`(1024px) 미만에서 햄버거 메뉴로 전환, 그 이상에서는 기존 중앙 정렬 네비게이션 유지
- [x] 경로 이동 시 메뉴 자동 닫힘을 "메뉴가 열렸을 때의 pathname vs 현재 pathname 비교"로 구현 (`useEffect` 내 setState, 렌더 중 ref 접근 모두 이 프로젝트 lint 규칙 위반이라 우회)
- [x] 로고 PNG의 불투명 흰 배경을 "흰색으로부터의 거리 기반 알파 + 언프리멀티플라이"로 투명 처리
- [x] 390px/820px/1280px 스크린샷으로 겹침 없음 확인
- [x] 커밋: `8edc93f` (Task 3과 동일 커밋에 함께 포함)

## 참고: 같은 기간 홈에서 pull된 작업 (직접 설계하지 않음)

- `617c9ce` 마이페이지 계정 설정 + 관리자 바로가기
- `6f92ac3` 마스터 문제/회차 삭제
- `5bdd0e1`, `731c417` 2022~2026 필기·실기 콘텐츠 추출 및 시드 생성
- 이 항목들은 홈 세션에서 만들어져 그대로 pull됐고, 이 문서에서 설계 근거까지 다시 기록하지는 않는다.

## 검증

- [x] `npx vitest run` — 570개 테스트 통과
- [x] `npm run lint` — 클린
- [x] `npm run build` — 성공, 신규 라우트 전부 정상 등록
- [x] Playwright 헤드리스로 실기 회차 목록/선택 화면, 헤더 반응형(3개 폭) 확인

## 다음 단계 (사용자 확인 필요)

1. `supabase/seeds/2025-2-practical.sql`, `2025-3-practical.sql`, `2026-1-practical.sql`을 Supabase SQL Editor에서 실행해야 실기 회차 목록에 실제 문제가 뜬다.
2. 실기 마스터 인라인 편집 기능이 필요하면 별도 작업으로 진행한다.
3. 커밋 `8edc93f`, `719d09b`의 GitHub push 여부 확인 (사용자가 "나중에 진행" 요청함).
