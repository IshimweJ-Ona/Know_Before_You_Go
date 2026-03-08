let MODAL_TYPE      = null;
let MODAL_EDIT_ID   = null;
let COUNTRIES_CACHE = [];

function countryOptions(selected = '') {
    return COUNTRIES_CACHE.map(c =>
        `<option value="${c.country_code}" ${c.country_code === selected ? 'selected' : ''}>${c.name} (${c.country_code})</option>`
    ).join('');
}

const MODAL_FORMS = {

    country: (d = {}) => `
        <div class="form-row">
          <div class="form-group">
            <label class="form-label">Country Code</label>
            <input class="form-input" id="f-country_code" value="${esc(d.country_code||'')}" placeholder="e.g. KE" maxlength="2" ${d.country_code ? 'readonly' : ''}>
          </div>
          <div class="form-group">
            <label class="form-label">Country Name</label>
            <input class="form-input" id="f-name" value="${esc(d.name||'')}" placeholder="e.g. Kenya">
          </div>
        </div>
        <div class="form-row">
          <div class="form-group">
            <label class="form-label">Region</label>
            <input class="form-input" id="f-region" value="${esc(d.region||'')}" placeholder="e.g. East Africa">
          </div>
          <div class="form-group">
            <label class="form-label">Capital</label>
            <input class="form-input" id="f-capital" value="${esc(d.capital||'')}" placeholder="e.g. Nairobi">
          </div>
        </div>
        <div class="form-group">
          <label class="form-label">Flag URL</label>
          <input class="form-input" id="f-flag_url" value="${esc(d.flag_url||'')}" placeholder="https://flagcdn.com/ke.svg">
        </div>`,

    visa: (d = {}) => `
        <div class="form-group">
          <label class="form-label">Country</label>
          <select class="form-select" id="f-country_code"><option value="">Select country...</option>${countryOptions(d.country_code)}</select>
        </div>
        <div class="form-group">
          <label class="form-label">Visa Type</label>
          <input class="form-input" id="f-visa_type" value="${esc(d.visa_type||'')}" placeholder="e.g. Tourist Visa">
        </div>
        <div class="form-row">
          <div class="form-group">
            <label class="form-label">Duration (days)</label>
            <input class="form-input" type="number" id="f-duration_days" value="${d.duration_days||''}" placeholder="90">
          </div>
          <div class="form-group">
            <label class="form-label">Cost (USD)</label>
            <input class="form-input" type="number" step="0.01" id="f-cost_usd" value="${d.cost_usd??''}" placeholder="0 = Free">
          </div>
        </div>
        <div class="form-group">
          <label class="form-label">Processing Time (days)</label>
          <input class="form-input" type="number" id="f-processing_days" value="${d.processing_days||''}" placeholder="3">
        </div>
        <div class="form-group">
          <label class="form-label">Required Documents</label>
          <textarea class="form-textarea" id="f-documents" placeholder="Comma-separated list">${esc(d.documents||'')}</textarea>
        </div>`,

    health: (d = {}) => `
        <div class="form-group">
          <label class="form-label">Country</label>
          <select class="form-select" id="f-country_code"><option value="">Select country...</option>${countryOptions(d.country_code)}</select>
        </div>
        <div class="form-group">
          <label class="form-label">Requirement Name</label>
          <input class="form-input" id="f-requirement_name" value="${esc(d.requirement_name||'')}" placeholder="e.g. Yellow Fever Vaccination">
        </div>
        <div class="form-group">
          <label class="form-label">Status</label>
          <select class="form-select" id="f-is_mandatory">
            <option value="false" ${!d.is_mandatory?'selected':''}>Recommended</option>
            <option value="true"  ${d.is_mandatory ?'selected':''}>Mandatory</option>
          </select>
        </div>
        <div class="form-group">
          <label class="form-label">Notes</label>
          <textarea class="form-textarea" id="f-notes" placeholder="Additional notes">${esc(d.notes||'')}</textarea>
        </div>`,

    dosdont: (d = {}) => `
        <div class="form-group">
          <label class="form-label">Country</label>
          <select class="form-select" id="f-country_code"><option value="">Select country...</option>${countryOptions(d.country_code)}</select>
        </div>
        <div class="form-group">
          <label class="form-label">Type</label>
          <select class="form-select" id="f-type">
            <option value="do"   ${d.type==='do'  ?'selected':''}>Do</option>
            <option value="dont" ${d.type==='dont'?'selected':''}>Don't</option>
          </select>
        </div>
        <div class="form-group">
          <label class="form-label">Description</label>
          <textarea class="form-textarea" id="f-description" placeholder="Describe the do or don't">${esc(d.description||'')}</textarea>
        </div>`,

    general: (d = {}) => `
        <div class="form-group">
          <label class="form-label">Country</label>
          <select class="form-select" id="f-country_code"><option value="">Select country...</option>${countryOptions(d.country_code)}</select>
        </div>
        <div class="form-group">
          <label class="form-label">Title</label>
          <input class="form-input" id="f-title" value="${esc(d.title||'')}" placeholder="e.g. Passport Validity">
        </div>
        <div class="form-group">
          <label class="form-label">Description</label>
          <textarea class="form-textarea" id="f-description" placeholder="Describe the requirement">${esc(d.description||'')}</textarea>
        </div>
        <div class="form-group">
          <label class="form-label">Mandatory</label>
          <select class="form-select" id="f-is_mandatory">
            <option value="true"  ${d.is_mandatory!==false?'selected':''}>Required</option>
            <option value="false" ${d.is_mandatory===false ?'selected':''}>Optional</option>
          </select>
        </div>`,

    emergency: (d = {}) => `
        <div class="form-group">
          <label class="form-label">Country</label>
          <select class="form-select" id="f-country_code"><option value="">Select country...</option>${countryOptions(d.country_code)}</select>
        </div>
        <div class="form-group">
          <label class="form-label">Embassy / Service Name</label>
          <input class="form-input" id="f-embassy_name" value="${esc(d.embassy_name||'')}" placeholder="e.g. British High Commission">
        </div>
        <div class="form-row">
          <div class="form-group">
            <label class="form-label">Phone</label>
            <input class="form-input" id="f-phone" value="${esc(d.phone||'')}" placeholder="+254 20 000 0000">
          </div>
          <div class="form-group">
            <label class="form-label">Email</label>
            <input class="form-input" type="email" id="f-email" value="${esc(d.email||'')}" placeholder="embassy@example.com">
          </div>
        </div>
        <div class="form-group">
          <label class="form-label">Address</label>
          <textarea class="form-textarea" id="f-address" placeholder="Full address">${esc(d.address||'')}</textarea>
        </div>`,
};

function openModal(type, title = null, editId = null, data = {}) {
    MODAL_TYPE    = type;
    MODAL_EDIT_ID = editId;
    document.getElementById('modal-title').textContent = title || `Add ${type.charAt(0).toUpperCase() + type.slice(1)}`;
    document.getElementById('modal-body').innerHTML    = MODAL_FORMS[type]?.(data) || '';
    document.getElementById('modal-overlay').classList.add('open');
}

function closeModal() {
    document.getElementById('modal-overlay').classList.remove('open');
}

function closeModalOutside(e) {
    if (e.target === document.getElementById('modal-overlay')) closeModal();
}

function editCountry(c)   { openModal('country',   'Edit Country',             c.country_code, c); }
function editVisa(v)      { openModal('visa',       'Edit Visa Record',         v.id, v); }
function editHealth(h)    { openModal('health',     'Edit Health Record',       h.id, h); }
function editDosDont(d)   { openModal('dosdont',    "Edit Do / Don't",          d.id, d); }
function editGeneral(g)   { openModal('general',    'Edit General Requirement', g.id, g); }
function editEmergency(e) { openModal('emergency',  'Edit Emergency Contact',   e.id, e); }

function getVal(id) {
    const el = document.getElementById(id);
    return el ? el.value.trim() : null;
}

async function saveModal() {
    const btn       = document.getElementById('modal-save-btn');
    btn.textContent = 'Saving...';
    btn.disabled    = true;

    try {
        const type = MODAL_TYPE;
        const id   = MODAL_EDIT_ID;
        let body, endpoint, method;

        if (type === 'country') {
            body = {
                country_code: getVal('f-country_code'),
                name:         getVal('f-name'),
                region:       getVal('f-region'),
                capital:      getVal('f-capital'),
                flag_url:     getVal('f-flag_url'),
            };
            if (!body.country_code || !body.name) { toast('Country code and name are required.', 'error'); return; }
            endpoint = id ? `/api/admin/countries/${id}` : '/api/admin/countries';
            method   = id ? 'PUT' : 'POST';

        } else if (type === 'visa') {
            body = {
                country_code:    getVal('f-country_code'),
                visa_type:       getVal('f-visa_type'),
                duration_days:   getVal('f-duration_days')   ? parseInt(getVal('f-duration_days'))   : null,
                cost_usd:        getVal('f-cost_usd') !== '' ? parseFloat(getVal('f-cost_usd'))      : null,
                processing_days: getVal('f-processing_days') ? parseInt(getVal('f-processing_days')) : null,
                documents:       getVal('f-documents'),
            };
            if (!body.country_code || !body.visa_type) { toast('Country and visa type are required.', 'error'); return; }
            endpoint = id ? `/api/admin/visa/${id}` : '/api/admin/visa';
            method   = id ? 'PUT' : 'POST';

        } else if (type === 'health') {
            body = {
                country_code:     getVal('f-country_code'),
                requirement_name: getVal('f-requirement_name'),
                is_mandatory:     getVal('f-is_mandatory') === 'true',
                notes:            getVal('f-notes'),
            };
            if (!body.country_code || !body.requirement_name) { toast('Country and requirement name are required.', 'error'); return; }
            endpoint = id ? `/api/admin/health/${id}` : '/api/admin/health';
            method   = id ? 'PUT' : 'POST';

        } else if (type === 'dosdont') {
            body = {
                country_code: getVal('f-country_code'),
                type:         getVal('f-type'),
                description:  getVal('f-description'),
            };
            if (!body.country_code || !body.description) { toast('Country and description are required.', 'error'); return; }
            endpoint = id ? `/api/admin/dos-donts/${id}` : '/api/admin/dos-donts';
            method   = id ? 'PUT' : 'POST';

        } else if (type === 'general') {
            body = {
                country_code: getVal('f-country_code'),
                title:        getVal('f-title'),
                description:  getVal('f-description'),
                is_mandatory: getVal('f-is_mandatory') === 'true',
            };
            if (!body.country_code || !body.title || !body.description) { toast('Country, title and description are required.', 'error'); return; }
            endpoint = id ? `/api/admin/general/${id}` : '/api/admin/general';
            method   = id ? 'PUT' : 'POST';

        } else if (type === 'emergency') {
            body = {
                country_code: getVal('f-country_code'),
                embassy_name: getVal('f-embassy_name'),
                phone:        getVal('f-phone'),
                email:        getVal('f-email'),
                address:      getVal('f-address'),
            };
            if (!body.country_code || !body.embassy_name) { toast('Country and embassy name are required.', 'error'); return; }
            endpoint = id ? `/api/admin/emergency/${id}` : '/api/admin/emergency';
            method   = id ? 'PUT' : 'POST';
        }

        await API.adminFetch(endpoint, method, body);
        toast(id ? 'Record updated.' : 'Record added.', 'success');
        closeModal();
        PAGE_LOADERS[getCurrentPage()]?.();

    } catch (e) {
        toast(e.message || 'Failed to save.', 'error');
    } finally {
        btn.textContent = 'Save';
        btn.disabled    = false;
    }
}
