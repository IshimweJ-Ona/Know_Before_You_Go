import Groq from "groq-sdk";

const groq = new Groq({
    apiKey: process.env.GROQ_API_KEY,
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
