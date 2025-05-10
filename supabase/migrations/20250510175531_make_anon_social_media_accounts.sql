-- Anonymous view: only expose account_id
create or replace view public.anon_social_media_accounts as
select account_id
from public.social_media_account;

-- Enable RLS for origin table
alter table public.origin enable row level security;
