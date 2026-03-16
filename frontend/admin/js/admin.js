/**
 * admin.js
 * ─────────────────────────────────────────────────────
 * Admin dashboard logic for KBYG.
 * Handles login, tab switching, data tables, and CSV export.
 */

'use strict';

const ADMIN_API = 'http://localhost:5000'; // Change to deployed URL

let TOKEN = localStorage.getItem('kbyg_admin_token') || null;
let COUNTRIES = [];
let SELECTED = null;

/* ── INIT ── */
document.addEventListener('DOMContentLoaded', () => {
  document.getElementById('today-date').textContent = new Date().toLocaleDateString('en-GB', {
    weekday: 'long', year: 'numeric', month: 'long', day: 'numeric',
  });

  if (TOKEN) {
    bootDashboard();
  }
});

/* ── AUTH ── */
async function doLogin() {
  const email    = document.getElementById('login-email').value.trim();
  const password = document.getElementById('login-password').value;
  const errEl    = document.getElementById('login-err');
  const btn      = document.getElementById('login-btn');
  errEl.style.display = 'none';

  if (!email || !password) {
    errEl.textContent = 'Please enter your email and password.';
    errEl.style.display = 'block';
    return;
  }

  btn.disabled = true; btn.textContent = 'Signing in...';

  try {
    const res  = await fetch(`${ADMIN_API}/api/v1/auth/login`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ email, password }),
    });
    const data = await res.json();
    if (!res.ok) throw new Error(data.message || 'Login failed');

    TOKEN = data.token;
    localStorage.setItem('kbyg_admin_token', TOKEN);
    bootDashboard();
  } catch (err) {
    errEl.textContent = err.message || 'Login failed. Please try again.';
    errEl.style.display = 'block';
    btn.disabled = false; btn.textContent = 'Sign in';
  }
}

function doLogout() {
  TOKEN = null;
  localStorage.removeItem('kbyg_admin_token');
  document.getElementById('dashboard').style.display    = 'none';
  document.getElementById('login-screen').style.display = 'flex';
}

/* ── BOOT ── */
async function bootDashboard() {
  document.getElementById('login-screen').style.display = 'none';
  document.getElementById('dashboard').style.display    = 'grid';
  await Promise.all([loadOverview(), loadSubscribers(), loadFeedback(), loadCountries()]);
}

/* ── API HELPER ── */
async function adminApi(path, opts = {}) {
  const res  = await fetch(ADMIN_API + path, {
    headers: { 'Content-Type': 'application/json', 'Authorization': `Bearer ${TOKEN}`, ...opts.headers },
    ...opts,
  });
  if (res.status === 401) { doLogout(); throw new Error('Session expired'); }
  const body = await res.json().catch(() => ({}));
  if (!res.ok) throw new Error(body.message || `HTTP ${res.status}`);
  return body;
}

/* ── LOAD DATA ── */
async function loadSubscribers() {
  try {
    const data = await adminApi('/api/v1/admin/subscribers');
    const list = Array.isArray(data) ? data : (data.subscribers || data.data || []);
    renderSubscribersTable(list);
    document.getElementById('stat-subs').textContent  = list.length;
    const week = list.filter(s => isThisWeek(s.created_at || s.subscribedAt)).length;
    document.getElementById('stat-new').textContent   = week;
    renderRecentSubs(list.slice(0, 8));
  } catch (err) {
    console.error('[KBYG Admin] subscribers:', err.message);
  }
}

async function loadFeedback() {
  try {
    const data = await adminApi('/api/v1/admin/feedback');
    const list = Array.isArray(data) ? data : (data.feedback || data.data || []);
    renderFeedbackTable(list);
    document.getElementById('stat-feedback').textContent = list.length;
  } catch (err) {
    console.error('[KBYG Admin] feedback:', err.message);
  }
}

async function loadCountries() {
  try {
    const data = await adminApi('/api/v1/countries');
    const list = Array.isArray(data) ? data : (data.countries || data.data || []);
    COUNTRIES = list;
    renderCountriesGrid(list);
    document.getElementById('stat-countries').textContent = list.length;
  } catch (err) {
    console.error('[KBYG Admin] countries:', err.message);
  }
}

async function loadOverview() {
  // Stats are populated by the individual load functions above
}

/* ── RENDER ── */
function renderSubscribersTable(list) {
  const body = document.getElementById('subs-body');
  if (!list.length) { body.innerHTML = `<tr><td colspan="4" class="empty-state">No subscribers yet.</td></tr>`; return; }
  body.innerHTML = list.map(s => `
    <tr>
      <td>${s.name || '—'}</td>
      <td>${s.email || ''}</td>
      <td>${formatDate(s.created_at || s.subscribedAt)}</td>
      <td><span class="badge badge-active">Active</span></td>
    </tr>`).join('');
}

function renderFeedbackTable(list) {
  const body = document.getElementById('feedback-body');
  if (!list.length) { body.innerHTML = `<tr><td colspan="5" class="empty-state">No feedback yet.</td></tr>`; return; }
  body.innerHTML = list.map(f => `
    <tr>
      <td>${f.name || '—'}</td>
      <td>${f.email || '—'}</td>
      <td>${f.country_code || f.country || '—'}</td>
      <td style="max-width:280px;white-space:normal;">${f.message || ''}</td>
      <td>${formatDate(f.created_at)}</td>
    </tr>`).join('');
}

function renderCountriesGrid(list) {
  const grid = document.getElementById('countries-grid');
  if (!list.length) { grid.innerHTML = `<p class="empty-state">No countries found.</p>`; return; }
  grid.innerHTML = list.map(c => {
    const code = (c.country_code || c.code || '').toUpperCase();
    const on = SELECTED && (SELECTED.country_code || SELECTED.code || '').toUpperCase() === code ? 'on' : '';
    return `
      <button type="button" class="country-item ${on}" onclick="selectCountry('${code}')">
        <div class="country-flag">${c.flag || ''}</div>
        <div>
          <div class="country-info-name">${c.country_name || c.name || ''}</div>
          <div class="country-info-code">${code}</div>
        </div>
      </button>`;
  }).join('');
}

function renderRecentSubs(list) {
  const el = document.getElementById('recent-subs-list');
  if (!list.length) { el.innerHTML = `<p class="empty-state">No subscribers yet.</p>`; return; }
  el.innerHTML = list.map(s => `
    <div class="recent-row">
      <div>
        <div class="recent-name">${s.name || 'Anonymous'}</div>
        <div class="recent-email">${s.email || ''}</div>
      </div>
      <div class="recent-date">${formatDate(s.created_at || s.subscribedAt)}</div>
    </div>`).join('');
}

/* â”€â”€ COUNTRY EDITOR â”€â”€ */
function selectCountry(code) {
  const found = COUNTRIES.find(c => (c.country_code || c.code || '').toUpperCase() === code);
  if (!found) return;
  SELECTED = found;
  document.getElementById('editor-empty').style.display = 'none';
  document.getElementById('editor-form').style.display = 'block';
  document.getElementById('editor-title').textContent = `${found.country_name || found.name || ''} (${code})`;
  document.getElementById('edit-transportation').value = found.transportation || '';
  document.getElementById('edit-housing').value = found.housing || '';
  const msg = document.getElementById('editor-msg');
  msg.textContent = '';
  msg.className = 'editor-msg';
  renderCountriesGrid(COUNTRIES);
}

async function saveCountry() {
  if (!SELECTED) return;
  const code = (SELECTED.country_code || SELECTED.code || '').toUpperCase();
  const transportation = document.getElementById('edit-transportation').value.trim();
  const housing = document.getElementById('edit-housing').value.trim();
  const btn = document.getElementById('save-country-btn');
  const msg = document.getElementById('editor-msg');
  msg.textContent = '';
  msg.className = 'editor-msg';
  btn.disabled = true; btn.textContent = 'Saving...';
  try {
    const updated = await adminApi(`/api/v1/admin/countries/${code}`, {
      method: 'PATCH',
      body: JSON.stringify({ transportation, housing }),
    });
    const idx = COUNTRIES.findIndex(c => (c.country_code || c.code || '').toUpperCase() === code);
    if (idx >= 0) {
      COUNTRIES[idx] = { ...COUNTRIES[idx], ...updated };
      SELECTED = COUNTRIES[idx];
    }
    msg.textContent = 'Saved successfully.';
    msg.className = 'editor-msg ok';
    renderCountriesGrid(COUNTRIES);
  } catch (err) {
    msg.textContent = err.message || 'Save failed.';
    msg.className = 'editor-msg err';
  } finally {
    btn.disabled = false; btn.textContent = 'Save changes';
  }
}

/* ── TABS ── */
function showTab(name) {
  document.querySelectorAll('.tab-panel').forEach(p => p.classList.remove('on'));
  document.querySelectorAll('.nav-item').forEach(b => b.classList.remove('on'));
  document.getElementById(`panel-${name}`).classList.add('on');
  document.getElementById(`tab-${name}`).classList.add('on');
}

/* ── SEARCH / FILTER ── */
function filterTable(tableId, query) {
  const q    = query.toLowerCase();
  const rows = document.querySelectorAll(`#${tableId} tbody tr`);
  rows.forEach(row => {
    row.style.display = row.textContent.toLowerCase().includes(q) ? '' : 'none';
  });
}

/* ── EXPORT CSV ── */
function exportCSV(tableId, filename) {
  const table = document.getElementById(tableId);
  const rows  = [...table.querySelectorAll('tr')];
  const csv   = rows
    .filter(row => row.style.display !== 'none')
    .map(row =>
      [...row.querySelectorAll('th, td')]
        .map(cell => `"${cell.textContent.trim().replace(/"/g, '""')}"`)
        .join(',')
    ).join('\n');

  const blob = new Blob([csv], { type: 'text/csv' });
  const url  = URL.createObjectURL(blob);
  const a    = document.createElement('a');
  a.href     = url;
  a.download = `${filename}_${new Date().toISOString().slice(0,10)}.csv`;
  a.click();
  URL.revokeObjectURL(url);
}

/* ── UTILITIES ── */
function formatDate(iso) {
  if (!iso) return '—';
  return new Date(iso).toLocaleDateString('en-GB', { day: 'numeric', month: 'short', year: 'numeric' });
}
function isThisWeek(iso) {
  if (!iso) return false;
  const d    = new Date(iso);
  const now  = new Date();
  const diff = (now - d) / (1000 * 60 * 60 * 24);
  return diff <= 7;
}
