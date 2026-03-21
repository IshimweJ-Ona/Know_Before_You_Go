import Groq from "groq-sdk";
import { env } from "../config/env.js";

const groq = new Groq({
    apiKey: env.groqApiKey,
});

export const askAI = async ({ systemPrompt, userPrompt, model = "openai/gpt-oss-120b" }) => {
    const completion = await groq.chat.completions.create({
        messages: [
            { role: "system", content: systemPrompt },
            { role: "user", content: userPrompt },
        ],
        model,
        temperature: 0.2,
    });

    return completion.choices[0]?.message?.content ?? "";
};
