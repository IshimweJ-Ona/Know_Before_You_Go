/**
 * Newsletter Subscription API Endpoint
 * POST /api/newsletter/subscribe
 * 
 * Handles newsletter subscription with email validation and duplicate detection
 */

const { query } = require('../config/database');

/**
 * POST /api/newsletter/subscribe
 * Subscribe a user to the newsletter
 * 
 * Request Body:
 * {
 *   "name": "John Doe",
 *   "email": "john@example.com"
 * }
 * 
 * Response (Success 201):
 * {
 *   success: true,
 *   message: "Successfully subscribed to newsletter",
 *   subscriber_id: 1,
 *   timestamp: "2026-03-08T10:30:00Z"
 * }
 * 
 * Response (Duplicate 409):
 * {
 *   success: false,
 *   error: "Email already subscribed",
 *   message: "This email is already in our newsletter list"
 * }
 * 
 * Response (Validation Error 400):
 * {
 *   success: false,
 *   error: "Validation failed",
 *   message: "Email is required and must be valid",
 *   fields: ["email"]
 * }
 */
const subscribeNewsletter = async (req, res) => {
  try {
    const { name, email } = req.body;

    // ============================================
    // VALIDATION (Phase 4 will enhance this)
    // ============================================
    
    // Check name
    if (!name || typeof name !== 'string' || name.trim().length === 0) {
      return res.status(400).json({
        success: false,
        error: 'Validation failed',
        message: 'Name is required and must be a non-empty string',
        fields: ['name'],
        timestamp: new Date().toISOString()
      });
    }

    // Check email
    if (!email || typeof email !== 'string') {
      return res.status(400).json({
        success: false,
        error: 'Validation failed',
        message: 'Email is required and must be a string',
        fields: ['email'],
        timestamp: new Date().toISOString()
      });
    }

    // Basic email format validation
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailRegex.test(email.trim())) {
      return res.status(400).json({
        success: false,
        error: 'Validation failed',
        message: 'Email must be in valid format (e.g., user@example.com)',
        fields: ['email'],
        timestamp: new Date().toISOString()
      });
    }

    const trimmedEmail = email.trim().toLowerCase();
    const trimmedName = name.trim();

    // ============================================
    // CHECK FOR DUPLICATE EMAIL
    // ============================================
    const existingResult = await query(
      'SELECT id, is_active FROM subscribers WHERE email = $1',
      [trimmedEmail]
    );

    if (existingResult.rows.length > 0) {
      const existingSubscriber = existingResult.rows[0];
      
      if (existingSubscriber.is_active) {
        return res.status(409).json({
          success: false,
          error: 'Email already subscribed',
          message: 'This email is already in our newsletter list',
          email: trimmedEmail,
          timestamp: new Date().toISOString()
        });
      } else {
        // Reactivate unsubscribed email
        const reactivateResult = await query(
          `UPDATE subscribers 
           SET is_active = true, unsubscribed_at = NULL, updated_at = CURRENT_TIMESTAMP
           WHERE id = $1
           RETURNING id, name, email, subscribed_at`,
          [existingSubscriber.id]
        );

        return res.status(201).json({
          success: true,
          message: 'Successfully resubscribed to newsletter',
          subscriber_id: reactivateResult.rows[0].id,
          status: 'resubscribed',
          timestamp: new Date().toISOString()
        });
      }
    }

    // ============================================
    // INSERT NEW SUBSCRIBER
    // ============================================
    const insertResult = await query(
      `INSERT INTO subscribers (name, email, is_active, subscribed_at)
       VALUES ($1, $2, true, CURRENT_TIMESTAMP)
       RETURNING id, name, email, subscribed_at`,
      [trimmedName, trimmedEmail]
    );

    const newSubscriber = insertResult.rows[0];

    res.status(201).json({
      success: true,
      message: 'Successfully subscribed to newsletter',
      subscriber_id: newSubscriber.id,
      email: newSubscriber.email,
      subscribed_at: newSubscriber.subscribed_at,
      timestamp: new Date().toISOString()
    });
  } catch (error) {
    console.error('Error subscribing to newsletter:', error);
    res.status(500).json({
      success: false,
      error: 'Subscription failed',
      message: error.message,
      timestamp: new Date().toISOString()
    });
  }
};

module.exports = {
  subscribeNewsletter
};
