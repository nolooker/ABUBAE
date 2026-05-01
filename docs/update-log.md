# ABUBAE 업데이트 로그

ABUBAE 프로젝트에서 무엇을 바꿨는지 빠르게 따라갈 수 있도록 정리한 작업 기록입니다.

## 2026-04-23

### 인프라 / 연결
- GitHub 저장소 `nolooker/ABUBAE`와 로컬 프로젝트를 연결했다.
- Vercel 프로젝트를 `abubae` 기준으로 정리하고 프로덕션 주소를 `https://abubae.vercel.app`로 맞췄다.
- Supabase 연결 패키지와 기본 환경 변수를 세팅했다.

### MVP 페이지 뼈대
- 다음 기본 페이지들을 만들었다.
  - `/`
  - `/exam`
  - `/exam/[slug]`
  - `/exam/[slug]/questions`
  - `/exam/[slug]/questions/[id]`
  - `/resources`
  - `/resources/[id]`
  - `/quiz/daily`
  - `/login`
  - `/signup`
  - `/mypage`
  - `/admin`
  - `/admin/login`
- Supabase 데이터가 비어 있을 때도 화면이 유지되도록 mock fallback 구조를 넣었다.

### 브랜드 방향
- 아부배의 톤을 `따뜻한 멘토형`으로 정리했다.
- 핵심 문구를 `아직 부족해도 괜찮은 배움` 방향으로 확정했다.

## 2026-04-25

### 홈 화면 리디자인
- 홈 화면을 카드형 브랜드 허브 구조로 다시 정리했다.
- 홈 전용 헤더와 내부 공통 헤더를 분리해서 운영하기 시작했다.
- 컬러/버튼/배지/카드 스타일을 디자인 시스템처럼 재사용할 수 있게 정리했다.

### 로고 / 브랜딩 자산
- 로고 시안 여러 개를 `public/images/brand/`와 `public/images/brand/archive/`에 정리했다.
- 홈/내부 페이지에서 사용하는 로고를 구분해서 적용했다.

## 2026-04-27

### 데이터 연결 시작
- 브랜치 `feature/foundation-data`에서 실제 DB 연결 작업을 시작했다.
- `src/lib/data.ts`에서 Supabase 우선 조회 + mock fallback 구조를 유지한 채 데이터 접근 레이어를 정리했다.

### 시험 허브 / 기출 구조 개편
- `/exam/[slug]`에서 필기 / 실기로 먼저 나누는 구조를 만들었다.
- `/exam/[slug]/questions`에 `필기 기출 / 실기 기출` 탭을 붙였다.
- 필기 기출은 회차별 선택 구조로, 실기 기출은 답안형 mockup으로 정리했다.

### 관리자 기능 추가
- `/admin/questions`에서 필기 문제 등록 화면을 만들었다.
- 실기 문제 등록 UI도 추가했다.
- 내부 헤더에 `Admin` 진입점을 추가했다.

## 2026-04-28

### 문제 이미지 저장 구조 추가
- 문제 본문과 보기 사이에 그림이 들어갈 수 있도록 `questions.image_url`, `questions.image_caption` 구조를 반영했다.
- 문제 상세 페이지는 이미지가 있으면 표시하고, 없으면 바로 보기 목록으로 넘어가게 정리했다.
- 관리자 문제 등록 화면에 `문제 이미지 URL`, `이미지 설명` 입력칸을 추가했다.
- 관련 SQL/문서를 추가했다.
  - `docs/sql/question-image-columns.sql`
  - `docs/sql/storage-buckets-setup.sql`
  - `docs/storage-plan.md`

### Storage / SQL 운영 파일 정리
- Supabase Storage 버킷 구조를 정리했다.
  - `question-images` (public)
  - `resource-previews` (public)
  - `resource-files` (private)
- 2020년 정처기 필기 import용 SQL과 스크립트를 정리했다.
  - `scripts/import_jeongchogi_written_pdf.py`
  - `docs/sql/2020-jeongchogi-written-*.sql`
- 2020년 임시 import 데이터를 지울 수 있도록 cleanup SQL을 추가했다.
  - `docs/sql/delete-2020-jeongchogi-written.sql`

### 자유게시판 추가 / 단순화
- `/board`를 자유게시판 전용 페이지로 정리했다.
- 공지사항/합격후기 탭은 제거하고, 자유게시판 하나만 사용하는 방향으로 단순화했다.
- 제목 없이 textarea 하나로 바로 글을 등록하는 구조로 만들었다.
- `posts` 테이블의 `type = 'note'`를 자유게시판 글로 사용하도록 연결했다.
- 자유게시판 글 등록용 정책 SQL을 추가했다.
  - `docs/sql/posts-free-board-policy.sql`
- 샘플 글 6개를 넣어서 스크롤 동작을 확인할 수 있게 했다.

### 자유게시판 UX 조정
- textarea를 더 크게 키웠고, 처음부터 스크롤이 보이지 않도록 `overflow-hidden`, `resize-none`을 적용했다.
- 목록은 최근 글이 먼저 보이고 아래로 스크롤되는 구조로 맞췄다.

### 헤더 / 네비게이션 통일
- 홈 헤더와 내부 헤더의 주요 메뉴를 같은 5개 기준으로 통일했다.
  - `정처기`
  - `기출문제`
  - `오늘의 문제`
  - `자료실`
  - `자유게시판`
- 블로그, 합격후기는 아직 전용 페이지를 만들기 전 단계라 이번 네비에는 넣지 않았다.

### 홈 화면 추가 정리
- 홈 푸터에서 `아직 부족해도 괜찮은 배움` 텍스트 한 줄을 제거했다.
- 저작권 연도를 `2025`로 수정했다.
- 홈 `page.tsx`의 깨진 한글/문자열 문제를 정리하면서 안정적인 버전으로 다시 정리했다.

### 오늘 기준 다음 우선순위
- `/blog` 페이지 만들기
- `/reviews` 페이지 만들기
- 자유게시판 실제 DB 등록 흐름 검증
- 최신 회차 기출문제 우선 입력

## 2026-04-29

### 블로그 / 합격후기 페이지 추가
- `/blog`와 `/reviews` 목록 페이지를 만들었다.
- 두 페이지 모두 `posts` 테이블을 읽고, 데이터가 비어 있을 때는 fallback 카드가 보이도록 구성했다.
- 블로그/후기 전용 데이터 접근 레이어를 `src/lib/content-feed.ts`로 분리했다.

### 상세 페이지와 검색 노출 준비
- `/blog/[slug]`, `/reviews/[slug]` 상세 페이지를 추가했다.
- 목록에서 상세로 이동할 수 있게 링크를 연결했다.
- 각 목록/상세 페이지에 메타 정보, canonical, Open Graph, Twitter 카드, JSON-LD 구조화 데이터를 넣었다.

### sitemap / robots / 검색 콘솔 준비
- `src/app/sitemap.ts`를 추가해서 공개 페이지와 블로그/후기 상세 페이지가 sitemap에 포함되도록 했다.
- `src/app/robots.ts`를 추가해서 기본 크롤링 규칙과 sitemap 경로를 노출했다.
- Search Console 연결용 체크리스트 문서를 `docs/search-console-checklist.md`로 정리했다.
- Search Console 실제 연결은 다음 작업으로 미뤘다.

### 헤더 메뉴 확장
- 홈 헤더와 내부 헤더 메뉴에 `블로그`, `합격후기`를 추가했다.
- 공통 헤더 메뉴는 다음 7개 기준으로 확장했다.
  - `정처기`
  - `기출문제`
  - `오늘의 문제`
  - `자료실`
  - `블로그`
  - `합격후기`
  - `자유게시판`
- 홈 헤더 메뉴가 두 줄로 보이지 않도록 간격과 글자 크기를 조정했다.

## 2026-05-01

### 블로그 / 합격후기 상세 디자인 정리
- `/blog/[slug]`, `/reviews/[slug]` 상세 페이지 레이아웃을 같은 톤으로 다시 정리했다.
- 상단에 목록 복귀 링크, 배지, 날짜, 조회수, 제목, 요약을 더 또렷하게 보이도록 재배치했다.
- 본문은 읽기 카드 구조로 정리하고 문단 간격과 여백을 키워 장문도 편하게 읽히도록 다듬었다.
- 오른쪽 보조 영역에 다음 이동 CTA와 페이지 성격을 설명하는 요약 카드를 추가했다.
- 하단 관련 글 / 관련 후기 카드도 같은 디자인 톤으로 맞춰서 이어보는 흐름을 강화했다.
