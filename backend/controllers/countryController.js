import { detectCountries } from "../services/countryDetector.js";

export const detectCountryFromQuery = async (req, res) => {
    const { query } = req.body;

    const { mentions } = await detectCountries(query || "");
    const country = mentions[0] || null;

    if (!country) {
        return res.status(404).json({
            success: false,
            message: "No country detected.",
            country: null
        });
    }

    res.json ({
        success: true,
        country,
        mentions,
    });
};
