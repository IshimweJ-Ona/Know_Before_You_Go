/**
 * Dos and Don'ts API Endpoint
 * GET /api/dos-donts/:country_code
 * 
 * Returns cultural guidance and local laws for a specific country
 */

const { query } = require('../config/database');

/**
 * GET /api/dos-donts/:country_code
 * Fetch dos and don'ts for a country
 * 
 * Parameters:
 * - country_code: ISO 3166-1 alpha-3 code (e.g., RWA, KEN, TZA)
 * 
 * Response:
 * {
 *   success: true,
 *   country_code: "RWA",
 *   country_name: "Rwanda",
 *   do_count: 3,
 *   dont_count: 3,
 *   data: {
 *     do: [
 *       {
 *         id: 1,
 *         description: "Do respect the culture..."
 *       }
 *     ],
 *     dont: [
 *       {
 *         id: 4,
 *         description: "Don't photograph people..."
 *       }
 *     ]
 *   }
 * }
 */
const getDosAndDonts = async (req, res) => {
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

    // Fetch "do" items
    const doResult = await query(
      `SELECT 
        id,
        description
      FROM dos_and_donts
      WHERE country_code = $1 AND type = 'do'
      ORDER BY id ASC`,
      [country_code.toUpperCase()]
    );

    // Fetch "don't" items
    const dontResult = await query(
      `SELECT 
        id,
        description
      FROM dos_and_donts
      WHERE country_code = $1 AND type = 'dont'
      ORDER BY id ASC`,
      [country_code.toUpperCase()]
    );

    res.status(200).json({
      success: true,
      country_code: country_code.toUpperCase(),
      country_name: countryName,
      do_count: doResult.rows.length,
      dont_count: dontResult.rows.length,
      data: {
        do: doResult.rows,
        dont: dontResult.rows
      },
      timestamp: new Date().toISOString()
    });
  } catch (error) {
    console.error('Error fetching dos and donts:', error);
    res.status(500).json({
      success: false,
      error: 'Failed to fetch dos and donts',
      message: error.message,
      timestamp: new Date().toISOString()
    });
  }
};

module.exports = {
  getDosAndDonts
};
