function toast(msg, type = 'success') {
    const el     = document.createElement('div');
    el.className = `toast ${type}`;
    el.innerHTML = `<span class="toast-msg">${esc(msg)}</span>`;
    document.getElementById('toast-container').appendChild(el);
    setTimeout(() => el.remove(), 4000);
}

let pendingDelete = null;

function confirmDelete(type, id, label) {
    pendingDelete = { type, id };
    document.getElementById('confirm-msg').textContent = `Delete "${label}"? This cannot be undone.`;
    document.getElementById('confirm-overlay').classList.add('open');
    document.getElementById('confirm-ok-btn').onclick = executeDelete;
}

function closeConfirm() {
    pendingDelete = null;
    document.getElementById('confirm-overlay').classList.remove('open');
}

const DELETE_ENDPOINTS = {
    country:    id => `/api/admin/countries/${id}`,
    visa:       id => `/api/admin/visa/${id}`,
    health:     id => `/api/admin/health/${id}`,
    dosdont:    id => `/api/admin/dos-donts/${id}`,
    general:    id => `/api/admin/general/${id}`,
    emergency:  id => `/api/admin/emergency/${id}`,
    feedback:   id => `/api/feedback/admin/${id}`,
    subscriber: id => `/api/admin/subscribers/${id}`,
    user:       id => `/api/admin/users/${id}`,
};

const DELETE_PAGE_MAP = {
    country:    'countries',
    visa:       'visa',
    health:     'health',
    dosdont:    'dosdont',
    general:    'general',
    emergency:  'emergency',
    feedback:   'feedback',
    subscriber: 'subscribers',
    user:       'users',
};

async function executeDelete() {
    if (!pendingDelete) return;
    const { type, id } = pendingDelete;
    closeConfirm();
    try {
        await API.adminFetch(DELETE_ENDPOINTS[type](id), 'DELETE');
        toast('Record deleted.', 'success');
        PAGE_LOADERS[DELETE_PAGE_MAP[type] || getCurrentPage()]?.();
    } catch (e) {
        toast(e.message || 'Failed to delete.', 'error');
    }
}

function filterTable(tbodyId, query, colIndexes) {
    const q    = query.toLowerCase();
    const rows = document.getElementById(tbodyId).querySelectorAll('tr:not(.empty-row)');
    rows.forEach(row => {
        const text = colIndexes.map(i => row.cells[i]?.textContent || '').join(' ').toLowerCase();
        row.style.display = text.includes(q) ? '' : 'none';
    });
}

function filterByType(tbodyId, value, colIndex) {
    const rows = document.getElementById(tbodyId).querySelectorAll('tr:not(.empty-row)');
    rows.forEach(row => {
        if (!value) { row.style.display = ''; return; }
        row.style.display = (row.cells[colIndex]?.textContent?.toLowerCase() || '').includes(value) ? '' : 'none';
    });
}

function esc(str) {
    return String(str || '')
        .replace(/&/g, '&amp;')
        .replace(/</g, '&lt;')
        .replace(/>/g, '&gt;')
        .replace(/"/g, '&quot;');
}

function formatDate(iso) {
    if (!iso) return '-';
    return new Date(iso).toLocaleDateString('en-GB', { day: '2-digit', month: 'short', year: 'numeric' });
}
