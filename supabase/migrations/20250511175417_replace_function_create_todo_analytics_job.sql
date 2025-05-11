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
-- INSERT INTO "public"."cgm_channel_analytics_job" ("id", "social_media_account_id", "scheduled_time", "status", "started_at", "finished_at", "total_videos", "error_log") VALUES ('1162eb8f-5c63-4a60-8d87-dd619956e31e', '5fc1220a-7720-4b5d-b425-9b4a8e8d1f46', '2025-05-11 12:25:39.109037+00', 'Pending', null, null, null, null);
