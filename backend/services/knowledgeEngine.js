import pool from "../config/db.js";
import { createMemoryCache } from "../utils/memoryCache.js";

const getCountryByName = async (name) => {
    const [rows] = await pool.query(
        `SELECT id, country_code, country_name, region, capital, currency, language, population,
                power_voltage, timezone, tipping, climate, description, transportation, housing,
                flag_url, advisory_level, visa_status, cdc_notice_level
         FROM countries
         WHERE country_name = ?`,
        [name]
    );
    return rows[0] || null;
};

const getEmergencyContacts = async (countryId) => {
    const [rows] = await pool.query(
        `SELECT police_number, ambulance_number, fire_number, general_emergency, tourist_police
         FROM emergency_contacts
         WHERE country_id = ?`,
        [countryId]
    );
    return rows[0] || null;
};

const getPlaces = async (countryId) => {
    const [rows] = await pool.query(
        "SELECT name, description, image_url FROM places WHERE country_id = ? ORDER BY name",
        [countryId]
    );
    return rows;
};

const getVisaRequirement = async (countryId) => {
    const [rows] = await pool.query(
        `SELECT visa_status, visa_free_days, visa_title, visa_info
         FROM visa_requirements
         WHERE country_id = ?`,
        [countryId]
    );
    return rows[0] || null;
};

const getCulturalGuidelines = async (countryId) => {
    const [guidelineRows] = await pool.query(
        "SELECT id, dress_code FROM cultural_guidelines WHERE country_id = ?",
        [countryId]
    );
    const guideline = guidelineRows[0];
    if (!guideline) return { dress_code: null, dos: [], donts: [], legal_warnings: [] };

    const [dosRows] = await pool.query(
        "SELECT item FROM cultural_dos WHERE guideline_id = ? ORDER BY id",
        [guideline.id]
    );
    const [dontRows] = await pool.query(
        "SELECT item FROM cultural_donts WHERE guideline_id = ? ORDER BY id",
        [guideline.id]
    );
    const [legalRows] = await pool.query(
        "SELECT title, description FROM cultural_legal_warnings WHERE guideline_id = ? ORDER BY id",
        [guideline.id]
    );

    return {
        dress_code: guideline.dress_code,
        dos: dosRows.map(row => row.item),
        donts: dontRows.map(row => row.item),
        legal_warnings: legalRows,
    };
};

const getHealthAdvisory = async (countryId) => {
    const [advisoryRows] = await pool.query(
        "SELECT id, medication_rules, cdc_notice_level FROM health_advisories WHERE country_id = ?",
        [countryId]
    );
    const advisory = advisoryRows[0];
    if (!advisory) return null;

    const [requiredRows] = await pool.query(
        "SELECT vaccine FROM health_required_vaccines WHERE advisory_id = ? ORDER BY id",
        [advisory.id]
    );
    const [recommendedRows] = await pool.query(
        "SELECT vaccine FROM health_recommended_vaccines WHERE advisory_id = ? ORDER BY id",
        [advisory.id]
    );
    const [riskRows] = await pool.query(
        "SELECT risk FROM health_risks WHERE advisory_id = ? ORDER BY id",
        [advisory.id]
    );
    const [outbreakRows] = await pool.query(
        "SELECT outbreak FROM health_active_outbreaks WHERE advisory_id = ? ORDER BY id",
        [advisory.id]
    );

    return {
        medication_rules: advisory.medication_rules,
        cdc_notice_level: advisory.cdc_notice_level,
        required_vaccines: requiredRows.map(row => row.vaccine),
        recommended_vaccines: recommendedRows.map(row => row.vaccine),
        health_risks: riskRows.map(row => row.risk),
        active_outbreaks: outbreakRows.map(row => row.outbreak),
    };
};



export const fetchCountryProfile = async (countryName) => {
    const country = await getCountryByName(countryName);
    if (!country) return null;

    const [emergency, places, cultural, health, visa] = await Promise.all([
        getEmergencyContacts(country.id),
        getPlaces(country.id),
        getCulturalGuidelines(country.id),
        getHealthAdvisory(country.id),
        getVisaRequirement(country.id),
    ]);

    return {
        country,
        emergency,
        places,
        cultural,
        health,
        visa,
    };
};

export const fetchVisaInfo = async ({ countryName }) => {
    const country = await getCountryByName(countryName);
    if (!country) return { country: null, visa: null };

    const visa = await getVisaRequirement(country.id);
    return { country, visa };
};

const CACHE_TTL_SECONDS = 5 * 60;
const cache = createMemoryCache(CACHE_TTL_SECONDS);

export const fetchCountryProfileCached = async (countryName) => {
    const key = `profile:${countryName.toLowerCase()}`;
    const memoryHit = cache.get(key);
    if (memoryHit) return memoryHit;

    const data = await fetchCountryProfile(countryName);
    if (data) {
        cache.set(key, data);
    }
    return data;
};

export const fetchVisaInfoCached = async ({ countryName }) => {
    const key = `visa:${countryName.toLowerCase()}`;
    const memoryHit = cache.get(key);
    if (memoryHit) return memoryHit;

    const data = await fetchVisaInfo({ countryName });
    if (data) {
        cache.set(key, data);
    }
    return data;
};
