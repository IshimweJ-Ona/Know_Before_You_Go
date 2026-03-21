import express from "express";
import cors from "cors";
import path from "path";
import { fileURLToPath } from "url";
import crypto from "crypto";
import rateLimit from "express-rate-limit";

import aiRoutes from "./routes/aiRoutes.js";
import countryRoutes from "./routes/countryRoutes.js";
import v1Routes from "./routes/v1Routes.js";
import pool from "./config/db.js";
import { env } from "./config/env.js";

const app = express();
const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);
const userFrontendPath = path.join(__dirname, "..", "frontend", "user");
const adminFrontendPath = path.join(__dirname, "..", "frontend", "admin");

const allowedOrigins = (process.env.CORS_ORIGINS || "http://localhost:3000,http://localhost:5173,http://localhost:5000")
    .split(",")
    .map(origin => origin.trim())
    .filter(Boolean);

app.use(cors({
    origin: (origin, callback) => {
        if (!origin || allowedOrigins.includes(origin)) {
            return callback(null, true);
        }
        return callback(new Error("Not allowed by CORS"));
    },
}));
app.use(express.json());

app.use((req, res, next) => {
    req.id = crypto.randomUUID();
    res.setHeader("X-Request-Id", req.id);
    const start = Date.now();
    res.on("finish", () => {
        const durationMs = Date.now() - start;
        console.log(`${req.id} ${req.method} ${req.originalUrl} ${res.statusCode} ${durationMs}ms`);
    });
    next();
});

const aiLimiter = rateLimit({
    windowMs: 60 * 1000,
    limit: 30,
    standardHeaders: true,
    legacyHeaders: false,
});

const adminLimiter = rateLimit({
    windowMs: 60 * 1000,
    limit: 10,
    standardHeaders: true,
    legacyHeaders: false,
});

const subscriberLimiter = rateLimit({
    windowMs: 60 * 1000,
    limit: 20,
    standardHeaders: true,
    legacyHeaders: false,
});

// Disable caching for API responses
app.use("/api/", (req, res, next) => {
    res.set({
        'Cache-Control': 'no-store, no-cache, must-revalidate, max-age=0',
        'Pragma': 'no-cache',
        'Expires': '0'
    });
    next();
});

app.use("/api/ai", aiLimiter, aiRoutes);
app.use("/api/countries", countryRoutes);
app.use("/api/v1/admin", adminLimiter);
app.use("/api/v1/subscriber", subscriberLimiter);
app.use("/api/v1", v1Routes);

app.use("/admin", express.static(adminFrontendPath));
app.use(express.static(userFrontendPath));
app.get("/", (_req, res) => {
    res.sendFile(path.join(userFrontendPath, "index.html"));
});
app.get("/favicon.ico", (_req, res) => {
    res.status(204).end();
});

app.get("/health", (_req, res) => {
    res.status(200).json({ ok: true });
});

app.get("/ready", async (_req, res) => {
    try {
        await pool.query("SELECT 1");
        res.status(200).json({ ok: true });
    } catch (error) {
        res.status(500).json({ ok: false, message: "Dependency check failed." });
    }
});

const PORT = process.env.PORT || 5000;

const server = app.listen(PORT, () => {
    console.log(`Server running on port ${PORT}, http://localhost:5000`);
});

server.on("error", (error) => {
    console.error("Server startup error:", error?.message || error);
});

process.on("unhandledRejection", (error) => {
    console.error("Unhandled rejection:", error?.message || error);
});

process.on("uncaughtException", (error) => {
    console.error("Uncaught exception:", error?.message || error);
});

export { app, server };
