# Search Console Checklist

## 1. Search Console 속성 추가
- Google Search Console에서 `https://abubae.vercel.app` 속성을 추가합니다.
- 가능하면 URL prefix 방식보다 Domain 속성도 함께 검토합니다.

## 2. 소유권 확인
- Vercel 도메인을 기준으로 메타 태그 또는 DNS 방식으로 소유권을 확인합니다.
- 커스텀 도메인을 붙이게 되면 그 도메인 기준으로 다시 확인하는 편이 좋습니다.

## 3. sitemap 제출
- 제출할 주소:
  - `https://abubae.vercel.app/sitemap.xml`

## 4. robots 확인
- 확인 주소:
  - `https://abubae.vercel.app/robots.txt`

## 5. 우선 색인 요청할 페이지
- `/`
- `/exam/jeongchogi`
- `/exam/jeongchogi/questions`
- `/quiz/daily`
- `/resources`
- `/blog`
- `/reviews`

## 6. 블로그/후기 운영 팁
- `/blog/[slug]`와 `/reviews/[slug]`는 제목에 키워드를 직접 포함합니다.
- 본문 첫 문단은 검색 결과 설명처럼 자연스럽게 씁니다.
- 각 글에서 `정처기 허브`, `기출문제`, `자료실`로 내부 링크를 꼭 연결합니다.

## 7. 지금 단계에서 기억할 것
- Search Console 연결 자체는 Google 계정에서 직접 진행해야 합니다.
- 코드는 이미 sitemap, robots, canonical, JSON-LD 기준을 갖춘 상태로 준비되어 있습니다.
