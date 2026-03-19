import http from "http";
import { server } from "./server.js";

const port = process.env.PORT || 5000;
const backendUrl = `http://localhost:${port}`;

console.log(`Backend:  ${backendUrl}`);

const requestStatus = (url, { method = "GET", headers = {}, body = null } = {}) => {
    const target = new URL(url);
    const payload = body ? JSON.stringify(body) : null;

    const options = {
        hostname: target.hostname,
        port: target.port,
        path: target.pathname + target.search,
        method,
        headers: {
            ...headers,
            ...(payload ? { "Content-Type": "application/json", "Content-Length": Buffer.byteLength(payload) } : {}),
        },
    };

    return new Promise((resolve) => {
        const req = http.request(options, (res) => {
            res.on("data", () => {});
            res.on("end", () => {
                resolve({ status: res.statusCode || 0, statusText: res.statusMessage || "" });
            });
        });
        req.on("error", () => resolve({ status: 0, statusText: "REQUEST_FAILED" }));
        if (payload) req.write(payload);
        req.end();
    });
};

const endpointChecks = [
    { method: "GET", path: "/api/v1/countries" },
    { method: "GET", path: "/api/v1/countries/XX" },
    { method: "GET", path: "/api/v1/countries/XX/assistant" },
    { method: "GET", path: "/api/v1/visa/XX" },
    { method: "GET", path: "/api/v1/health/XX" },
    { method: "GET", path: "/api/v1/emergency/XX" },
    { method: "GET", path: "/api/v1/dosDonts/XX" },
    { method: "POST", path: "/api/v1/newsletter", body: { email: "test@example.com", name: "Test User" } },
    { method: "POST", path: "/api/v1/admin/login", body: { email: "admin@example.com", password: "bad-pass" } },
    { method: "GET", path: "/api/v1/admin/subscribers" },
    { method: "GET", path: "/api/v1/admin/feedback" },
    { method: "PATCH", path: "/api/v1/admin/countries/XX", body: { transportation: "N/A", housing: "N/A" } },
    { method: "POST", path: "/api/countries/detect", body: { query: "Travel to Rwanda" } },
    { method: "POST", path: "/api/ai/query", body: { query: "Visa for Rwanda" } },
];

const runEndpointChecks = async () => {
    console.log("Endpoint status check:");
    for (const check of endpointChecks) {
        const url = `${backendUrl}${check.path}`;
        const { status, statusText } = await requestStatus(url, check);
        const label = `${check.method} ${check.path}`;
        console.log(`  ${label} -> ${status} ${statusText}`.trim());
    }
};

server.on("listening", () => {
    if (process.env.RUN_HEALTH_CHECKS === "true") {
        setTimeout(() => {
            runEndpointChecks().catch((error) => {
                console.error("Endpoint check failed:", error?.message || error);
            });
        }, 300);
    }
});
