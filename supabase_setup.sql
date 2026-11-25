-- 운동 카운터 클라우드 동기화 테이블
-- Supabase Dashboard > SQL Editor > New query 에 붙여넣고 Run 하세요.

create table if not exists public.workout_sync (
  user_id uuid primary key references auth.users(id) on delete cascade,
  payload jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now()
);

alter table public.workout_sync enable row level security;

drop policy if exists "Users can read own workout sync" on public.workout_sync;
create policy "Users can read own workout sync"
on public.workout_sync for select
to authenticated
using (auth.uid() = user_id);

drop policy if exists "Users can insert own workout sync" on public.workout_sync;
create policy "Users can insert own workout sync"
on public.workout_sync for insert
to authenticated
with check (auth.uid() = user_id);

drop policy if exists "Users can update own workout sync" on public.workout_sync;
create policy "Users can update own workout sync"
on public.workout_sync for update
to authenticated
using (auth.uid() = user_id)
with check (auth.uid() = user_id);

grant select, insert, update on public.workout_sync to authenticated;
