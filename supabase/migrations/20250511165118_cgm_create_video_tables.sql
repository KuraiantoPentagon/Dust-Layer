create table public.cgm_video_content (
  id uuid primary key default gen_random_uuid(),
  title text not null,
  description text,
  category text,
  content_idea_id uuid not null, -- foreign key to ContentIdea (optional for now)
  created_at timestamptz not null default now()
);

create table public.cgm_published_video (
  id uuid primary key default gen_random_uuid(),
  video_content_id uuid not null,
  platform text not null check (platform in ('YouTube', 'TikTok', 'Instagram', 'Facebook', 'Other')),
  platform_video_id text not null,
  url text,
  publish_date timestamptz,
  status text not null default 'Published' check (status in ('Scheduled', 'Published', 'Archived')),
  created_at timestamptz not null default now(),

  unique (platform, platform_video_id),
);

