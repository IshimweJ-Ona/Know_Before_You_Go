import pool from "../config/db.js";

const CACHE_KEY = "countries:index:v1";
const CACHE_TTL_SECONDS = 10 * 60;

let cache = {
    loadedAt: 0,
    ttlMs: CACHE_TTL_SECONDS * 1000,
    countries: [],
    countrySet: new Set(),
    countryByLower: new Map(),
    countryRegex: null,
};

const normalize = (value) => (value || "").toLowerCase().trim();

const escapeRegExp = (value) => value.replace(/[.*+?^${}()|[\]\\]/g, "\\$&");

const hydrateCache = ({ names, codes }) => {
    const countrySet = new Set();
    const countryByLower = new Map();
    const regexParts = [];

    for (const name of names) {
        const key = normalize(name);
        countrySet.add(key);
        countryByLower.set(key, name);
        if (key) {
            regexParts.push(escapeRegExp(key).replace(/\s+/g, "\\s+"));
        }
    }

    for (const code of codes) {
        const key = normalize(code);
        if (!key) continue;
        countrySet.add(key);
        if (!countryByLower.has(key) && names.length) {
            const match = names.find(n => normalize(n) && normalize(n) === key);
            if (match) countryByLower.set(key, match);
        }
        if (!countryByLower.has(key)) {
            // map code to canonical name via index position if possible
            const idx = codes.indexOf(code);
            const mappedName = names[idx];
            if (mappedName) countryByLower.set(key, mappedName);
        }
        regexParts.push(escapeRegExp(key));
    }

    const countryRegex = regexParts.length
        ? new RegExp(`\\b(?:${regexParts.join("|")})\\b`, "g")
        : null;

    cache = {
        ...cache,
        loadedAt: Date.now(),
        countries: names,
        countrySet,
        countryByLower,
        countryRegex,
    };
};

const loadFromDb = async () => {
    const [rows] = await pool.query("SELECT country_name, country_code FROM countries ORDER BY country_name");
    return {
        names: rows.map(row => row.country_name),
        codes: rows.map(row => row.country_code),
    };
};

export const getCountryIndex = async () => {
    const expired = Date.now() - cache.loadedAt > cache.ttlMs;
    if (!cache.loadedAt || expired) {
        const { names, codes } = await loadFromDb();
        hydrateCache({ names, codes });
    }
    return cache;
};
