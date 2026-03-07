# Know Before You Go

A simple, publicly accessible web platform that gives African travelers instant travel 
information for any African country. Select a destination and immediately see visa 
requirements, health documentation, dos and don'ts, general entry requirements, and 
emergency contacts — all on one page. No login required.

---

## Team Members

| Name | Role |
|------|------|
| James Giir Deng | Literature Review |
| Andrew Thon Riem Alier | Documentation and Ethics Lead |
| Nitonde Binthia | Project Manager |
| ISHIMWE Jonathan | System Architecture |
| David Mugisha | Frontend Development |
| KABANDA Gislain | Database and ERD |

---

## Tech Stack

| Layer | Technology |
|-------|------------|
| Frontend | React.js |
| Backend | Node.js + Express.js |
| Database | PostgreSQL |
| HTTP Requests | Axios |
| API Testing | Postman |
| Version Control | GitHub |

---

## Project Structure
```
know-before-you-go/
│
├── frontend/                        # React.js application (David)
│   └── src/
│       ├── pages/
│       │   ├── Home.js              # Country selector page
│       │   ├── CountryInfo.js       # All 5 info sections for selected country
│       │   └── Newsletter.js        # Optional email subscription page
│       ├── components/
│       │   └── Navbar/
│       │       └── Navbar.js
│       └── utils/
│           └── api.js               # All API calls centralised here
│
├── backend/                         # Node.js + Express API (Gislain)
│   ├── server.js
│   ├── config/
│   │   └── db.js                    # PostgreSQL connection
│   └── routes/
│       ├── countries.js
│       ├── visa.js
│       ├── health.js
│       ├── dosDonts.js
│       ├── general.js
│       ├── emergency.js
│       └── newsletter.js
│
├── database/                        # SQL files (Gislain)
│   ├── migrations/
│   │   └── 001_create_tables.sql
│   └── seeds/
│       └── seed_data.sql
│
├── docs/                            # Architecture diagrams and ERD (Jonathan)
├── .gitignore
└── README.md
```

---

## Getting Started

### Prerequisites
- Node.js v18 or higher
- PostgreSQL v14 or higher
- npm

### 1. Clone the repository
```bash
git clone https://github.com/YOUR_USERNAME/know-before-you-go.git
cd know-before-you-go
```

### 2. Set up the database
```bash
psql -U postgres -c "CREATE DATABASE know_before_you_go;"
psql -U postgres -d know_before_you_go -f database/migrations/001_create_tables.sql
psql -U postgres -d know_before_you_go -f database/seeds/seed_data.sql
```

### 3. Set up the backend
```bash
cd backend
npm install
cp .env.example .env
```
Open the `.env` file and fill in your PostgreSQL credentials:
```
PORT=5000
DB_HOST=localhost
DB_PORT=5432
DB_NAME=know_before_you_go
DB_USER=postgres
DB_PASSWORD=your_password_here
```
Then start the server:
```bash
npm run dev
```
The API will be running at `http://localhost:5000`

### 4. Set up the frontend
```bash
cd frontend
npm install
npm start
```
The app will open at `http://localhost:3000`

---

## API Endpoints

All endpoints are publicly accessible. No authentication required.

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/api/countries` | Get all available countries for the dropdown |
| GET | `/api/visa?country=KE` | Get visa requirements for a country |
| GET | `/api/health?country=KE` | Get health documentation requirements |
| GET | `/api/dos-donts?country=KE` | Get dos and don'ts for a country |
| GET | `/api/general?country=KE` | Get general entry requirements |
| GET | `/api/emergency?country=KE` | Get embassy and emergency contacts |
| POST | `/api/newsletter/subscribe` | Subscribe to newsletter (name + email only) |

Replace `KE` with any supported country code. Supported codes: `RW`, `KE`, `TZ`, `UG`, `NG`, `GH`, `ZA`, `MA`, `ET`, `SN`

---

## Branching Strategy

| Branch | Purpose |
|--------|---------|
| `main` | Stable, reviewed code only — do not push directly |
| `dev` | Active development — all members merge into this branch |
| `feature/your-feature-name` | Your individual work branch |

### How to contribute

Always start from the latest `dev` branch:
```bash
git checkout dev
git pull origin dev
git checkout -b feature/your-feature-name
```
Do your work, then:
```bash
git add .
git commit -m "feat: describe what you did"
git push origin feature/your-feature-name
```
Then open a Pull Request into `dev` on GitHub. Do not merge your own pull request — ask a teammate to review it first.

### Commit message format
```
feat: add country info page
fix: correct visa query for Morocco
docs: update README with API endpoints
style: clean up navbar styling
test: add unit test for newsletter form
```

---

## Supported Countries

| Code | Country | Region |
|------|---------|--------|
| RW | Rwanda | East Africa |
| KE | Kenya | East Africa |
| TZ | Tanzania | East Africa |
| UG | Uganda | East Africa |
| NG | Nigeria | West Africa |
| GH | Ghana | West Africa |
| ZA | South Africa | Southern Africa |
| MA | Morocco | North Africa |
| ET | Ethiopia | East Africa |
| SN | Senegal | West Africa |

---

## Project Board
Trello: [Link to be added by Nitonde]

---

## License
Academic project — not for commercial use.
