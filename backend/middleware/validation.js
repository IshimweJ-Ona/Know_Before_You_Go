/**
 * Input Validation & Sanitization Middleware
 * Validates and sanitizes all user inputs to prevent:
 * - SQL Injection (via parameterized queries + validation)
 * - XSS attacks (via sanitization)
 * - Invalid data types
 * - Oversized requests
 */

const validator = require('validator');

/**
 * Validate country code format
 * Ensures it's exactly 3 uppercase letters (ISO 3166-1 alpha-3)
 * 
 * @param {string} code - Country code to validate
 * @returns {object} { valid: boolean, error?: string }
 */
const validateCountryCode = (code) => {
  if (!code || typeof code !== 'string') {
    return { valid: false, error: 'Country code must be a non-empty string' };
  }

  const sanitized = code.trim().toUpperCase();
  
  // Check format: exactly 3 letters
  if (!/^[A-Z]{3}$/.test(sanitized)) {
    return { valid: false, error: 'Country code must be 3 uppercase letters (ISO 3166-1 alpha-3)' };
  }

  return { valid: true, sanitized };
};

/**
 * Validate email format
 * Uses validator.js for robust email validation
 * 
 * @param {string} email - Email to validate
 * @returns {object} { valid: boolean, sanitized?: string, error?: string }
 */
const validateEmail = (email) => {
  if (!email || typeof email !== 'string') {
    return { valid: false, error: 'Email must be a non-empty string' };
  }

  const trimmed = email.trim().toLowerCase();

  // Validate email format
  if (!validator.isEmail(trimmed)) {
    return { valid: false, error: 'Email must be in valid format (user@example.com)' };
  }

  // Sanitize: normalize spaces and remove dangerous characters
  const sanitized = validator.normalizeEmail(trimmed);

  return { valid: true, sanitized };
};

/**
 * Validate name field
 * Ensures non-empty string with reasonable length
 * 
 * @param {string} name - Name to validate
 * @returns {object} { valid: boolean, sanitized?: string, error?: string }
 */
const validateName = (name) => {
  if (!name || typeof name !== 'string') {
    return { valid: false, error: 'Name must be a non-empty string' };
  }

  const trimmed = name.trim();

  // Check length (allow 2-100 characters)
  if (trimmed.length < 2 || trimmed.length > 100) {
    return { valid: false, error: 'Name must be between 2 and 100 characters' };
  }

  // Escape HTML/special characters to prevent XSS
  const sanitized = validator.escape(trimmed);

  return { valid: true, sanitized };
};

/**
 * Validate newsletter subscription request body
 * Combines name + email validation
 * 
 * @param {object} body - Request body { name, email }
 * @returns {object} { valid: boolean, data?: {name, email}, errors?: {field: error} }
 */
const validateNewsletterSubscription = (body) => {
  const errors = {};

  // Validate name
  const nameValidation = validateName(body.name);
  if (!nameValidation.valid) {
    errors.name = nameValidation.error;
  }

  // Validate email
  const emailValidation = validateEmail(body.email);
  if (!emailValidation.valid) {
    errors.email = emailValidation.error;
  }

  // If any errors, return early
  if (Object.keys(errors).length > 0) {
    return { valid: false, errors };
  }

  return {
    valid: true,
    data: {
      name: nameValidation.sanitized,
      email: emailValidation.sanitized
    }
  };
};

/**
 * Middleware: Validate country code in URL params
 * Use in routes like: app.get('/api/:country_code', validateCountryCodeParam, handler)
 * 
 * @param {object} req - Express request object
 * @param {object} res - Express response object
 * @param {function} next - Express next middleware function
 */
const validateCountryCodeParam = (req, res, next) => {
  const { country_code } = req.params;
  const validation = validateCountryCode(country_code);

  if (!validation.valid) {
    return res.status(400).json({
      success: false,
      error: 'Invalid country code',
      message: validation.error,
      timestamp: new Date().toISOString()
    });
  }

  // Attach sanitized code to request for downstream use
  req.params.country_code = validation.sanitized;
  next();
};

/**
 * Middleware: Validate newsletter subscription body
 * Use in routes like: app.post('/api/newsletter/subscribe', validateNewsletterBody, handler)
 * 
 * @param {object} req - Express request object
 * @param {object} res - Express response object
 * @param {function} next - Express next middleware function
 */
const validateNewsletterBody = (req, res, next) => {
  const validation = validateNewsletterSubscription(req.body);

  if (!validation.valid) {
    return res.status(400).json({
      success: false,
      error: 'Validation failed',
      message: 'One or more fields are invalid',
      fields: Object.keys(validation.errors),
      errors: validation.errors,
      timestamp: new Date().toISOString()
    });
  }

  // Attach validated & sanitized data to request
  req.validatedBody = validation.data;
  next();
};

/**
 * Sanitize string for database storage
 * Removes null bytes and excessive whitespace
 * Note: Parameterized queries handle SQL injection, this is extra protection
 * 
 * @param {string} str - String to sanitize
 * @returns {string} Sanitized string
 */
const sanitizeString = (str) => {
  if (!str) return '';
  
  // Remove null bytes
  let sanitized = str.replace(/\0/g, '');
  
  // Replace multiple spaces with single space
  sanitized = sanitized.replace(/\s+/g, ' ');
  
  return sanitized.trim();
};

/**
 * Escape SQL-like patterns (defense in depth)
 * The real protection is parameterized queries, but this adds another layer
 * 
 * @param {string} input - Input to escape
 * @returns {string} Escaped string
 */
const escapeSQLPattern = (input) => {
  if (!input || typeof input !== 'string') return input;
  
  // Escape single quotes
  return input.replace(/'/g, "''");
};

module.exports = {
  // Validators (return objects)
  validateCountryCode,
  validateEmail,
  validateName,
  validateNewsletterSubscription,
  
  // Middleware (used with Express)
  validateCountryCodeParam,
  validateNewsletterBody,
  
  // Utility functions
  sanitizeString,
  escapeSQLPattern
};
