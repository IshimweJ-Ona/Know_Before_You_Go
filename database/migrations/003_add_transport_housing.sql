-- ============================================================
-- Know Before You Go - Migration 003
-- Adds transportation and housing info to countries.
-- Run after 001_create_tables.sql.
-- ============================================================

ALTER TABLE IF EXISTS countries
  ADD COLUMN IF NOT EXISTS transportation TEXT,
  ADD COLUMN IF NOT EXISTS housing        TEXT;
