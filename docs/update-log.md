# ABUBAE 업데이트 로그

아부배 프로젝트에서 오늘 무엇을 했는지 추적하기 위한 작업 기록입니다.

## 2026-04-23

### GitHub / Vercel 연결

- 로컬 프로젝트 `C:\Users\user\Desktop\abubae\edu-brand`를 GitHub 저장소 `nolooker/ABUBAE`에 연결했다.
- Vercel 프로젝트 이름을 `abubae` 기준으로 정리했다.
- 기본 공유 주소를 `https://abubae.vercel.app`로 맞췄다.
- `abubae.vercel.app`이 실제 프로덕션 배포를 가리키도록 alias 및 project domain을 연결했다.
- Vercel 배포 보호 설정 때문에 폰에서 안 보이던 문제를 확인했고, Vercel Authentication 보호를 해제해야 한다는 원인을 파악했다.

### 프로젝트 인프라

- Supabase 클라이언트 패키지를 설치했다.
  - `@supabase/ssr`
  - `@supabase/supabase-js`
- Supabase 초기 테이블 생성을 위한 `supabase-setup.sql`을 준비했다.
- DB 데이터가 없을 때도 화면이 뜨도록 mock data fallback 구조를 추가했다.
- `src/tpyes` 오타 폴더를 `src/types`로 수정했다.

### MVP 페이지 구성

- 다음 MVP 페이지들을 추가했다.
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

### 인증 / 관리자

- 일반 로그인/회원가입은 Supabase Auth 기준으로 구성했다.
- 관리자 로그인은 이메일 방식 대신 master 코드 방식으로 단순화했다.
- 기본 관리자 코드는 `master`로 설정했다.
- 공개 홈에서는 Admin 링크를 숨기고, `/admin/login` 주소로 직접 접근하는 방식으로 정리했다.

### 홈 화면 정리

- 홈이 난잡해 보이지 않도록 섹션을 4단계로 단순화했다.
  - 브랜드 히어로
  - 인기 학습 자료
  - 오늘의 문제
  - 자격증별 학습 허브
- 아직 없는 메뉴인 `합격후기`, `프리미엄`, `/quiz` 링크를 상단 메뉴에서 제거했다.
- 상단 메뉴의 `문제풀기`는 실제 존재하는 `/quiz/daily`로 연결했다.
- 자료 섹션에서 같은 자료가 중복 노출되던 구조를 제거했다.
- 코드에 `[화면]`, `[기능]`, `[숨김 후보]` 주석을 추가해 수정 위치를 쉽게 찾을 수 있게 했다.

### 브랜드 방향

- 아부배의 브랜드 톤을 `따뜻한 멘토형`으로 정했다.
- 홈 히어로 핵심 문구를 다음으로 결정했다.

```text
아직 부족해도 괜찮은 배움
```

- 보조 문구는 다음으로 정리했다.

```text
자격증 공부가 막막할 때, 오늘 볼 자료와 풀 문제를 차근차근 정리해드립니다.
```

### 홈 이미지 / 비주얼

- 따뜻한 멘토형 브랜드에 맞는 홈 히어로 이미지를 생성했다.
- 최종 반영 이미지:
  - `public/images/home-hero-mentor.png`
- 히어로 이미지를 배경으로 사용하고, 왼쪽에 텍스트가 읽히도록 흰색 오버레이를 추가했다.
- 히어로 높이를 키웠다.
  - 모바일/작은 화면: 최소 `520px`
  - 데스크탑: 최소 `640px`
- 기존 책 아이콘은 히어로 이미지와 중복되어 제거했다.

### 헤더 배너

- 헤더 상단에 공지/프로모션 배너를 추가했다.
- 현재 배너 문구:

```text
정처기 무료 요약노트와 오늘의 문제를 먼저 공개했어요.
```

- 배너는 `/resources`로 연결된다.
- `src/components/layout/Header.tsx` 상단의 `announcement` 객체에서 문구와 링크를 바꿀 수 있게 했다.
- `enabled: false`로 바꾸면 배너를 숨길 수 있다.

### 배포한 주요 커밋

- `Build ABUBAE MVP pages`
- `Ignore Vercel project files`
- `Clean up ABUBAE home sections`
- `Add header announcement banner`
- `Add warm mentor home hero`

### 현재 운영 주소

- Production: `https://abubae.vercel.app`
- GitHub: `https://github.com/nolooker/ABUBAE`

### 다음에 하면 좋은 일

- Supabase에 실제 시험/자료/문제 데이터를 입력한다.
- `/blog` 페이지가 아직 없으므로 공지사항 링크를 살리려면 블로그 목록 페이지를 만든다.
- Search 버튼은 아직 UI만 있으므로 검색 페이지 또는 검색 모달을 연결한다.
- 자료 카드에 실제 PDF 미리보기 이미지 또는 과목별 썸네일 규칙을 추가한다.
- 사용하지 않는 로컬 테스트 이미지 `public/images/home-hero.png`는 필요 없으면 삭제한다.

## 2026-04-25

### 홈 화면 리디자인

- 홈 화면을 기존 섹션 조합형 구조에서 더 단정한 브랜드형 랜딩 구조로 다시 정리했다.
- 홈 전용 네비게이션, 히어로, 오늘의 문제, 자료 리스트, 후기, 모바일 탭바를 한 화면 흐름으로 재구성했다.
- 가운데 메뉴가 기준 이미지처럼 보이도록 `로고 - 가운데 메뉴 - 오른쪽 CTA` 배치로 정리했다.
- 상단 배너 문구 `정처기 무료 요약노트와 오늘의 문제를 먼저 공개했어요.` 는 제거했다.

### 디자인 시스템 적용

- `abubaebrand_design_system.html`을 기준으로 컬러 토큰과 버튼/배지 스타일을 코드에 옮기기 시작했다.
- `src/app/globals.css`에 다음 공통 UI 클래스를 추가했다.
  - `ab-btn`
  - `ab-btn-primary`
  - `ab-btn-secondary`
  - `ab-btn-orange`
  - `ab-btn-ghost`
  - `ab-badge-*`
  - `ab-card`
- 홈 화면 일부 요소를 위 공통 클래스로 교체해서, 다른 페이지에도 같은 톤을 재사용할 수 있게 했다.

### 컬러 / 톤 조정

- 홈 화면에서 파란색이 너무 많이 보이지 않도록 색 사용 비중을 줄였다.
- 브랜드 블루는 강조용으로만 남기고, 기본 텍스트/네비/지표 숫자는 중성 톤 위주로 다시 정리했다.
- PRO / NEW / 인기 배지 색도 더 부드럽고 덜 튀게 조정했다.

### 브랜드 문구 / 로고

- 홈 상단 브랜드 문구를 `아직 부족해도 괜찮은 배움`으로 통일했다.
- 여러 로고 시안 중 다음 조합을 채택했다.
  - 대표 로고: `abubae_logo_02.png`
  - 탑바용 간단 로고: `abubae_logo_06.png`
  - 심볼 로고: `abubae_logo_04.png`
- 프로젝트에 아래 파일명으로 저장했다.
  - `public/images/brand/abubae-logo-primary.png`
  - `public/images/brand/abubae-logo-topbar.png`
  - `public/images/brand/abubae-logo-symbol.png`
- 이후 상단 탑바도 `2번` 로고를 쓰는 방향으로 다시 바꿨고, 로고가 네비 높이를 뚫지 않도록 크기와 컨테이너를 같이 조정했다.

### 설정 / 에디터 경고 정리

- `tsconfig.json`에서 deprecated 경고가 뜨던 `baseUrl`을 제거하고, alias는 `paths`로만 유지했다.
- `src/app/globals.css`는 Tailwind v4 방식에 맞게 `@import "tailwindcss";` 구조로 정리했다.
- VS Code에서 `@apply`, `@tailwind` 같은 Tailwind 전용 at-rule 경고가 반복되지 않도록 `.vscode/settings.json`을 추가했다.

### 빌드 확인

- 주요 변경 이후 `npm run build`를 반복 실행해 빌드가 계속 통과하는 상태를 확인했다.

### 다음에 하면 좋은 일

- 홈 `page.tsx`는 현재 코드량이 많으므로 `HomeTopNav`, `HomeHero`, `HomeStats` 같은 역할별 컴포넌트로 분리한다.
- `/resources` 페이지를 네이버 도서/자료 목록 같은 세로 리스트형 UI로 바꾼다.
- 파비콘과 브라우저 탭 아이콘도 `abubae-logo-symbol.png` 기준으로 맞춘다.

## 2026-04-27

### ������ ���� �۾� ����

- �۾� �귣ġ `feature/foundation-data`�� �����ϰ�, ������ �ܰ� �������� DB ���� �۾��� �����ߴ�.
- `src/lib/data.ts`�� �������� ���� ���/�� �������� Supabase�� ���� �а�, ���� �� mock data�� �������� ������ �����ߴ�.
- `getQuestion(slug, id)`�� ���� ��ü�� �� ���� �ʰ� ���� 1���� ���� ��ȸ�ϴ� ������� �����ߴ�.

### ���� ��� ���� ����

- `��ó��` �� �帧�� `�ʱ� / �Ǳ�`�� ���� ������ �������� ������ �ٲ��.
- �߰��� ���:
  - `/exam/[slug]/written`
  - `/exam/[slug]/practical`
- `/exam/[slug]`���� �ٷ� `�ʱ�`, `�Ǳ�` ī��� ������ �� �ְ� �ߴ�.

### ���⹮�� ��� UX ����

- `/exam/jeongchogi/questions` ���������� ȸ������ ������ ���� ���� ���̰� �����ߴ�.
- `���⹮�� ���` �Ʒ��� `�ʱ� ���� / �Ǳ� ����` ���� �߰��ߴ�.
- �� ���� ������ �̵��� �ƴ϶� �Ʒ� ������ ������ �ٲ�� ������� �����Ѵ�.
- `�ʱ� ����` �ǿ����� ȸ�� ��ư�� ������ �ش� ȸ�� ������ ���̰� �����ߴ�.
- `�Ǳ� ����` ���� mockup �ܰ�� ���� �������, ū textarea�� ������/�ۼ� �� ������ ���Եȴ�.

### ���� ������ ��� ����

- Ȩ�� �ƴ� ���� ������ ��� ��� �ΰ��� `abubae-logo-08.png`�� �����ߴ�.
- Ȩ(`/`)�� ���� Ȩ ���� �ΰ��� �����ϰ�, ����/����/���� ������ �ʸ� ���� �ΰ��� ������ �и��ߴ�.
- ���� ��� ������ `Admin` ���� ��ư�� �߰��ߴ�.

### ������ ���� ��� ȭ�� �߰�

- `/admin` ��ú��带 � �������� �ٽ� �����ߴ�.
- �� ������ `/admin/questions`�� �߰��ߴ�.
- �� ȭ�鿡�� �����ڰ� DB�� ������ ���� ������ �� �ֵ��� �������.

#### �ʱ� ���� ���

- ���� ���:
  - `questions`
  - `choices`
- �Է� �׸�:
  - ����
  - ����
  - ����
  - ȸ��
  - ���� ��ȣ
  - ���̵�
  - ���� ����
  - ���� 4��
  - ���� ��ȣ
  - �ؼ�

#### �Ǳ� ���� ���

- ������ ȭ�鵵 `�ʱ� ���� ��� / �Ǳ� ���� ���`���� �и��ߴ�.
- �Ǳ� ��� UI�� ū textarea �߽����� �����ߴ�.
- ���� ����� `questions` + `answer_text` �������� �����ߴ�.
- �Ǳ� ������ DB�� `exam_part`, `answer_text` �÷��� �־�� ������ �Ϸ�ȴ�.

### Supabase Ȯ��/� �޸�

- Supabase SQL Editor���� `exams`, `questions`, `choices` �����͸� Ȯ���ϴ� SQL�� �����ߴ�.
- ���� ��ó�� `questions` �����Ͱ� ��� �ִ� ���¶�� ���� Ȯ���߰�, ���� ���⹮�� ����� mock fallback�� ���� ���� ���ɼ��� ����.
- �Ǳ� ������ ���� ���̺� �и� ��� `questions` ���̺� Ȯ��(`exam_part`, `answer_text`) ������� ���� ������ Ȯ���ߴ�.

### ���� Ȯ���� ����

- `npm run build` ���
- ���Ʈ ���� ���� Ȯ��:
  - `/admin`
  - `/admin/questions`
  - `/exam/[slug]`
  - `/exam/[slug]/written`
  - `/exam/[slug]/practical`
  - `/exam/[slug]/questions`
  - `/exam/[slug]/questions/[id]`

### ������ �ٷ� �ϸ� ���� ��

- Supabase�� ���� �ʱ� ���� 3~5������ �ְ� ��� �ݿ� Ȯ��
- �Ǳ�� `exam_part`, `answer_text` �÷��� ���� �� �Ǳ� ���� �׽�Ʈ
- ������ ȭ�鿡�� ����� ������ ����/�����ϴ� 2�� ��� �߰�
