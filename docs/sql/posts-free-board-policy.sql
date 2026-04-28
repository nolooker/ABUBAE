-- Allow public inserts only for free-board style posts.
-- This keeps notice/review content protected while opening lightweight community posting.

alter table posts enable row level security;

do $$
begin
  if not exists (
    select 1
    from pg_policies
    where schemaname = 'public'
      and tablename = 'posts'
      and policyname = 'posts_free_board_insert'
  ) then
    create policy "posts_free_board_insert"
    on posts
    for insert
    to anon, authenticated
    with check (
      type = 'note'
      and is_premium = false
      and is_published = true
    );
  end if;
end
$$;
