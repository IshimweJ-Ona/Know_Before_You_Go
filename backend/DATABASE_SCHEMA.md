# Know Before You Go - Entity Relationship Diagram (ERD)

## Database Schema Overview

### Entity Relationship Diagram (Text/ASCII)

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                          KNOW BEFORE YOU GO DATABASE                        │
└─────────────────────────────────────────────────────────────────────────────┘

                                   COUNTRIES (PK: country_code)
                                   ┌────────────────────────────┐
                                   │ country_code (PK, VARCHAR) │
                                   │ name                       │
                                   │ region                     │
                                   │ capital                    │
                                   │ flag_url                   │
                                   │ created_at, updated_at     │
                                   └────────────────────────────┘
                                            │
                  ┌─────────────────────────┼─────────────────────────┐
                  │                         │                         │
                  ▼                         ▼                         ▼
        ┌──────────────────────┐  ┌──────────────────────┐  ┌──────────────────────┐
        │ VISA_REQUIREMENTS    │  │ HEALTH_REQUIREMENTS  │  │ DOS_AND_DON'TS       │
        ├──────────────────────┤  ├──────────────────────┤  ├──────────────────────┤
        │ id (PK)              │  │ id (PK)              │  │ id (PK)              │
        │ country_code (FK)    │  │ country_code (FK)    │  │ country_code (FK)    │
        │ visa_type            │  │ requirement_name     │  │ type (do/dont)       │
        │ duration_days        │  │ is_mandatory         │  │ description          │
        │ cost_usd             │  │ description          │  │ created_at, updated  │
        │ requirements         │  │ notes                │  └──────────────────────┘
        │ notes                │  │ created_at, updated  │
        │ created_at, updated  │  └──────────────────────┘
        └──────────────────────┘

                  │                         │
                  ▼                         ▼
        ┌──────────────────────┐  ┌──────────────────────┐
        │ GENERAL_REQUIREMENTS │  │ EMERGENCY_CONTACTS   │
        ├──────────────────────┤  ├──────────────────────┤
        │ id (PK)              │  │ id (PK)              │
        │ country_code (FK)    │  │ country_code (FK)    │
        │ title                │  │ embassy_name         │
        │ description          │  │ phone                │
        │ is_mandatory         │  │ email                │
        │ created_at, updated  │  │ address              │
        └──────────────────────┘  │ website              │
                                   │ created_at, updated  │
                                   └──────────────────────┘

        ┌──────────────────────────────────────────────────────────────┐
        │                     SUBSCRIBERS (Newsletter)                 │
        ├──────────────────────────────────────────────────────────────┤
        │ id (PK)                                                      │
        │ name                                                         │
        │ email (UNIQUE)    ← For duplicate detection                  │
        │ is_active                                                    │
        │ subscribed_at                                                │
        │ unsubscribed_at                                              │
        │ created_at, updated_at                                       │
        └──────────────────────────────────────────────────────────────┘

```

## Relationship Details

### One-to-Many Relationships

| From Table | To Tables | Relationship | Foreign Key |
|---|---|---|---|
| **countries** | visa_requirements | 1:M | country_code |
| **countries** | health_requirements | 1:M | country_code |
| **countries** | dos_and_donts | 1:M | country_code |
| **countries** | general_requirements | 1:M | country_code |
| **countries** | emergency_contacts | 1:M | country_code |

### Independent Table

| Table | Purpose | No Foreign Keys |
|---|---|---|
| **subscribers** | Stores newsletter signups (name, email only) | Standalone |


## Query Performance Strategy

### Fast Country Lookup (Critical for Frontend)

When a user selects a country, the frontend needs ALL 5 sections of information instantly:

```sql
-- Fetch all info for selected country in ONE query with JOINs
SELECT 
    c.country_code,
    c.name,
    c.region,
    c.capital,
    json_agg(DISTINCT v.*) as visas,
    json_agg(DISTINCT h.*) as health_reqs,
    json_agg(DISTINCT d.*) as dos_donts,
    json_agg(DISTINCT g.*) as general_reqs,
    json_agg(DISTINCT e.*) as emergency_contacts
FROM countries c
LEFT JOIN visa_requirements v ON c.country_code = v.country_code
LEFT JOIN health_requirements h ON c.country_code = h.country_code
LEFT JOIN dos_and_donts d ON c.country_code = d.country_code
LEFT JOIN general_requirements g ON c.country_code = g.country_code
LEFT JOIN emergency_contacts e ON c.country_code = e.country_code
WHERE c.country_code = $1
GROUP BY c.country_code, c.name, c.region, c.capital;
```

### Indexes Ensure Performance

- **idx_visa_country_code** - O(log n) lookup for visa data
- **idx_health_country_code** - O(log n) lookup for health data
- **idx_dosdont_country_code** - O(log n) lookup for dos/donts
- **idx_general_country_code** - O(log n) lookup for general requirements
- **idx_emergency_country_code** - O(log n) lookup for emergency contacts

Even with 10 countries currently, these indexes future-proof the database for scaling to 54 African countries.

---

## Data Model Decisions

### Why This Structure?

1. **Denormalized Travel Data**: Each travel information type has its own table rather than a generic "travel_info" table
   - **Pro**: Clear, type-specific columns (visa_type, cost_usd vs requirement_name, is_mandatory)
   - **Con**: Slight redundancy of country_code across tables
   - **Justification**: The frontend needs distinct APIs for each section, so separate tables match API design

2. **No Authentication**: No users table, no passwords, no sessions
   - All information is public
   - Newsletter subscribers don't authenticate

3. **Separate Subscribers Table**: Instead of embedding email in countries
   - **Pro**: Decoupled newsletter logic from travel data
   - **Con**: Separate table
   - **Justification**: Subscribers are optional, transient, and managed independently

4. **Boolean Flags for Mandatory/Recommended**:
   - `is_mandatory` in health_requirements and general_requirements
   - Allows filtering (show "must have" vs "recommended" separately)

5. **Type Field in dos_and_donts**:
   - Constraint enforces only 'do' or 'dont' values
   - Allows frontend to split into two columns: "What to Do" vs "What NOT to Do"

---

## Security & Data Integrity

### Referential Integrity
- All tables reference `countries(country_code)` with `ON DELETE CASCADE`
- Deleting a country automatically removes all associated data
- Prevents orphaned records

### Data Validation
- `dos_and_donts.type` has CHECK constraint → only 'do' or 'dont'
- `subscribers.email` is UNIQUE → prevents duplicate newsletter signups
- `countries.name` is UNIQUE → prevents duplicate country entries

### Timestamps
- `created_at` → When record was inserted
- `updated_at` → When record was last modified
- Combined with audit logging in application layer = full change history

---

## Scalability Notes

### Current Design Supports:
- ✅ 54 African countries (currently 10)
- ✅ 5 travel information sections per country
- ✅ Multiple records per section (e.g., multiple visa types per country)
- ✅ Unlimited newsletter subscribers
- ✅ Thousands of concurrent read operations (no user logins = no locks)

### Future Enhancements:
1. Add `country_pairs` table for bilateral visa agreements (e.g., Rwanda ↔ Kenya travel agreement)
2. Add `travel_alerts` table for real-time security/health alerts
3. Add `user_preferences` for saved favorites (if authentication is added)
4. Add `feedback` table to collect user suggestions on incomplete data

---

## Testing & Verification

### Verify Schema Creation:
```sql
-- Check all tables exist
SELECT table_name FROM information_schema.tables 
WHERE table_schema = 'public';

-- Check indexes exist
SELECT indexname FROM pg_indexes 
WHERE schemaname = 'public';

-- Verify row counts
SELECT 'countries' as table_name, COUNT(*) FROM countries
UNION ALL
SELECT 'visa_requirements', COUNT(*) FROM visa_requirements
UNION ALL
SELECT 'health_requirements', COUNT(*) FROM health_requirements
UNION ALL
SELECT 'dos_and_donts', COUNT(*) FROM dos_and_donts
UNION ALL
SELECT 'general_requirements', COUNT(*) FROM general_requirements
UNION ALL
SELECT 'emergency_contacts', COUNT(*) FROM emergency_contacts
UNION ALL
SELECT 'subscribers', COUNT(*) FROM subscribers;
```

---

**Database Design Complete** ✓  
Ready for SQL execution and API layer development.
