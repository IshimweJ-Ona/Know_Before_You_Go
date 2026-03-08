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
 * Expects: req.validatedBody (set by validateNewsletterBody middleware)
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
 */
const subscribeNewsletter = async (req, res) => {
  try {
    // Use pre-validated and sanitized data from middleware
    const { name, email } = req.validatedBody;

    // ============================================
    // CHECK FOR DUPLICATE EMAIL
    // ============================================
    const existingResult = await query(
      'SELECT id, is_active FROM subscribers WHERE email = $1',
      [email]  // Already lowercase and normalized by validation middleware
    );

    if (existingResult.rows.length > 0) {
      const existingSubscriber = existingResult.rows[0];
      
      if (existingSubscriber.is_active) {
        return res.status(409).json({
          success: false,
          error: 'Email already subscribed',
          message: 'This email is already in our newsletter list',
          email: email,
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
      [name, email]  // Both already sanitized by validation middleware
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
