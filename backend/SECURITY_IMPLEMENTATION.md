# Know Before You Go - Security Implementation Guide

## Overview

This document outlines the security measures implemented in the Know Before You Go backend API to protect against common web vulnerabilities.

---

## Security Threats & Mitigations

### 1. SQL Injection

**Threat**: Attacker injects malicious SQL code through input to manipulate database queries

**Example Attack**:
```
GET /api/visa/'; DROP TABLE countries; --
```

**Mitigation Implemented**:

 **Parameterized Queries (PRIMARY DEFENSE)**
```javascript
// UNSAFE - Never do this
const query1 = `SELECT * FROM countries WHERE country_code = '${code}'`;

// SAFE - Our implementation
const query2 = await query(
  'SELECT * FROM countries WHERE country_code = $1',
  [code]  // Value separated from SQL
);
```

The `pg` library automatically escapes values in the `$1, $2` placeholders.

**Input Validation**
- Country codes: Validated to be exactly 3 uppercase letters
- Emails: Validated with regex before use
- All inputs trimmed and normalized

 **Defense in Depth**
- `sanitizeString()` removes null bytes
- `escapeSQLPattern()` escapes quotes (bonus layer)

**Code Location**: `config/database.js` (query function)

---

### 2. Cross-Site Scripting (XSS)

**Threat**: Attacker injects JavaScript through input fields, executed in user's browser

**Example Attack**:
```json
{
  "name": "<img src=x onerror='alert(\"hacked\")'/>",
  "email": "attacker@example.com"
}
```

**Mitigation Implemented**:

 **Input Sanitization**
```javascript
const sanitized = validator.escape(trimmed);
// Converts: <img src=x /> → &lt;img src=x /&gt;
```

 **validator.js Library**
- `validator.escape()` converts dangerous HTML to entities
- `validator.normalizeEmail()` removes XSS vectors from emails

 **Content-Type Validation**
- Middleware checks `Content-Type: application/json`
- Size limits (10KB) prevent large XSS payloads

**Code Location**: `middleware/validation.js` (validateName, validateEmail)

---

### 3. Command Injection

**Threat**: Attacker executes system commands through input (less relevant for API, but prevented)

**Mitigation**: 
- No shell commands executed with user input
- All database operations use parameterized queries
- No `eval()` or `exec()` anywhere in codebase

---

### 4. Authentication & Authorization

**Current Status**:  Not needed for this project

- Platform is **public** — no user accounts
- No authentication required
- No sensitive user data stored (only name + email for newsletter)

**If authentication is added later**:
- Use JWT with secure signing
- Store hashed passwords (bcrypt)
- Implement role-based access control (RBAC)

---

### 5. Rate Limiting

**Threat**: Attacker sends thousands of requests to:
- Overwhelm the server (DoS attack)
- Scrape data
- Brute force (less relevant without auth)

**Current Status**:  Not implemented (Phase 5)

**Next Steps** (recommended for production):
```javascript
const rateLimit = require('express-rate-limit');

const limiter = rateLimit({
  windowMs: 15 * 60 * 1000, // 15 minutes
  max: 100, // 100 requests per window
  message: 'Too many requests from this IP'
});

app.use('/api/', limiter);
```

---

### 6. CORS (Cross-Origin Resource Sharing)

**Threat**: Malicious website makes requests to our API on behalf of user

**Mitigation Implemented**:

 **CORS Middleware Configuration**
```javascript
const corsOptions = {
  origin: process.env.FRONTEND_URL || '*',
  methods: ['GET', 'POST', 'OPTIONS'],
  allowedHeaders: ['Content-Type'],
  credentials: true
};
app.use(cors(corsOptions));
```

**Current Setting**: Allows all origins (`*`)  
**For Production**: Set specific frontend URL in `.env`

**Code Location**: `server.js`

---

### 7. Security Headers

**Threat**: Browser doesn't know how to safely render responses (XSS, clickjacking, etc.)

**Mitigation Implemented**:

 **Helmet.js**
```javascript
app.use(helmet());
```

Sets security headers:
- `X-Content-Type-Options: nosniff` — Forces browser to trust Content-Type header
- `X-Frame-Options: DENY` — Prevents clickjacking
- `X-XSS-Protection: 1; mode=block` — Enables browser XSS filter
- `Strict-Transport-Security` — Forces HTTPS (in production)

**Code Location**: `server.js`

---

### 8. Request Size Limits

**Threat**: Large payloads crash server or enable DoS attacks

**Mitigation Implemented**:

 **Body Parser Limits**
```javascript
app.use(express.json({ limit: '10kb' }));
app.use(express.urlencoded({ limit: '10kb' }));
```

Limits requests to 10KB. Newsletter signup (largest endpoint) is ~100 bytes.

**Code Location**: `server.js`

---

### 9. Sensitive Data Exposure

**Threat**: Error messages leak database structure, stack traces, etc.

**Mitigation Implemented**:

 **Environment-Aware Error Messages**
```javascript
if (process.env.NODE_ENV === 'production') {
  response.error = 'Internal Server Error';  // Generic message
} else {
  response.details = err.details;  // Full details in dev
}
```

 **No Stack Traces in Production**
```javascript
stack: process.env.NODE_ENV === 'development' ? err.stack : undefined
```

 **Sanitized Database Error Messages**
- PostgreSQL error codes mapped to generic messages
- Never expose table/column names
- Never expose query structure

**Code Location**: `middleware/errorHandler.js`

---

### 10. Database Connection Security

**Threat**: Weak credentials, unencrypted connections, connection reuse issues

**Mitigation Implemented**:

 **Environment-Based Credentials**
- Database password stored in `.env`
- `.env` NOT committed to Git (in `.gitignore`)
- Template provided in `.env.example`

 **Connection Pooling**
```javascript
const pool = new Pool({
  max: 20,  // Production limit
  idleTimeoutMillis: 30000,
  connectionTimeoutMillis: 2000
});
```

 **Connection Error Handling**
```javascript
pool.on('error', (err) => {
  console.error('Connection error', err);
  process.exit(-1);  // Safe fail
});
```

**Code Location**: `config/database.js`

---

### 11. Email Validation for Newsletter

**Threat**: Spam, abuse, non-functional emails

**Mitigation Implemented**:

 **Email Format Validation**
```javascript
const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
if (!emailRegex.test(email.trim())) {
  return { valid: false, error: 'Invalid email format' };
}
```

 **Uses validator.js**
```javascript
if (!validator.isEmail(trimmed)) {
  return { valid: false };
}
```

**Duplicate Prevention**
```javascript
const existingResult = await query(
  'SELECT id FROM subscribers WHERE email = $1',
  [trimmedEmail]
);
```

**Code Location**: `middleware/validation.js`, `routes/newsletter.js`

---

### 12. Default Headers & Metadata

**Threat**: Leaking server information (Express version, etc.)

**Mitigation Implemented**:

 **Helmet removes server signatures**
```javascript
app.use(helmet());  // Hides X-Powered-By header
```

 **Custom Headers**
```javascript
app.use((req, res, next) => {
  res.removeHeader('X-Powered-By');
  next();
});
```

---

## Checklist: Security Best Practices

###  Implemented (Phase 2-4)
- [ ] Parameterized SQL queries (prevents SQL injection)
- [ ] Input validation & sanitization (prevents XSS)
- [ ] CORS configuration
- [ ] Helmet.js security headers
- [ ] Request size limits
- [ ] Environment-aware error messages
- [ ] Connection pooling
- [ ] Email validation
- [ ] Duplicate prevention
- [ ] Async error handling
- [ ] `.env` protection (gitignore)
- [ ] No hardcoded secrets
- [ ] Security logs

###  Recommended (Phase 5 / Production)
- [ ] Rate limiting (express-rate-limit)
- [ ] HTTPS enforcement (SSL/TLS)
- [ ] HSTS header (HTTP Strict Transport Security)
- [ ] API key authentication (if needed)
- [ ] Request logging to file
- [ ] Intrusion detection
- [ ] Regular security audits
- [ ] Penetration testing
- [ ] WAF (Web Application Firewall)

---

## Testing Security

### Manual Testing

**Test SQL Injection Prevention**:
```bash
curl "http://localhost:5000/api/visa/RWA'; DROP TABLE countries; --"
# Should return: 400 Invalid country code
```

**Test XSS Prevention**:
```bash
curl -X POST http://localhost:5000/api/newsletter/subscribe \
  -H "Content-Type: application/json" \
  -d '{
    "name": "<script>alert(\"xss\")</script>",
    "email": "test@example.com"
  }'
# Name should be HTML-escaped in database
```

**Test Rate Limiting** (when implemented):
```bash
for i in {1..150}; do curl http://localhost:5000/api/countries; done
# After 100 requests: 429 Too Many Requests
```

### Automated Testing (Recommended)

Libraries to use:
- `npm install owasp-scan` — OWASP Top 10 check
- `npm install snyk` — Vulnerability scanning
- `npm install eslint-plugin-security` — ESLint security rules

---

## Production Deployment Security

### Before Deploying to Production

1. **Environment Variables**
   ```bash
   # .env must exist with real values
   NODE_ENV=production
   DB_PASSWORD=secure_password_here
   FRONTEND_URL=https://yourdomain.com
   ```

2. **Database**
   ```bash
   # Ensure database user has minimal permissions
   GRANT SELECT, INSERT ON public.* TO api_user;
   ```

3. **Update CORS**
   ```env
   FRONTEND_URL=https://app.knowbeforeyougo.com
   ```

4. **Enable HTTPS**
   ```javascript
   const https = require('https');
   const fs = require('fs');
   
   const options = {
     key: fs.readFileSync('/path/to/key.pem'),
     cert: fs.readFileSync('/path/to/cert.pem')
   };
   
   https.createServer(options, app).listen(443);
   ```

5. **Add Rate Limiting**
   ```javascript
   const rateLimit = require('express-rate-limit');
   app.use('/api/', rateLimit({
     windowMs: 15 * 60 * 1000,
     max: 100
   }));
   ```

6. **Enable Logging**
   ```env
   LOG_LEVEL=info
   ```

7. **Monitor & Alert**
   - Set up error tracking (Sentry)
   - Monitor database connections
   - Alert on high error rates

---

## Common Vulnerabilities & How We Prevent Them

| Vulnerability | Attack Example | Our Prevention |
|---|---|---|
| SQL Injection | `'; DROP TABLE--` | Parameterized queries |
| XSS | `<script>alert(1)</script>` | HTML escaping + sanitization |
| Command Injection | `; rm -rf /` | No shell execution |
| CORS Bypass | Cross-origin requests | CORS middleware |
| Clickjacking | `<iframe src="..." />` | X-Frame-Options header |
| Weak Credentials | Guessing database password | Environment variables |
| Information Disclosure | Stack traces in responses | Environment-aware errors |
| DoS Attack | 1000 requests/sec | Rate limiting (to add) |
| CSRF | Forged requests | SameSite cookies (if auth added) |

---

## References

- [OWASP Top 10](https://owasp.org/www-project-top-ten/)
- [Node.js Security Best Practices](https://nodejs.org/en/docs/guides/security/)
- [Express.js Security](https://expressjs.com/en/advanced/best-practice-security.html)
- [Helmet.js Documentation](https://helmetjs.github.io/)
- [PostgreSQL Security](https://www.postgresql.org/docs/current/sql-syntax.html)

---

**Security Status**: Phase 4 Complete ✓  
**Next**: Phase 5 - Final Documentation & Deployment Guide
