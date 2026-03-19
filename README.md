# KBYG — Know Before You Go

KBYG is a travel intelligence platform with a Node.js backend (Express + MySQL) and a lightweight static frontend. It provides country guides, visa rules, health advisories, cultural guidance, and AI summaries.

## Quick Overview
- Backend: `backend/` (Express API + MySQL)
- Frontend (User): `frontend/user/` (static HTML/CSS/JS)
- Frontend (Admin): `frontend/admin/` (static HTML/CSS/JS)
- Docker: `Dockerfile`, `docker-compose.yml`

## Project Structure and File Purpose
### Backend
- `backend/main.js`: Entry point that starts the server and optionally runs endpoint checks.
- `backend/server.js`: Express app wiring, middleware, CORS, rate limiting, static frontend hosting, health endpoints.
- `backend/config/db.js`: MySQL connection pool.
- `backend/controllers/aiController.js`: AI query endpoint handler (intent + data + AI response).
- `backend/controllers/countryController.js`: Country detection endpoint handler.
- `backend/controllers/v1Controller.js`: Main API logic for countries, visa, health, emergency, admin, assistant, newsletter.
- `backend/middleware/auth.js`: JWT admin auth guard.
- `backend/routes/aiRoutes.js`: AI route definitions.
- `backend/routes/countryRoutes.js`: Country detection route definitions.
- `backend/routes/v1Routes.js`: Main API routes.
- `backend/services/countryDetector.js`: Country detection logic.
- `backend/services/countryIndex.js`: In-memory cache for country name index.
- `backend/services/knowledgeEngine.js`: Data access layer for country profiles and visa info with memory cache.
- `backend/services/queryAnalyzer.js`: Basic intent detection.
- `backend/services/ragService.js`: AI prompting and memory cache for AI responses.
- `backend/services/responseFormatter.js`: Formats country and visa data into UI-friendly sections.
- `backend/utils/detectCountry.js`: Lightweight helper for single-country detection.
- `backend/data/schema.sql`: Database schema.
- `backend/data/seed.sql`: Seed data.
- `backend/.env`: Backend environment configuration (API keys, DB config).

### Frontend
- `frontend/user/index.html`: User-facing UI.
- `frontend/user/js/config.js`: API base URL configuration.
- `frontend/user/js/api.js`: Fetch helper.
- `frontend/user/js/app.js`: UI logic for listing and viewing countries.
- `frontend/user/css/main.css`: User UI styling.
- `frontend/admin/index.html`: Admin dashboard UI.
- `frontend/admin/js/admin.js`: Admin UI logic (login, tables, edit).
- `frontend/admin/css/admin.css`: Admin UI styling.

### Root
- `Dockerfile`: Container for backend and static frontend.
- `docker-compose.yml`: Compose file for backend + MySQL.
- `.env`: Compose environment values for MySQL.

## Requirements (Local)
- Node.js 18+
- MySQL 8+

## Environment Setup (Local)
Update `backend/.env`:
```
GROQ_API_KEY=your_key
DB_HOST=localhost
DB_USER=kbyg_user
DB_PASSWORD=kbyg_password
DB_NAME=ai_db
DB_PORT=3306
JWT_SECRET=your_secret
ADMIN_SETUP_TOKEN=your_first_admin_token
AI_CACHE_TTL_SECONDS=21600
```

## Database Setup (Local)
Option 1: MySQL client
```bash
mysql -u root -p < backend/data/schema.sql
mysql -u root -p < backend/data/seed.sql
```

Option 2: Run in your MySQL UI using:
```
SOURCE backend/data/schema.sql;
SOURCE backend/data/seed.sql;
```

## Start Locally (Windows / macOS / Linux)
```bash
cd backend
npm install
npm run dev
```
Base URL: `http://localhost:5000`

## Start with Docker (Windows / macOS / Linux)
1. Update the root `.env` (used by Docker Compose):
```
MYSQL_ROOT_PASSWORD=change_me_root_password
DB_NAME=ai_db
DB_USER=kbyg_user
DB_PASSWORD=kbyg_password
```

2. Build and run containers:
```bash
docker pull mysql:8.4
docker pull node:20
docker compose up --build
```

The MySQL container automatically runs `backend/data/schema.sql` and `backend/data/seed.sql` on first boot.

## Team Startup Guide (Step-by-step)
1. Install Docker Desktop and make sure Docker Engine is running.
2. Pull the repo and open the project root.
3. Update the root `.env` with your MySQL credentials.
4. Start everything:
```bash
docker compose up --build
```
5. Open the app:
   - Backend: `http://localhost:5000`
   - MySQL: `localhost:333`
6. Stop containers when done:
```bash
docker compose down
```

## Finding Docker Images
If you need images, open a web browser and go to Docker Hub.
Search for `mysql` to see available tags and documentation.

## Docker Troubleshooting
If Docker fails during build or startup, these commands help you inspect and clean up.

Show running containers:
```bash
docker ps
```

Show all containers (including stopped):
```bash
docker ps -a
```

Show all images:
```bash
docker images
```

Stop and remove containers + network (keeps named volumes):
```bash
docker compose down
```
This stops services and removes containers and the default compose network.

Stop and remove containers + network + volumes:
```bash
docker compose down -v
```
This does everything `docker compose down` does, plus deletes volumes (your MySQL data volume), which forces a fresh database init next time.


Remove a specific container by name:
```bash
docker rm -f ai_chat-backend
```
This force-removes the `ai_chat-backend` container if it is stuck or you want a clean rebuild.


Remove a specific image container by name:
```bash
docker rmi -f ai_chat-backend:latest
```

## Health Endpoints
- `GET /health` → basic process health
- `GET /ready` → checks DB connectivity

## API Endpoints
Base: `http://localhost:5000`

### Country detection
`POST /api/countries/detect`
```bash
curl -X POST http://localhost:5000/api/countries/detect \
  -H "Content-Type: application/json" \
  -d "{\"query\":\"Emergency numbers in Kenya\"}"
```

### AI Query
`POST /api/ai/query`
```bash
curl -X POST http://localhost:5000/api/ai/query \
  -H "Content-Type: application/json" \
  -d "{\"query\":\"Visa requirements for Rwanda\"}"
```

### Countries
`GET /api/v1/countries`
```bash
curl http://localhost:5000/api/v1/countries
```

`GET /api/v1/countries/:code`
```bash
curl http://localhost:5000/api/v1/countries/RW
```

`GET /api/v1/countries/:code/assistant`
```bash
curl http://localhost:5000/api/v1/countries/RW/assistant
```

### Visa
`GET /api/v1/visa/:code`
```bash
curl http://localhost:5000/api/v1/visa/RW
```

### Health
`GET /api/v1/health/:code`
```bash
curl http://localhost:5000/api/v1/health/RW
```

### Emergency
`GET /api/v1/emergency/:code`
```bash
curl http://localhost:5000/api/v1/emergency/RW
```

### Cultural Dos & Don'ts
`GET /api/v1/dosDonts/:code`
```bash
curl http://localhost:5000/api/v1/dosDonts/RW
```

### Newsletter Subscribe
`POST /api/v1/newsletter`
```bash
curl -X POST http://localhost:5000/api/v1/newsletter \
  -H "Content-Type: application/json" \
  -d "{\"email\":\"test@example.com\",\"name\":\"Traveler\"}"
```

## Postman Testing
1. Set environment variable `baseUrl` = `http://localhost:5000`.
2. Create requests using the endpoint paths above.
3. For admin endpoints, login first:
   - `POST /api/v1/admin/login` → get token
   - Use header `Authorization: Bearer <token>` for admin routes.

## Admin Setup (First Admin)
For the very first admin account:
```
POST /api/v1/admin
Headers: x-setup-token: <ADMIN_SETUP_TOKEN>
Body:
{
  "email": "admin@example.com",
  "password": "StrongPassword!",
  "full_name": "Admin Name"
}
```

After the first admin is created, only existing admins can create more.

## Notes
- Memory caching is enabled by default for AI responses and country bundles.
- Change `AI_CACHE_TTL_SECONDS` to control AI cache expiration.
- Update `CORS_ORIGINS` in `backend/.env` for production.
