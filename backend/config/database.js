/**
 * Database Configuration & Connection Pool
 * Manages PostgreSQL connections for the Know Before You Go API
 */

const { Pool } = require('pg');
require('dotenv').config();

/**
 * PostgreSQL Connection Pool Configuration
 * 
 * Environment variables required:
 * - DB_HOST: Database host (default: localhost)
 * - DB_PORT: Database port (default: 5432)
 * - DB_NAME: Database name (default: know_before_you_go)
 * - DB_USER: Database user (default: postgres)
 * - DB_PASSWORD: Database password
 * - NODE_ENV: Environment (development, test, production)
 */

const pool = new Pool({
  user: process.env.DB_USER || 'postgres',
  host: process.env.DB_HOST || 'localhost',
  database: process.env.DB_NAME || 'know_before_you_go',
  password: process.env.DB_PASSWORD || '',
  port: process.env.DB_PORT || 5432,
  max: process.env.NODE_ENV === 'production' ? 20 : 10, // Max connections
  idleTimeoutMillis: 30000,
  connectionTimeoutMillis: 2000,
  application_name: 'know-before-you-go-api'
});

/**
 * Handle pool errors
 */
pool.on('error', (err) => {
  console.error('Unexpected error on idle client', err);
  process.exit(-1);
});

pool.on('connect', () => {
  console.log('✓ New database connection established');
});

/**
 * Execute a parameterized query (SECURE - prevents SQL injection)
 * 
 * @param {string} queryText - SQL query with $1, $2, etc. placeholders
 * @param {array} values - Values to bind to placeholders
 * @returns {Promise} Query result
 * 
 * Example:
 * query('SELECT * FROM countries WHERE country_code = $1', ['RWA'])
 */
const query = async (queryText, values = []) => {
  const start = Date.now();
  try {
    const result = await pool.query(queryText, values);
    const duration = Date.now() - start;
    
    // Log slow queries in development
    if (process.env.NODE_ENV === 'development' && duration > 1000) {
      console.warn(`⚠ Slow query (${duration}ms): ${queryText.substring(0, 100)}`);
    }
    
    return result;
  } catch (error) {
    console.error('Database query error:', {
      query: queryText.substring(0, 100),
      error: error.message
    });
    throw error;
  }
};

/**
 * Get a single client from the pool for transaction handling
 * IMPORTANT: Call client.release() when done
 * 
 * Example:
 * const client = await getClient();
 * try {
 *   await client.query('BEGIN');
 *   await client.query('UPDATE ...');
 *   await client.query('COMMIT');
 * } catch (e) {
 *   await client.query('ROLLBACK');
 * } finally {
 *   client.release();
 * }
 */
const getClient = async () => {
  return pool.connect();
};

/**
 * Test the database connection
 * Call this on server startup to verify connectivity
 */
const testConnection = async () => {
  try {
    const result = await query('SELECT NOW()');
    console.log(`✓ Database connected successfully at ${result.rows[0].now}`);
    return true;
  } catch (error) {
    console.error('✗ Database connection failed:', error.message);
    return false;
  }
};

/**
 * Close the connection pool (call on server shutdown)
 */
const closePool = async () => {
  await pool.end();
  console.log('Database connection pool closed');
};

module.exports = {
  query,
  getClient,
  testConnection,
  closePool,
  pool
};
