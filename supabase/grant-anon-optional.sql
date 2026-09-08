-- 선택 사항: 브라우저 Publishable Key(anon)로 기존 gachive_saves를 읽고 쓸 수 있게 합니다.
-- 테이블을 만들거나 데이터를 지우지 않습니다.
-- 앱이 자동 실행하지 않습니다.

grant select, insert, update, delete on table public.gachive_saves to anon, authenticated;

alter table public.gachive_saves enable row level security;

drop policy if exists "gachive_saves_all" on public.gachive_saves;
create policy "gachive_saves_all" on public.gachive_saves
  for all to anon, authenticated using (true) with check (true);

do $$
begin
  if not exists (
    select 1 from pg_publication_tables
    where pubname = 'supabase_realtime'
      and schemaname = 'public'
      and tablename = 'gachive_saves'
  ) then
    alter publication supabase_realtime add table public.gachive_saves;
  end if;
end $$;
