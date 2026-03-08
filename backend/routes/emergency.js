/**
 * Emergency Contacts API Endpoint
 * GET /api/emergency/:country_code
 * 
 * Returns embassy and consulate contact information for a specific country
 * Country code validation is handled by middleware (validateCountryCodeParam)
 */

const { query } = require('../config/database');

/**
 * GET /api/emergency/:country_code
 * Fetch emergency contacts (embassies, consulates) for a country
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
 *   data: [...]
 * }
 */
const getEmergencyContacts = async (req, res) => {
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
        timestamp: new Date().toISOString()
      });
    }

    const countryName = countryResult.rows[0].name;

    // Fetch emergency contacts
    const contactsResult = await query(
      `SELECT 
        id,
        embassy_name,
        phone,
        email,
        address,
        website
      FROM emergency_contacts
      WHERE country_code = $1
      ORDER BY embassy_name ASC`,
      [country_code]
    );

    res.status(200).json({
      success: true,
      country_code: country_code,
      country_name: countryName,
      count: contactsResult.rows.length,
      data: contactsResult.rows,
      timestamp: new Date().toISOString()
    });
  } catch (error) {
    console.error('Error fetching emergency contacts:', error);
    res.status(500).json({
      success: false,
      error: 'Failed to fetch emergency contacts',
      message: error.message,
      timestamp: new Date().toISOString()
    });
  }
};

module.exports = {
  getEmergencyContacts
};
