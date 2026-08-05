# 사이트 전수 리뷰 대응 실행 기록

> 새 작업 지시서가 아니라 2026-08-05에 끝난 작업의 실행 기록이다.

**기준 설계서:** `docs/superpowers/specs/2026-08-05-site-review-fixes-design.md`

## Task 0: 사이트 전수 리뷰

- [x] 개발 서버 + Playwright 스크린샷으로 홈/헤더/푸터/exam/mypage 등 주요 페이지 실사용 확인
- [x] 코드 확인으로 원인 추적, 심각도순 7개 항목 정리
- [x] 사용자와 우선순위 협의 (1번부터 진행, 2/3/4번 보류)

## Task 1: 레거시 mock 폴백 제거, 실제 콘텐츠 연결

- [x] `/quiz/daily` 삭제 (공개 조회가 정답을 노출하지 않는 보안 원칙과 충돌하는 UX라 되살리지 않기로 사용자 결정)
- [x] 홈 화면의 "오늘의 문제" 배너 제거
- [x] 레거시 `/exam/[slug]/questions/[id]` 삭제 (더 이상 참조하는 곳 없음, 실기 문제 표현 불가)
- [x] 아무 데서도 안 쓰이던 `src/components/home/*` 죽은 컴포넌트 3개 삭제
- [x] `src/lib/exam-content-stats.ts` 작성 (필기+실기 회차 요약 합산) + 테스트
- [x] `/exam/[slug]/page.tsx`, `/exam/page.tsx` 실제 통계로 재작성
- [x] `src/lib/data.ts`/`mock-data.ts`에서 죽은 문제 관련 함수·타입 제거
- [x] 커밋: `b033321`

## Task 2: 약관 페이지 + 모바일 로고 버그

- [x] `/terms`, `/privacy` 신규 작성 (표준 템플릿, 사업자 정보는 플레이스홀더)
- [x] 홈 화면 자체 푸터 죽은 링크(`href="#"`) 정리 → `/notices`, `/terms`, `/privacy`
- [x] 모바일 하단 탭바 "즐겨찾기" 링크 `/mypage/bookmarks`로 수정
- [x] 모바일 헤더 로고 거의 안 보이는 버그 원인 규명 (원본 크기 그대로 `next/image`에 전달 → 브라우저 20배 축소) 및 수정 (헤더/양쪽 푸터 3곳 모두 표시 크기에 맞는 width/height로 교체)
- [x] 커밋: `ac6acac`

## Task 3: 자유게시판 카테고리

- [x] `board_posts.category`(`free`/`review`, 기본 `free`) 추가
- [x] 게시판 목록 전체/자유/후기 탭 필터
- [x] 글쓰기·수정 폼 카테고리 선택 버튼, 목록·상세 카테고리 배지
- [x] `board.ts`/`board-repository.ts`/API 라우트/`BoardPostForm` 테스트 전부 업데이트
- [x] 홈 화면 "합격후기"를 실제 후기로 교체하는 건 이번 범위 밖 (관리자 승인/노출 단계 필요, 게시글 0개라 다음 단계로 미룸)
- [x] 커밋: `89a7a59`

## 검증

- [x] `npx vitest run` — 652개 테스트 통과
- [x] `npm run lint` — 클린
- [x] `npm run build` — 성공, 삭제된 라우트(`/quiz/daily`, `/exam/[slug]/questions/[id]`) 빌드 결과에서 사라짐 확인
- [x] Playwright 헤드리스로 모바일/데스크톱 로고, 실제 통계, 게시판 탭 전환 스크린샷 확인

## 다음 단계 (사용자 확인 필요)

1. `board_posts.category` 컬럼 추가 SQL을 Supabase SQL Editor에서 재실행해야 카테고리가 실제로 저장된다.
2. PDF 상품 카드(7개 중 3개 404, 4개 내용 불일치) — PDF 콘텐츠 준비되면 진행.
3. 홈 화면 가짜 통계·후기를 실제 데이터로 교체 — 게시판에 실제 후기가 쌓인 뒤, 관리자가 골라 노출하는 단계를 별도로 설계해야 함.
4. 자료/PDF 업로드·다운로드 시스템, 관리자 대시보드 남은 카드, SEO/커스텀 도메인, 카카오 로그인, 구글 OAuth 게시 — 전부터 보류 중인 항목, 여전히 미착수.
