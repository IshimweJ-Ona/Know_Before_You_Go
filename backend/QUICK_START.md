# Know Before You Go - Quick Start Guide

Get the backend API running locally in 5 minutes.

## Prerequisites

- **Node.js** v16+ ([Download](https://nodejs.org/))
- **PostgreSQL** v12+ ([Download](https://www.postgresql.org/))
- **Git**
- A terminal (CMD, PowerShell, or Bash)

---

## Step 1: Clone Repository

```bash
git clone <your-repo-url>
cd Know_Before_You_Go/backend
```

---

## Step 2: Install Dependencies

```bash
npm install
```

**What it installs:**
- express (REST API framework)
- pg (PostgreSQL driver)
- cors (cross-origin requests)
- helmet (security headers)
- validator (input validation)
- dotenv (environment variables)

---

## Step 3: Create PostgreSQL Database

### Option A: Using psql (PostgreSQL CLI)

```bash
# Open PostgreSQL prompt
psql -U postgres

# Inside psql, create database
CREATE DATABASE know_before_you_go;
\q  # Exit psql
```

### Option B: Using pgAdmin (GUI)

1. Open pgAdmin
2. Right-click "Databases" → Create → Database
3. Name: `know_before_you_go`
4. Click Save

---

## Step 4: Configure Environment

```bash
# Copy template to actual config
cp .env.example .env

# Edit .env with your PostgreSQL password
# Windows: notepad .env
# Mac: nano .env
# Linux: vim .env
```

**Edit these values:**
```env
DB_HOST=localhost
DB_PORT=5432
DB_NAME=know_before_you_go
DB_USER=postgres
DB_PASSWORD=your_postgres_password  # Change this!
```

---

## Step 5: Load Database Schema & Data

```bash
# Create tables
psql -U postgres -d know_before_you_go -f database/001_create_tables.sql

# Load sample data (10 countries)
psql -U postgres -d know_before_you_go -f database/002_seed_data.sql

# Verify (optional)
psql -U postgres -d know_before_you_go -c "SELECT COUNT(*) FROM countries;"
# Should output: count = 10
```

---

## Step 6: Start the Server

```bash
# Development mode (auto-reload on file changes)
npm run dev

# OR Production mode
npm start
```

**Expected output:**
```
╔════════════════════════════════════════════════════════════╗
║   Know Before You Go Backend API                          ║
║   Server running on http://localhost:5000                 ║
║   Environment: development                                ║
║   Health Check: http://localhost:5000/health              ║
║                                                            ║
║   API Endpoints (Phase 4 - SECURED):                      ║
║   - GET  /api/countries                                   ║
║   - GET  /api/visa/:country_code                          ║
║   - GET  /api/health/:country_code                        ║
║   - GET  /api/dos-donts/:country_code                     ║
║   - GET  /api/general/:country_code                       ║
║   - GET  /api/emergency/:country_code                     ║
║   - POST /api/newsletter/subscribe                        ║
╚════════════════════════════════════════════════════════════╝
```

---

## Step 7: Test the API

### Using cURL

```bash
# Test 1: Get all countries
curl http://localhost:5000/api/countries

# Test 2: Get visa requirements for Rwanda
curl http://localhost:5000/api/visa/RWA

# Test 3: Get health requirements for Kenya
curl http://localhost:5000/api/health/KEN

# Test 4: Subscribe to newsletter
curl -X POST http://localhost:5000/api/newsletter/subscribe \
  -H "Content-Type: application/json" \
  -d '{
    "name": "John Doe",
    "email": "john@example.com"
  }'
```

### Using Postman (Recommended)

1. Download [Postman](https://www.postman.com/)
2. Create new collection: "Know Before You Go"
3. Add requests:
   - **GET** http://localhost:5000/api/countries
   - **GET** http://localhost:5000/api/visa/RWA
   - **GET** http://localhost:5000/api/health/KEN
   - **POST** http://localhost:5000/api/newsletter/subscribe
     - Body (JSON): `{"name": "Jane Smith", "email": "jane@example.com"}`

---

## Available Country Codes

Test with these 10 African countries:

| Code | Country | Region |
|------|---------|--------|
| RWA | Rwanda | East Africa |
| KEN | Kenya | East Africa |
| TZA | Tanzania | East Africa |
| UGA | Uganda | East Africa |
| NGA | Nigeria | West Africa |
| GHA | Ghana | West Africa |
| ZAF | South Africa | Southern Africa |
| MAR | Morocco | North Africa |
| ETH | Ethiopia | East Africa |
| SEN | Senegal | West Africa |

---

## Troubleshooting

### Error: "connect ECONNREFUSED 127.0.0.1:5432"
**Problem**: PostgreSQL not running  
**Solution**:
```bash
# Windows: Check Services → PostgreSQL
# Mac: brew services start postgresql
# Linux: sudo systemctl start postgresql
```

### Error: "database ... does not exist"
**Problem**: Database not created  
**Solution**: Run Step 3 again

### Error: "password authentication failed"
**Problem**: Wrong PostgreSQL password in .env  
**Solution**: 
1. Verify your postgres password
2. Update .env with correct password
3. Restart server

### Error: "relation ... does not exist"
**Problem**: Database tables not created  
**Solution**: Run Step 5 again

### Port 5000 already in use
**Problem**: Another process using port 5000  
**Solution**:
```bash
# Change port in .env
PORT=5001 npm run dev
```

---

## Project Structure

```
backend/
├── config/
│   └── database.js           # PostgreSQL connection pool
├── database/
│   ├── 001_create_tables.sql # Schema
│   └── 002_seed_data.sql     # Sample data
├── middleware/
│   ├── validation.js         # Input validation
│   └── errorHandler.js       # Error handling
├── routes/
│   ├── countries.js
│   ├── visa.js
│   ├── health.js
│   ├── dosDonts.js
│   ├── general.js
│   ├── emergency.js
│   └── newsletter.js
├── server.js                 # Express server entry point
├── package.json              # Dependencies
├── .env.example              # Config template
├── README.md
├── QUICK_START.md            # This file
├── API_DOCUMENTATION.md      # Endpoint reference
├── DATABASE_SCHEMA.md        # DB design
├── SECURITY_IMPLEMENTATION.md # Security details
└── DEPLOYMENT_GUIDE.md       # Production setup
```

---

## Next Steps

- **Read API Documentation**: [API_DOCUMENTATION.md](API_DOCUMENTATION.md)
- **Learn Database Design**: [DATABASE_SCHEMA.md](DATABASE_SCHEMA.md)
- **Understand Security**: [SECURITY_IMPLEMENTATION.md](SECURITY_IMPLEMENTATION.md)
- **Deploy to Production**: [DEPLOYMENT_GUIDE.md](DEPLOYMENT_GUIDE.md)

---

## Development Tips

### Hot Reload
```bash
npm run dev  # Uses nodemon - auto-restarts on file changes
```

### Check Database Directly
```bash
# Connect to database
psql -U postgres -d know_before_you_go

# Useful queries
SELECT * FROM countries;
SELECT * FROM subscribers;
SELECT COUNT(*) FROM visa_requirements;
\dt  # List all tables
\q   # Quit
```

### View Logs
Logs appear in console:
```
✓ New database connection established
Slow query (1200ms): SELECT * FROM...
Error: Failed to fetch...
```

### Debug Mode
```bash
# Enable detailed logging
LOG_LEVEL=debug npm run dev
```

---

## Common Commands

| Command | Purpose |
|---------|---------|
| `npm run dev` | Start with auto-reload |
| `npm start` | Start production |
| `npm test` | Run tests (to add) |
| `npm run seed` | Reseed database |

---

**Ready to test?** Open Postman and request `http://localhost:5000/api/countries` 🚀

For full API documentation, see [API_DOCUMENTATION.md](API_DOCUMENTATION.md)
