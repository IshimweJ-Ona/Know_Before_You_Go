-- ============================================================
-- Know Before You Go — Migration 002
-- Adds the user_feedback table.
-- Run after 001_create_tables.sql.
-- ============================================================

CREATE TABLE IF NOT EXISTS user_feedback (
  id           UUID        PRIMARY KEY DEFAULT gen_random_uuid(),
  name         TEXT,
  email        TEXT,
  country_code CHAR(2),
  message      TEXT        NOT NULL,
  created_at   TIMESTAMPTZ DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_feedback_created  ON user_feedback (created_at DESC);
CREATE INDEX IF NOT EXISTS idx_feedback_country  ON user_feedback (country_code);
