-- ============================================================
-- Know Before You Go — Migration 001
-- Creates all core tables.
-- Run this first in your Supabase SQL editor.
-- ============================================================

-- Enable UUID generation
CREATE EXTENSION IF NOT EXISTS "pgcrypto";


-- ── COUNTRIES 
CREATE TABLE IF NOT EXISTS countries (
  id               UUID        PRIMARY KEY DEFAULT gen_random_uuid(),
  country_code     CHAR(2)     NOT NULL UNIQUE,
  country_name     TEXT        NOT NULL,
  region           TEXT,
  capital          TEXT,
  currency         TEXT,
  language         TEXT,
  population       TEXT,
  power_voltage    TEXT,
  timezone         TEXT,
  tipping          TEXT,
  climate          TEXT,
  description      TEXT,
  flag             TEXT,
  hero_image       TEXT,
  advisory_level   SMALLINT    DEFAULT 1 CHECK (advisory_level BETWEEN 1 AND 4),
  visa_status      TEXT,
  cdc_notice_level SMALLINT    DEFAULT 0 CHECK (cdc_notice_level BETWEEN 0 AND 3),
  places           JSONB       DEFAULT '[]',
  created_at       TIMESTAMPTZ DEFAULT NOW(),
  updated_at       TIMESTAMPTZ DEFAULT NOW()
);


-- ── VISA REQUIREMENTS 
CREATE TABLE IF NOT EXISTS visa_requirements (
  id               UUID        PRIMARY KEY DEFAULT gen_random_uuid(),
  country_code     CHAR(2)     NOT NULL UNIQUE,
  country_name     TEXT        NOT NULL,
  visa_status      TEXT        NOT NULL,
  visa_free_days   INT,
  visa_title       TEXT,
  visa_info        TEXT,
  notes            TEXT,
  last_updated     TIMESTAMPTZ DEFAULT NOW()
);


-- ── EMERGENCY CONTACTS 
CREATE TABLE IF NOT EXISTS emergency_contacts (
  id                UUID        PRIMARY KEY DEFAULT gen_random_uuid(),
  country_code      CHAR(2)     NOT NULL UNIQUE,
  country_name      TEXT        NOT NULL,
  police_number     TEXT,
  ambulance_number  TEXT,
  fire_number       TEXT,
  general_emergency TEXT,
  tourist_police    TEXT,
  notes             TEXT,
  last_updated      TIMESTAMPTZ DEFAULT NOW()
);


-- ── CULTURAL GUIDELINES 
CREATE TABLE IF NOT EXISTS cultural_guidelines (
  id              UUID        PRIMARY KEY DEFAULT gen_random_uuid(),
  country_code    CHAR(2)     NOT NULL UNIQUE,
  country_name    TEXT        NOT NULL,
  dos             TEXT[]      DEFAULT '{}',
  donts           TEXT[]      DEFAULT '{}',
  dress_code      TEXT,
  photo_rules     TEXT,
  legal_warnings  JSONB       DEFAULT '[]',
  source_url      TEXT,
  last_updated    TIMESTAMPTZ DEFAULT NOW()
);


-- ── HEALTH ADVISORIES 
CREATE TABLE IF NOT EXISTS health_advisories (
  id                    UUID        PRIMARY KEY DEFAULT gen_random_uuid(),
  country_code          CHAR(2)     NOT NULL UNIQUE,
  country_name          TEXT        NOT NULL,
  required_vaccines     TEXT[]      DEFAULT '{}',
  recommended_vaccines  TEXT[]      DEFAULT '{}',
  health_risks          TEXT[]      DEFAULT '{}',
  active_outbreaks      TEXT[]      DEFAULT '{}',
  medication_rules      TEXT,
  cdc_notice_level      SMALLINT    DEFAULT 0 CHECK (cdc_notice_level BETWEEN 0 AND 3),
  last_updated          TIMESTAMPTZ DEFAULT NOW()
);


-- ── NEWSLETTER SUBSCRIBERS 
CREATE TABLE IF NOT EXISTS newsletter_subscribers (
  id         UUID        PRIMARY KEY DEFAULT gen_random_uuid(),
  name       TEXT,
  email      TEXT        NOT NULL UNIQUE,
  active     BOOLEAN     DEFAULT TRUE,
  created_at TIMESTAMPTZ DEFAULT NOW()
);


-- ── ADMIN USERS 
CREATE TABLE IF NOT EXISTS admin_users (
  id            UUID        PRIMARY KEY DEFAULT gen_random_uuid(),
  name          TEXT,
  email         TEXT        NOT NULL UNIQUE,
  password_hash TEXT        NOT NULL,
  created_at    TIMESTAMPTZ DEFAULT NOW()
);


-- ── INDEXES 
CREATE INDEX IF NOT EXISTS idx_countries_code       ON countries           (country_code);
CREATE INDEX IF NOT EXISTS idx_visa_code            ON visa_requirements   (country_code);
CREATE INDEX IF NOT EXISTS idx_emergency_code       ON emergency_contacts  (country_code);
CREATE INDEX IF NOT EXISTS idx_cultural_code        ON cultural_guidelines (country_code);
CREATE INDEX IF NOT EXISTS idx_health_code          ON health_advisories   (country_code);
CREATE INDEX IF NOT EXISTS idx_newsletter_email     ON newsletter_subscribers (email);
CREATE INDEX IF NOT EXISTS idx_newsletter_created   ON newsletter_subscribers (created_at DESC);


-- ── AUTO-UPDATE updated_at 
CREATE OR REPLACE FUNCTION update_updated_at()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_countries_updated_at
  BEFORE UPDATE ON countries
  FOR EACH ROW EXECUTE FUNCTION update_updated_at();
