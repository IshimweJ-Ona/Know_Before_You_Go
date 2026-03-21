import { analyzeQuery } from "../services/queryAnalyzer.js";
import { detectCountries } from "../services/countryDetector.js";
import { fetchCountryProfileCached, fetchVisaInfoCached } from "../services/knowledgeEngine.js";
import { formatGuide, formatVisa } from "../services/responseFormatter.js";
import { generateAnswer } from "../services/ragService.js";

const hasMeaningfulData = (payload) => {
    if (!payload) return false;
    if (payload.country && payload.country.country_name) return true;
    if (payload.visa && Object.keys(payload.visa).length > 0) return true;
    if (payload.places && payload.places.length > 0) return true;
    if (payload.emergency && (payload.emergency.police_number || payload.emergency.ambulance_number)) return true;
    if (payload.cultural && ((payload.cultural.dos || []).length || (payload.cultural.donts || []).length)) return true;
    if (payload.health && ((payload.health.required_vaccines || []).length || (payload.health.recommended_vaccines || []).length)) return true;
    return false;
};

export const handleQuery = async (req, res) => {
    try {
        const { query } = req.body;

        if (!query || typeof query !== "string") {
            return res.status(400).json({ success: false, message: "Query is required." });
        }

        const intent = analyzeQuery(query);
        const { origin, destination, mentions } = await detectCountries(query);

        if (intent === "visa_info") {
            const targetCountry = destination || origin || mentions[0];
            if (!targetCountry) {
                return res.status(400).json({
                    success: false,
                    intent,
                    message: "No country detected in the query.",
                });
            }
            const visaData = await fetchVisaInfoCached({
                countryName: targetCountry,
            });
            const formatted = formatVisa(visaData);
            let aiText = "";
            try {
                if (hasMeaningfulData(visaData)) {
                    aiText = await generateAnswer({
                        intent,
                        data: visaData,
                        question: query,
                        countryName: targetCountry,
                    });
                }
            } catch (aiError) {
                console.error("AI generation failed (visa_info):", {
                    message: aiError?.message || aiError,
                    intent,
                    country: targetCountry,
                    query: query.slice(0, 160),
                });
            }

            return res.json({
                success: true,
                intent,
                country: targetCountry,
                formatted,
                aiText,
            });
        }

        const targetCountry = destination || origin || mentions[0];
        if (!targetCountry) {
            return res.json({
                success: false,
                intent,
                message: "No country detected in the query.",
            });
        }

        const profile = await fetchCountryProfileCached(targetCountry);
        if (!profile) {
            return res.json({
                success: false,
                intent,
                message: "Country not found in database.",
            });
        }

        const formatted = formatGuide(profile);
        let aiText = "";
        try {
            if (hasMeaningfulData(profile)) {
                aiText = await generateAnswer({
                    intent,
                    data: profile,
                    question: query,
                    countryName: targetCountry,
                });
            }
        } catch (aiError) {
            console.error("AI generation failed (guide):", {
                message: aiError?.message || aiError,
                intent,
                country: targetCountry,
                query: query.slice(0, 160),
            });
        }

        res.json({
            success: true,
            intent,
            country: targetCountry,
            formatted,
            aiText,
        });
    } catch (error) {
        console.error("handleQuery error:", error?.message || error);
        res.status(500).json({
            success: false,
            message: "Internal server error.",
        });
    }
};
