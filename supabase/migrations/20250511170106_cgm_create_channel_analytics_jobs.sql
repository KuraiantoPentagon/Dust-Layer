-- Create table for storing channel analytics jobs
CREATE TABLE public.cgm_channel_analytics_job (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  scheduled_time TIMESTAMPTZ NOT NULL,
  status TEXT NOT NULL CHECK (status IN ('Pending', 'Running', 'Completed', 'Failed')),
  started_at TIMESTAMPTZ,
  finished_at TIMESTAMPTZ,
  total_videos INTEGER,
  error_log TEXT
);

-- Enable Row Level Security
ALTER TABLE public.cgm_channel_analytics_job ENABLE ROW LEVEL SECURITY;

-- Create table for storing results of each job
CREATE TABLE public.cgm_channel_analytics_result (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  job_id UUID NOT NULL,
  report_data JSONB NOT NULL,
  collected_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

-- Enable Row Level Security
ALTER TABLE public.cgm_channel_analytics_result ENABLE ROW LEVEL SECURITY;

