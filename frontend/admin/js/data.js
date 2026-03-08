async function loadDashboard() {
    try {
        const [countries, users, subscribers, feedback] = await Promise.all([
            API.adminFetch('/api/countries'),
            API.adminFetch('/api/admin/users'),
            API.adminFetch('/api/admin/subscribers'),
            API.adminFetch('/api/feedback/admin/all'),
        ]);

        document.getElementById('stat-countries').textContent   = countries.length;
        document.getElementById('stat-users').textContent       = users.length;
        document.getElementById('stat-subscribers').textContent = subscribers.length;
        document.getElementById('stat-feedback').textContent    = feedback.length;
        COUNTRIES_CACHE = countries;

        document.getElementById('recent-feedback-body').innerHTML =
            feedback.slice(0, 5).map(f => `
                <tr>
                  <td><strong>${esc(f.user_name)}</strong></td>
                  <td>${esc(f.country_name)}</td>
                  <td>${f.rating}/5</td>
                  <td>${f.comment ? esc(f.comment.substring(0, 60)) + (f.comment.length > 60 ? '...' : '') : '-'}</td>
                  <td>${formatDate(f.created_at)}</td>
                </tr>`).join('')
            || '<tr class="empty-row"><td colspan="5">No feedback yet</td></tr>';

        document.getElementById('recent-subscribers-body').innerHTML =
            subscribers.slice(0, 5).map(s => `
                <tr>
                  <td><strong>${esc(s.name)}</strong></td>
                  <td>${esc(s.email)}</td>
                  <td>${formatDate(s.subscribed_at)}</td>
                  <td><span class="badge ${s.is_active ? 'badge-teal' : 'badge-navy'}">${s.is_active ? 'Active' : 'Inactive'}</span></td>
                </tr>`).join('')
            || '<tr class="empty-row"><td colspan="4">No subscribers yet</td></tr>';

    } catch { toast('Failed to load dashboard data.', 'error'); }
}

async function loadCountries() {
    const tbody = document.getElementById('countries-tbody');
    try {
        const data      = await API.adminFetch('/api/countries');
        COUNTRIES_CACHE = data;
        tbody.innerHTML = data.length
            ? data.map(c => `
                <tr>
                  <td><img class="flag-img" src="${c.flag_url}" alt="${c.name}" onerror="this.style.display='none'"></td>
                  <td><strong>${esc(c.name)}</strong></td>
                  <td><span class="badge badge-navy">${c.country_code}</span></td>
                  <td>${esc(c.region || '-')}</td>
                  <td>${esc(c.capital || '-')}</td>
                  <td>
                    <button class="btn btn-ghost btn-sm" onclick='editCountry(${JSON.stringify(c)})'>Edit</button>
                    <button class="btn btn-danger btn-sm" onclick="confirmDelete('country','${c.country_code}','${esc(c.name)}')">Delete</button>
                  </td>
                </tr>`).join('')
            : '<tr class="empty-row"><td colspan="6">No countries found</td></tr>';
    } catch { tbody.innerHTML = '<tr class="empty-row"><td colspan="6">Failed to load</td></tr>'; }
}

async function loadVisa() {
    const tbody = document.getElementById('visa-tbody');
    try {
        const countries = await API.adminFetch('/api/countries');
        COUNTRIES_CACHE = countries;
        const rows = [];
        for (const c of countries) {
            try {
                const visas = await API.adminFetch(`/api/visa?country=${c.country_code}`);
                visas.forEach(v => rows.push({ ...v, country_name: c.name }));
            } catch {}
        }
        tbody.innerHTML = rows.length
            ? rows.map(v => `
                <tr>
                  <td><strong>${esc(v.country_name)}</strong></td>
                  <td>${esc(v.visa_type)}</td>
                  <td>${v.duration_days ? v.duration_days + ' days' : '-'}</td>
                  <td>${v.cost_usd != null ? (v.cost_usd == 0 ? '<span class="badge badge-teal">Free</span>' : '$' + v.cost_usd) : '-'}</td>
                  <td>${v.processing_days != null ? v.processing_days + ' days' : '-'}</td>
                  <td>
                    <button class="btn btn-ghost btn-sm" onclick='editVisa(${JSON.stringify(v)})'>Edit</button>
                    <button class="btn btn-danger btn-sm" onclick="confirmDelete('visa',${v.id},'${esc(v.visa_type)}')">Delete</button>
                  </td>
                </tr>`).join('')
            : '<tr class="empty-row"><td colspan="6">No visa records found</td></tr>';
    } catch { tbody.innerHTML = '<tr class="empty-row"><td colspan="6">Failed to load</td></tr>'; }
}

async function loadHealth() {
    const tbody = document.getElementById('health-tbody');
    try {
        const countries = await API.adminFetch('/api/countries');
        const rows = [];
        for (const c of countries) {
            try {
                const health = await API.adminFetch(`/api/health?country=${c.country_code}`);
                health.forEach(h => rows.push({ ...h, country_name: c.name }));
            } catch {}
        }
        tbody.innerHTML = rows.length
            ? rows.map(h => `
                <tr>
                  <td><strong>${esc(h.country_name)}</strong></td>
                  <td>${esc(h.requirement_name)}</td>
                  <td><span class="badge ${h.is_mandatory ? 'badge-red' : 'badge-amber'}">${h.is_mandatory ? 'Mandatory' : 'Recommended'}</span></td>
                  <td>${esc(h.notes || '-')}</td>
                  <td>
                    <button class="btn btn-ghost btn-sm" onclick='editHealth(${JSON.stringify(h)})'>Edit</button>
                    <button class="btn btn-danger btn-sm" onclick="confirmDelete('health',${h.id},'${esc(h.requirement_name)}')">Delete</button>
                  </td>
                </tr>`).join('')
            : '<tr class="empty-row"><td colspan="5">No health records found</td></tr>';
    } catch { tbody.innerHTML = '<tr class="empty-row"><td colspan="5">Failed to load</td></tr>'; }
}

async function loadDosDonts() {
    const tbody = document.getElementById('dosdont-tbody');
    try {
        const countries = await API.adminFetch('/api/countries');
        const rows = [];
        for (const c of countries) {
            try {
                const items = await API.adminFetch(`/api/dos-donts?country=${c.country_code}`);
                items.forEach(i => rows.push({ ...i, country_name: c.name }));
            } catch {}
        }
        tbody.innerHTML = rows.length
            ? rows.map(d => `
                <tr data-type="${d.type}">
                  <td><strong>${esc(d.country_name)}</strong></td>
                  <td><span class="badge ${d.type === 'do' ? 'badge-teal' : 'badge-red'}">${d.type === 'do' ? 'Do' : "Don't"}</span></td>
                  <td>${esc(d.description)}</td>
                  <td>
                    <button class="btn btn-ghost btn-sm" onclick='editDosDont(${JSON.stringify(d)})'>Edit</button>
                    <button class="btn btn-danger btn-sm" onclick="confirmDelete('dosdont',${d.id},'${esc(d.description.substring(0, 30))}...')">Delete</button>
                  </td>
                </tr>`).join('')
            : '<tr class="empty-row"><td colspan="4">No records found</td></tr>';
    } catch { tbody.innerHTML = '<tr class="empty-row"><td colspan="4">Failed to load</td></tr>'; }
}

async function loadGeneral() {
    const tbody = document.getElementById('general-tbody');
    try {
        const countries = await API.adminFetch('/api/countries');
        const rows = [];
        for (const c of countries) {
            try {
                const items = await API.adminFetch(`/api/general?country=${c.country_code}`);
                items.forEach(i => rows.push({ ...i, country_name: c.name }));
            } catch {}
        }
        tbody.innerHTML = rows.length
            ? rows.map(g => `
                <tr>
                  <td><strong>${esc(g.country_name)}</strong></td>
                  <td>${esc(g.title)}</td>
                  <td>${esc(g.description)}</td>
                  <td><span class="badge ${g.is_mandatory ? 'badge-red' : 'badge-navy'}">${g.is_mandatory ? 'Required' : 'Optional'}</span></td>
                  <td>
                    <button class="btn btn-ghost btn-sm" onclick='editGeneral(${JSON.stringify(g)})'>Edit</button>
                    <button class="btn btn-danger btn-sm" onclick="confirmDelete('general',${g.id},'${esc(g.title)}')">Delete</button>
                  </td>
                </tr>`).join('')
            : '<tr class="empty-row"><td colspan="5">No records found</td></tr>';
    } catch { tbody.innerHTML = '<tr class="empty-row"><td colspan="5">Failed to load</td></tr>'; }
}

async function loadEmergency() {
    const tbody = document.getElementById('emergency-tbody');
    try {
        const countries = await API.adminFetch('/api/countries');
        const rows = [];
        for (const c of countries) {
            try {
                const items = await API.adminFetch(`/api/emergency?country=${c.country_code}`);
                items.forEach(i => rows.push({ ...i, country_name: c.name }));
            } catch {}
        }
        tbody.innerHTML = rows.length
            ? rows.map(e => `
                <tr>
                  <td><strong>${esc(e.country_name)}</strong></td>
                  <td>${esc(e.embassy_name)}</td>
                  <td>${esc(e.phone || '-')}</td>
                  <td>${esc(e.email || '-')}</td>
                  <td>
                    <button class="btn btn-ghost btn-sm" onclick='editEmergency(${JSON.stringify(e)})'>Edit</button>
                    <button class="btn btn-danger btn-sm" onclick="confirmDelete('emergency',${e.id},'${esc(e.embassy_name)}')">Delete</button>
                  </td>
                </tr>`).join('')
            : '<tr class="empty-row"><td colspan="5">No records found</td></tr>';
    } catch { tbody.innerHTML = '<tr class="empty-row"><td colspan="5">Failed to load</td></tr>'; }
}

async function loadFeedback() {
    const tbody = document.getElementById('feedback-tbody');
    try {
        const data = await API.adminFetch('/api/feedback/admin/all');
        tbody.innerHTML = data.length
            ? data.map(f => `
                <tr>
                  <td><strong>${esc(f.user_name)}</strong><br><small>${esc(f.user_email)}</small></td>
                  <td>${esc(f.country_name)}</td>
                  <td>${f.rating}/5</td>
                  <td>${f.comment ? esc(f.comment) : '-'}</td>
                  <td>${formatDate(f.created_at)}</td>
                  <td><button class="btn btn-danger btn-sm" onclick="confirmDelete('feedback',${f.id},'review by ${esc(f.user_name)}')">Delete</button></td>
                </tr>`).join('')
            : '<tr class="empty-row"><td colspan="6">No feedback yet</td></tr>';
    } catch { tbody.innerHTML = '<tr class="empty-row"><td colspan="6">Failed to load</td></tr>'; }
}

async function loadSubscribers() {
    const tbody = document.getElementById('subscribers-tbody');
    try {
        const data = await API.adminFetch('/api/admin/subscribers');
        tbody.innerHTML = data.length
            ? data.map(s => `
                <tr>
                  <td><strong>${esc(s.name)}</strong></td>
                  <td>${esc(s.email)}</td>
                  <td>${formatDate(s.subscribed_at)}</td>
                  <td><span class="badge ${s.is_active ? 'badge-teal' : 'badge-navy'}">${s.is_active ? 'Active' : 'Inactive'}</span></td>
                  <td><button class="btn btn-danger btn-sm" onclick="confirmDelete('subscriber',${s.id},'${esc(s.name)}')">Delete</button></td>
                </tr>`).join('')
            : '<tr class="empty-row"><td colspan="5">No subscribers yet</td></tr>';
    } catch { tbody.innerHTML = '<tr class="empty-row"><td colspan="5">Failed to load</td></tr>'; }
}

async function loadUsers() {
    const tbody = document.getElementById('users-tbody');
    try {
        const data = await API.adminFetch('/api/admin/users');
        tbody.innerHTML = data.length
            ? data.map(u => `
                <tr>
                  <td><strong>${esc(u.name)}</strong></td>
                  <td>${esc(u.email)}</td>
                  <td><span class="badge ${u.role === 'admin' ? 'badge-admin' : 'badge-navy'}">${u.role}</span></td>
                  <td>${formatDate(u.created_at)}</td>
                  <td>${u.role !== 'admin'
                        ? `<button class="btn btn-danger btn-sm" onclick="confirmDelete('user',${u.id},'${esc(u.name)}')">Delete</button>`
                        : '<span style="color:var(--grey);font-size:12px">Protected</span>'
                  }</td>
                </tr>`).join('')
            : '<tr class="empty-row"><td colspan="5">No users found</td></tr>';
    } catch { tbody.innerHTML = '<tr class="empty-row"><td colspan="5">Failed to load</td></tr>'; }
}
