# 응시 이력 · 오답노트 · 문제 즐겨찾기 설계

> as-built 설계 문서. `docs/superpowers/specs/2026-08-04-exam-schedule-practical-quiz-design.md` 이후, 2026-08-05에 구현이 끝난 기능을 사후에 기록한다.

## 목표

- 로그인 회원이 지금까지 채점받은 필기·실기 회차와 점수를 다시 확인할 수 있게 한다.
- 아직 틀렸거나 미응답인 문제만 모아보는 오답노트를 제공한다.
- 다시 보고 싶은 문제를 회차 전체가 아니라 문제 단위로 표시해두는 즐겨찾기를 제공한다.

## 범위

### 1. 응시 이력 · 오답노트 (커밋 `c8568d5`)

- `public.exam_attempts` 테이블을 새로 추가했다. 한 행이 "한 번의 채점 결과" 전체다. 문항별 상세를 다시 정규화한 별도 테이블로 쪼개지 않고, 채점 API가 이미 만들어 반환하는 `WrittenGradeResult`/`PracticalGradeResult` 객체를 그대로 `result JSONB` 컬럼에 저장했다 — 문제 내용/선택지는 언제든 `getPublicWrittenRound`/`getPublicPracticalRound`로 다시 불러와 `question.id` 기준으로 합치면 되므로, 중복 저장을 피하기 위함이다.
- RLS는 게시판(`board_posts`)과 동일한 "본인 것만" self-service 패턴: `auth.uid() = user_id`로 SELECT/INSERT만 허용한다(수정·삭제 불필요).
- 필기/실기 채점 API(`.../grade/route.ts`)는 채점 성공 후 로그인 사용자가 있으면 `exam_attempts`에 best-effort로 저장한다. 저장이 실패해도(RLS, DB 오류 등) 채점 응답 자체는 항상 정상 반환한다 — 채점은 필수 기능이고 이력 저장은 부가 기능이기 때문에 실패를 삼킨다.
- 같은 라우트 안에서 두 가지 보안 패턴이 섞여 있다: 채점 계산(`gradeWrittenSubmission`/`gradePracticalSubmission`)은 `questions`/`choices`/`practical_answers`가 RLS로 전체 차단되어 있어 서비스 롤이 필요하고, 응시 기록 저장은 사용자 본인 소유 데이터라 요청 스코프의 self-service 클라이언트로 충분하다. 이 둘을 한 라우트에서 같이 쓰는 것이 의도한 설계다.
- `/mypage/history`: 응시 기록 목록(회차·유형·점수·날짜).
- `/mypage/history/[attemptId]`: 상세 화면. 기존 `WrittenRoundResult`/`PracticalRoundResult` 컴포넌트를 그대로 재사용하되, "다시 풀기" 버튼이 로컬 상태를 리셋하는 대신 실제 문제풀이 페이지로 이동하도록 `ExamAttemptResultView` 클라이언트 래퍼를 새로 만들었다. 기존 컴포넌트의 "이 결과는 저장되지 않습니다" 문구는 저장된 기록을 보여주는 화면에서는 사실과 다르므로, `savedNotice` prop으로 덮어쓸 수 있게 확장했다(기존 실시간 채점 화면은 기본 문구 그대로 유지).
- `/mypage/wrong-answers`: 사용자의 전체 응시 기록을 최신순으로 훑어, 문제 `id` 기준으로 아직 틀린(또는 그 문제가 다시 맞은 적 없는) 것만 남긴다. `created_at DESC` 정렬 + `Map` 기반 최초 등장(=최신 응시) 우선 dedup으로, "각 문제의 가장 최근 채점 결과 기준"이 자연스럽게 보장된다.

### 2. 문제 단위 즐겨찾기 (커밋 `c8568d5`)

- 새 테이블을 만들지 않았다. 초기 스키마 설계 단계에서 이미 만들어져 있었지만 한 번도 연결되지 않았던 범용 `public.bookmarks(user_id, target_type, target_id)` 테이블(`target_type` 이미 `'question'` 포함, RLS `auth.uid() = user_id`로 완비)을 그대로 재사용했다.
- 설계 결정: 회차 전체가 아니라 **문제 단위**로 북마크한다. 회차 목록 페이지에서 이미 회차 전체로 바로 들어갈 수 있어 "회차 즐겨찾기"는 실익이 적고, 문제 단위는 오답노트(자동으로 틀린 문제만 모음)와 겹치지 않는 보완 기능(사용자가 스스로 고른 문제, 맞은 문제도 포함)이 된다.
- `questions` 테이블에 이미 `exam_type`/`year`/`round`/`subject`/`number` 컬럼이 있어 필기·실기 문제가 같은 테이블에 공존한다. 북마크된 `target_id`(문제 id) 목록을 서비스 롤로 다시 조회해 메타데이터(연도·회차·과목·문제 번호·내용)를 붙이는 `bookmark-content.ts`를 별도로 두었다 — `bookmarks` 테이블 자체는 self-service RLS로 충분하지만, 문제 원문은 여전히 RLS로 잠겨 있어 서비스 롤이 필요하기 때문이다.
- 문제풀이 화면(`WrittenRoundRunner`/`PracticalRoundRunner`)에 "문제 수정" 버튼 옆으로 즐겨찾기 토글 버튼을 추가했다. 비로그인 상태에서 누르면 로그인 페이지로 이동한다(문제 자체를 못 보게 막지는 않음). 토글은 낙관적 업데이트 + 실패 시 되돌리기로 처리한다.
- `/mypage/bookmarks`: 즐겨찾기한 문제를 목록으로 보여주고, 각 항목에서 해당 회차로 이동하거나 개별 제거가 가능하다.

## 테스트

- `exam-attempt.ts`/`exam-attempt-repository.ts`: 저장/조회/목록/오답 dedup(최신 우선) 단위 테스트.
- 필기·실기 채점 라우트: 로그인 사용자 저장 호출 여부, 비로그인 시 저장 생략, 저장 실패해도 채점 응답은 200으로 유지되는 케이스.
- `bookmark-repository.ts`/`bookmark-content.ts`: 추가/제거/중복 삽입(23505) 무시, DB 오류 시 에러 래핑.
- `/api/bookmarks/questions/[questionId]`: 인증 필요, UUID 형식 검증, 저장소 오류 redaction.
- `BookmarkToggleButton`: 비로그인 리다이렉트, 낙관적 토글, 실패 시 롤백.
- 전체 스위트 643개 통과, `npm run lint` 클린, `npm run build` 성공 확인(2026-08-05 기준).
