# Know Before You Go - Deployment Guide

Production deployment checklist for deploying to cloud platforms.

---

## Deployment Readiness Checklist

Before deploying to production, ensure all items are complete:

- [ ] All tests passing
- [ ] Environment variables configured (secure passwords)
- [ ] HTTPS/SSL certificates obtained
- [ ] Database backups configured
- [ ] Monitoring & alerting set up
- [ ] CORS updated to specific frontend URL
- [ ] Rate limiting enabled
- [ ] Security headers verified
- [ ] Error logging configured
- [ ] Team has deployment access

---

## Option 1: Deploy to Render.com (Recommended for learning)

Render is a free/low-cost cloud platform perfect for this project.

### Step 1: Push Code to GitHub

```bash
git add .
git commit -m "Ready for production deployment"
git push origin main
```

### Step 2: Create Render Account

1. Go to [render.com](https://render.com)
2. Sign up (connect GitHub account)
3. Click "New" → "Web Service"
4. Connect your GitHub repository

### Step 3: Configure Deployment Settings

| Setting | Value |
|---------|-------|
| Name | know-before-you-go-api |
| Environment | Node |
| Region | Choose closest to users (e.g., Frankfurt for Africa) |
| Build Command | `npm install` |
| Start Command | `npm start` |

### Step 4: Add Environment Variables

In Render dashboard, add to "Environment":

```env
NODE_ENV=production
PORT=5000
DB_HOST=<your-db-host>
DB_PORT=5432
DB_NAME=know_before_you_go
DB_USER=<db-user>
DB_PASSWORD=<secure-password>
FRONTEND_URL=https://app.knowbeforeyougo.com
LOG_LEVEL=info
```

### Step 5: Deploy PostgreSQL Database

**Option A: Use Render PostgreSQL**
1. In Render dashboard: "New" → "PostgreSQL"
2. Name: `know_before_you_go_db`
3. Copy connection credentials
4. Update `DB_HOST`, `DB_USER`, `DB_PASSWORD` in environment variables

**Option B: Use External Database Provider**
- [Neon](https://neon.tech) - Free PostgreSQL hosting
- [Supabase](https://supabase.com) - Firebase alternative with PostgreSQL
- [AWS RDS](https://aws.amazon.com/rds/) - Enterprise-grade (paid)

### Step 6: Initialize Database

Once PostgreSQL is deployed:

```bash
# Connect to cloud database
psql postgresql://<user>:<password>@<host>:<port>/<database>

# Run schema creation
\i /path/to/001_create_tables.sql

# Load sample data
\i /path/to/002_seed_data.sql
```

Or use Render's "Shell" tab to run SQL commands.

### Step 7: Verify Deployment

```bash
# Test API endpoint
curl https://know-before-you-go-api.onrender.com/health
# Should return: {"status":"OK",...}

# Test real endpoint
curl https://know-before-you-go-api.onrender.com/api/countries
# Should return countries list
```

---

## Option 2: Deploy to Railway.app

Alternative platform with generous free tier.

### Step 1: Create Account

1. Go to [railway.app](https://railway.app)
2. Sign up with GitHub
3. Create new project

### Step 2: Add PostgreSQL Service

1. Click "Add Service" → "PostgreSQL"
2. Railway generates connection credentials automatically

### Step 3: Add Backend Service

1. Click "Add Service" → "GitHub Repo"
2. Select your Know Before You Go repository
3. Set environment variables (see Option 1, Step 4)

### Step 4: Deploy

Railway auto-deploys on GitHub push. Monitor progress in dashboard.

### Step 5: Configure Custom Domain (Optional)

1. In Railway project settings
2. Add custom domain: `api.knowbeforeyougo.com`
3. Update DNS records at domain registrar

---

## Option 3: Deploy to Heroku (Basic tier paid)

Heroku requires credit card even for free tier.

```bash
# Install Heroku CLI
npm install -g heroku

# Login
heroku login

# Create app
heroku create know-before-you-go-api

# Add PostgreSQL add-on
heroku addons:create heroku-postgresql:hobby-dev

# Set environment variables
heroku config:set NODE_ENV=production
heroku config:set FRONTEND_URL=https://app.knowbeforeyougo.com

# Deploy
git push heroku main

# View logs
heroku logs --tail
```

---

## Option 4: Self-Hosted (Advanced)

For complete control, rent a VPS and host yourself.

### Recommended Providers
- **DigitalOcean** ($5-6/month) - Simple, great for learning
- **Linode** - Fast, reliable
- **AWS EC2** - Enterprise option
- **Azure** - Microsoft cloud

### Basic Setup (DigitalOcean)

```bash
# 1. SSH into your server
ssh root@your_server_ip

# 2. Install Node.js
curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
sudo apt-get install -y nodejs

# 3. Install PostgreSQL
sudo apt-get install postgresql postgresql-contrib

# 4. Clone your repository
git clone https://github.com/yourusername/Know_Before_You_Go.git
cd Know_Before_You_Go/backend

# 5. Install dependencies
npm install

# 6. Create .env file
nano .env
# Add production environment variables

# 7. Initialize database
sudo -u postgres psql < database/001_create_tables.sql
sudo -u postgres psql < database/002_seed_data.sql

# 8. Start with PM2 (process manager)
npm install -g pm2
pm2 start server.js --name "know-before-you-go-api"
pm2 startup
pm2 save

# 9. Set up NGINX reverse proxy
sudo apt-get install nginx
# Configure NGINX to forward requests to :5000

# 10. Enable HTTPS with Let's Encrypt
sudo apt-get install certbot python3-certbot-nginx
sudo certbot certonly --nginx -d api.knowbeforeyougo.com
```

---

## Production Security Checklist

### Environment & Secrets

- [ ] All secrets in `.env` (never hardcoded)
- [ ] `.env` NOT in Git (add to `.gitignore`)
- [ ] Strong database password (20+ chars, mixed case/numbers/symbols)
- [ ] Separate database user with minimal permissions
- [ ] NODE_ENV=production
- [ ] API keys/tokens rotated regularly

### Database

```sql
-- Create low-privilege user for API
CREATE USER api_user WITH PASSWORD 'strong_secure_password';

-- Grant only necessary permissions
GRANT CONNECT ON DATABASE know_before_you_go TO api_user;
GRANT USAGE ON SCHEMA public TO api_user;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO api_user;
GRANT INSERT ON subscribers TO api_user;

-- No dangerous permissions
-- Don't grant DROP, ALTER TABLE, CREATE TABLE
```

### Network & HTTP

- [ ] HTTPS/TLS enabled (HTTP → HTTPS redirect)
- [ ] Valid SSL certificate (Let's Encrypt free)
- [ ] HSTS header set
- [ ] Don't expose server version (Helmet handles this)
- [ ] CORS set to specific frontend domain (not `*`)

### Monitoring & Logging

- [ ] Error tracking enabled (Sentry, Rollbar)
- [ ] Request logging to file
- [ ] Database query logging (slow queries)
- [ ] Uptime monitoring (Pingdom, UptimeRobot)
- [ ] Alert system (email/Slack on errors)

### Data Protection

- [ ] Database backups automated (daily)
- [ ] Backup verification tested
- [ ] Data encryption in transit (HTTPS)
- [ ] Data encryption at rest (consider for sensitive clients)
- [ ] GDPR compliance (for EU users)

### Access Control

- [ ] SSH key authentication (no password)
- [ ] firewall configured (only allow necessary ports)
- [ ] Rate limiting enabled
- [ ] DDoS protection (Cloudflare, AWS Shield)
- [ ] Activity logs reviewed regularly

---

## Production Environment Variables

```env
# Server
NODE_ENV=production
PORT=5000
LOG_LEVEL=info

# Database (use strong credentials)
DB_HOST=prod-db.your-provider.com
DB_PORT=5432
DB_NAME=know_before_you_go
DB_USER=api_user
DB_PASSWORD=<strong-random-password-20+chars>

# Frontend (specific URL, not *)
FRONTEND_URL=https://app.knowbeforeyougo.com

# Optional: Error tracking
SENTRY_DSN=https://key@sentry.io/project

# Optional: Monitoring
NEWRELIC_LICENSE_KEY=...
```

---

## Post-Deployment

### Health Checks

```bash
# Daily
curl https://api.knowbeforeyougo.com/health

# Monitor response time < 200ms in production
```

### Monitoring Queries

```sql
-- Check table sizes
SELECT 
  tablename, 
  pg_size_pretty(pg_total_relation_size(schemaname||'.'||tablename)) 
FROM pg_tables 
WHERE schemaname = 'public';

-- Count records
SELECT 'countries' as table_name, COUNT(*) FROM countries
UNION ALL
SELECT 'subscribers', COUNT(*) FROM subscribers
UNION ALL
SELECT 'visa_requirements', COUNT(*) FROM visa_requirements;

-- Check index usage
SELECT 
  idx.indexname,
  SUM(idx_tup_read) as reads,
  SUM(idx_tup_fetch) as fetches
FROM pg_stat_user_indexes
GROUP BY idx.indexname;
```

### Backup Verification

```bash
# Test restore monthly
# 1. Create test database
createdb test_know_before_you_go

# 2. Restore from backup
pg_restore -d test_know_before_you_go /backups/latest.sql

# 3. Verify data integrity
psql -d test_know_before_you_go -c "SELECT COUNT(*) FROM countries;"

# 4. Drop test database
dropdb test_know_before_you_go
```

---

## Scaling Considerations

### When to Scale Up

| Milestone | Action |
|-----------|--------|
| 100 concurrent users | Upgrade database tier |
| 1000 concurrent users | Add read replicas for reads |
| 10,000 concurrent users | Use connection pooling (PgBouncer) |
| 100,000+ concurrent users | Consider NoSQL caching (Redis) |

### Caching Strategy

```javascript
// Add Redis for frequent queries
const redis = require('redis');
const client = redis.createClient();

// Cache countries list (changes rarely)
app.get('/api/countries', async (req, res) => {
  const cached = await client.get('countries');
  if (cached) return res.json(JSON.parse(cached));
  
  const result = await query('SELECT * FROM countries');
  await client.setex('countries', 3600, JSON.stringify(result)); // 1 hour
  res.json(result);
});
```

---

## Disaster Recovery

### Backup Strategy

```bash
# Automated daily backups
# Add to cron (crontab -e)
0 2 * * * pg_dump know_before_you_go > /backups/db_$(date +\%Y\%m\%d).sql

# Weekly backups to cloud
0 3 * * 0 aws s3 cp /backups/ s3://my-backup-bucket/ --recursive
```

### Incident Response

1. **Database Down**
   - Restore from latest backup
   - Notify users on status page
   - Verify data integrity

2. **API Slow**
   - Check database load
   - Review slow queries
   - Increase resources

3. **Security Breach**
   - Rotate all secrets
   - Force password reset (if auth added)
   - Review audit logs
   - Notify users if data exposed

---

## Monitoring Tools

### Free Options
- **UptimeRobot** - Endpoint monitoring
- **Sentry** - Error tracking (free tier)
- **Grafana** - Metrics visualization

### Paid Options
- **Datadog** - Comprehensive monitoring
- **New Relic** - APM (Application Performance Monitoring)
- **Splunk** - Log aggregation

---

## Performance Benchmarks

Target metrics for production:

| Metric | Target | Best |
|--------|--------|------|
| API Response Time | <500ms | <100ms |
| Database Query | <100ms | <50ms |
| Uptime | 99.5% | 99.95% |
| Error Rate | <1% | <0.1% |

---

**Ready to deploy?** Start with Render for easiest experience.

For detailed safety recommendations, see [SECURITY_IMPLEMENTATION.md](SECURITY_IMPLEMENTATION.md)
