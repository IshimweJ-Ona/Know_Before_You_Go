import { createMemoryCache } from "../utils/memoryCache.js";
import { env } from "../config/env.js";

const DEFAULT_TTL_SECONDS = Number(env.externalSourcesTtlSeconds || 6 * 60 * 60);
const cache = createMemoryCache(DEFAULT_TTL_SECONDS);

const TRUSTED_HOSTS = new Set([
    "travel.state.gov",
    "wwwnc.cdc.gov",
    "tools.cdc.gov",
    "www.gov.uk",
    "www.diplomatie.ma",
    "www.evisa.gov.et",
    "eservices.immigration.go.tz",
    "visas.immigration.go.ug",
    "immigration.gov.ng",
    "evisa.gov.gh",
    "etakenya.go.ke",
    "irembo.gov.rw",
    "visas.diplomatie.sn",
    "www.dha.gov.za",
]);

const COUNTRY_SLUGS = {
    Rwanda: "rwanda",
    Kenya: "kenya",
    Tanzania: "tanzania",
    Uganda: "uganda",
    Nigeria: "nigeria",
    Ghana: "ghana",
    "South Africa": "south-africa",
    Morocco: "morocco",
    Ethiopia: "ethiopia",
    Senegal: "senegal",
};

const VISA_PORTALS = {
    RW: "https://irembo.gov.rw/rolportal/en/web/minema/e-visa",
    KE: "https://etakenya.go.ke",
    TZ: "https://eservices.immigration.go.tz",
    UG: "https://visas.immigration.go.ug",
    NG: "https://immigration.gov.ng/visa-on-arrival/",
    GH: "https://evisa.gov.gh",
    ZA: "https://www.dha.gov.za",
    MA: "https://www.diplomatie.ma",
    ET: "https://www.evisa.gov.et",
    SN: "https://visas.diplomatie.sn",
};

const normalize = (value) => (value || "").toLowerCase().trim();

const isTrustedUrl = (url) => {
    try {
        const host = new URL(url).hostname;
        return TRUSTED_HOSTS.has(host);
    } catch {
        return false;
    }
};

const fetchJsonWithTimeout = async (url, timeoutMs = 4500) => {
    if (!isTrustedUrl(url)) return null;
    const cached = cache.get(url);
    if (cached) return cached;

    const controller = new AbortController();
    const timeout = setTimeout(() => controller.abort(), timeoutMs);
    try {
        const res = await fetch(url, {
            method: "GET",
            headers: { "User-Agent": "KBYG/1.0" },
            signal: controller.signal,
        });
        if (!res.ok) return null;
        const data = await res.json();
        cache.set(url, data);
        return data;
    } catch {
        return null;
    } finally {
        clearTimeout(timeout);
    }
};

const buildTrustedSources = ({ intent, countryName, countryCode }) => {
    const slug = COUNTRY_SLUGS[countryName];
    const sources = [];

    if (intent === "visa_info" && countryCode && VISA_PORTALS[countryCode]) {
        sources.push({ title: "Official visa portal", url: VISA_PORTALS[countryCode] });
    }

    if (slug) {
        if (["emergency_numbers", "dos_donts", "safety_alerts"].includes(intent)) {
            sources.push({
                title: "UK FCDO travel advice",
                url: `https://www.gov.uk/foreign-travel-advice/${slug}`,
            });
            sources.push({
                title: "US State Dept country info",
                url: `https://travel.state.gov/content/travel/en/international-travel/International-Travel-Country-Information-Pages/${slug}.html`,
            });
        }

        if (["health", "safety_alerts", "general_guide"].includes(intent)) {
            sources.push({
                title: "CDC destination page",
                url: `https://wwwnc.cdc.gov/travel/destinations/traveler/none/${slug}`,
            });
            sources.push({
                title: "CDC travel notices feed",
                url: "https://tools.cdc.gov/api/v2/resources/media/132689.json",
            });
        }
    }

    return sources.filter((s) => isTrustedUrl(s.url));
};

const pickFromArray = (arr, countryName) => {
    if (!Array.isArray(arr)) return null;
    const target = normalize(countryName);
    return arr.find((item) => normalize(item?.country) === target) || null;
};

const extractTravelAdvisory = (payload, countryName) => {
    if (!payload) return null;
    if (Array.isArray(payload)) return pickFromArray(payload, countryName);
    if (Array.isArray(payload?.data)) return pickFromArray(payload.data, countryName);
    if (Array.isArray(payload?.results)) return pickFromArray(payload.results, countryName);
    return null;
};

const getStateDeptAdvisory = async (countryName) => {
    const url =
        "https://travel.state.gov/content/travel/en/traveladvisories/traveladvisories.html/traveladvisories.json";
    const payload = await fetchJsonWithTimeout(url);
    const advisory = extractTravelAdvisory(payload, countryName);
    if (!advisory) return null;
    return {
        advisory_level: advisory.advisory_level ?? advisory.level ?? null,
        advisory_message: advisory.advisory_message ?? advisory.message ?? null,
        last_updated: advisory.last_updated ?? advisory.date ?? null,
        url: advisory.url ?? null,
    };
};

const getCdcNotices = async (countryName) => {
    const url = "https://tools.cdc.gov/api/v2/resources/media/132689.json";
    const payload = await fetchJsonWithTimeout(url);
    const results = payload?.results || [];
    const target = normalize(countryName);
    if (!Array.isArray(results) || !target) return [];
    return results.filter((item) => normalize(item?.name || "").includes(target)).slice(0, 3);
};

export const fetchExternalEnrichment = async ({ intent, countryName, countryCode }) => {
    if (!countryName) return null;
    const sources = buildTrustedSources({ intent, countryName, countryCode });

    let advisory = null;
    let cdc_notices = [];
    if (["safety_alerts", "health", "general_guide"].includes(intent)) {
        advisory = await getStateDeptAdvisory(countryName);
        cdc_notices = await getCdcNotices(countryName);
    }

    return {
        sources,
        advisory,
        cdc_notices,
    };
};
