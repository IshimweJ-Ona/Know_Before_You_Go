# Know Before You Go - API Documentation

## Base URL
```
http://localhost:5000
```

## Authentication
None required. All endpoints are public.

---

## Endpoints

### 1. GET /api/countries
**Description**: Fetch all African countries in the database

**Method**: GET  
**Status**: ✅ Implemented (Phase 3)

**Parameters**: None

**Response** (200 OK):
```json
{
  "success": true,
  "count": 10,
  "data": [
    {
      "country_code": "RWA",
      "name": "Rwanda",
      "region": "East Africa",
      "capital": "Kigali",
      "flag_url": "https://flagcdn.com/rw.svg",
      "created_at": "2026-03-08T10:00:00Z"
    },
    {
      "country_code": "KEN",
      "name": "Kenya",
      "region": "East Africa",
      "capital": "Nairobi",
      "flag_url": "https://flagcdn.com/ke.svg",
      "created_at": "2026-03-08T10:00:00Z"
    }
  ],
  "timestamp": "2026-03-08T10:30:00Z"
}
```

**cURL Example**:
```bash
curl http://localhost:5000/api/countries
```

---

### 2. GET /api/visa/:country_code
**Description**: Fetch visa requirements for a specific country

**Method**: GET  
**Status**: ✅ Implemented (Phase 3)

**Parameters**:
- `country_code` (string, required): ISO 3166-1 alpha-3 country code (e.g., RWA, KEN, TZA)

**Response** (200 OK):
```json
{
  "success": true,
  "country_code": "RWA",
  "country_name": "Rwanda",
  "count": 2,
  "data": [
    {
      "id": 1,
      "visa_type": "Visa on Arrival",
      "duration_days": 30,
      "cost_usd": 50,
      "requirements": "Passport (valid 6+ months), return ticket, proof of accommodation",
      "notes": "Available at Kigali International Airport"
    },
    {
      "id": 2,
      "visa_type": "Tourist Visa",
      "duration_days": 90,
      "cost_usd": 50,
      "requirements": "Application form, passport, 2 photos, proof of funds",
      "notes": "Can be extended up to 90 days"
    }
  ],
  "timestamp": "2026-03-08T10:30:00Z"
}
```

**Error Responses**:
- 400 - Invalid country code format
- 404 - Country not found
- 500 - Server error

**cURL Example**:
```bash
curl http://localhost:5000/api/visa/RWA
```

---

### 3. GET /api/health/:country_code
**Description**: Fetch health documentation requirements for a specific country

**Method**: GET  
**Status**: ✅ Implemented (Phase 3)

**Parameters**:
- `country_code` (string, required): ISO 3166-1 alpha-3 country code

**Response** (200 OK):
```json
{
  "success": true,
  "country_code": "RWA",
  "country_name": "Rwanda",
  "mandatory_count": 1,
  "recommended_count": 2,
  "data": {
    "mandatory": [
      {
        "id": 1,
        "requirement_name": "Yellow Fever Vaccination",
        "description": "Yellow fever vaccine required for entry from endemic countries",
        "notes": "International vaccination certificate required"
      }
    ],
    "recommended": [
      {
        "id": 2,
        "requirement_name": "Malaria Prophylaxis",
        "description": "Recommended for travelers to rural areas",
        "notes": "Consult doctor before travel"
      },
      {
        "id": 3,
        "requirement_name": "Typhoid Vaccination",
        "description": "Recommended but not mandatory",
        "notes": "Food and water safety precautions still advised"
      }
    ]
  },
  "timestamp": "2026-03-08T10:30:00Z"
}
```

**cURL Example**:
```bash
curl http://localhost:5000/api/health/KEN
```

---

### 4. GET /api/dos-donts/:country_code
**Description**: Fetch cultural guidance and local laws ("dos" and "don'ts")

**Method**: GET  
**Status**: ✅ Implemented (Phase 3)

**Parameters**:
- `country_code` (string, required): ISO 3166-1 alpha-3 country code

**Response** (200 OK):
```json
{
  "success": true,
  "country_code": "RWA",
  "country_name": "Rwanda",
  "do_count": 3,
  "dont_count": 3,
  "data": {
    "do": [
      {
        "id": 1,
        "description": "Do respect the culture and traditions; Rwandans are generally friendly and welcoming"
      },
      {
        "id": 2,
        "description": "Do visit the Kigali Genocide Memorial to understand the country's history"
      },
      {
        "id": 3,
        "description": "Do use official taxis (ubercab or known services) for safety"
      }
    ],
    "dont": [
      {
        "id": 4,
        "description": "Don't photograph people without permission, especially in rural areas"
      },
      {
        "id": 5,
        "description": "Don't make light of the genocide or display insensitivity"
      },
      {
        "id": 6,
        "description": "Don't wander alone at night in Kigali"
      }
    ]
  },
  "timestamp": "2026-03-08T10:30:00Z"
}
```

**cURL Example**:
```bash
curl http://localhost:5000/api/dos-donts/TZA
```

---

### 5. GET /api/general/:country_code
**Description**: Fetch general entry requirements (passport validity, funds, etc.)

**Method**: GET  
**Status**: ✅ Implemented (Phase 3)

**Parameters**:
- `country_code` (string, required): ISO 3166-1 alpha-3 country code

**Response** (200 OK):
```json
{
  "success": true,
  "country_code": "UGA",
  "country_name": "Uganda",
  "mandatory_count": 1,
  "optional_count": 2,
  "data": {
    "mandatory": [
      {
        "id": 1,
        "title": "Passport Validity",
        "description": "Minimum 6 months validity from date of entry"
      }
    ],
    "optional": [
      {
        "id": 2,
        "title": "Return Ticket",
        "description": "Proof of return travel may be requested"
      },
      {
        "id": 3,
        "title": "Travel Insurance",
        "description": "Recommended but not mandatory"
      }
    ]
  },
  "timestamp": "2026-03-08T10:30:00Z"
}
```

**cURL Example**:
```bash
curl http://localhost:5000/api/general/NGA
```

---

### 6. GET /api/emergency/:country_code
**Description**: Fetch emergency contact information (embassies, consulates)

**Method**: GET  
**Status**: ✅ Implemented (Phase 3)

**Parameters**:
- `country_code` (string, required): ISO 3166-1 alpha-3 country code

**Response** (200 OK):
```json
{
  "success": true,
  "country_code": "GHA",
  "country_name": "Ghana",
  "count": 2,
  "data": [
    {
      "id": 1,
      "embassy_name": "US Embassy Accra",
      "phone": "+233 30 2741 000",
      "email": "acraacs@state.gov",
      "address": "Accra, Ghana",
      "website": "https://gh.usembassy.gov/"
    },
    {
      "id": 2,
      "embassy_name": "British High Commission",
      "phone": "+233 30 2143 143",
      "email": "bhc.accra@fco.gov.uk",
      "address": "Accra, Ghana",
      "website": "www.gov.uk/world/organisations"
    }
  ],
  "timestamp": "2026-03-08T10:30:00Z"
}
```

**cURL Example**:
```bash
curl http://localhost:5000/api/emergency/ZAF
```

---

### 7. POST /api/newsletter/subscribe
**Description**: Subscribe an email to the newsletter

**Method**: POST  
**Status**: ✅ Implemented (Phase 3)

**Parameters**: None (data in request body)

**Request Body**:
```json
{
  "name": "John Doe",
  "email": "john@example.com"
}
```

**Response** (201 Created):
```json
{
  "success": true,
  "message": "Successfully subscribed to newsletter",
  "subscriber_id": 1,
  "email": "john@example.com",
  "subscribed_at": "2026-03-08T10:30:00Z",
  "timestamp": "2026-03-08T10:30:00Z"
}
```

**Error Responses**:

**400 - Missing/Invalid Name**:
```json
{
  "success": false,
  "error": "Validation failed",
  "message": "Name is required and must be a non-empty string",
  "fields": ["name"],
  "timestamp": "2026-03-08T10:30:00Z"
}
```

**400 - Invalid Email**:
```json
{
  "success": false,
  "error": "Validation failed",
  "message": "Email must be in valid format (e.g., user@example.com)",
  "fields": ["email"],
  "timestamp": "2026-03-08T10:30:00Z"
}
```

**409 - Email Already Subscribed**:
```json
{
  "success": false,
  "error": "Email already subscribed",
  "message": "This email is already in our newsletter list",
  "email": "john@example.com",
  "timestamp": "2026-03-08T10:30:00Z"
}
```

**cURL Example**:
```bash
curl -X POST http://localhost:5000/api/newsletter/subscribe \
  -H "Content-Type: application/json" \
  -d '{
    "name": "Jane Smith",
    "email": "jane@example.com"
  }'
```

---

### 8. GET /health
**Description**: Server health check endpoint

**Method**: GET  
**Status**: ✅ Always available

**Parameters**: None

**Response** (200 OK):
```json
{
  "status": "OK",
  "timestamp": "2026-03-08T10:30:00Z",
  "environment": "development"
}
```

**cURL Example**:
```bash
curl http://localhost:5000/health
```

---

## Error Handling

All endpoints follow a consistent error response format:

```json
{
  "success": false,
  "error": "Error Type",
  "message": "Detailed error message",
  "timestamp": "2026-03-08T10:30:00Z"
}
```

### Common Error Codes

| Code | Error | Cause |
|------|-------|-------|
| 400 | Bad Request | Invalid input (missing/malformed data) |
| 404 | Not Found | Country/resource doesn't exist |
| 409 | Conflict | Email already subscribed to newsletter |
| 500 | Internal Server Error | Database or server error |

---

## Data Types & Constraints

### Pagination
Currently NOT implemented. All queries return all matching records.

### Sorting
- Countries: Sorted by region, then name
- All travel information: Sorted by primary field (visa_type, requirement_name, etc.)

### Filtering
Available query parameters (to be added in Phase 4):
- None currently implemented

---

## Rate Limiting
Not currently implemented (add in Phase 5 for production).

---

## CORS Configuration

**Allowed Origins**: `*` (all) or configured in `.env` as `FRONTEND_URL`

**Allowed Methods**: GET, POST, OPTIONS

**Allowed Headers**: Content-Type

---

## Testing with Postman

### Setup
1. Import these endpoints into Postman
2. Set `{{base_url}}` to `http://localhost:5000`
3. Create requests for each endpoint

### Example Collection Variables
```json
{
  "base_url": "http://localhost:5000",
  "country_code": "RWA"
}
```

### Sample Countries to Test
- RWA (Rwanda)
- KEN (Kenya)
- TZA (Tanzania)
- UGA (Uganda)
- NGA (Nigeria)
- GHA (Ghana)
- ZAF (South Africa)
- MAR (Morocco)
- ETH (Ethiopia)
- SEN (Senegal)

---

## Response Time Expectations

With 10 countries and proper indexes:
- **GET /api/countries**: <50ms
- **GET /api/visa/:country_code**: <30ms
- **GET /api/health/:country_code**: <30ms
- **GET /api/dos-donts/:country_code**: <30ms
- **GET /api/general/:country_code**: <30ms
- **GET /api/emergency/:country_code**: <30ms
- **POST /api/newsletter/subscribe**: <100ms (includes email validation & duplicate check)

---

## Security Notes

✅ **Implemented** (Phase 2-3):
- Parameterized queries (prevents SQL injection)
- Request size limits (10KB)
- CORS configuration
- Helmet.js security headers

🔄 **Coming** (Phase 4):
- Advanced input sanitization
- Rate limiting
- Request logging
- Error message sanitization

---

**API Status**: Phase 3 Complete ✓  
**Last Updated**: 2026-03-08  
**Next Phase**: Phase 4 - Security & Validation Enhancement
