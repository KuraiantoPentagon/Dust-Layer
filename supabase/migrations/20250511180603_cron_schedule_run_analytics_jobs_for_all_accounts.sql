-- Create a wrapper function to run analytics job for each social media account
CREATE OR REPLACE FUNCTION public.run_analytics_jobs_for_all_accounts()
RETURNS void AS $$
BEGIN
  PERFORM public.create_todo_analytics_job(id)
  FROM public.cgm_social_media_account
  WHERE status = 'Active';
END;
$$ LANGUAGE plpgsql;

-- Schedule the function to run every 5 minutes using pg_cron
SELECT cron.schedule(
  'analytics_jobs_every_5_min',
  '*/5 * * * *',
  $$SELECT public.run_analytics_jobs_for_all_accounts();$$
);
