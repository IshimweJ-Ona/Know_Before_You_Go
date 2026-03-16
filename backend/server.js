'use strict';

const express    = require('express');
const cors       = require('cors');
const helmet     = require('helmet');
const rateLimit  = require('express-rate-limit');
require('dotenv').config();

const app = express();

/* ── SECURITY ── */
app.use(helmet());
app.use(express.json());

// CORS — allow configured origins
const allowedOrigins = (process.env.ALLOWED_ORIGINS || 'http://localhost:3000').split(',');
app.use(cors({
  origin: (origin, cb) => {
    if (!origin || allowedOrigins.includes(origin)) return cb(null, true);
    cb(new Error('Not allowed by CORS'));
  },
  methods: ['GET', 'POST', 'PUT', 'PATCH', 'DELETE'],
  allowedHeaders: ['Content-Type', 'Authorization'],
}));

// Global rate limiter
app.use(rateLimit({
  windowMs: 15 * 60 * 1000, // 15 minutes
  max: 100,
  message: { error: 'Too many requests. Please try again later.' },
  standardHeaders: true,
  legacyHeaders: false,
}));

/* ── ROUTES ── */
app.use('/api/v1/countries',  require('./routes/countries'));
app.use('/api/v1/visa',       require('./routes/visa'));
app.use('/api/v1/health',     require('./routes/health'));
app.use('/api/v1/dosDonts',   require('./routes/dosDonts'));
app.use('/api/v1/general',    require('./routes/general'));
app.use('/api/v1/emergency',  require('./routes/emergency'));
app.use('/api/v1/newsletter', require('./routes/newsletter'));
app.use('/api/v1/feedback',   require('./routes/feedback'));
app.use('/api/v1/auth',       require('./routes/auth'));
app.use('/api/v1/users',      require('./routes/users'));
app.use('/api/v1/admin',      require('./routes/admin'));

/* ── HEALTH CHECK ── */
app.get('/health', (req, res) => {
  res.json({ status: 'ok', timestamp: new Date().toISOString() });
});

/* ── 404 ── */
app.use((req, res) => {
  res.status(404).json({ error: 'Route not found' });
});

/* ── ERROR HANDLER ── */
app.use((err, req, res, next) => {
  console.error('[KBYG Error]', err.message);
  const status = err.status || err.statusCode || 500;
  res.status(status).json({ error: err.message || 'Internal server error' });
});

/* ── START ── */
const PORT = process.env.PORT || 5000;
app.listen(PORT, () => {
  console.log(`[KBYG] Server running on port ${PORT} (${process.env.NODE_ENV || 'development'})`);
});
