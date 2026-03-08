const API_BASE = 'http://localhost:5000';

const API = {

    async login(email, password) {
        const res  = await fetch(`${API_BASE}/api/auth/login`, {
            method:  'POST',
            headers: { 'Content-Type': 'application/json' },
            body:    JSON.stringify({ email, password }),
        });
        const data = await res.json();
        if (!res.ok) throw { status: res.status, message: data.error };
        return data;
    },

    async adminFetch(path, method = 'GET', body = null) {
        const token   = localStorage.getItem('kbyg_admin_token');
        const headers = { 'Content-Type': 'application/json' };
        if (token) headers['Authorization'] = `Bearer ${token}`;
        const opts = { method, headers };
        if (body) opts.body = JSON.stringify(body);
        const res  = await fetch(`${API_BASE}${path}`, opts);
        const data = await res.json();
        if (!res.ok) throw { status: res.status, message: data.error || 'Request failed.' };
        return data;
    },
};
