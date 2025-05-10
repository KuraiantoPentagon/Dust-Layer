-- Anonymous view: only expose account_id
create or replace view public.anon_social_media_accounts as
select account_id
from public.social_media_account;

-- Enable RLS for origin table
alter table public.social_media_account enable row level security;
alter table public.youtube_account_details enable row level security;
alter table public.tiktok_account_details enable row level security;
