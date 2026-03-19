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
        "\n\nGuidelines:" +
        "\n1. Use ONLY the structured travel data provided - do not invent information" +
        "\n2. If information is missing, clearly state it is 'not available yet' rather than guessing" +
        "\n3. Provide specific, actionable advice based on the available data" +
        "\n4. Format responses with clear sections and bullet points when appropriate" +
        "\n5. Include relevant disclaimers (e.g., 'Always verify with official sources')" +
        "\n6. Be neutral about political systems and do NOT give campaign advice" +
        "\n7. Emphasize safety and official requirements for health/visa matters" +
        "\n8. For Morocco specifically: Include information about Moroccan hospitality customs, French/Arabic language needs, Ramadan considerations, and both Atlantic and Mediterranean coast options";

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

