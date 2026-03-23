import crypto from "crypto";
import { askAI } from "./groqService.js";
import { env } from "../config/env.js";
import { createMemoryCache } from "../utils/memoryCache.js";

const buildContextBlock = (data) => {
    return JSON.stringify(data, null, 2);
};

const aiCache = createMemoryCache(env.aiCacheTtlSeconds);

export const generateAnswer = async ({ intent, data, question, countryName, systemPrompt: overrideSystemPrompt }) => {
    const countryLine = countryName ? `Country: ${countryName}\n` : "";

    const baseSystemPrompt =
        "You are an expert travel advisor specializing in African destinations. Your expertise includes:" +
        "\n- Visa requirements and entry procedures for all African countries" +
        "\n- Health advisories, vaccinations, and medical preparation" +
        "\n- Cultural etiquette, local customs, and dos & don'ts" +
        "\n- Emergency contacts and safety information" +
        "\n- Transportation options and practical travel tips" +
        "\n- Best time to visit, climate, and seasonal considerations" +
        "\n- Budget travel and cost-of-living information" +
        "\n- Education statistics (literacy and enrollment rates) when provided" +
        "\n\nGuidelines:" +
        "\n1. Use ONLY the structured data provided - do not invent information" +
        "\n2. If information is missing, clearly state it is 'not available yet' rather than guessing" +
        "\n3. Keep the response clean and readable: short headings with colon and bullet points" +
        "\n4. Do NOT use markdown tables or long markdown formatting" +
        "\n5. If external_sources are provided, use them as trusted references and add a short 'Sources:' line with URLs" +
        "\n6. Include relevant disclaimers (e.g., 'Always verify with official sources')" +
        "\n7. Do NOT provide political analysis, religious guidance, relationship advice, or general science content" +
        "\n8. Emphasize safety and official requirements for health/visa matters" +
        "\n9. If education statistics are present, include the year and source and do not extrapolate beyond the data" +
        "\n10. For Morocco specifically: Include information about Moroccan hospitality customs, French/Arabic language needs, Ramadan considerations, and both Atlantic and Mediterranean coast options";

    const systemPrompt = overrideSystemPrompt || baseSystemPrompt;

    const userPrompt = `${countryLine}Intent: ${intent}
Question: ${question}

Data:
${buildContextBlock(data)}`;

    const cacheSeed = JSON.stringify({ intent, question, data, countryName, systemPrompt });
    const hash = crypto.createHash("sha256").update(cacheSeed).digest("hex");
    const cacheKey = `ai:${hash}`;
    const cached = aiCache.get(cacheKey);
    if (cached) return cached;

    const answer = await askAI({ systemPrompt, userPrompt });
    if (answer) {
        aiCache.set(cacheKey, answer);
    }
    return answer;
};
