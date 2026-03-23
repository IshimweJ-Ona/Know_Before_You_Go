# KBYG - Know Before You Go

KBYG is a travel intelligence platform with a Node.js backend (Express + MySQL) and static frontends for users and admins. It provides country guides, visa rules, health advisories, emergency contacts, cultural dos and donts, education stats, and AI summaries.

Dataset: March 2026 country reference (10 countries, 4 data domains per country).

## Admin Credentials (Seeded)
Use these for admin login:
- Username/Email: `kybg_tester`
- Password: `H1ll@`
- Name: `KBYG Tester`

## Project Structure
Backend
- `backend/main.js`: Starts the server and optional endpoint checks.
- `backend/server.js`: Express app, middleware, CORS, rate limiting, health endpoints.
- `backend/config/db.js`: MySQL connection pool.
- `backend/controllers/aiController.js`: AI query endpoint handler.
- `backend/controllers/countryController.js`: Country detection endpoint handler.
- `backend/controllers/v1Controller.js`: Core API routes (countries, visa, health, emergency, admin, assistant, newsletter).
- `backend/middleware/auth.js`: JWT + session token auth guard.
- `backend/services/*`: Country detection, query analysis, RAG, response formatting.
- `backend/data/schema.sql`: Database schema.
- `backend/data/seed.sql`: Seed data.

Frontend
- `frontend/user/index.html`: User UI.
- `frontend/user/js/app.js`: User UI logic.
- `frontend/user/css/main.css`: User UI styling.
- `frontend/admin/index.html`: Admin UI.
- `frontend/admin/js/admin.js`: Admin login and admin tools.

## Local Environment (.env)
Create `backend/.env`:
```
GROQ_API_KEY=your_key
DB_HOST=localhost
DB_USER=kbyg_user
DB_PASSWORD=kbyg_password
DB_NAME=ai_db
DB_PORT=3306
JWT_SECRET=your_secret
ADMIN_INVITE_EMAILS=kybg_tester,admin@kbyg.com
AI_CACHE_TTL_SECONDS=21600
EXTERNAL_SOURCES_TTL_SECONDS=21600
```

## Database Setup
### Create Database and User (MySQL)
Run these commands in MySQL (as root):
```bash
CREATE DATABASE IF NOT EXISTS ai_db;
CREATE USER IF NOT EXISTS 'kbyg_user'@'localhost' IDENTIFIED BY 'kbyg_password';
GRANT ALL PRIVILEGES ON ai_db.* TO 'kbyg_user'@'localhost';
FLUSH PRIVILEGES;
```

### Seed the Schema and Data
Option 1 - MySQL client:
```bash
mysql -u root -p < backend/data/schema.sql
mysql -u kbyg_user -p ai_db < backend/data/seed.sql
```

Option 2 - MySQL UI:
```
SOURCE backend/data/schema.sql;
SOURCE backend/data/seed.sql;
```

## Setup on Windows (Detailed)
1. Install Node.js 18+ (LTS).
2. Install MySQL 8+ (or use Docker).
3. Clone the repo and open the project root.
4. Create `backend/.env` using the example above.
5. Create the database and user (MySQL shell):
   - Use the commands in the Database Setup section.
6. Seed the database:
   - Run the `mysql` commands from the Seed section.
7. Install backend dependencies:
```bash
cd backend
npm install
```
8. Run the backend:
```bash
npm run dev
```
9. Open the app:
- Backend API: `http://localhost:5000`
- User UI: open `frontend/user/index.html`
- Admin UI: open `frontend/admin/index.html`

## Setup on macOS (Detailed)
1. Install Node.js 18+ (LTS) using Homebrew:
```bash
brew install node
```
2. Install MySQL 8+ (or use Docker):
```bash
brew install mysql
brew services start mysql
```
3. Clone the repo and open the project root.
4. Create `backend/.env` using the example above.
5. Create the database and user (MySQL shell):
   - Use the commands in the Database Setup section.
6. Seed the database:
   - Run the `mysql` commands from the Seed section.
7. Install backend dependencies:
```bash
cd backend
npm install
```
8. Run the backend:
```bash
npm run dev
```
9. Open the app:
- Backend API: `http://localhost:5000`
- User UI: open `frontend/user/index.html`
- Admin UI: open `frontend/admin/index.html`

## Docker Setup (Windows or macOS)
1. Update root `.env` (for Docker Compose):
```
MYSQL_ROOT_PASSWORD=change_me_root_password
DB_NAME=ai_db
DB_USER=kbyg_user
DB_PASSWORD=kbyg_password
```

2. Build and run:
```bash
docker pull mysql:8.4
docker pull node:20
docker compose up --build
```

The MySQL container initializes from `backend/data/schema.sql` and `backend/data/seed.sql` on first boot.

## Admin Access Flow
- Admin signup does not use a setup token in the URL.
- Access is controlled by:
  - `admin_invites` table (seeded), or
  - `ADMIN_INVITE_EMAILS` in `backend/.env`.
- When an admin logs in or signs up, the backend generates a JWT and a session token. The frontend stores the token and uses it in the `Authorization: Bearer <token>` header for admin requests.

## API Endpoints (Base URL: http://localhost:5000)
AI Query
- `POST /api/ai/query`

Countries
- `GET /api/v1/countries`
- `GET /api/v1/countries/:code`
- `GET /api/v1/countries/:code/assistant`

Visa
- `GET /api/v1/visa/:code`

Health
- `GET /api/v1/health/:code`

Emergency
- `GET /api/v1/emergency/:code`

Cultural Dos and Donts
- `GET /api/v1/dosDonts/:code`

Newsletter
- `POST /api/v1/newsletter`

## Notes
- AI responses are cached. Adjust `AI_CACHE_TTL_SECONDS` to control cache duration.
- External trusted sources are cached. Adjust `EXTERNAL_SOURCES_TTL_SECONDS` for refresh frequency.
- Update `CORS_ORIGINS` in `backend/.env` for production.
