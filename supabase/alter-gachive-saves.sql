-- 기존 public.gachive_saves 테이블에 없는 컬럼만 추가합니다.
-- CREATE TABLE / DROP TABLE / TRUNCATE는 포함하지 않습니다.
-- 이 파일은 앱이 자동 실행하지 않습니다. 필요할 때만 SQL Editor에서 실행하세요.

alter table public.gachive_saves
  add column if not exists sync_code text;

alter table public.gachive_saves
  add column if not exists created_by text not null default '';

alter table public.gachive_saves
  add column if not exists updated_by text not null default '';

alter table public.gachive_saves
  add column if not exists created_at timestamptz not null default now();

-- updated_at, payload 컬럼은 이미 존재하므로 추가하지 않습니다.
