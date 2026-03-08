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

const app = express();
const PORT = process.env.PORT || 5000;

// ============================================
// MIDDLEWARE
// ============================================

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
// API ROUTES (Placeholder - will be implemented in Phase 3)
// ============================================

// Countries endpoint
app.get('/api/countries', (req, res) => {
  res.status(200).json({
    status: 'endpoint-ready',
    message: 'GET /api/countries - Fetch all countries (Phase 3)',
    implementation: 'pending'
  });
});

// Visa requirements endpoint
app.get('/api/visa/:country_code', (req, res) => {
  res.status(200).json({
    status: 'endpoint-ready',
    message: `GET /api/visa/${req.params.country_code} - Fetch visa requirements (Phase 3)`,
    implementation: 'pending'
  });
});

// Health requirements endpoint
app.get('/api/health/:country_code', (req, res) => {
  res.status(200).json({
    status: 'endpoint-ready',
    message: `GET /api/health/${req.params.country_code} - Fetch health requirements (Phase 3)`,
    implementation: 'pending'
  });
});

// Dos and Don'ts endpoint
app.get('/api/dos-donts/:country_code', (req, res) => {
  res.status(200).json({
    status: 'endpoint-ready',
    message: `GET /api/dos-donts/${req.params.country_code} - Fetch dos and don'ts (Phase 3)`,
    implementation: 'pending'
  });
});

// General requirements endpoint
app.get('/api/general/:country_code', (req, res) => {
  res.status(200).json({
    status: 'endpoint-ready',
    message: `GET /api/general/${req.params.country_code} - Fetch general requirements (Phase 3)`,
    implementation: 'pending'
  });
});

// Emergency contacts endpoint
app.get('/api/emergency/:country_code', (req, res) => {
  res.status(200).json({
    status: 'endpoint-ready',
    message: `GET /api/emergency/${req.params.country_code} - Fetch emergency contacts (Phase 3)`,
    implementation: 'pending'
  });
});

// Newsletter subscription endpoint
app.post('/api/newsletter/subscribe', (req, res) => {
  res.status(200).json({
    status: 'endpoint-ready',
    message: 'POST /api/newsletter/subscribe - Subscribe to newsletter (Phase 3)',
    implementation: 'pending'
  });
});

// ============================================
// 404 NOT FOUND
// ============================================
app.use((req, res) => {
  res.status(404).json({
    error: 'Not Found',
    message: `The route ${req.method} ${req.path} does not exist`,
    timestamp: new Date().toISOString()
  });
});

// ============================================
// ERROR HANDLING
// ============================================
app.use((err, req, res, next) => {
  console.error(err.stack);
  res.status(err.status || 500).json({
    error: err.message || 'Internal Server Error',
    timestamp: new Date().toISOString()
  });
});

// ============================================
// SERVER STARTUP
// ============================================
app.listen(PORT, () => {
  console.log(`
  ╔════════════════════════════════════════════════════════════╗
  ║   Know Before You Go Backend API                          ║
  ║   Server running on http://localhost:${PORT}                  ║
  ║   Environment: ${process.env.NODE_ENV || 'development'}                        ║
  ║   Health Check: http://localhost:${PORT}/health             ║
  ║                                                            ║
  ║   API Endpoints (Phase 3):                                ║
  ║   - GET  /api/countries                                   ║
  ║   - GET  /api/visa/:country_code                          ║
  ║   - GET  /api/health/:country_code                        ║
  ║   - GET  /api/dos-donts/:country_code                     ║
  ║   - GET  /api/general/:country_code                       ║
  ║   - GET  /api/emergency/:country_code                     ║
  ║   - POST /api/newsletter/subscribe                        ║
  ╚════════════════════════════════════════════════════════════╝
  `);
});

// Graceful shutdown
process.on('SIGTERM', () => {
  console.log('SIGTERM signal received: closing HTTP server');
  process.exit(0);
});

module.exports = app;
