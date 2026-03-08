# Know Before You Go - Backend API

A Node.js + Express REST API for the Know Before You Go African travel information platform.

## Project Structure

```
backend/
├── config/
│   └── database.js          # PostgreSQL connection pool & query handler
├── database/
│   ├── 001_create_tables.sql   # SQL schema (7 tables)
│   ├── 002_seed_data.sql       # Sample data (10 countries)
├── routes/                  # (Phase 3) API route handlers
├── security/                # (Phase 4) Input validation & sanitization
├── server.js                # Express server entry point
├── package.json             # Node.js dependencies
├── .env.example             # Environment variable template
└── .gitignore               # Git ignore rules
```

## Technology Stack

- **Runtime**: Node.js (v16+)
- **Framework**: Express.js (v4.18)
- **Database**: PostgreSQL (v12+)
- **Security**: 
  - Helmet.js (security headers)
  - CORS (cross-origin requests)
  - Parameterized queries (SQL injection prevention)
- **Input Validation**: Validator.js

## Setup Instructions

### 1. Install Dependencies

```bash
cd backend
npm install
```

### 2. Configure Environment Variables

```bash
# Copy the template
cp .env.example .env

# Edit .env with your PostgreSQL credentials
# DB_HOST=localhost
# DB_PORT=5432
# DB_NAME=know_before_you_go
# DB_USER=postgres
# DB_PASSWORD=your_password
```

### 3. Create PostgreSQL Database

```bash
# Using psql (PostgreSQL CLI)
createdb know_before_you_go

# Or via PostgreSQL Admin UI
```

### 4. Create Tables & Seed Data

```bash
# Using psql to run SQL files
psql -U postgres -d know_before_you_go -f database/001_create_tables.sql
psql -U postgres -d know_before_you_go -f database/002_seed_data.sql

# Verify with:
# SELECT COUNT(*) FROM countries;
```

### 5. Start the Server

```bash
# Development mode (with auto-reload)
npm run dev

# Production mode
npm start
```

The server will start at `http://localhost:5000`

## API Endpoints (Phase 3)

All endpoints are public (no authentication required).

### Countries
- `GET /api/countries` - Fetch all countries

### Travel Information
- `GET /api/visa/:country_code` - Visa requirements
- `GET /api/health/:country_code` - Health requirements
- `GET /api/dos-donts/:country_code` - Cultural guidance
- `GET /api/general/:country_code` - General entry requirements
- `GET /api/emergency/:country_code` - Embassy contacts

### Newsletter
- `POST /api/newsletter/subscribe` - Subscribe to updates

### System
- `GET /health` - Server health check

## Database Schema

### Tables (7 total)

| Table | Purpose | Records |
|-------|---------|---------|
| countries | Central reference (country metadata) | 10 currently |
| visa_requirements | Visa types, costs, requirements | Multiple per country |
| health_requirements | Vaccinations, health certifications | Multiple per country |
| dos_and_donts | Cultural norms and local laws | Multiple per country |
| general_requirements | Passport validity, funds, etc. | Multiple per country |
| emergency_contacts | Embassy/consulate details | Multiple per country |
| subscribers | Newsletter signups (name, email) | Growing |

### Relationships

All travel information tables reference the `countries` table:
- `countries` (1) ← → (M) `visa_requirements`
- `countries` (1) ← → (M) `health_requirements`
- `countries` (1) ← → (M) `dos_and_donts`
- `countries` (1) ← → (M) `general_requirements`
- `countries` (1) ← → (M) `emergency_contacts`
- `subscribers` (independent)

## Security Features

### Implemented (Phase 2)
-  CORS configuration (configurable origin)
-  Helmet.js security headers
-  Connection pooling (prevents resource exhaustion)
-  Request size limits (10KB)

### Coming (Phase 4)
-  Parameterized queries (SQL injection prevention)
-  Input validation & sanitization
-  Rate limiting
-  Error handling & logging

## Query Performance

### Indexes on country_code ensure O(log n) lookups:
```
idx_visa_country_code
idx_health_country_code
idx_dosdont_country_code
idx_general_country_code
idx_emergency_country_code
```

### Example Query (fetch all info for one country):
```sql
SELECT 
    c.*,
    json_agg(DISTINCT v.*) as visas,
    json_agg(DISTINCT h.*) as health_reqs
FROM countries c
LEFT JOIN visa_requirements v ON c.country_code = v.country_code
LEFT JOIN health_requirements h ON c.country_code = h.country_code
WHERE c.country_code = $1
GROUP BY c.country_code;
```

## Testing

### Manual Testing with Postman
1. Import the API endpoints (coming in Phase 5)
2. Test each endpoint with sample country codes (RWA, KEN, TZA, etc.)
3. Verify response structure matches frontend expectations

### Automated Testing (coming)
```bash
npm test
```

## Troubleshooting

### Port Already in Use
```bash
# Change PORT in .env or use:
PORT=5001 npm run dev
```

### Database Connection Failed
- Verify PostgreSQL is running
- Check credentials in .env
- Ensure database exists: `createdb know_before_you_go`

### Missing Tables
```bash
psql -U postgres -d know_before_you_go -f database/001_create_tables.sql
```

## Development Workflow

1. Create a new branch: `git checkout -b feature/new-endpoint`
2. Make changes in `routes/` folder
3. Test with Postman or curl
4. Commit: `git commit -m "Add new endpoint"`
5. Push: `git push origin feature/new-endpoint`
6. Create Pull Request

## Environment Variables Reference

| Variable | Default | Purpose |
|----------|---------|---------|
| PORT | 5000 | Server port |
| NODE_ENV | development | Environment mode |
| DB_HOST | localhost | Database host |
| DB_PORT | 5432 | Database port |
| DB_NAME | know_before_you_go | Database name |
| DB_USER | postgres | Database user |
| DB_PASSWORD | (none) | Database password |
| FRONTEND_URL | * | CORS allowed origin |
| LOG_LEVEL | debug | Logging verbosity |

## Next Steps (Phases 3-5)

### Phase 3: API Routes Implementation
- Implement all 7 API endpoints
- Connect database queries to Express routes
- Return JSON responses

### Phase 4: Security & Validation
- Add input validation middleware
- Implement parameterized queries
- Add rate limiting
- Error handling

### Phase 5: Documentation
- API documentation (Swagger/Postman)
- Deployment guide
- Security best practices

## Contributing

- Follow Node.js naming conventions (camelCase for variables/functions)
- Use parameterized queries for all database operations
- Add comments for complex logic
- Test endpoints before committing

## License

MIT

---

**Status**: Phase 2 Complete ✓  
**Next**: Phase 3 - API Routes Implementation
