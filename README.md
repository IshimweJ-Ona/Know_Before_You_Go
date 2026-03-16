# Know Before You Go

A simple, public travel information platform for African destinations. Travelers can quickly check visa requirements, health advisories, cultural dos and don'ts, and emergency contacts for each country.

**What is in this repo**
- `frontend/` contains two static web apps: the public traveler site and the admin dashboard.
- `backend/` is a Node.js + Express API that serves data and handles admin operations.
- `database/` holds SQL migrations and seed data for Supabase (PostgreSQL).

**Requirements**
- Node.js `>= 18` (for the backend).
- A Supabase project (PostgreSQL) with access to the SQL editor.

**Quick Start (Local)**
1. Backend setup: `cd backend`, then `npm install`, then copy env file `cp .env.example .env`.
2. Update values in `.env`: `SUPABASE_URL`, `SUPABASE_ANON_KEY`, `SUPABASE_SERVICE_KEY`, `JWT_SECRET`, and `ALLOWED_ORIGINS`.
3. Database setup (Supabase SQL editor): run `database/migrations/001_create_tables.sql`, then `database/migrations/002_add_feedback.sql`, then `database/migrations/003_add_transport_housing.sql`, then `database/migrations/004_align_with_info_resources.sql`, then `database/seeds/seed_data.sql`.
4. Start the API: `npm run dev` (development) or `npm start` (production).
5. Frontend setup (static): update `API_BASE` in `frontend/user/js/config.js` and `ADMIN_API` in `frontend/admin/js/admin.js`.
6. Open the apps: `frontend/user/index.html` and `frontend/admin/index.html`.

If you use a local static server (recommended), make sure its URL is included in `ALLOWED_ORIGINS` in `.env`.

**Start the System (Local)**
1. Start the backend API from `backend/`: `npm run dev`.
2. Start a static server for the frontend (or open the HTML files directly).
3. Open the public app: `frontend/user/index.html`.
4. Open the admin app: `frontend/admin/index.html`.

**Backend Overview**
- Framework: Express
- Security: `helmet`, CORS allow-list, and global rate limiting
- Auth: JWT for admin routes
- Database client: Supabase JS SDK
- Health check: `GET /health`

**Frontend Overview**
- Two independent static apps:
- User app: country grid and details
- Admin app: login, subscribers, feedback, and countries
- Configuration files: `frontend/user/js/config.js` and `frontend/admin/js/admin.js`

**Database Overview**
The SQL migrations create the core tables, including:
- `countries`
- `visa_requirements`
- `health_advisories`
- `cultural_guidelines`
- `emergency_contacts`
- `newsletter_subscribers`
- `admin_users`
- `feedback` (added in migration 002)

**Key API Endpoints**
Public endpoints:
- `GET /api/v1/countries`
- `GET /api/v1/countries/:code`
- `GET /api/v1/visa/:code`
- `GET /api/v1/health/:code`
- `GET /api/v1/emergency/:code`
- `GET /api/v1/dosDonts/:code`
- `GET /api/v1/general/:code`
- `POST /api/v1/newsletter`
- `POST /api/v1/feedback`

Admin endpoints (JWT):
- `POST /api/v1/auth/register`
- `POST /api/v1/auth/login`
- `GET /api/v1/admin/subscribers`
- `GET /api/v1/admin/feedback`
- `GET /api/v1/users`

**Docs**
Architecture diagrams and ERD are in `docs/System_Architecture Drawings/`.

**Team**
- James Giir Deng — Literature Review
- Andrew Thon Riem Alier — Documentation and Ethics Lead
- Nitonde Binthia — Project Manager
- ISHIMWE Jonathan — System Architecture & API Endpoints Testing
- David Mugisha — Frontend Development
- KABANDA Gislain — Database and ERD
