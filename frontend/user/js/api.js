/**
 * api.js
 * ─────────────────────────────────────────────────────
 * Thin HTTP wrapper used by app.js.
 * All fetch calls go through here so error handling
 * and base URL are managed in one place.
 *
 * Requires: config.js (loaded before this file)
 */

/**
 * Make a JSON API request.
 * @param {string} path   - Endpoint path (use EP constants from config.js)
 * @param {object} [opts] - Standard fetch options (method, body, headers…)
 * @returns {Promise<any>}
 * @throws  {Error} with a human-readable message on non-2xx responses
 */
async function api(path, opts = {}) {
  const headers = {
    'Content-Type': 'application/json',
    ...opts.headers,
  };

  const token = localStorage.getItem('user_token');
  if (token) {
    headers['Authorization'] = `Bearer ${token}`;
  }

  const fullUrl = API_BASE + path;
  console.log('[API] Calling:', fullUrl);
  
  const res  = await fetch(fullUrl, { ...opts, headers });
  const body = await res.json().catch(() => ({}));

  console.log('[API] Response status:', res.status);
  console.log('[API] Response body:', body);

  if (!res.ok) {
    throw new Error(body.message || body.error || `HTTP ${res.status}`);
  }

  return body;
}
