import { createMemoryCache } from "../utils/memoryCache.js";
import { getCountryByName } from "./knowledgeEngine.js";

const CACHE_TTL_SECONDS = 6 * 60 * 60;
const cache = createMemoryCache(CACHE_TTL_SECONDS);

const INDICATORS = [
  {
    key: "literacy_rate",
    label: "Adult literacy rate (%)",
    indicator: "SE.ADT.LITR.ZS",
  },
  {
    key: "primary_enrollment",
    label: "Primary school net enrollment (%)",
    indicator: "SE.PRM.NENR",
  },
  {
    key: "secondary_enrollment",
    label: "Secondary school net enrollment (%)",
    indicator: "SE.SEC.NENR",
  },
  {
    key: "tertiary_enrollment",
    label: "Tertiary school gross enrollment (%)",
    indicator: "SE.TER.ENRR",
  },
];

const fetchWithTimeout = async (url, timeoutMs = 4500) => {
  const controller = new AbortController();
  const timer = setTimeout(() => controller.abort(), timeoutMs);
  try {
    const res = await fetch(url, { signal: controller.signal });
    if (!res.ok) return null;
    return await res.json();
  } catch {
    return null;
  } finally {
    clearTimeout(timer);
  }
};

const pickLatestValue = (series) => {
  if (!Array.isArray(series)) return null;
  for (const point of series) {
    if (point && point.value !== null && point.value !== undefined) {
      return { value: point.value, year: point.date };
    }
  }
  return null;
};

export const fetchEducationStats = async ({ countryName }) => {
  if (!countryName) return null;
  const country = await getCountryByName(countryName);
  if (!country?.country_code) return null;

  const countryCode = country.country_code.toLowerCase();
  const cacheKey = `edu:${countryCode}`;
  const cached = cache.get(cacheKey);
  if (cached) return cached;

  const stats = [];
  const sources = new Set();

  for (const indicator of INDICATORS) {
    const url = `https://api.worldbank.org/v2/country/${countryCode}/indicator/${indicator.indicator}?format=json`;
    const data = await fetchWithTimeout(url);
    const series = Array.isArray(data) ? data[1] : null;
    const latest = pickLatestValue(series || []);
    if (latest) {
      stats.push({
        key: indicator.key,
        label: indicator.label,
        value: latest.value,
        year: latest.year,
      });
      sources.add(url);
    }
  }

  if (!stats.length) return null;

  const payload = {
    country: {
      name: country.country_name,
      code: country.country_code,
    },
    stats,
    sources: Array.from(sources),
  };
  cache.set(cacheKey, payload);
  return payload;
};

export const fetchEducationStatsCached = fetchEducationStats;
