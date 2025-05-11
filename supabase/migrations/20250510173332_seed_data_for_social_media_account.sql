-- Insert into social_media_account
insert into public.cgm_social_media_account (
  platform,
  account_id,
  account_name,
  url,
  status,
  created_at
)
values (
  'YouTube',
  'UCloVwl2JmKG3IghQmTQHBVw',
  'Hào Nghiêm Xuân',
  'https://www.youtube.com/channel/UCloVwl2JmKG3IghQmTQHBVw',
  'Active',
  now()
);

insert into public.cgm_youtube_account_details (
  account_id,
  subscriber_count,
  channel_type,
  verified,
  country
)
select id, 235, 'Education', true, 'Vietnam'
from public.cgm_social_media_account
where platform = 'YouTube' and account_id = 'UCloVwl2JmKG3IghQmTQHBVw';
