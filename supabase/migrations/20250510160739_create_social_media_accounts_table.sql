-- 1. Core table: social_media_account
create table public.cgm_social_media_account (
  id uuid primary key default gen_random_uuid(),
  platform text not null check (platform in ('YouTube', 'TikTok', 'Instagram', 'Facebook', 'Podcast')),
  account_id text not null, -- Native platform ID
  account_name text not null,
  url text,
  status text not null default 'Active' check (status in ('Active', 'Paused', 'Archived', 'Disabled')),
  created_at timestamptz not null default now(),
  unique (platform, account_id)
);

-- 2. YouTube-specific details
create table public.cgm_youtube_account_details (
  account_id uuid primary key,
  subscriber_count integer,
  channel_type text,
  verified boolean default false,
  country text
);

-- 3. TikTok-specific details
create table public.cgm_tiktok_account_details (
  account_id uuid primary key,
  follower_count integer,
  is_business boolean default false,
  region text
);

-- Anonymous view: only expose account_id
create or replace view public.anon_social_media_accounts as
select account_id
from public.cgm_social_media_account;

-- Enable RLS for origin table
alter table public.cgm_social_media_account enable row level security;
alter table public.youtube_account_details enable row level security;
alter table public.tiktok_account_details enable row level security;

