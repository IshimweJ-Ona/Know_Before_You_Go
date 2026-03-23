import dotenv from "dotenv";

dotenv.config();

const requiredEnvVars = [
    "DB_HOST",
    "DB_USER",
    "DB_PASSWORD",
    "DB_NAME",
    "DB_PORT",
    "GROQ_API_KEY",
    "JWT_SECRET",
];

const missing = requiredEnvVars.filter((key) => !process.env[key]);

if (missing.length) {
    const msg = `Missing required environment variables: ${missing.join(", ")}`;
    console.error(msg);
    // In production, fail fast; in development, log but continue.
    if (process.env.NODE_ENV === "production") {
        throw new Error(msg);
    }
}

export const env = {
    nodeEnv: process.env.NODE_ENV || "development",

    db: {
        host: process.env.DB_HOST,
        user: process.env.DB_USER,
        password: process.env.DB_PASSWORD,
        name: process.env.DB_NAME,
        port: Number(process.env.DB_PORT) || 3306,
    },

    jwtSecret: process.env.JWT_SECRET || "",
    groqApiKey: process.env.GROQ_API_KEY || "",
    aiCacheTtlSeconds: Number(process.env.AI_CACHE_TTL_SECONDS || 6 * 60 * 60),
    externalSourcesTtlSeconds: Number(process.env.EXTERNAL_SOURCES_TTL_SECONDS || 6 * 60 * 60),
};
