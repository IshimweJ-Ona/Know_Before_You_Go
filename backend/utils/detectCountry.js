import { detectCountries } from "../services/countryDetector.js";

export const detectCountry = async (text) => {
    const { mentions } = await detectCountries(text || "");
    return mentions[0] || null;
};
