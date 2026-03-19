import mysql from "mysql2/promise";
import dotenv from "dotenv";

dotenv.config();

let poolConfig;

if (process.env.DATABASE_URL) {
    // Parse DATABASE_URL for Railway MySQL
    const url = new URL(process.env.DATABASE_URL);
    poolConfig = {
        host: url.hostname,
        user: url.username,
        password: url.password,
        database: url.pathname.slice(1), // remove leading /
        port: Number(url.port) || 3306,
        waitForConnections: true,
        connectionLimit: 10,
        queueLimit: 0,
    };
} else {
    // Fallback to individual env vars
    poolConfig = {
        host: process.env.DB_HOST,
        user: process.env.DB_USER,
        password: process.env.DB_PASSWORD,
        database: process.env.DB_NAME,
        port: Number(process.env.DB_PORT),
        waitForConnections: true,
        connectionLimit: 10,
        queueLimit: 0,
    };
}

const pool = mysql.createPool(poolConfig);

export default pool;
