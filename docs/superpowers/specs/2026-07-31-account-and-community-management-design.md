# 자유게시판 운영 도구 · 관리자 유저 관리 · 로그인 UX 설계

> 이 문서는 2026-07-29~07-31 사이에 구현이 끝난 기능을 사후에 기록한 as-built 설계다. 실제 코드는 이 문서보다 먼저 존재하며, 아래 내용은 이미 커밋되었거나(표시된 커밋 해시) 이 시점 기준 로컬에서 테스트까지 통과한 상태다.

## 목표

- 자유게시판을 일반 게시판 전용 도메인으로 분리하고, 댓글·대댓글·수정·삭제·모더레이션·신고까지 다룬다.
- 관리자가 회원 목록을 조회하고 멤버십 등급과 계정 정지를 직접 처리할 수 있게 한다.
- 로그인 상태 표시와 로그인 방식(이메일/구글)의 UX 결함을 제거한다.

## 범위

### 1. 자유게시판 (커밋 `7c5404d`, `a1da14a`)

- 로그인한 모든 회원이 글/댓글을 작성·수정·삭제한다 (본인 소유만).
- 댓글은 1단계 대댓글까지만 허용한다 (대댓글의 대댓글 금지, 애플리케이션 계층에서 `parent_comment_id`가 이미 `NULL`인 댓글에만 답글을 허용).
- 댓글은 작성자만 수정할 수 있고, 수정 시 `(수정됨)` 표시를 남긴다.
- 게시글 상세 페이지에서 작성자 본인이 바로 삭제할 수 있는 버튼을 제공한다 (편집 페이지 진입 없이).
- Master는 글/댓글을 소유자와 무관하게 강제 삭제할 수 있다.
- 신고는 자유 텍스트 사유로 받고, 대상은 글 또는 댓글이다. Master만 `/admin/reports`에서 신고 큐를 조회·처리(해결 처리)할 수 있다.

### 2. 관리자 유저 관리 (커밋 `834c513`)

- `/admin/users`에서 이메일·닉네임 검색과 함께 회원 목록(가입일, 멤버십, 정지 상태)을 조회한다.
- 행마다 멤버십 등급(무료/스탠다드/프리미엄)을 즉시 변경할 수 있다.
- 행마다 계정 정지/해제를 처리한다. Master의 역할 승격/강등은 이번 범위에서 의도적으로 제외했다.
- 정지는 앱 레벨 플래그가 아니라 Supabase Auth Admin API의 `ban_duration`을 사용해 실제 로그인 자체를 막는다.
- 자기 자신을 정지할 수 없도록 API와 화면에서 이중으로 막는다.

### 3. 로그인 UX와 소셜 로그인 (미커밋, 로컬 테스트 통과)

- 헤더의 로그인 CTA를 "무료 시작"에서 "로그인"으로 바꾸고 `/login`으로 연결한다. `/login`에는 이미 회원가입 링크가 있다.
- 헤더의 "{닉네임}님" 버튼을 클릭 가능한 드롭다운(마이페이지/로그아웃)으로 바꾼다.
- **버그 수정**: 이메일/비밀번호 로그인은 별도 서버 라우트(`/api/auth/login`)에서 쿠키만 갱신하므로, 브라우저의 Supabase 클라이언트가 마운트 시 한 번만 확인하던 로그인 상태가 갱신되지 않는 결함이 있었다. `usePathname()`을 의존성에 추가해 경로 이동마다 로그인 상태를 다시 확인하도록 고쳤다.
- 구글 로그인을 `signInWithOAuth` + `/auth/callback` 라우트(코드 교환, open-redirect 방지)로 붙였다.
- 카카오 로그인은 코드까지는 만들었으나 **배포 이후로 보류**한다: Supabase의 카카오 연동이 `account_email`, `profile_image`, `profile_nickname` 세 스코프를 항상 요청하도록 고정되어 있어, 카카오 개발자 콘솔에서 "카카오계정(이메일)" 동의항목을 켜려면 비즈니스 인증이 필요하다. `SocialLoginButtons.tsx`의 `KAKAO_ENABLED` 플래그를 `true`로 바꾸면 즉시 재노출된다.
- 다른 페이지(홈 제외) 푸터의 "서비스 > 관리자" 링크는 로그인한 Master에게만 보이도록 클라이언트에서 `public.users.role`을 확인해 조건부로 렌더링한다.

## 권한과 데이터 흐름

- 게시판(`board_posts`/`board_comments`/`board_reports`)은 RLS로 공개 SELECT + 소유자 범위 INSERT/UPDATE/DELETE를 허용하고, `public.is_master()`를 활용한 별도 허용 정책으로 Master 강제 삭제를 추가한다. 서비스 역할 키가 필요 없는 "self-service RLS" 패턴이다.
- 유저 관리(`public.users` 갱신, Auth Admin API 호출)는 `REVOKE UPDATE ... FROM PUBLIC, anon, authenticated`로 직접 RLS 갱신이 불가능하므로, `createServiceClient()` + `requireMaster()` 검증을 거치는 "관리 콘텐츠" 패턴을 그대로 따른다.
- 소셜 로그인 콜백은 `createClient()`(요청 스코프 서버 클라이언트)로 `exchangeCodeForSession`을 수행하고, `next` 파라미터는 `/`로 시작하고 `//`나 `\`를 포함하지 않는 경로만 허용한다.

## 화면

- `/board`, `/board/[postId]`, `/board/[postId]/edit`, `/board/new`
- `/admin/reports`: 신고 큐, 글/댓글 구분 배지, 신고 사유, 처리 완료 버튼
- `/admin/users`: 검색창, 표(이메일/닉네임/가입일/멤버십 셀렉트/상태 배지/정지 버튼)
- 헤더: 닉네임 드롭다운(마이페이지/로그아웃), 비로그인 시 "로그인" 버튼
- `/login`, `/signup`: 하단에 "또는" 구분선 + 구글 로그인 버튼(카카오는 `KAKAO_ENABLED=false`로 숨김)

## 테스트

- `src/lib/board.ts`, `board-repository.ts`와 각 API 라우트: Vitest 단위/API 테스트
- `src/lib/user-admin.ts`, `user-repository.ts`, 멤버십/정지 API 라우트: Vitest 단위/API 테스트 (인가 401/403, 검증 400, 404, 성공 204, 500 리댁션까지 포함)
- `SocialLoginButtons.test.tsx`: 구글 플로우의 redirect URL 조합, 카카오 버튼 숨김, 실패 시 에러 노출·재시도 가능 상태
- `src/app/auth/callback/route.test.ts`: 코드 교환 성공/실패, `next` 안전 경로 검증, open-redirect 시도 차단
- 전체 스위트 430개 테스트 통과, `npm run lint` 클린, `npm run build` 성공 확인 (2026-07-31 기준)
