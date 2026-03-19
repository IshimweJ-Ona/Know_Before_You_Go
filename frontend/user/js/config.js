/**
 * config.js
 * ─────────────────────────────────────────────────────
 * Central configuration for the KBYG user frontend.
 *
 * Change API_BASE to your deployed backend URL before going live.
 *   Local   → http://localhost:5000
 *   Production → https://your-domain.com
 */

const API_BASE = window.API_BASE
  || localStorage.getItem('API_BASE')
  || window.location.origin;

console.log('[CONFIG] API_BASE:', API_BASE);

const EP = {
  COUNTRIES:  '/api/v1/countries',
  COUNTRY:    (code) => `/api/v1/countries/${code}`,
  COUNTRY_AI: (code) => `/api/v1/countries/${code}/assistant`,
  VISA:       (code) => `/api/v1/visa/${code}`,
  HEALTH:     (code) => `/api/v1/health/${code}`,
  EMERGENCY:  (code) => `/api/v1/emergency/${code}`,
  DOS_DONTS:  (code) => `/api/v1/dosDonts/${code}`,
  GENERAL:    (code) => `/api/v1/general/${code}`,
  NEWSLETTER: '/api/v1/newsletter',
  AI_QUERY:   '/api/ai/query',
  SUBSCRIBER_SIGNUP: '/api/v1/subscriber/signup',
  SUBSCRIBER_LOGIN: '/api/v1/subscriber/login',
  NEWS: '/api/v1/news',
  ADS: '/api/v1/ads',
  CHAT: '/api/v1/chat',
  ADMIN_LOGIN: '/api/v1/admin/login',
  ADMIN_SUBSCRIBERS: '/api/v1/admin/subscribers',
};
