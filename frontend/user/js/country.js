const params = new URLSearchParams(window.location.search);
const CODE   = params.get('code');
if (!CODE) window.location.href = 'index.html';

function row(label, value) {
    return `<div class="info-row"><span class="row-label">${label}</span><span>${value}</span></div>`;
}
function badge(text, cls) {
    return `<span class="badge badge-${cls}">${text}</span>`;
}
function empty(msg) {
    return `<p class="empty-text">${msg}</p>`;
}

function renderVisa(data) {
    if (!data.length) return empty('No visa information available.');
    return data.map(v => {
        let extra = '';
        if (v.duration_days)    extra += `<span class="grey-sm"> · ${v.duration_days} days</span>`;
        if (v.cost_usd != null) extra += `<span class="grey-sm"> · $${v.cost_usd} USD</span>`;
        return row('Visa Type', `<strong>${v.visa_type}</strong>${extra}`);
    }).join('');
}

function renderHealth(data) {
    if (!data.length) return empty('No health requirements on record.');
    return data.map(h =>
        row(h.requirement_name, badge(h.is_mandatory ? 'Mandatory' : 'Recommended', h.is_mandatory ? 'mandatory' : 'recommended'))
    ).join('');
}

function renderDosDonts(data) {
    if (!data.length) return empty("No dos and don'ts recorded.");
    const dos  = data.filter(d => d.type === 'do');
    const dont = data.filter(d => d.type === 'dont');
    const col  = (items, cls, title, color) => `
        <div>
          <h4 style="color:${color};font-weight:700;margin-bottom:10px;font-size:13px;text-transform:uppercase;letter-spacing:.05em">${title}</h4>
          ${items.map(d => `<div class="info-row">${badge(cls === 'do' ? 'Do' : "Don't", cls)}<span style="font-size:14px">${d.description}</span></div>`).join('')}
        </div>`;
    return `<div class="dos-grid">${col(dos, 'do', 'Dos', 'var(--teal-dark)')}${col(dont, 'dont', "Don'ts", '#C0392B')}</div>`;
}

function renderGeneral(data) {
    if (!data.length) return empty('No entry requirements listed.');
    return data.map(g =>
        row(g.title, `${g.description}${g.is_mandatory ? ' ' + badge('Required', 'mandatory') : ''}`)
    ).join('');
}

function renderEmergency(data) {
    if (!data.length) return empty('No emergency contacts recorded.');
    return data.map(e => `
        <div class="emergency-item">
          <p class="embassy-name">${e.embassy_name}</p>
          <div class="embassy-details">
            ${e.phone   ? `<span>${e.phone}</span>`   : ''}
            ${e.email   ? `<span>${e.email}</span>`   : ''}
            ${e.address ? `<span>${e.address}</span>` : ''}
          </div>
        </div>`).join('');
}

async function loadCountryData() {
    try {
        const data = await API.getCountryData(CODE);
        const name = data.visa?.[0]?.country_name || CODE;

        document.getElementById('country-name').textContent = name;
        document.title = `${name} — Know Before You Go`;

        document.getElementById('visa-body').innerHTML      = renderVisa(data.visa);
        document.getElementById('health-body').innerHTML    = renderHealth(data.health);
        document.getElementById('dosdont-body').innerHTML   = renderDosDonts(data.dosDonts);
        document.getElementById('general-body').innerHTML   = renderGeneral(data.general);
        document.getElementById('emergency-body').innerHTML = renderEmergency(data.emergency);

        document.getElementById('page-loading').style.display = 'none';
        document.getElementById('page-content').style.display = 'block';

    } catch (err) {
        const msg = err.status === 404
            ? `No information found for country code "${CODE}".`
            : 'Failed to load travel information. Please try again.';
        document.getElementById('page-loading').style.display = 'none';
        document.getElementById('error-msg').textContent      = msg;
        document.getElementById('page-error').style.display   = 'flex';
    }
}

loadCountryData();
