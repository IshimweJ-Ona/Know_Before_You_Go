/**
 * Health Requirements API Endpoint
 * GET /api/health/:country_code
 * 
 * Returns health documentation requirements for a specific country
 */

const { query } = require('../config/database');

/**
 * GET /api/health/:country_code
 * Fetch health requirements for a country
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
 *   recommended_count: 2,
 *   data: {
 *     mandatory: [
 *       {
 *         id: 1,
 *         requirement_name: "Yellow Fever Vaccination",
 *         description: "Yellow fever vaccine required...",
 *         notes: "International vaccination certificate..."
 *       }
 *     ],
 *     recommended: [
 *       {
 *         id: 2,
 *         requirement_name: "Malaria Prophylaxis",
 *         description: "Recommended for...",
 *         notes: "Consult doctor..."
 *       }
 *     ]
 *   }
 * }
 */
const getHealthRequirements = async (req, res) => {
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

    // Fetch mandatory health requirements
    const mandatoryResult = await query(
      `SELECT 
        id,
        requirement_name,
        description,
        notes
      FROM health_requirements
      WHERE country_code = $1 AND is_mandatory = true
      ORDER BY requirement_name ASC`,
      [country_code.toUpperCase()]
    );

    // Fetch recommended health requirements
    const recommendedResult = await query(
      `SELECT 
        id,
        requirement_name,
        description,
        notes
      FROM health_requirements
      WHERE country_code = $1 AND is_mandatory = false
      ORDER BY requirement_name ASC`,
      [country_code.toUpperCase()]
    );

    res.status(200).json({
      success: true,
      country_code: country_code.toUpperCase(),
      country_name: countryName,
      mandatory_count: mandatoryResult.rows.length,
      recommended_count: recommendedResult.rows.length,
      data: {
        mandatory: mandatoryResult.rows,
        recommended: recommendedResult.rows
      },
      timestamp: new Date().toISOString()
    });
  } catch (error) {
    console.error('Error fetching health requirements:', error);
    res.status(500).json({
      success: false,
      error: 'Failed to fetch health requirements',
      message: error.message,
      timestamp: new Date().toISOString()
    });
  }
};

module.exports = {
  getHealthRequirements
};
