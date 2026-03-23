import pool from "../config/db.js";
import bcrypt from "bcryptjs";
import jwt from "jsonwebtoken";
import { generateAnswer } from "../services/ragService.js";
import { evaluateQueryPolicy, buildPolicyRefusal } from "../services/aiPolicy.js";
import { fetchEducationStatsCached } from "../services/educationStatsService.js";
import { detectCountries } from "../services/countryDetector.js";
import { analyzeQuery } from "../services/queryAnalyzer.js";
import { fetchCountryProfileCached, fetchVisaInfoCached } from "../services/knowledgeEngine.js";
import { fetchExternalEnrichment } from "../services/externalSources.js";
import { generateSessionToken, hashSessionToken } from "../utils/sessionToken.js";

const hasMeaningfulData = (payload) => {
    if (!payload) return false;
    if (payload.country && payload.country.country_name) return true;
    if (payload.visa && Object.keys(payload.visa).length > 0) return true;
    if (payload.places && payload.places.length) return true;
    if (payload.health && ((payload.health.required_vaccines || []).length || (payload.health.recommended_vaccines || []).length)) return true;
    if (payload.emergency && (payload.emergency.police_number || payload.emergency.ambulance_number)) return true;
    if (payload.guidelines && ((payload.guidelines.dos || []).length || (payload.guidelines.donts || []).length)) return true;
    return false;
};


const COUNTRY_LIST_COLUMNS = [
    "country_code",
    "country_name",
    "region",
    "capital",
    "currency",
    "language",
    "population",
    "power_voltage",
    "timezone",
    "tipping",
    "climate",
    "description",
    "transportation",
    "housing",
    "flag_url",
    "advisory_level",
    "visa_status",
    "cdc_notice_level",
];
const COUNTRY_DETAIL_COLUMNS = ["id", ...COUNTRY_LIST_COLUMNS];
const COUNTRY_COLUMN_CACHE_TTL_MS = 5 * 60 * 1000;
let countryColumnCache = { columns: null, expiresAt: 0 };

const normalizeRow = (row, fields) => {
    const normalized = {};
    for (const field of fields) {
        normalized[field] = row?.[field] ?? null;
    }
    return normalized;
};

const getAvailableCountryColumns = async () => {
    const now = Date.now();
    if (countryColumnCache.columns && now < countryColumnCache.expiresAt) {
        return countryColumnCache.columns;
    }
    try {
        const dbName = process.env.DB_NAME;
        if (!dbName) return new Set(COUNTRY_DETAIL_COLUMNS);
        const [rows] = await pool.query(
            "SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = ? AND TABLE_NAME = 'countries'",
            [dbName]
        );
        const columns = new Set(rows.map((row) => row.COLUMN_NAME));
        countryColumnCache = { columns, expiresAt: now + COUNTRY_COLUMN_CACHE_TTL_MS };
        return columns;
    } catch {
        return new Set(COUNTRY_DETAIL_COLUMNS);
    }
};

const pickColumns = (requested, available, fallback) => {
    const selected = requested.filter((column) => available.has(column));
    if (selected.length) return selected;
    return fallback.filter((column) => available.has(column)).length
        ? fallback.filter((column) => available.has(column))
        : fallback;
};

const fetchCountryByCode = async (code) => {
    const available = await getAvailableCountryColumns();
    const selected = pickColumns(COUNTRY_DETAIL_COLUMNS, available, ["id", "country_code", "country_name"]);
    const [rows] = await pool.query(
        `SELECT ${selected.map((column) => `c.${column}`).join(", ")}
         FROM countries c
         WHERE c.country_code = ?`,
        [code]
    );
    const row = rows[0];
    if (!row) return null;
    return normalizeRow(row, COUNTRY_DETAIL_COLUMNS);
};

const ASSISTANT_CACHE_TTL_SECONDS = 10 * 60;
const BUNDLE_CACHE_TTL_SECONDS = 10 * 60;
import { createMemoryCache } from "../utils/memoryCache.js";

const assistantCache = createMemoryCache(ASSISTANT_CACHE_TTL_SECONDS);
const bundleCache = createMemoryCache(BUNDLE_CACHE_TTL_SECONDS);

const getAssistantCache = (key) => assistantCache.get(key);
const setAssistantCache = (key, value) => assistantCache.set(key, value);
const getBundleCache = (key) => bundleCache.get(key);
const setBundleCache = (key, value) => bundleCache.set(key, value);

const issueSessionToken = async (userId) => {
    const raw = generateSessionToken();
    const hashed = hashSessionToken(raw);
    await pool.query("UPDATE users SET session_token_hash = ? WHERE id = ?", [hashed, userId]);
    return raw;
};

const isAdminInviteAllowed = async (email) => {
    const allowList = (process.env.ADMIN_INVITE_EMAILS || "")
        .split(",")
        .map((value) => value.trim().toLowerCase())
        .filter(Boolean);
    if (allowList.length && allowList.includes(email)) {
        return { allowed: true, source: "env" };
    }
    try {
        const [rows] = await pool.query(
            "SELECT id FROM admin_invites WHERE email = ? AND is_active = 1 AND used_at IS NULL LIMIT 1",
            [email]
        );
        const invite = rows[0];
        return invite ? { allowed: true, source: "db", inviteId: invite.id } : { allowed: false };
    } catch {
        return { allowed: false };
    }
};

const fetchCountryBundle = async (code) => {
    const country = await fetchCountryByCode(code);
    if (!country) return null;

    const [
        [places],
        [visaRows],
        [advisoryRows],
        [emergencyRows],
        [guidelineRows],
    ] = await Promise.all([
        pool.query("SELECT name, description, image_url FROM places WHERE country_id = ? ORDER BY name", [country.id]),
        pool.query("SELECT visa_status, visa_free_days, visa_title, visa_info FROM visa_requirements WHERE country_id = ?", [country.id]),
        pool.query("SELECT id, medication_rules, cdc_notice_level FROM health_advisories WHERE country_id = ?", [country.id]),
        pool.query(
            `SELECT police_number, ambulance_number, fire_number, general_emergency, tourist_police
             FROM emergency_contacts WHERE country_id = ?`,
            [country.id]
        ),
        pool.query("SELECT id, dress_code FROM cultural_guidelines WHERE country_id = ?", [country.id]),
    ]);

    const advisory = advisoryRows[0];
    const guideline = guidelineRows[0];

    let health = {};
    if (advisory) {
        const [required] = await pool.query(
            "SELECT vaccine FROM health_required_vaccines WHERE advisory_id = ? ORDER BY id",
            [advisory.id]
        );
        const [recommended] = await pool.query(
            "SELECT vaccine FROM health_recommended_vaccines WHERE advisory_id = ? ORDER BY id",
            [advisory.id]
        );
        const [risks] = await pool.query(
            "SELECT risk FROM health_risks WHERE advisory_id = ? ORDER BY id",
            [advisory.id]
        );
        const [outbreaks] = await pool.query(
            "SELECT outbreak FROM health_active_outbreaks WHERE advisory_id = ? ORDER BY id",
            [advisory.id]
        );
        health = {
            medication_rules: advisory.medication_rules,
            cdc_notice_level: advisory.cdc_notice_level,
            required_vaccines: required.map(r => r.vaccine),
            recommended_vaccines: recommended.map(r => r.vaccine),
            health_risks: risks.map(r => r.risk),
            active_outbreaks: outbreaks.map(o => o.outbreak),
        };
    }

    let guidelines = {};
    if (guideline) {
        const [dos] = await pool.query(
            "SELECT item FROM cultural_dos WHERE guideline_id = ? ORDER BY id",
            [guideline.id]
        );
        const [donts] = await pool.query(
            "SELECT item FROM cultural_donts WHERE guideline_id = ? ORDER BY id",
            [guideline.id]
        );
        const [legal] = await pool.query(
            "SELECT title, description FROM cultural_legal_warnings WHERE guideline_id = ? ORDER BY id",
            [guideline.id]
        );
        guidelines = {
            dress_code: guideline.dress_code,
            dos: dos.map(d => d.item),
            donts: donts.map(d => d.item),
            legal_warnings: legal,
        };
    }

    return {
        country: {
            ...country,
            places: places.map(p => ({
                name: p.name,
                description: p.description,
                image: p.image_url,
            })),
        },
        visa: visaRows[0] || {},
        health,
        emergency: emergencyRows[0] || {},
        guidelines,
    };
};

const fetchCountryBundleCached = async (code) => {
    const cacheKey = `bundle:${code}`;
    const cached = getBundleCache(cacheKey);
    if (cached) return cached;
    const bundle = await fetchCountryBundle(code);
    if (bundle) {
        setBundleCache(cacheKey, bundle);
    }
    return bundle;
};

export const listCountries = async (_req, res) => {
    try {
        const available = await getAvailableCountryColumns();
        const selected = pickColumns(COUNTRY_LIST_COLUMNS, available, ["country_code", "country_name"]);
        const [rows] = await pool.query(
            `SELECT ${selected.map((column) => `c.${column}`).join(", ")}
             FROM countries c
             ORDER BY c.country_name`
        );
        const normalized = rows.map((row) => normalizeRow(row, COUNTRY_LIST_COLUMNS));
        console.log('[listCountries] Fetched', normalized.length, 'countries');
        res.status(200).json(normalized);
    } catch (error) {
        console.error('[listCountries] Error:', error.message);
        res.status(500).json({ message: "Failed to load countries." });
    }
};

export const getCountry = async (req, res) => {
    try {
        const code = (req.params.code || "").toUpperCase();
        const bundle = await fetchCountryBundleCached(code);
        if (!bundle) return res.status(404).json({ message: "Country not found." });
        res.status(200).json({ country: bundle.country });
    } catch (error) {
        res.status(500).json({ message: "Failed to load country." });
    }
};

export const getVisa = async (req, res) => {
    try {
        const code = (req.params.code || "").toUpperCase();
        const bundle = await fetchCountryBundleCached(code);
        if (!bundle) return res.status(404).json({ message: "Country not found." });
        res.status(200).json({ visa: bundle.visa });
    } catch (error) {
        res.status(500).json({ message: "Failed to load visa info." });
    }
};

export const getHealth = async (req, res) => {
    try {
        const code = (req.params.code || "").toUpperCase();
        const bundle = await fetchCountryBundleCached(code);
        if (!bundle) return res.status(404).json({ message: "Country not found." });
        res.status(200).json({ health: bundle.health || {} });
    } catch (error) {
        res.status(500).json({ message: "Failed to load health info." });
    }
};

export const getEmergency = async (req, res) => {
    try {
        const code = (req.params.code || "").toUpperCase();
        const bundle = await fetchCountryBundleCached(code);
        if (!bundle) return res.status(404).json({ message: "Country not found." });
        res.status(200).json({ emergency: bundle.emergency || {} });
    } catch (error) {
        res.status(500).json({ message: "Failed to load emergency contacts." });
    }
};

export const getDosDonts = async (req, res) => {
    try {
        const code = (req.params.code || "").toUpperCase();
        const bundle = await fetchCountryBundleCached(code);
        if (!bundle) return res.status(404).json({ message: "Country not found." });
        res.status(200).json({ guidelines: bundle.guidelines || {} });
    } catch (error) {
        res.status(500).json({ message: "Failed to load cultural guidelines." });
    }
};

export const getCountryAssistant = async (req, res) => {
    try {
        const code = (req.params.code || "").toUpperCase();
        const cacheKey = `assistant:${code}`;
        const cached = getAssistantCache(cacheKey);
        if (cached) {
            return res.status(200).json(cached);
        }

        const bundle = await fetchCountryBundleCached(code);
        if (!bundle) return res.status(404).json({ message: "Country not found." });

        let aiText = "";
        try {
            if (hasMeaningfulData(bundle)) {
                aiText = await generateAnswer({
                    intent: "country_profile",
                    data: bundle,
                    question: `Provide a concise, well-structured travel overview for ${bundle.country.country_name}. Focus on visas, health, safety, emergency services, and cultural norms.`,
                    countryName: bundle.country.country_name,
                });
            }
        } catch (aiError) {
            console.error("AI generation failed (country assistant):", {
                message: aiError?.message || aiError,
                intent: "country_profile",
                country: bundle.country?.country_name,
            });
            aiText = "";
        }

        const payload = { ...bundle, aiText };
        setAssistantCache(cacheKey, payload);
        res.status(200).json(payload);
    } catch (error) {
        res.status(500).json({ message: "Failed to load assistant data." });
    }
};

export const createNewsletter = async (req, res) => {
    const { email, name, password } = req.body || {};
    if (!email) return res.status(400).json({ message: "Email is required." });
    if (!password) return res.status(400).json({ message: "Password is required." });
    try {
        const sessionToken = generateSessionToken();
        const sessionHash = hashSessionToken(sessionToken);
        const hashedPassword = await bcrypt.hash(password, 10);
        await pool.query(
            "INSERT IGNORE INTO users (email, full_name, role, password_hash, source, session_token_hash) VALUES (?, ?, 'subscriber', ?, ?, ?)",
            [email.trim().toLowerCase(), name || null, hashedPassword, "frontend", sessionHash]
        );
        res.status(200).json({ success: true });
    } catch (error) {
        if (error?.code === "ER_DUP_ENTRY") {
            return res.status(409).json({ message: "Email already subscribed." });
        }
        res.status(500).json({ message: "Failed to subscribe." });
    }
};

export const listSubscribers = async (_req, res) => {
    try {
        const [rows] = await pool.query(
            "SELECT id, email, full_name AS name, status, created_at FROM users WHERE role = 'subscriber' ORDER BY created_at DESC"
        );
        res.status(200).json({ subscribers: rows });
    } catch (error) {
        res.status(500).json({ message: "Failed to load subscribers." });
    }
};

export const deleteSubscriber = async (req, res) => {
    const { id } = req.params;
    try {
        await pool.query("DELETE FROM users WHERE id = ? AND role = 'subscriber'", [id]);
        res.status(200).json({ message: "Subscriber deleted." });
    } catch (error) {
        res.status(500).json({ message: "Failed to delete subscriber." });
    }
};

export const createAdmin = async (req, res) => {
    const { email, full_name, password, role } = req.body || {};
    if (!email || !password) {
        return res.status(400).json({ message: "Email and password are required." });
    }
    try {
        const normalizedEmail = email.trim().toLowerCase();
        const inviteCheck = await isAdminInviteAllowed(normalizedEmail);
        if (!inviteCheck.allowed) {
            return res.status(403).json({ message: "Admin signup is restricted." });
        }

        const password_hash = await bcrypt.hash(password, 10);
        const sessionToken = generateSessionToken();
        const sessionHash = hashSessionToken(sessionToken);
        await pool.query(
            "INSERT INTO users (email, full_name, password_hash, role, session_token_hash) VALUES (?, ?, ?, ?, ?)",
            [normalizedEmail, full_name || null, password_hash, role || "admin", sessionHash]
        );
        if (inviteCheck.source === "db" && inviteCheck.inviteId) {
            await pool.query("UPDATE admin_invites SET used_at = NOW() WHERE id = ?", [
                inviteCheck.inviteId,
            ]);
        }
        res.status(201).json({ success: true });
    } catch (error) {
        if (error?.code === "ER_DUP_ENTRY") {
            return res.status(409).json({ message: "Email already exists." });
        }
        res.status(500).json({ message: "Failed to create admin." });
    }
};

export const loginAdmin = async (req, res) => {
    const { email, password } = req.body || {};
    if (!email || !password) {
        return res.status(400).json({ message: "Email and password are required." });
    }
    try {
        if (!process.env.JWT_SECRET) {
            return res.status(500).json({ message: "Server misconfiguration." });
        }
        const [rows] = await pool.query(
            "SELECT id, email, full_name, role, is_active, password_hash FROM users WHERE email = ? AND role = 'admin' LIMIT 1",
            [email.trim().toLowerCase()]
        );
        const admin = rows[0];
        if (!admin || !admin.is_active) {
            return res.status(401).json({ message: "Invalid credentials." });
        }
        const ok = await bcrypt.compare(password, admin.password_hash || "");
        if (!ok) return res.status(401).json({ message: "Invalid credentials." });

        const sessionToken = await issueSessionToken(admin.id);
        const token = jwt.sign(
            { id: admin.id, email: admin.email, role: admin.role, st: sessionToken },
            process.env.JWT_SECRET,
            { expiresIn: "7d" }
        );

        res.status(200).json({
            token,
            admin: {
                id: admin.id,
                email: admin.email,
                full_name: admin.full_name,
                role: admin.role,
            },
        });
    } catch (error) {
        res.status(500).json({ message: "Failed to login." });
    }
};

export const listFeedback = async (_req, res) => {
    res.status(200).json({ feedback: [] });
};

export const updateCountryAdmin = async (req, res) => {
    try {
        const code = (req.params.code || "").toUpperCase();
        const { transportation, housing } = req.body || {};
        const [rows] = await pool.query(
            "SELECT id FROM countries WHERE country_code = ?",
            [code]
        );
        const country = rows[0];
        if (!country) return res.status(404).json({ message: "Country not found." });

        await pool.query(
            "UPDATE countries SET transportation = ?, housing = ? WHERE id = ?",
            [transportation || null, housing || null, country.id]
        );

        const available = await getAvailableCountryColumns();
        const selected = pickColumns(COUNTRY_LIST_COLUMNS, available, ["country_code", "country_name"]);
        const [updatedRows] = await pool.query(
            `SELECT ${selected.map((column) => `c.${column}`).join(", ")}
             FROM countries c WHERE c.id = ?`,
            [country.id]
        );

        res.status(200).json(normalizeRow(updatedRows[0], COUNTRY_LIST_COLUMNS));
    } catch (error) {
        res.status(500).json({ message: "Failed to update country." });
    }
};

// Subscriber signup
export const signupSubscriber = async (req, res) => {
    const { email, password, full_name } = req.body || {};
    if (!email || !password || !full_name) {
        return res.status(400).json({ message: "Email, password, and full name are required." });
    }
    try {
        const hashedPassword = await bcrypt.hash(password, 10);
        const sessionToken = generateSessionToken();
        const sessionHash = hashSessionToken(sessionToken);
        await pool.query(
            "INSERT INTO users (email, full_name, role, password_hash, session_token_hash) VALUES (?, ?, 'subscriber', ?, ?)",
            [email.trim().toLowerCase(), full_name.trim(), hashedPassword, sessionHash]
        );
        res.status(201).json({ message: "Subscriber account created successfully." });
    } catch (error) {
        if (error?.code === "ER_DUP_ENTRY") {
            return res.status(409).json({ message: "Email already exists." });
        }
        res.status(500).json({ message: "Failed to create account." });
    }
};

// Subscriber login
export const loginSubscriber = async (req, res) => {
    const { email, password } = req.body || {};
    if (!email || !password) {
        return res.status(400).json({ message: "Email and password are required." });
    }
    try {
        if (!process.env.JWT_SECRET) {
            return res.status(500).json({ message: "Server misconfiguration." });
        }
        const [rows] = await pool.query(
            "SELECT id, email, full_name, role, is_active, password_hash FROM users WHERE email = ? AND role = 'subscriber' LIMIT 1",
            [email.trim().toLowerCase()]
        );
        const user = rows[0];
        if (!user || !user.is_active) {
            return res.status(401).json({ message: "Invalid credentials." });
        }
        const ok = await bcrypt.compare(password, user.password_hash || "");
        if (!ok) return res.status(401).json({ message: "Invalid credentials." });

        const sessionToken = await issueSessionToken(user.id);
        const token = jwt.sign(
            { id: user.id, email: user.email, role: user.role, st: sessionToken },
            process.env.JWT_SECRET,
            { expiresIn: "30d" }
        );

        res.status(200).json({
            token,
            user: {
                id: user.id,
                email: user.email,
                full_name: user.full_name,
                role: user.role,
            },
        });
    } catch (error) {
        res.status(500).json({ message: "Failed to login." });
    }
};

// Get news
export const getNews = async (req, res) => {
    try {
        const { country, category } = req.query;
        let query =
            "SELECT id, title, content, country_code, category, published_at FROM news WHERE is_active = 1";
        const params = [];

        if (country) {
            query += " AND country_code = ?";
            params.push(country.toUpperCase());
        }

        if (category) {
            query += " AND category = ?";
            params.push(category);
        }

        query += " ORDER BY published_at DESC";

        const [rows] = await pool.query(query, params);
        // If no news in DB, fetch from external sources for countries
        if (rows.length === 0) {
            // Mock external news fetching
            const countries = ['Kenya', 'Tanzania', 'Rwanda', 'Uganda', 'Ethiopia']; // From DB
            const mockNews = countries.map(c => ({
                title: `Latest Travel News for ${c}`,
                content: `Recent updates on travel to ${c}, including visa changes and safety alerts.`,
                published_at: new Date().toISOString()
            }));
            // In production, integrate with NewsAPI or similar service
            res.status(200).json({ news: mockNews });
        } else {
            res.status(200).json({ news: rows });
        }
    } catch (error) {
        console.error("getNews error:", error);
        res.status(500).json({ message: "Failed to fetch news." });
    }
};

// Get advertisements
export const getAds = async (req, res) => {
    try {
        const { country } = req.query;
        let query = "SELECT id, company_name, title, description, image_url, link_url FROM advertisements WHERE is_active = 1";
        const params = [];
        if (country) {
            query += " AND (target_country IS NULL OR target_country = ?)";
            params.push(country.toUpperCase());
        }
        query += " ORDER BY created_at DESC";
        const [rows] = await pool.query(query, params);
        res.status(200).json({ ads: rows });
    } catch (error) {
        console.error("getAds error:", error);
        res.status(500).json({ message: "Failed to fetch ads." });
    }
};

// AI Chat
export const aiChat = async (req, res) => {
    const { message, history } = req.body || {};
    if (!message) {
        return res.status(400).json({ message: "Message is required." });
    }
    try {
        const policy = evaluateQueryPolicy(message);
        if (!policy.allowed) {
            return res.status(200).json({ response: buildPolicyRefusal(policy.reason) });
        }

        const intent = analyzeQuery(message);
        const { origin, destination, mentions } = await detectCountries(message);
        const targetCountry = destination || origin || mentions?.[0];

        let educationStats = null;
        if (policy.wantsEducationStats && targetCountry) {
            try {
                educationStats = await fetchEducationStatsCached({ countryName: targetCountry });
            } catch {
                educationStats = null;
            }
        }

        if (!targetCountry) {
            return res.status(200).json({
                response: "Please include a country name so I can provide accurate information from our database.",
            });
        }

        let data = null;
        if (intent === "visa_info") {
            const visaData = await fetchVisaInfoCached({ countryName: targetCountry });
            const external = await fetchExternalEnrichment({
                intent,
                countryName: targetCountry,
                countryCode: visaData?.country?.country_code,
            });
            data = external ? { ...visaData, external_sources: external } : visaData;
        } else {
            const profile = await fetchCountryProfileCached(targetCountry);
            const external = await fetchExternalEnrichment({
                intent,
                countryName: targetCountry,
                countryCode: profile?.country?.country_code,
            });
            data = educationStats
                ? { ...profile, education_stats: educationStats, external_sources: external }
                : { ...profile, external_sources: external };
        }

        const userPrompt = history ? `${history}\nUser: ${message}` : `User: ${message}`;

        const response = await generateAnswer({
            intent,
            data: hasMeaningfulData(data) ? data : { country: { country_name: targetCountry } },
            question: userPrompt,
            countryName: targetCountry,
        });

        const text = typeof response === "string" ? response : response?.answer || "";
        res.status(200).json({ response: text });
    } catch (error) {
        console.error("aiChat error:", {
            message: error?.message || error,
            query: String(message).slice(0, 160),
        });
        res.status(500).json({ message: "Failed to process chat." });
    }
};
