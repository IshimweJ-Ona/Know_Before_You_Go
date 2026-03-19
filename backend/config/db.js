import mysql from "mysql2/promise";
import { env } from "./env.js";

// Database configuration
const poolConfig = {
    host: env.db.host,
    user: env.db.user,
    password: env.db.password,
    database: env.db.name,
    port: env.db.port,
    waitForConnections: true,
    connectionLimit: 10,
    queueLimit: 0,
};

const pool = mysql.createPool(poolConfig);

export default pool;
