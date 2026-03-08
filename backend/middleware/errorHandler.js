/**
 * Centralized Error Handler Middleware
 * Catches and formats all errors consistently
 * Prevents sensitive error details from leaking to frontend
 */

/**
 * API Error class for consistent error handling
 * 
 * @param {string} message - User-facing error message
 * @param {number} statusCode - HTTP status code
 * @param {object} details - Internal details (not sent to client)
 */
class APIError extends Error {
  constructor(message, statusCode = 500, details = {}) {
    super(message);
    this.statusCode = statusCode;
    this.details = details;
    this.timestamp = new Date().toISOString();
  }
}

/**
 * Async error wrapper
 * Wraps async route handlers to catch errors automatically
 * 
 * Usage:
 * app.get('/api/countries', asyncHandler(async (req, res) => {
 *   const result = await query(...);
 *   res.json(result);
 * }));
 * 
 * @param {function} fn - Async function to wrap
 * @returns {function} Wrapped function that catches errors
 */
const asyncHandler = (fn) => (req, res, next) => {
  Promise.resolve(fn(req, res, next)).catch(next);
};

/**
 * Global error handler middleware
 * Must be the LAST middleware in the app
 * 
 * Usage: app.use(errorHandler)
 * 
 * @param {error} err - Error object
 * @param {object} req - Express request
 * @param {object} res - Express response
 * @param {function} next - Express next
 */
const errorHandler = (err, req, res, next) => {
  console.error('Error:', {
    message: err.message,
    statusCode: err.statusCode || 500,
    stack: process.env.NODE_ENV === 'development' ? err.stack : undefined,
    timestamp: new Date().toISOString()
  });

  // Determine status code
  const statusCode = err.statusCode || 500;

  // Build response
  const response = {
    success: false,
    error: err.message || 'Internal Server Error',
    timestamp: new Date().toISOString()
  };

  // Sanitize error message for production
  if (process.env.NODE_ENV === 'production') {
    if (statusCode === 500) {
      response.error = 'Internal Server Error';
      response.message = 'An unexpected error occurred. Please try again later.';
    }
  } else {
    // In development, include more details
    if (err.details) {
      response.details = err.details;
    }
  }

  res.status(statusCode).json(response);
};

/**
 * 404 Not Found middleware
 * Catches any unmatched routes
 * 
 * Usage: app.use(notFoundHandler) — must be after all other routes
 * 
 * @param {object} req - Express request
 * @param {object} res - Express response
 */
const notFoundHandler = (req, res) => {
  res.status(404).json({
    success: false,
    error: 'Not Found',
    message: `The route ${req.method} ${req.path} does not exist`,
    timestamp: new Date().toISOString()
  });
};

/**
 * Validation error formatter
 * Formats validation errors consistently
 * 
 * @param {object} errors - Validation error object { field: error_message }
 * @param {number} statusCode - HTTP status code (default: 400)
 * @returns {object} Formatted error response
 */
const validationError = (errors, statusCode = 400) => {
  return {
    success: false,
    error: 'Validation Error',
    message: 'One or more fields failed validation',
    statusCode,
    fields: Object.keys(errors),
    errors,
    timestamp: new Date().toISOString()
  };
};

/**
 * Database error formatter
 * Handles database errors safely
 * 
 * @param {error} dbError - Database error object
 * @returns {object} Formatted error response
 */
const databaseError = (dbError) => {
  console.error('Database error:', dbError);

  // Check error type
  if (dbError.code === '23505') {
    // Unique constraint violation
    return {
      success: false,
      error: 'Duplicate Entry',
      message: 'This record already exists',
      statusCode: 409,
      timestamp: new Date().toISOString()
    };
  }

  if (dbError.code === '23503') {
    // Foreign key constraint violation
    return {
      success: false,
      error: 'Invalid Reference',
      message: 'Referenced record does not exist',
      statusCode: 400,
      timestamp: new Date().toISOString()
    };
  }

  if (dbError.code === '42P01') {
    // Undefined table
    return {
      success: false,
      error: 'Database Error',
      message: 'Required database tables do not exist',
      statusCode: 500,
      timestamp: new Date().toISOString()
    };
  }

  // Generic database error (don't expose details)
  return {
    success: false,
    error: 'Database Error',
    message: 'Failed to process request',
    statusCode: 500,
    timestamp: new Date().toISOString()
  };
};

/**
 * Logging middleware
 * Logs all requests and their outcomes
 * 
 * Usage: app.use(requestLogger)
 * 
 * @param {object} req - Express request
 * @param {object} res - Express response
 * @param {function} next - Express next
 */
const requestLogger = (req, res, next) => {
  const start = Date.now();
  
  // Capture the original send function
  const originalSend = res.send;
  
  // Override res.send to log response
  res.send = function (data) {
    const duration = Date.now() - start;
    
    // Only log in debug mode to avoid excessive output
    if (process.env.LOG_LEVEL === 'debug') {
      console.log({
        method: req.method,
        path: req.path,
        statusCode: res.statusCode,
        duration: `${duration}ms`,
        timestamp: new Date().toISOString()
      });
    }
    
    // Call the original send
    return originalSend.call(this, data);
  };
  
  next();
};

module.exports = {
  APIError,
  asyncHandler,
  errorHandler,
  notFoundHandler,
  validationError,
  databaseError,
  requestLogger
};
