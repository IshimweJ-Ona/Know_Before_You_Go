import { getCountryIndex } from "./countryIndex.js";

const tokenize = (text) => {
    return (text || "")
        .toLowerCase()
        .replace(/[^a-z\s]/g, " ")
        .split(/\s+/)
        .filter(Boolean);
};

const pickOriginDestination = (text, mentions) => {
    const normalized = (text || "").toLowerCase();
    let origin = null;
    let destination = null;

    const fromMatch = mentions.find(c => normalized.includes(`from ${c.toLowerCase()}`));
    const toMatch = mentions.find(c => normalized.includes(`to ${c.toLowerCase()}`));

    if (fromMatch) origin = fromMatch;
    if (toMatch) destination = toMatch;

    if (!origin && !destination && mentions.length === 2) {
        origin = mentions[0];
        destination = mentions[1];
    }

    if (!destination && mentions.length >= 1) {
        destination = mentions[mentions.length -1];
    }

    return { origin, destination };
};

export const detectCountries = async (text) => {
    const { countries, countrySet, countryByLower } = await getCountryIndex();
    const normalizedText = (text || "").toLowerCase();
    const tokens = tokenize(text);

    const mentions = [];
    for (const name of countries) {
        const key = name.toLowerCase();
        if (normalizedText.includes(key)) {
            mentions.push(name);
        }
    }

    for (const t of tokens) {
        if (countrySet.has(t)) {
            const canonical = countryByLower.get(t);
            if (canonical && !mentions.includes(canonical)) mentions.push(canonical);
        }
    }

    const { origin, destination } = pickOriginDestination(text, mentions);
    
    return { mentions, origin, destination };
};
