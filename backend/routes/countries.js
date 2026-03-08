/**
 * Countries API Endpoint
 * GET /api/countries
 * 
 * Returns all African countries in the database with their metadata
 * Used by frontend to populate the country selector dropdown
 */

const { query } = require('../config/database');

/**
 * GET /api/countries
 * Fetch all countries
 * 
 * Response:
 * {
 *   success: true,
 *   count: 10,
 *   data: [
 *     {
 *       country_code: "RWA",
 *       name: "Rwanda",
 *       region: "East Africa",
 *       capital: "Kigali",
 *       flag_url: "https://flagcdn.com/rw.svg"
 *     },
 *     ...
 *   ]
 * }
 */
const getCountries = async (req, res) => {
  try {
    const result = await query(
      `SELECT 
        country_code,
        name,
        region,
        capital,
        flag_url,
        created_at
      FROM countries
      ORDER BY region ASC, name ASC`
    );

    res.status(200).json({
      success: true,
      count: result.rows.length,
      data: result.rows,
      timestamp: new Date().toISOString()
    });
  } catch (error) {
    console.error('Error fetching countries:', error);
    res.status(500).json({
      success: false,
      error: 'Failed to fetch countries',
      message: error.message,
      timestamp: new Date().toISOString()
    });
  }
};

module.exports = {
  getCountries
};
