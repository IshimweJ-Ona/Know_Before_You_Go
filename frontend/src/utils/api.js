import axios from "axios";

// ── Base URL ───────────────────────────────────────────────────────────────
// In development: proxy via package.json "proxy" field (or set REACT_APP_API_URL)
// In production:  set REACT_APP_API_URL=https://your-render-backend.onrender.com
const BASE_URL = process.env.REACT_APP_API_URL || "";

const api = axios.create({
  baseURL: BASE_URL,
  timeout: 10000,
  headers: { "Content-Type": "application/json" },
});

// ── Countries ──────────────────────────────────────────────────────────────
/**
 * GET /api/countries
 * Returns array of { country_code, name, region, capital, flag_url }
 */
export const getCountries = () => api.get("/api/countries");

// ── Country Information (parallel fetch) ──────────────────────────────────
/**
 * Fetches all 5 information sections simultaneously for a given country code.
 * Uses Promise.all — all 5 requests fire at once; none render until all resolve.
 * @param {string} countryCode - e.g. "KE"
 * @returns {Promise} resolves to { visa, health, dosDonts, general, emergency }
 */
export const getCountryData = async (countryCode) => {
  const [visa, health, dosDonts, general, emergency] = await Promise.all([
    api.get(`/api/visa?country=${countryCode}`),
    api.get(`/api/health?country=${countryCode}`),
    api.get(`/api/dos-donts?country=${countryCode}`),
    api.get(`/api/general?country=${countryCode}`),
    api.get(`/api/emergency?country=${countryCode}`),
  ]);
  return {
    visa:      visa.data,
    health:    health.data,
    dosDonts:  dosDonts.data,
    general:   general.data,
    emergency: emergency.data,
  };
};

// ── Newsletter ─────────────────────────────────────────────────────────────
/**
 * POST /api/newsletter/subscribe
 * @param {string} name
 * @param {string} email
 */
export const subscribeNewsletter = (name, email) =>
  api.post("/api/newsletter/subscribe", { name, email });

export default api;