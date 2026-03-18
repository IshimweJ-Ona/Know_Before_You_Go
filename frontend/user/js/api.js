/**
 * api.js
 * Thin HTTP wrapper used by app.js.
 * All fetch calls go through here so error handling
 * and base URL are managed in one place.
 *
 * Requires: config.js (loaded before this file)
 */

async function api(path, opts = {}) {
  const headers = {
    'Content-Type': 'application/json',
    ...opts.headers,
  };

  const res  = await fetch(API_BASE + path, { ...opts, headers });
  const body = await res.json().catch(() => ({}));

  if (!res.ok) {
    throw new Error(body.message || body.error || `HTTP ${res.status}`);
  }

  return body;
}
