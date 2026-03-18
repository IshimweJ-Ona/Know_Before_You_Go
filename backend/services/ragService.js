import crypto from "crypto";
import { askAI } from "./groqService.js";

const buildContextBlock = (data) => {
    return JSON.stringify(data, null, 2);
};

const AI_CACHE_TTL_SECONDS = Number(process.env.AI_CACHE_TTL_SECONDS || 6 * 60 * 60);
const aiMemoryCache = new Map();

const getAiMemoryCache = (key) => {
    const hit = aiMemoryCache.get(key);
    if (!hit) return null;
    if (Date.now() > hit.expiresAt) {
        aiMemoryCache.delete(key);
        return null;
    }
    return hit.value;
};

const setAiMemoryCache = (key, value, ttlSeconds) => {
    aiMemoryCache.set(key, { value, expiresAt: Date.now() + ttlSeconds * 1000 });
};

export const generateAnswer = async ({ intent, data, question }) => {
    const systemPrompt = "You are a travel assistant for African travelers. Use ONLY the information provided. If data is missing, say it is not available.";
    const userPrompt = `Intent: ${intent}
Question: ${question}

Data:
${buildContextBlock(data)}`;

    const cacheSeed = JSON.stringify({ intent, question, data });
    const hash = crypto.createHash("sha256").update(cacheSeed).digest("hex");
    const cacheKey = `ai:${hash}`;
    const cached = getAiMemoryCache(cacheKey);
    if (cached) return cached;

    const answer = await askAI({ systemPrompt, userPrompt });
    if (answer) {
        setAiMemoryCache(cacheKey, answer, AI_CACHE_TTL_SECONDS);
    }
    return answer;
};
