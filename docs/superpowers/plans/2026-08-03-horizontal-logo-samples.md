# Horizontal Logo Samples Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** 원본 로고를 보존하면서 펭귄이 크고 문구가 오른쪽에 놓인 가로형 PNG 시안 두 개를 만든다.

**Architecture:** 원본 PNG를 편집 대상 이미지로 사용해 두 번의 독립적인 이미지 편집을 수행한다. 각 결과는 별도 파일로 저장하고 육안으로 구성과 한글 정확성을 검수한다.

**Tech Stack:** OpenAI 내장 이미지 생성 도구, PNG, Codex 이미지 검사 도구

## Global Constraints

- `public/images/brand/abubae-logo-primary.png`는 변경하지 않는다.
- 문구는 정확히 `아직 부족해도 괜찮은 배움`이다.
- 기존 손그림 스타일과 검정·흰색·파란색 팔레트를 유지한다.
- 결과 파일은 `public/images/brand/` 아래에 저장한다.

---

### Task 1: 균형형 가로 로고 생성

**Files:**
- Read: `public/images/brand/abubae-logo-primary.png`
- Create: `public/images/brand/abubae-logo-horizontal-balanced.png`

**Interfaces:**
- Consumes: 원본 로고 PNG
- Produces: 문구가 `아직 부족해도` / `괜찮은 배움`으로 배치된 가로형 PNG

- [ ] **Step 1: 원본 이미지를 편집 대상으로 로드한다**
- [ ] **Step 2: 펭귄 확대와 오른쪽 2줄 문구 배치를 지정해 시안을 생성한다**
- [ ] **Step 3: 결과를 지정된 새 파일명으로 저장한다**
- [ ] **Step 4: 원본 보존, 구성, 문구 정확성을 육안 검수한다**

### Task 2: 배움 강조형 가로 로고 생성

**Files:**
- Read: `public/images/brand/abubae-logo-primary.png`
- Create: `public/images/brand/abubae-logo-horizontal-emphasis.png`

**Interfaces:**
- Consumes: 원본 로고 PNG
- Produces: `배움`이 크게 강조된 가로형 PNG

- [ ] **Step 1: 원본 이미지를 편집 대상으로 로드한다**
- [ ] **Step 2: 펭귄 확대와 오른쪽 강조 문구 배치를 지정해 시안을 생성한다**
- [ ] **Step 3: 결과를 지정된 새 파일명으로 저장한다**
- [ ] **Step 4: 원본 보존, 구성, 문구 정확성 및 두 시안의 차이를 육안 검수한다**
