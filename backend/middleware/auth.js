import jwt from "jsonwebtoken";
import pool from "../config/db.js";
import { hashSessionToken } from "../utils/sessionToken.js";

const verifySessionToken = async ({ id, role, st }) => {
    if (!id || !role || !st) return false;
    const tokenHash = hashSessionToken(st);
    const [rows] = await pool.query(
        "SELECT session_token_hash FROM users WHERE id = ? AND role = ? AND is_active = 1 LIMIT 1",
        [id, role]
    );
    const record = rows[0];
    if (!record?.session_token_hash) return false;
    return record.session_token_hash === tokenHash;
};

export const requireAdmin = async (req, res, next) => {
    if (!process.env.JWT_SECRET) {
        return res.status(500).json({ message: "Server misconfiguration." });
    }
    const header = req.headers.authorization || "";
    const token = header.startsWith("Bearer ") ? header.slice(7) : null;
    if (!token) return res.status(401).json({ message: "Missing token." });

    try {
        const payload = jwt.verify(token, process.env.JWT_SECRET);
        if (payload?.role !== "admin") {
            return res.status(403).json({ message: "Access denied." });
        }
        const ok = await verifySessionToken(payload);
        if (!ok) {
            return res.status(401).json({ message: "Invalid session." });
        }
        req.user = payload;
        next();
    } catch (error) {
        return res.status(401).json({ message: "Invalid token." });
    }
};

export const requireSubscriber = async (req, res, next) => {
    if (!process.env.JWT_SECRET) {
        return res.status(500).json({ message: "Server misconfiguration." });
    }
    const header = req.headers.authorization || "";
    const token = header.startsWith("Bearer ") ? header.slice(7) : null;
    if (!token) return res.status(401).json({ message: "Missing token." });

    try {
        const payload = jwt.verify(token, process.env.JWT_SECRET);
        if (payload?.role !== "subscriber") {
            return res.status(403).json({ message: "Access denied." });
        }
        const ok = await verifySessionToken(payload);
        if (!ok) {
            return res.status(401).json({ message: "Invalid session." });
        }
        req.user = payload;
        next();
    } catch (error) {
        return res.status(401).json({ message: "Invalid token." });
    }
};
