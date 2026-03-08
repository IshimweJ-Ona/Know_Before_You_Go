-- Know Before You Go Database Schema
-- Created for an African travel information platform
-- All tables are public (no authentication required)

-- ============================================
-- 1. COUNTRIES TABLE (Central Reference)
-- ============================================
CREATE TABLE IF NOT EXISTS countries (
    country_code VARCHAR(3) PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    region VARCHAR(50) NOT NULL,
    capital VARCHAR(100) NOT NULL,
    flag_url VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Index for fast region queries
CREATE INDEX IF NOT EXISTS idx_countries_region ON countries(region);

-- ============================================
-- 2. VISA REQUIREMENTS TABLE
-- ============================================
CREATE TABLE IF NOT EXISTS visa_requirements (
    id SERIAL PRIMARY KEY,
    country_code VARCHAR(3) NOT NULL REFERENCES countries(country_code) ON DELETE CASCADE,
    visa_type VARCHAR(100) NOT NULL,
    duration_days INT,
    cost_usd DECIMAL(10, 2),
    requirements TEXT,
    notes TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Index for fast country lookups
CREATE INDEX IF NOT EXISTS idx_visa_country_code ON visa_requirements(country_code);

-- ============================================
-- 3. HEALTH REQUIREMENTS TABLE
-- ============================================
CREATE TABLE IF NOT EXISTS health_requirements (
    id SERIAL PRIMARY KEY,
    country_code VARCHAR(3) NOT NULL REFERENCES countries(country_code) ON DELETE CASCADE,
    requirement_name VARCHAR(150) NOT NULL,
    is_mandatory BOOLEAN DEFAULT FALSE,
    description TEXT,
    notes TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Index for fast country lookups
CREATE INDEX IF NOT EXISTS idx_health_country_code ON health_requirements(country_code);

-- ============================================
-- 4. DOS AND DON'TS TABLE
-- ============================================
CREATE TABLE IF NOT EXISTS dos_and_donts (
    id SERIAL PRIMARY KEY,
    country_code VARCHAR(3) NOT NULL REFERENCES countries(country_code) ON DELETE CASCADE,
    type VARCHAR(10) NOT NULL CHECK (type IN ('do', 'dont')),
    description TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Index for fast country lookups and type filtering
CREATE INDEX IF NOT EXISTS idx_dosdont_country_code ON dos_and_donts(country_code);
CREATE INDEX IF NOT EXISTS idx_dosdont_type ON dos_and_donts(type);

-- ============================================
-- 5. GENERAL REQUIREMENTS TABLE
-- ============================================
CREATE TABLE IF NOT EXISTS general_requirements (
    id SERIAL PRIMARY KEY,
    country_code VARCHAR(3) NOT NULL REFERENCES countries(country_code) ON DELETE CASCADE,
    title VARCHAR(150) NOT NULL,
    description TEXT NOT NULL,
    is_mandatory BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Index for fast country lookups
CREATE INDEX IF NOT EXISTS idx_general_country_code ON general_requirements(country_code);

-- ============================================
-- 6. EMERGENCY CONTACTS TABLE
-- ============================================
CREATE TABLE IF NOT EXISTS emergency_contacts (
    id SERIAL PRIMARY KEY,
    country_code VARCHAR(3) NOT NULL REFERENCES countries(country_code) ON DELETE CASCADE,
    embassy_name VARCHAR(150) NOT NULL,
    phone VARCHAR(20),
    email VARCHAR(100),
    address TEXT,
    website VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Index for fast country lookups
CREATE INDEX IF NOT EXISTS idx_emergency_country_code ON emergency_contacts(country_code);

-- ============================================
-- 7. SUBSCRIBERS TABLE (Newsletter)
-- ============================================
CREATE TABLE IF NOT EXISTS subscribers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    is_active BOOLEAN DEFAULT TRUE,
    subscribed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    unsubscribed_at TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Index for fast email lookups (important for duplicate detection)
CREATE INDEX IF NOT EXISTS idx_subscribers_email ON subscribers(email);
CREATE INDEX IF NOT EXISTS idx_subscribers_is_active ON subscribers(is_active);

-- ============================================
-- EXPLANATION OF DESIGN CHOICES
-- ============================================
/*

1. PRIMARY KEYS:
   - countries: country_code (VARCHAR(3)) — ISO 3166-1 alpha-3 code
   - All other tables: SERIAL id (auto-increment integer)

2. FOREIGN KEYS:
   - All travel info tables (visa, health, dos_and_donts, general, emergency)
     reference countries(country_code) with ON DELETE CASCADE
   - Ensures referential integrity — if a country is deleted, all related data is removed

3. INDEXES:
   - idx_*_country_code: Every table has an index on country_code for fast retrieval
     of all information for a selected country (Critical for query performance)
   - idx_subscribers_email: For duplicate detection during newsletter signup
   - idx_subscribers_is_active: For filtering active subscribers
   - idx_dosdont_type: For filtering by 'do' or 'dont'
   - idx_countries_region: For region-based queries

4. CONSTRAINTS:
   - dos_and_donts.type: CHECK constraint ensures only 'do' or 'dont' values
   - subscribers.email: UNIQUE constraint prevents duplicate newsletter signups
   - countries.name: UNIQUE constraint ensures no duplicate country names

5. DATA TYPES:
   - Visa cost: DECIMAL(10, 2) for precise currency handling
   - Links: VARCHAR(255) for URLs, TEXT for longer descriptions
   - Boolean: is_mandatory, is_active for yes/no flags
   - Timestamps: created_at, updated_at for audit trails

6. SECURITY FEATURES:
   - Foreign key constraints enforce data integrity
   - Indexes prevent N+1 query problems
   - Parameterized queries (in API layer) prevent SQL injection
   - UNIQUE constraint on email prevents duplicate newsletter entries

7. QUERY PERFORMANCE:
   - To fetch ALL information for a selected country in one round trip:
     SELECT *
     FROM countries c
     LEFT JOIN visa_requirements vr ON c.country_code = vr.country_code
     LEFT JOIN health_requirements hr ON c.country_code = hr.country_code
     LEFT JOIN dos_and_donts dd ON c.country_code = dd.country_code
     LEFT JOIN general_requirements gr ON c.country_code = gr.country_code
     LEFT JOIN emergency_contacts ec ON c.country_code = ec.country_code
     WHERE c.country_code = $1;
   
   - Indexes on country_code ensure this query runs in O(log n) time
   - With 10 countries, even without indexes it's O(1), but indexes future-proof

*/
