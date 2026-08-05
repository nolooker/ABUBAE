# 응시 이력 · 오답노트 · 문제 즐겨찾기 실행 기록

> 새 작업 지시서가 아니라 2026-08-05에 끝난 작업의 실행 기록이다.

**기준 설계서:** `docs/superpowers/specs/2026-08-05-exam-history-bookmarks-design.md`

## Task 1: 응시 이력 · 오답노트

- [x] `public.exam_attempts` 테이블 + self-service RLS(본인 SELECT/INSERT만) (`supabase-setup.sql`)
- [x] `src/lib/exam-attempt.ts`, `exam-attempt-repository.ts` + 테스트(저장/목록/상세/오답 dedup)
- [x] 필기·실기 채점 API에 채점 성공 후 best-effort 저장 연결 + 테스트(로그인/비로그인/저장 실패 케이스)
- [x] `/mypage/history` 목록 페이지
- [x] `/mypage/history/[attemptId]` 상세 페이지 + `ExamAttemptResultView` 클라이언트 래퍼("다시 풀기" → 실제 문제풀이 페이지로 이동)
- [x] `WrittenRoundResult`/`PracticalRoundResult`에 `savedNotice` prop 추가(저장된 기록 화면에서 "저장되지 않습니다" 문구 대체)
- [x] `/mypage/wrong-answers` 오답노트 페이지(회차별 그룹, 최신 응시 기준)
- [x] `/mypage`에 응시 기록·오답노트 카드 연결

## Task 2: 문제 단위 즐겨찾기

- [x] 기존 `public.bookmarks` 테이블 재사용 확정 (신규 SQL 없음)
- [x] `src/lib/bookmark.ts`, `bookmark-repository.ts`(self-service) + 테스트
- [x] `src/lib/bookmark-content.ts`(서비스 롤, 문제 메타데이터 조회) + 테스트
- [x] `POST/DELETE /api/bookmarks/questions/[questionId]` + 테스트
- [x] `BookmarkToggleButton` 컴포넌트(낙관적 토글, 비로그인 리다이렉트) + 테스트
- [x] `WrittenRoundRunner`/`PracticalRoundRunner`에 버튼 연결 + `initialBookmarkedIds`/`isLoggedIn` 전달
- [x] `/mypage/bookmarks` 페이지(`BookmarkRemoveButton` 포함)
- [x] `/mypage` 즐겨찾기 카드 연결

## 커밋

- [x] `c8568d5` — 두 기능 함께 커밋 (관련도가 높고 같은 세션에서 이어진 작업이라 번들)

## 검증

- [x] `npx vitest run` — 643개 테스트 통과
- [x] `npm run lint` — 클린
- [x] `npm run build` — 성공, 신규 라우트(`/mypage/history`, `/mypage/history/[attemptId]`, `/mypage/wrong-answers`, `/mypage/bookmarks`, `/api/bookmarks/questions/[questionId]`) 전부 정상 등록
- [x] 사용자가 Supabase SQL Editor에서 `exam_attempts` 테이블 생성 SQL 실행 완료 확인받음

## 다음 단계 (사용자 확인 필요)

1. 로그인 후 실제 문제 풀이 → 채점 → 마이페이지 확인까지 실사용 흐름은 사용자가 직접 검증하기로 함(자동화된 개발 서버 스모크 체크는 사용자가 보류).
2. 즐겨찾기/오답노트 UI가 늘어나면 회차 목록(`WrittenRoundList`/`PracticalRoundList`)에도 북마크 여부 표시를 추가할지는 이번 범위에서 다루지 않았다.
