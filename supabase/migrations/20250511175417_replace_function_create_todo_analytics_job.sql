CREATE OR REPLACE FUNCTION public.create_todo_analytics_job(p_account_id UUID)
RETURNS UUID AS $$
DECLARE
  v_job_id UUID := gen_random_uuid();
BEGIN
  -- Insert a new analytics job
  INSERT INTO public.cgm_channel_analytics_job (
    id,
    social_media_account_id,
    scheduled_time,
    status,
    started_at,
    finished_at,
    total_videos,
    error_log
  )
  VALUES (
    v_job_id,
    p_account_id,
    now(),          -- Schedule immediately
    'Pending',
    NULL,
    NULL,
    NULL,
    NULL
  );

  RETURN v_job_id;
END;
$$ LANGUAGE plpgsql;
