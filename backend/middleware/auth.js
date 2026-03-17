import jwt from "jsonwebtoken";

export const requireAdmin = (req, res, next) => {
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
        req.user = payload;
        next();
    } catch (error) {
        return res.status(401).json({ message: "Invalid token." });
    }
};
