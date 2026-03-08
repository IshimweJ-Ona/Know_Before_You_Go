/**
 * Visa Requirements API Endpoint
 * GET /api/visa/:country_code
 * 
 * Returns visa requirements for a specific country
 * Country code validation is handled by middleware (validateCountryCodeParam)
 */

const { query } = require('../config/database');

/**
 * GET /api/visa/:country_code
 * Fetch visa requirements for a country
 * 
 * Parameters:
 * - country_code: ISO 3166-1 alpha-3 code (e.g., RWA, KEN, TZA)
 *   Validated and sanitized by validateCountryCodeParam middleware
 * 
 * Response:
 * {
 *   success: true,
 *   country_code: "RWA",
 *   country_name: "Rwanda",
 *   count: 2,
 *   data: [
 *     {
 *       id: 1,
 *       visa_type: "Visa on Arrival",
 *       duration_days: 30,
 *       cost_usd: 50,
 *       requirements: "Passport...",
 *       notes: "Available at..."
 *     },
 *     ...
 *   ]
 * }
 */
const getVisaRequirements = async (req, res) => {
  try {
    const country_code = req.params.country_code;  // Already validated by middleware

    // Verify country exists
    const countryResult = await query(
      'SELECT country_code, name FROM countries WHERE country_code = $1',
      [country_code]
    );

    if (countryResult.rows.length === 0) {
      return res.status(404).json({
        success: false,
        error: 'Country not found',
        country_code: country_code,
        message: 'The requested country does not exist in the database',
        timestamp: new Date().toISOString()
      });
    }

    const countryName = countryResult.rows[0].name;

    // Fetch visa requirements
    const visaResult = await query(
      `SELECT 
        id,
        visa_type,
        duration_days,
        cost_usd,
        requirements,
        notes
      FROM visa_requirements
      WHERE country_code = $1
      ORDER BY visa_type ASC`,
      [country_code]
    );

    res.status(200).json({
      success: true,
      country_code: country_code,
      country_name: countryName,
      count: visaResult.rows.length,
      data: visaResult.rows,
      timestamp: new Date().toISOString()
    });
  } catch (error) {
    console.error('Error fetching visa requirements:', error);
    res.status(500).json({
      success: false,
      error: 'Failed to fetch visa requirements',
      message: error.message,
      timestamp: new Date().toISOString()
    });
  }
};

module.exports = {
  getVisaRequirements
};
