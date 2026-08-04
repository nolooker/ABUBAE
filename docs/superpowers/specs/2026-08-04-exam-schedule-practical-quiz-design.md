# 시험 일정 관리 · 관리자 유저 생성 · 실기 문제풀이 설계

> as-built 설계 문서. `docs/superpowers/specs/2026-07-31-account-and-community-management-design.md` 이후, 2026-08-01~08-04 사이에 구현이 끝난 기능을 사후에 기록한다.

## 목표

- 정보처리기사 회차별 필기·실기 일정을 관리자가 직접 등록·관리하고, 방문자는 표로 확인한다.
- 관리자가 유저 관리 화면에서 계정을 새로 만들고 Role(user/master)까지 지정할 수 있게 한다.
- 이미 추출된 실기(단답형) 문제 JSON/시드를 실제 문제풀이·채점 화면에 연결한다.
- 모바일에서 깨져 보이던 헤더와, 배경색과 따로 노는 로고 이미지를 고친다.

## 범위

### 1. 시험 일정 관리 (커밋 `cfceff7`)

- `public.exam_schedules` 테이블: 시험(`exam_id`)·연도·회차별로 필기 접수기간·시험일·발표일, 실기 접수기간·시험일·발표일까지 8개 날짜 필드를 가진다.
- 공개 SELECT는 RLS로 허용하고, 쓰기는 서비스 롤 + `requireMaster()`로만 가능하다(공지사항과 동일한 "관리 콘텐츠" 패턴).
- `/admin/exam-schedules`: 목록 + 새 일정 추가 폼 + 행별 인라인 수정/삭제.
- `/exam/jeongchogi/schedule`: 공개 조회 페이지. 홈 로드시 DB에 실제로 접근해야 해서 `export const dynamic = 'force-dynamic'`으로 빌드 타임 정적 생성에서 제외했다(스키마가 아직 없는 상태에서 빌드가 깨지는 문제 해결).
- 푸터 "시험" 컬럼과 시험 허브 페이지에 "시험일정 보기" 링크 연결.

### 2. 관리자 유저 생성 (커밋 `a77069d`)

- `/admin/users`에 "새 유저 추가" 폼: 이메일·비밀번호·닉네임(선택)·Role(user/master)을 관리자가 직접 입력해 계정을 즉시 생성한다(초대 이메일 방식이 아니라 비밀번호 직접 지정 방식을 선택함).
- Supabase Auth Admin API `createUser({ email_confirm: true })`로 생성 후, `role: 'master'`를 선택한 경우에만 `public.users`를 후속 UPDATE로 승격한다(트리거가 기본값 `user`로 프로필을 먼저 만들기 때문).
- 이메일 중복은 `UserAlreadyExistsError` → 409로 구분해 응답한다.
- 기존 "마스터 승격/강등을 유저 목록에서 노출하지 않는다"는 방침은 *기존 유저 수정*에는 그대로 적용되고, *신규 생성 시점의 Role 지정*만 예외적으로 허용한 것이다.

### 3. 실기(단답형) 문제풀이 (커밋 `8edc93f`)

- 콘텐츠는 별도 파이프라인(Python 추출 스크립트 + `generate-practical-seed.mjs`)으로 이미 만들어져 있었고, 이번 작업은 그 데이터를 실제 화면에 연결하는 것만 다룬다.
- 문제는 `public.questions`에 `exam_type='practical'`로 필기와 같은 테이블을 공유하고, 정답은 `public.practical_answers(question_id, blank_number, accepted_answers[])`에 별도 저장한다(문항당 빈칸이 1개 이상일 수 있음).
- 채점: 빈칸 답안은 공백 트리밍 + 소문자 비교로 대소문자를 무시하고, 문항 하나는 모든 빈칸이 맞아야 정답으로 처리한다.
- 공개 조회는 정답을 절대 내려보내지 않고 `blankCount`(빈칸 개수)만 전달해, 프론트가 입력창 개수를 결정한다. `practical_answers`는 RLS로 전체 REVOKE되어 있어 서비스 롤을 거치지 않으면 어떤 클라이언트도 직접 조회할 수 없다.
- 필기의 마스터 인라인 편집(RPC 기반) 기능은 이번 범위에 포함하지 않았다 — 요청 범위가 "문제풀이+채점"이었기 때문에 의도적으로 제외했다.
- 시험 유형 선택 화면(`ExamTypeSelector`)의 실기 카드가 "준비 중"에서 실제 링크로 바뀌었다.

### 4. 모바일 헤더 반응형 + 로고 투명화 (커밋 `8edc93f`)

- 기존 헤더는 `absolute left-1/2 -translate-x-1/2`로 항상 중앙 정렬된 네비게이션이 로고·로그인 버튼 너비와 무관하게 배치되어, 좁은 화면에서 서로 겹쳤다.
- `lg`(1024px) 이상에서는 기존 중앙 정렬 네비게이션을 유지하고, 그 미만에서는 로고 + 햄버거 버튼만 보이며 클릭 시 전체 폭 드롭다운 메뉴가 펼쳐지도록 바꿨다.
- 경로 이동 시 모바일 메뉴가 자동으로 닫혀야 하는데, `useEffect` 안에서 `setState`를 직접 호출하거나 렌더 중 `ref.current`를 읽고 쓰는 방식은 이 프로젝트의 `react-hooks` lint 규칙(React Compiler 대응)에서 모두 금지되어 있었다. 그래서 "메뉴가 열렸을 때의 pathname"과 "현재 pathname"을 비교해 열림 상태를 파생시키는 방식(`{ open, pathname }` 상태 + 파생 비교)으로 우회했다.
- 로고 PNG(`abubae-logo-horizontal-balanced.png`)가 알파 채널 없이 순백색(255,255,255) 배경으로 저장되어 있어, 사이트 배경(`--bg-subtle: #F8FAFC`)과 미세하게 달라 로고가 사각형 박스처럼 떠 보였다. "흰색과의 거리 기반 알파" 변환(흰색에 가까운 픽셀일수록 투명하게, 색이 있는 픽셀은 불투명 유지하며 언프리멀티플라이)으로 배경을 투명하게 만들어 해결했다.

## 테스트

- `exam-schedule.ts`/`exam-schedule-repository.ts`와 관리자 API 라우트: Vitest 단위/API 테스트(생성/조회/수정/삭제, 401/403/400/404/409 케이스 포함).
- `user-admin.ts`/`user-repository.ts`의 `createUser` 경로: 이메일 중복, Role 승격 실패, 프로필 재조회 실패 케이스까지 포함.
- `practical-exam.ts`: 대소문자·공백 무시 채점, 다중 빈칸 전부 정답이어야 정답 처리, 미응답 처리, 잘못된 payload 거부.
- `practical-question-repository.ts`: 공개 조회 시 정답 미노출, DB 오류 시 `PracticalContentUnavailableError`.
- `PracticalRoundRunner`/`PracticalRoundResult` 컴포넌트: 답안 유지, 다중 빈칸 렌더링, 미응답 경고, 채점 결과 표시.
- 전체 스위트 570개 통과, `npm run lint` 클린, `npm run build` 성공 확인(2026-08-04 기준).
