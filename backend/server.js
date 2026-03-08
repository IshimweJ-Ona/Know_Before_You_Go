/**
 * Know Before You Go Backend API
 * Express.js server for African travel information platform
 * 
 * Endpoints:
 * - GET /api/countries
 * - GET /api/visa/:country_code
 * - GET /api/health/:country_code
 * - GET /api/dos-donts/:country_code
 * - GET /api/general/:country_code
 * - GET /api/emergency/:country_code
 * - POST /api/newsletter/subscribe
 */

require('dotenv').config();
const express = require('express');
const cors = require('cors');
const helmet = require('helmet');

// Import middleware
const { 
  validateCountryCodeParam, 
  validateNewsletterBody 
} = require('./middleware/validation');
const { 
  asyncHandler, 
  errorHandler, 
  notFoundHandler,
  requestLogger 
} = require('./middleware/errorHandler');

// Import route handlers
const { getCountries } = require('./routes/countries');
const { getVisaRequirements } = require('./routes/visa');
const { getHealthRequirements } = require('./routes/health');
const { getDosAndDonts } = require('./routes/dosDonts');
const { getGeneralRequirements } = require('./routes/general');
const { getEmergencyContacts } = require('./routes/emergency');
const { subscribeNewsletter } = require('./routes/newsletter');

const app = express();
const PORT = process.env.PORT || 5000;

// ============================================
// MIDDLEWARE
// ============================================

// Request logging middleware
app.use(requestLogger);

// Security headers
app.use(helmet());

// CORS configuration (allow frontend to make requests)
const corsOptions = {
  origin: process.env.FRONTEND_URL || '*',
  methods: ['GET', 'POST', 'OPTIONS'],
  allowedHeaders: ['Content-Type'],
  credentials: true,
  optionsSuccessStatus: 200
};
app.use(cors(corsOptions));

// Body parser middleware
app.use(express.json({ limit: '10kb' }));
app.use(express.urlencoded({ limit: '10kb', extended: true }));

// ============================================
// HEALTH CHECK ENDPOINT
// ============================================
app.get('/health', (req, res) => {
  res.status(200).json({
    status: 'OK',
    timestamp: new Date().toISOString(),
    environment: process.env.NODE_ENV || 'development'
  });
});

// ============================================
// API ROUTES (Implemented with Validation - Phase 4)
// ============================================

// Countries endpoint
app.get('/api/countries', asyncHandler(getCountries));

// Visa requirements endpoint (with country code validation)
app.get('/api/visa/:country_code', validateCountryCodeParam, asyncHandler(getVisaRequirements));

// Health requirements endpoint (with country code validation)
app.get('/api/health/:country_code', validateCountryCodeParam, asyncHandler(getHealthRequirements));

// Dos and Don'ts endpoint (with country code validation)
app.get('/api/dos-donts/:country_code', validateCountryCodeParam, asyncHandler(getDosAndDonts));

// General requirements endpoint (with country code validation)
app.get('/api/general/:country_code', validateCountryCodeParam, asyncHandler(getGeneralRequirements));

// Emergency contacts endpoint (with country code validation)
app.get('/api/emergency/:country_code', validateCountryCodeParam, asyncHandler(getEmergencyContacts));

// Newsletter subscription endpoint (with body validation)
app.post('/api/newsletter/subscribe', validateNewsletterBody, asyncHandler(subscribeNewsletter));

// ============================================
// 404 NOT FOUND & ERROR HANDLING (Phase 4)
// ============================================

// 404 handler (must be after all routes)
app.use(notFoundHandler);

// Global error handler (must be last)
app.use(errorHandler);

// ============================================
// SERVER STARTUP
// ============================================
app.listen(PORT, () => {
  console.log(`
  ║   Know Before You Go Backend API                          ║
  ║   Server running on http://localhost:${PORT}                  ║
  ║   Environment: ${process.env.NODE_ENV || 'development'}                        ║
  ║   Health Check: http://localhost:${PORT}/health             ║
  ║                                                            ║
  ║   API Endpoints (Phase 4 - SECURED):                      ║
  ║   - GET  /api/countries                                   ║
  ║   - GET  /api/visa/:country_code (validated)              ║
  ║   - GET  /api/health/:country_code (validated)            ║
  ║   - GET  /api/dos-donts/:country_code (validated)         ║
  ║   - GET  /api/general/:country_code (validated)           ║
  ║   - GET  /api/emergency/:country_code (validated)         ║
  ║   - POST /api/newsletter/subscribe (validated)            ║
  ║                                                            ║
  ║   Security Features:                                      ║
  ║   ✓ Parameterized SQL queries                             ║
  ║   ✓ Input validation & sanitization                       ║
  ║   ✓ Helmet.js security headers                            ║
  ║   ✓ CORS protection                                       ║
  ║   ✓ Global error handler                                  ║
  ║   ✓ Environment-aware error messages                      ║
  ║   ✓ Request logging                                       ║
  `);
});

// Graceful shutdown
process.on('SIGTERM', () => {
  console.log('SIGTERM signal received: closing HTTP server');
  process.exit(0);
});

module.exports = app;
