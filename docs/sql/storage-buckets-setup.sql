-- ABUBAE Supabase Storage bucket setup
-- 목적:
-- 1) 문제 그림 저장용 question-images
-- 2) 자료 미리보기 이미지용 resource-previews
-- 3) 실제 PDF 원본용 resource-files
--
-- 주의:
-- - question-images, resource-previews 는 public bucket 권장
-- - resource-files 는 private bucket 권장
-- - 현재 관리자 인증은 Supabase Auth가 아니라 별도 master code 기반이므로
--   업로드 자동화까지 하려면 추후 service role backend 또는 Supabase Auth 관리자 구조가 필요함

insert into storage.buckets (id, name, public)
values
  ('question-images', 'question-images', true),
  ('resource-previews', 'resource-previews', true),
  ('resource-files', 'resource-files', false)
on conflict (id) do nothing;

-- 공개 이미지 버킷: 조회는 전체 허용
do $$
begin
  if not exists (
    select 1
    from pg_policies
    where schemaname = 'storage'
      and tablename = 'objects'
      and policyname = 'question_images_public_read'
  ) then
    create policy "question_images_public_read"
    on storage.objects
    for select
    to public
    using (bucket_id = 'question-images');
  end if;
end
$$;

do $$
begin
  if not exists (
    select 1
    from pg_policies
    where schemaname = 'storage'
      and tablename = 'objects'
      and policyname = 'resource_previews_public_read'
  ) then
    create policy "resource_previews_public_read"
    on storage.objects
    for select
    to public
    using (bucket_id = 'resource-previews');
  end if;
end
$$;

-- 비공개 자료 버킷은 기본 공개 조회 정책을 만들지 않음
-- 다운로드는 추후 signed URL 또는 서버 액션을 통해 제공
