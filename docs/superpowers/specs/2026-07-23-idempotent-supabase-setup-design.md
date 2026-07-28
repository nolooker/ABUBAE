# 재실행 가능한 Supabase 통합 설정 SQL 설계

## 목적

`supabase-setup.sql` 하나로 새 Supabase 프로젝트를 초기화하고, 기존 ABUBAE 프로젝트에도 기존 데이터를 삭제하지 않은 채 최신 Master 문제 편집 기능과 보안 정책을 적용한다.

## 데이터 보존

- 기존 테이블과 행을 삭제하지 않는다.
- 테이블은 `CREATE TABLE IF NOT EXISTS`로 생성한다.
- 기존 테이블에 필요한 컬럼은 `ALTER TABLE ... ADD COLUMN IF NOT EXISTS`로 추가한다.
- 기존 문제, 보기, 사용자, 게시물, 자료, 즐겨찾기, 다운로드 권한을 덮어쓰지 않는다.
- 질문과 보기의 고유 인덱스는 `CREATE UNIQUE INDEX IF NOT EXISTS`로 추가한다. 기존 중복 데이터가 있으면 실행을 중단하고 중복을 먼저 정리하도록 한다.

## 반복 실행 규칙

- 시험 샘플 행은 `slug` 충돌 시 `DO NOTHING`으로 기존 값을 보존한다.
- Auth 사용자 프로필 트리거는 기존 트리거를 `DROP TRIGGER IF EXISTS`로 제거한 후 동일 정의로 재생성한다.
- RLS 정책은 이름별로 `DROP POLICY IF EXISTS` 후 재생성한다.
- 함수는 `CREATE OR REPLACE FUNCTION`으로 갱신한다.
- 함수 권한은 매 실행마다 `REVOKE`와 `GRANT`로 원하는 최종 상태를 복원한다.

## 보안 경계

- `exams`, 게시된 `posts`, 게시된 `resources`만 공개 테이블 정책으로 읽는다.
- `questions`와 `choices`에는 브라우저 직접 읽기 정책을 만들지 않는다.
- 공개 문제 목록과 서버 채점은 서버 전용 Supabase 클라이언트에서 처리한다.
- 정답과 해설 편집은 로그인한 `master`만 RPC를 통해 수행한다.
- Master 저장은 질문, 보기, 정답, 해설, `reviewed`, `updated_at`, `updated_by`를 하나의 트랜잭션에서 갱신한다.

## 기존 사용자 호환

- `public.users.role`은 기존 행에 `user` 기본값으로 추가한다.
- 신규 Auth 사용자는 트리거를 통해 `public.users`에 생성한다.
- 기존 사용자 프로필은 수정하거나 삭제하지 않는다.
- 통합 SQL은 이미 존재하는 `seoteang@gmail.com` 프로필만 대소문자 구분 없이 찾아 `role = 'master'`로 지정한다.
- 해당 프로필이 없으면 새 사용자를 만들거나 다른 사용자를 승격하지 않는다.
- 반복 실행해도 같은 계정의 역할만 `master`로 유지한다.

## 오류 처리

- 기존 데이터가 새 고유 인덱스를 위반하면 자동 삭제·병합하지 않고 오류로 중단한다.
- 외래키 구조가 예상과 다르면 데이터를 변경하지 않고 실행 오류를 그대로 노출한다.
- SQL은 트랜잭션으로 실행해 중간 실패 시 부분 적용을 방지한다.

## 검증

- 정적 계약 테스트로 모든 테이블의 `IF NOT EXISTS`, 컬럼 추가, 비파괴 샘플 삽입, 정책·트리거 재생성, 유효한 PostgreSQL 타입, RPC 권한을 검사한다.
- 기존 전체 테스트, TypeScript, ESLint를 실행한다.
- 실제 Supabase에서는 통합 SQL을 두 번 실행해 두 실행 모두 성공하고 행 개수가 변하지 않는지 확인한다.
