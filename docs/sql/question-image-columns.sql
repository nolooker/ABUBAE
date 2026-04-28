-- 문제 이미지 저장 구조 추가
-- 실행 대상: questions 테이블

alter table questions
add column if not exists image_url text;

alter table questions
add column if not exists image_caption text;

comment on column questions.image_url is '문제에 포함된 그림, 도표, 코드 스크린샷 등의 공개 이미지 URL';
comment on column questions.image_caption is '문제 이미지 설명 또는 캡션';
