import pool from "../config/db.js";

const CACHE_KEY = "countries:index:v1";
const CACHE_TTL_SECONDS = 10 * 60;

let cache = {
    loadedAt: 0,
    ttlMs: CACHE_TTL_SECONDS * 1000,
    countries: [],
    countrySet: new Set(),
    countryByLower: new Map(),
};

const normalize = (value) => (value || "").toLowerCase().trim();

const hydrateCache = (names) => {
    const countrySet = new Set();
    const countryByLower = new Map();

    for (const name of names) {
        const key = normalize(name);
        countrySet.add(key);
        countryByLower.set(key, name);
    }

    cache = {
        ...cache,
        loadedAt: Date.now(),
        countries: names,
        countrySet,
        countryByLower,
    };
};

const loadFromDb = async () => {
    const [rows] = await pool.query("SELECT country_name FROM countries ORDER BY country_name");
    return rows.map(row => row.country_name);
};

export const getCountryIndex = async () => {
    const expired = Date.now() - cache.loadedAt > cache.ttlMs;
    if (!cache.loadedAt || expired) {
        const names = await loadFromDb();
        hydrateCache(names);
    }
    return cache;
};
