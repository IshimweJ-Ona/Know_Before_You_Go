/**
 * General Entry Requirements API Endpoint
 * GET /api/general/:country_code
 * 
 * Returns general entry requirements (passport validity, funds, etc.) for a specific country
 */

const { query } = require('../config/database');

/**
 * GET /api/general/:country_code
 * Fetch general entry requirements for a country
 * 
 * Parameters:
 * - country_code: ISO 3166-1 alpha-3 code (e.g., RWA, KEN, TZA)
 * 
 * Response:
 * {
 *   success: true,
 *   country_code: "RWA",
 *   country_name: "Rwanda",
 *   mandatory_count: 1,
 *   optional_count: 2,
 *   data: {
 *     mandatory: [
 *       {
 *         id: 1,
 *         title: "Passport Validity",
 *         description: "Passport must be valid..."
 *       }
 *     ],
 *     optional: [
 *       {
 *         id: 2,
 *         title: "Return Ticket",
 *         description: "Proof of onward..."
 *       }
 *     ]
 *   }
 * }
 */
const getGeneralRequirements = async (req, res) => {
  try {
    const { country_code } = req.params;

    // Validate country code format
    if (!country_code || country_code.length !== 3) {
      return res.status(400).json({
        success: false,
        error: 'Invalid country code',
        message: 'Country code must be 3 letters (ISO 3166-1 alpha-3)',
        timestamp: new Date().toISOString()
      });
    }

    // Verify country exists
    const countryResult = await query(
      'SELECT country_code, name FROM countries WHERE country_code = $1',
      [country_code.toUpperCase()]
    );

    if (countryResult.rows.length === 0) {
      return res.status(404).json({
        success: false,
        error: 'Country not found',
        country_code: country_code.toUpperCase(),
        timestamp: new Date().toISOString()
      });
    }

    const countryName = countryResult.rows[0].name;

    // Fetch mandatory general requirements
    const mandatoryResult = await query(
      `SELECT 
        id,
        title,
        description
      FROM general_requirements
      WHERE country_code = $1 AND is_mandatory = true
      ORDER BY title ASC`,
      [country_code.toUpperCase()]
    );

    // Fetch optional general requirements
    const optionalResult = await query(
      `SELECT 
        id,
        title,
        description
      FROM general_requirements
      WHERE country_code = $1 AND is_mandatory = false
      ORDER BY title ASC`,
      [country_code.toUpperCase()]
    );

    res.status(200).json({
      success: true,
      country_code: country_code.toUpperCase(),
      country_name: countryName,
      mandatory_count: mandatoryResult.rows.length,
      optional_count: optionalResult.rows.length,
      data: {
        mandatory: mandatoryResult.rows,
        optional: optionalResult.rows
      },
      timestamp: new Date().toISOString()
    });
  } catch (error) {
    console.error('Error fetching general requirements:', error);
    res.status(500).json({
      success: false,
      error: 'Failed to fetch general requirements',
      message: error.message,
      timestamp: new Date().toISOString()
    });
  }
};

module.exports = {
  getGeneralRequirements
};
