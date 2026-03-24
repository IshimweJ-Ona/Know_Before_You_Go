-- NOTE: Database and users are managed externally (e.g., Aiven).
-- Run this schema after selecting your target database.

-- Core countries table
CREATE TABLE IF NOT EXISTS countries (
    id INT AUTO_INCREMENT PRIMARY KEY,
    country_code CHAR(2) NOT NULL UNIQUE,
    country_name VARCHAR(100) NOT NULL,
    region VARCHAR(50),
    capital VARCHAR(100),
    currency VARCHAR(100),
    language VARCHAR(200),
    population VARCHAR(50),
    power_voltage VARCHAR(50),
    timezone VARCHAR(20),
    tipping VARCHAR(100),
    climate VARCHAR(100),
    description TEXT,
    transportation TEXT,
    housing TEXT,
    flag_url VARCHAR(255),
    advisory_level INT,
    visa_status VARCHAR(100),
    cdc_notice_level INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE INDEX idx_countries_name ON countries(country_name);
CREATE INDEX idx_countries_region ON countries(region);

-- Places / attractions
CREATE TABLE IF NOT EXISTS places (
    id INT AUTO_INCREMENT PRIMARY KEY,
    country_id INT NOT NULL,
    name VARCHAR(150) NOT NULL,
    description TEXT,
    image_url VARCHAR(255),
    FOREIGN KEY (country_id) REFERENCES countries(id) ON DELETE CASCADE
);

CREATE INDEX idx_places_country ON places(country_id);

-- Visa requirements (single row per country)
CREATE TABLE IF NOT EXISTS visa_requirements (
    id INT AUTO_INCREMENT PRIMARY KEY,
    country_id INT NOT NULL UNIQUE,
    visa_status VARCHAR(100),
    visa_free_days INT,
    visa_title VARCHAR(100),
    visa_info TEXT,
    FOREIGN KEY (country_id) REFERENCES countries(id) ON DELETE CASCADE
);

CREATE INDEX idx_visa_country ON visa_requirements(country_id);

-- Emergency contacts (single row per country)
CREATE TABLE IF NOT EXISTS emergency_contacts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    country_id INT NOT NULL UNIQUE,
    police_number VARCHAR(50),
    ambulance_number VARCHAR(50),
    fire_number VARCHAR(50),
    general_emergency VARCHAR(50),
    tourist_police VARCHAR(50),
    FOREIGN KEY (country_id) REFERENCES countries(id) ON DELETE CASCADE
);

CREATE INDEX idx_emergency_country ON emergency_contacts(country_id);

-- Cultural guidelines
CREATE TABLE IF NOT EXISTS cultural_guidelines (
    id INT AUTO_INCREMENT PRIMARY KEY,
    country_id INT NOT NULL UNIQUE,
    dress_code TEXT,
    FOREIGN KEY (country_id) REFERENCES countries(id) ON DELETE CASCADE
);

CREATE INDEX idx_culture_country ON cultural_guidelines(country_id);

CREATE TABLE IF NOT EXISTS cultural_dos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    guideline_id INT NOT NULL,
    item TEXT NOT NULL,
    FOREIGN KEY (guideline_id) REFERENCES cultural_guidelines(id) ON DELETE CASCADE
);

CREATE INDEX idx_culture_dos_guideline ON cultural_dos(guideline_id);

CREATE TABLE IF NOT EXISTS cultural_donts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    guideline_id INT NOT NULL,
    item TEXT NOT NULL,
    FOREIGN KEY (guideline_id) REFERENCES cultural_guidelines(id) ON DELETE CASCADE
);

CREATE INDEX idx_culture_donts_guideline ON cultural_donts(guideline_id);

CREATE TABLE IF NOT EXISTS cultural_legal_warnings (
    id INT AUTO_INCREMENT PRIMARY KEY,
    guideline_id INT NOT NULL,
    title VARCHAR(150),
    description TEXT,
    FOREIGN KEY (guideline_id) REFERENCES cultural_guidelines(id) ON DELETE CASCADE
);

CREATE INDEX idx_culture_legal_guideline ON cultural_legal_warnings(guideline_id);

-- Health advisories
CREATE TABLE IF NOT EXISTS health_advisories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    country_id INT NOT NULL UNIQUE,
    medication_rules TEXT,
    cdc_notice_level INT,
    FOREIGN KEY (country_id) REFERENCES countries(id) ON DELETE CASCADE
);

CREATE INDEX idx_health_country ON health_advisories(country_id);

CREATE TABLE IF NOT EXISTS health_required_vaccines (
    id INT AUTO_INCREMENT PRIMARY KEY,
    advisory_id INT NOT NULL,
    vaccine TEXT NOT NULL,
    FOREIGN KEY (advisory_id) REFERENCES health_advisories(id) ON DELETE CASCADE
);

CREATE INDEX idx_health_required_advisory ON health_required_vaccines(advisory_id);

CREATE TABLE IF NOT EXISTS health_recommended_vaccines (
    id INT AUTO_INCREMENT PRIMARY KEY,
    advisory_id INT NOT NULL,
    vaccine TEXT NOT NULL,
    FOREIGN KEY (advisory_id) REFERENCES health_advisories(id) ON DELETE CASCADE
);

CREATE INDEX idx_health_recommended_advisory ON health_recommended_vaccines(advisory_id);

CREATE TABLE IF NOT EXISTS health_risks (
    id INT AUTO_INCREMENT PRIMARY KEY,
    advisory_id INT NOT NULL,
    risk TEXT NOT NULL,
    FOREIGN KEY (advisory_id) REFERENCES health_advisories(id) ON DELETE CASCADE
);

CREATE INDEX idx_health_risks_advisory ON health_risks(advisory_id);

CREATE TABLE IF NOT EXISTS health_active_outbreaks (
    id INT AUTO_INCREMENT PRIMARY KEY,
    advisory_id INT NOT NULL,
    outbreak TEXT NOT NULL,
    FOREIGN KEY (advisory_id) REFERENCES health_advisories(id) ON DELETE CASCADE
);

CREATE INDEX idx_health_outbreaks_advisory ON health_active_outbreaks(advisory_id);

-- Users (subscribers + admins)
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(191) NOT NULL UNIQUE,
    full_name VARCHAR(120),
    role ENUM('subscriber','admin') NOT NULL DEFAULT 'subscriber',
    password_hash VARCHAR(255),
    session_token_hash VARCHAR(255),
    status VARCHAR(20) DEFAULT 'active',
    source VARCHAR(50) DEFAULT 'frontend',
    is_active TINYINT(1) DEFAULT 1,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE INDEX idx_users_role ON users(role);
CREATE INDEX idx_users_created_at ON users(created_at);
CREATE INDEX idx_users_role_created ON users(role, created_at);

-- Admin invite list (controls who can sign up as admin)
CREATE TABLE IF NOT EXISTS admin_invites (
    id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(191) NOT NULL UNIQUE,
    is_active TINYINT(1) DEFAULT 1,
    created_by VARCHAR(100),
    used_at TIMESTAMP NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_admin_invites_active ON admin_invites(is_active, used_at);

-- News table for travel updates
CREATE TABLE IF NOT EXISTS news (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    country_code CHAR(2),
    category ENUM('visa', 'airport', 'transportation', 'general') NOT NULL,
    published_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    is_active TINYINT(1) DEFAULT 1,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (country_code) REFERENCES countries(country_code) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE INDEX idx_news_country ON news(country_code);
CREATE INDEX idx_news_category ON news(category);
CREATE INDEX idx_news_active_published ON news(is_active, published_at);

-- Advertisements table
CREATE TABLE IF NOT EXISTS advertisements (
    id INT AUTO_INCREMENT PRIMARY KEY,
    company_name VARCHAR(255) NOT NULL,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    image_url VARCHAR(255),
    link_url VARCHAR(255),
    target_country CHAR(2),
    is_active TINYINT(1) DEFAULT 1,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (target_country) REFERENCES countries(country_code) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE INDEX idx_ads_country ON advertisements(target_country);
CREATE INDEX idx_ads_active_created ON advertisements(is_active, created_at);
