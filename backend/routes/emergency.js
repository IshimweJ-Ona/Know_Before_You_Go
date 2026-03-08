/**
 * Emergency Contacts API Endpoint
 * GET /api/emergency/:country_code
 * 
 * Returns embassy and consulate contact information for a specific country
 */

const { query } = require('../config/database');

/**
 * GET /api/emergency/:country_code
 * Fetch emergency contacts (embassies, consulates) for a country
 * 
 * Parameters:
 * - country_code: ISO 3166-1 alpha-3 code (e.g., RWA, KEN, TZA)
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
 *       embassy_name: "Embassy of Rwanda in Kenya",
 *       phone: "+254 20 4443 567",
 *       email: "info@rwandaembassy.or.ke",
 *       address: "Nairobi, Kenya",
 *       website: "www.rwandaembassy.or.ke"
 *     },
 *     ...
 *   ]
 * }
 */
const getEmergencyContacts = async (req, res) => {
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
      [country_code.toUpperCase()]
    );

    res.status(200).json({
      success: true,
      country_code: country_code.toUpperCase(),
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
