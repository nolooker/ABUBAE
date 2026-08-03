# Home Horizontal Logo Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** 홈 페이지 전용 푸터에 A안 가로형 로고를 적용한다.

**Architecture:** `src/app/page.tsx`의 기존 `next/image` 컴포넌트를 그대로 사용하고 이미지 경로, 고유 크기, 표시 너비만 변경한다. 공용 레이아웃 컴포넌트와 다른 페이지는 수정하지 않는다.

**Tech Stack:** Next.js App Router, React, `next/image`, Tailwind CSS

## Global Constraints

- 홈 페이지 전용 푸터만 변경한다.
- 원본 `public/images/brand/abubae-logo-primary.png`는 보존한다.
- A안 `public/images/brand/abubae-logo-horizontal-balanced.png`를 사용한다.
- 공용 헤더·푸터 및 다른 페이지는 변경하지 않는다.

---

### Task 1: 홈 푸터 로고 교체

**Files:**
- Modify: `src/app/page.tsx:325`
- Consume: `public/images/brand/abubae-logo-horizontal-balanced.png`

**Interfaces:**
- Consumes: `/images/brand/abubae-logo-horizontal-balanced.png` 정적 공개 경로
- Produces: 홈 푸터에서만 렌더링되는 가로형 브랜드 이미지

- [ ] **Step 1: 현재 홈 페이지에 기존 로고 참조가 있는지 확인한다**

Run: `rg -n "abubae-logo-primary|abubae-logo-horizontal-balanced" src/app/page.tsx`

Expected: 홈 푸터가 `abubae-logo-primary.png`를 참조한다.

- [ ] **Step 2: 이미지 속성을 최소 변경한다**

```tsx
<Image
  src="/images/brand/abubae-logo-horizontal-balanced.png"
  alt="아직 부족해도 괜찮은 배움 로고"
  width={1915}
  height={821}
  className="h-auto w-full max-w-[300px]"
/>
```

- [ ] **Step 3: 홈에서만 새 이미지가 참조되는지 확인한다**

Run: `rg -n "abubae-logo-horizontal-balanced" src`

Expected: `src/app/page.tsx` 한 곳만 출력된다.

- [ ] **Step 4: 전체 테스트를 실행한다**

Run: `npm test -- --run`

Expected: 모든 테스트 파일과 테스트가 통과한다.
