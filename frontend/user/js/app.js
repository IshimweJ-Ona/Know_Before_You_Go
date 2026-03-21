/**
 * app.js — KBYG User Frontend
 * Requires: config.js, api.js
 */
'use strict';

let ALL = [];
let CURRENT_USER = null;

/* ── Unique fallback hero images per country code ── */
const COUNTRY_IMAGES = {
  RW: 'https://www.shiftcities.org/sites/default/files/styles/16_9_extra_large/public/2021-12/51262629802_21efa5b084_k.jpg?itok=UhA25Itj', // Rwanda gorillas/hills
  KE: 'https://www.do4africa.org/app/uploads/2022/01/Actu3_Kenyacity.png', // Kenya savannah
  TZ: 'https://assets.micontenthub.com/traveloffers/traveler-editorials/a-guide-to-tanzania-what-to-do-and-where-to-stay/DarEsSalaam_p-LNBmfXF.jpg', // Tanzania Serengeti
  UG: 'https://www.asiliaafrica.com/wp-content/uploads/2024/04/The-city-skyline-Uganda.jpg', // Uganda landscape
  NG: 'https://news.delta.com/sites/default/files/styles/node_image_top_960/public/2025-01/adobestock_359316984.jpeg.jpg?itok=JuztjTHe', // Nigeria Lagos
  GH: 'https://images.unsplash.com/photo-1727023663921-967d01f69c7e?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fGdoYW5hfGVufDB8fDB8fHww', // Ghana coast
  ZA: 'https://images.unsplash.com/photo-1495492429145-2c82ff875f67?q=80&w=2334&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', // South Africa Cape Town
  MA: 'https://www.brookings.edu/wp-content/uploads/2025/03/shutterstock_2527687493.jpg?quality=75', // Morocco Marrakech
  ET: 'https://images.unsplash.com/photo-1614981816670-3e65f4cfdb28?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fGFkZGlzJTIwYWJhYmF8ZW58MHx8MHx8fDA%3D', // Ethiopia mountains
  SN: 'https://images.unsplash.com/photo-1664887246498-7d729201b1f6?q=80&w=3133&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', // Senegal coast
};

/* ── SVG ICONS ── */
const IC = {
  cap:   '',
  money: '',
  lang:  '',
  pop:   '',
  plug:  '',
  clock: '',
  tip:   '',
  temp:  '',
  pass:  '',
  chk:   '',
  x:     '',
  warn:  '',
  syr:   '',
  shld:  '',
  pol:   '',
  amb:   '',
  fire:  '',
  sos:   '',
};

/* ── DOM HELPERS ── */
function setEl(id, html)  { const e = document.getElementById(id); if (e) e.innerHTML  = html; }
function setTxt(id, text) { const e = document.getElementById(id); if (e) e.textContent = text; }
function setLoader(pct, text) {
  const bar = document.getElementById('ld-bar');
  const label = document.getElementById('ld-txt');
  if (bar) bar.style.width = `${pct}%`;
  if (label) label.textContent  = text;
}
function hideLoader() {
  const el = document.getElementById('loader');
  if (!el) return;
  el.style.opacity = '0';
  setTimeout(() => { el.style.display = 'none'; }, 440);
}
function showApp() {
  const app = document.getElementById('app');
  if (app) app.style.display = 'block';
}

function toast(msg, type = 'ok') {
  const el = document.getElementById('toast');
  if (!el) return;
  el.textContent = msg;
  el.className   = `show ${type}`;
  clearTimeout(el._t);
  el._t = setTimeout(() => { el.className = ''; }, 3400);
}

function escapeHtml(value) {
  return String(value || '')
    .replace(/&/g, '&amp;')
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;')
    .replace(/"/g, '&quot;')
    .replace(/'/g, '&#39;');
}

// Basic URL sanitizer for images/links so assets stay path-safe
function safeUrl(value) {
  const url = String(value || '').trim();
  if (!url) return '';
  if (/^https?:\/\//i.test(url)) return url;
  return '';
}

function renderAiSummary(text, country) {
  const name = country?.country_name || country?.name || 'this destination';
  const safeText = (text || '').trim();
  if (!safeText) {
    setEl('d-ai', `<div class="ai-empty">AI summary unavailable.</div>`);
    return;
  }

  const lines = safeText.split('\n').map(l => l.trim()).filter(Boolean);
  const bullets = lines
    .filter(l => /^[-*•]/.test(l))
    .map(l => l.replace(/^[-*•]\s*/, '').trim())
    .filter(Boolean);
  const paragraphs = lines.filter(l => !/^[-*•]/.test(l));

  const paraHtml = paragraphs.length
    ? paragraphs.map(p => `<p>${escapeHtml(p)}</p>`).join('')
    : '';
  const bulletHtml = bullets.length
    ? `<ul class="ai-bullets">${bullets.slice(0, 6).map(b => `<li>${escapeHtml(b)}</li>`).join('')}</ul>`
    : '';

  setEl('d-ai', `
    <div class="ai-card">
      <div class="ai-title">AI Highlights for ${escapeHtml(name)}</div>
      ${paraHtml}
      ${bulletHtml}
    </div>
  `);
}

/* ── NEWSLETTER ── */
function openNL() {
  document.getElementById('nl-overlay').classList.add('open');
  if (USER_TOKEN) {
    loadNews();
    document.getElementById('subscriber-news').style.display = 'block';
  } else {
    setEl('subscriber-news', '<p>To get news about travels to countries, subscribe to our newsletter.</p>');
    document.getElementById('subscriber-news').style.display = 'block';
  }
}
function closeNLBtn(){ document.getElementById('nl-overlay').classList.remove('open'); }
function closeNL(e)  { if (e.target === document.getElementById('nl-overlay')) closeNLBtn(); }

async function submitNewsletter() {
  const name     = document.getElementById('nl-name').value.trim();
  const email    = document.getElementById('nl-email').value.trim();
  const password = document.getElementById('nl-password').value.trim();
  const errEl    = document.getElementById('nl-modal-err');
  errEl.style.display = 'none';
  if (!email) { errEl.textContent = 'Please enter your email address.'; errEl.style.display = 'block'; return; }
  if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) { errEl.textContent = 'Please enter a valid email address.'; errEl.style.display = 'block'; return; }
  if (!password) { errEl.textContent = 'Please enter a password.'; errEl.style.display = 'block'; return; }
  const btn = document.getElementById('nl-btn');
  btn.disabled = true; btn.classList.add('loading'); btn.textContent = 'Subscribing';
  try {
    await api(EP.NEWSLETTER, { method: 'POST', body: JSON.stringify({ name, email, password }) });
    // Auto-login after newsletter subscription
    const loginRes = await api(EP.SUBSCRIBER_LOGIN, {
      method: 'POST',
      body: JSON.stringify({ email, password }),
    });
    USER_TOKEN = loginRes.token;
    CURRENT_USER = { email, name };
    localStorage.setItem('user_token', USER_TOKEN);
    localStorage.setItem('user_info', JSON.stringify(CURRENT_USER));
    updateLoginUI();
    document.getElementById('nl-modal-form').style.display = 'none';
    document.getElementById('nl-modal-ok').style.display   = 'block';
    setTimeout(() => {
      document.getElementById('nl-overlay').classList.remove('open');
      location.reload();
    }, 1500);
  } catch (err) {
    errEl.textContent = err.message || 'Something went wrong. Please try again.';
    errEl.style.display = 'block';
    btn.disabled = false; btn.classList.remove('loading'); btn.textContent = 'Subscribe';
  }
}

async function submitInlineNewsletter() {
  const email = document.getElementById('nl-inline-email').value.trim();
  const msgEl = document.getElementById('nl-inline-msg');
  const btn   = document.getElementById('nl-inline-btn');
  msgEl.style.display = 'none';
  if (!email) { msgEl.textContent = 'Please enter your email address.'; msgEl.className = 'err'; msgEl.style.display = 'block'; return; }
  if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) { msgEl.textContent = 'Please enter a valid email.'; msgEl.className = 'err'; msgEl.style.display = 'block'; return; }
  btn.disabled = true; btn.textContent = 'Subscribing...';
  try {
    await api(EP.NEWSLETTER, { method: 'POST', body: JSON.stringify({ email }) });
    document.getElementById('nl-inline-email').value = '';
    msgEl.textContent = 'You are now subscribed. Safe travels.';
    msgEl.className = 'ok'; msgEl.style.display = 'block';
    btn.textContent = 'Subscribed';
  } catch (err) {
    msgEl.textContent = err.message || 'Something went wrong. Please try again.';
    msgEl.className = 'err'; msgEl.style.display = 'block';
    btn.disabled = false; btn.textContent = 'Subscribe';
  }
}

/* ── LABEL HELPERS ── */
function advClass(lvl) { return ['b1','b2','b3','b4'][Math.min((lvl||1),4)-1]; }
function advLabel(lvl) { return ['Normal Precautions','Exercise Caution','Reconsider Travel','Do Not Travel'][Math.min((lvl||1),4)-1]; }
function visaLabel(s='') {
  const l = s.toLowerCase();
  if (l.includes('free'))    return 'Visa Free';
  if (l.includes('arrival')) return 'Visa on Arrival';
  if (l.includes('evisa') || l.includes('e-visa')) return 'eVisa Required';
  if (l.includes('required'))return 'Visa Required';
  return 'Check Visa';
}
function visaClass(s='') {
  const l = s.toLowerCase();
  if (l.includes('free'))    return 'tg';
  if (l.includes('arrival')) return 'tw';
  return '';
}
function healthLabel(lvl=0){ return ['All Clear','Watch','Alert','Warning'][Math.min(lvl,3)]; }
function healthClass(lvl=0){ return lvl>=2?'tw':lvl===1?'':'tg'; }

/* ── COUNTRY GRID ── */
function renderSkeletons(n) {
  setEl('grid', Array.from({length:n},()=>`
    <div class="sk">
      <div class="skel" style="height:240px;border-radius:0;"></div>
      <div style="padding:22px 24px 26px;">
        <div class="skel" style="height:28px;width:65%;margin-bottom:12px;border-radius:8px;"></div>
        <div class="skel" style="height:14px;width:45%;margin-bottom:18px;border-radius:6px;"></div>
        <div class="skel" style="height:12px;width:80%;border-radius:6px;"></div>
      </div>
    </div>`).join(''));
}
function renderError() {
  setEl('grid',`<p style="padding:60px 0;color:#a0a0b0;font-size:1.05rem;grid-column:1/-1;text-align:center;">
    Could not load destinations. Please check your connection and try again.
  </p>`);
}
function renderNoResults() {
  setEl('grid',`<p style="padding:60px 0;color:#a0a0b0;font-size:1.05rem;grid-column:1/-1;text-align:center;">
    No destinations match your search criteria. Try adjusting your filters.
  </p>`);
}
function renderCountries(list) {
  console.log('[renderCountries] Called with list:', list);
  console.log('[renderCountries] List length:', list ? list.length : 'undefined');
  
  if (!list||!list.length){ 
    console.error('[renderCountries] List is empty, rendering no results');
    console.trace('Trace for empty list:');
    renderNoResults(); 
    return; 
  }
  
  const gridEl = document.getElementById('grid');
  console.log('[renderCountries] Grid element exists:', !!gridEl);
  
  const html = list.map((c,i)=>{
    const code = c.country_code||c.code||'';
    const name = c.country_name||c.name||'';
    // Use unique image per country — prefer DB value, fall back to country-specific default
    const rawImg  = c.hero_image||c.heroImg||COUNTRY_IMAGES[code]||COUNTRY_IMAGES.KE;
    const img = safeUrl(rawImg) || COUNTRY_IMAGES.KE;
    const lvl  = c.advisory_level||c.advisory||1;
    const vs   = c.visa_status||c.visaStatus||'';
    const hlvl = c.cdc_notice_level||0;
    const lang = (c.language||'').split(',')[0];
    return `
      <div class="c-card" onclick="openCountry('${code}')" style="animation-delay:${i*0.06}s">
        <div class="c-img">
          <img src="${img}" alt="${escapeHtml(name)}" loading="lazy"
            onerror="this.src='${COUNTRY_IMAGES.KE}'">
          <div class="c-img-fade"></div>
          <div class="c-flag">${c.flag||''}</div>
          <div class="c-badge ${advClass(lvl)}">${advLabel(lvl)}</div>
        </div>
        <div class="c-body">
          <div class="c-name">${name}</div>
          <div class="c-meta">${c.region||''} &nbsp;&middot;&nbsp; ${c.capital||''}</div>
          <div class="c-tags">
            <span class="tag tv ${visaClass(vs)}">${visaLabel(vs)}</span>
            <span class="tag ${healthClass(hlvl)}">Health: ${healthLabel(hlvl)}</span>
            ${lang?`<span class="tag">${lang}</span>`:''}
          </div>
        </div>
      </div>`;
  }).join('');
  
  console.log('[renderCountries] Generated HTML length:', html.length);
  setEl('grid', html);
  console.log('[renderCountries] Destinations rendered successfully');
}
function getChipValue(group) {
  return (document.querySelector(`.chip-group[data-group="${group}"] .chip.on`)?.dataset.value || 'all').toLowerCase();
}

function setChip(btn) {
  const group = btn.closest('.chip-group');
  if (!group) return;
  group.querySelectorAll('.chip').forEach(b => b.classList.remove('on'));
  btn.classList.add('on');
  filterCountries();
}

function filterCountries(q) {
  const query = (typeof q === 'string' ? q : (document.getElementById('search')?.value || '')).toLowerCase();
  const visaFilter = getChipValue('visa');
  const regionFilter = getChipValue('region');
  console.log('[FILTER] Query:', query, 'Visa filter:', visaFilter, 'Region filter:', regionFilter);
  const visible = ALL.filter((c) => {
    const name = (c.country_name || c.name || '').toLowerCase();
    const region = (c.region || '').toLowerCase();
    const capital = (c.capital || '').toLowerCase();
    const visa = (c.visa_status || c.visaStatus || '').toLowerCase();
    const matchesQuery = !query || name.includes(query) || region.includes(query) || capital.includes(query);
    if (!matchesQuery) return false;
    if (visaFilter === 'free' && !visa.includes('free')) return false;
    if (regionFilter !== 'all' && !region.includes(regionFilter)) return false;
    return true;
  });
  console.log('[FILTER] Visible count:', visible.length);
  if (visible.length === 0) {
    renderNoResults();
  } else {
    renderCountries(visible);
  }
  setTxt('count-lbl',`${visible.length} destination${visible.length!==1?'s':''}`);
}

/* ── COUNTRY DETAIL ── */
async function openCountry(code) {
  document.getElementById('home').style.display      = 'none';
  document.getElementById('detail').style.display    = 'block';
  document.getElementById('float-btn').style.display = 'flex';
  window.scrollTo(0,0);
  window.currentCountry = code;
  switchTab('overview');

  setTxt('d-name','Loading');
  ['d-flag','d-reg','d-adv','d-desc'].forEach(id=>setTxt(id,''));
  const ph=`<div class="skel" style="height:80px;"></div>`;
  ['d-tiles','d-th','d-strip','d-places','d-dd','d-legal','d-visa','d-health','d-em'].forEach(id=>setEl(id,ph));

  try {
    const data = await api(EP.COUNTRY_AI(code));
    const c  = data.country   ||{};
    const v  = data.visa      ||{};
    const h  = data.health    ||{};
    const em = data.emergency ||{};
    const d  = data.guidelines||{};
    const ai = data.aiText    || '';
    buildHero(c, code);
    updateChatHeader(c);
    buildOverview(c);
    buildPlaces(c);
    buildRules(d,c);
    buildVisa(v,c);
    buildHealth(h,c);
    buildEmergency(em);
    renderAiSummary(ai, c);
    window._aiCountry = c;
  } catch(err) {
    console.error('[KBYG] Country load error:',err.message);
    toast('Failed to load country data. Please try again.','err');
    setTxt('d-name','Error');
  }
}

/* ── BUILD FUNCTIONS ── */
function buildHero(c, code) {
  const rawImg = c.hero_image||c.heroImg||COUNTRY_IMAGES[code]||COUNTRY_IMAGES.KE;
  const img = safeUrl(rawImg) || COUNTRY_IMAGES.KE;
  const imgEl = document.getElementById('d-img');
  if (imgEl) imgEl.src = img;
  setTxt('d-flag', c.flag||'');
  setTxt('d-name',(c.country_name||c.name||'').toUpperCase());
  setTxt('d-reg', c.region||'');
  const lvl = c.advisory_level||c.advisory||1;
  const adv = document.getElementById('d-adv');
  adv.textContent = advLabel(lvl);
  adv.className   = `d-adv ${advClass(lvl)}`;
}

function tile(ico,lbl,val){
  return `<div class="i-tile"><div class="i-ico">${ico}</div><div class="i-lbl">${lbl}</div><div class="i-val">${val}</div></div>`;
}
function parseTransport(text) {
  if (!text || text === 'N/A') return '<p style="color:#a0a0b0;">No transport data available.</p>';
  const categories = [
    { key: 'International Air', label: 'International Air' },
    { key: 'International:', label: 'International Air' },
    { key: 'Road Transport', label: 'Road Transport' },
    { key: 'Road:', label: 'Road Transport' },
    { key: 'Intercity Buses', label: 'Intercity Buses' },
    { key: 'Intercity:', label: 'Intercity Buses' },
    { key: 'Rideshare / Apps', label: 'Rideshare / Apps' },
    { key: 'Apps:', label: 'Rideshare / Apps' },
    { key: 'Rail', label: 'Rail' },
  ];
  const rows = {};
  const parts = text.split(/(?=International[: ]|Road[: ]|Intercity[: ]|Rideshare|Apps:|Rail[: ])/);
  parts.forEach(part => {
    const match = categories.find(c => part.trim().startsWith(c.key));
    if (match) {
      const val = part.replace(match.key, '').replace(/^[:\s]+/, '').trim();
      if (val) rows[match.label] = val;
    }
  });
  if (!Object.keys(rows).length) return `<p style="font-size:0.95rem;color:var(--txt-sub);line-height:1.7;">${text}</p>`;
  return `<table class="info-table"><tbody>${Object.entries(rows).map(([k,v]) =>
    `<tr><td class="info-table-key">${k}</td><td class="info-table-val">${v}</td></tr>`
  ).join('')}</tbody></table>`;
}

function parseHousing(text) {
  if (!text || text === 'N/A') return '<p style="color:#a0a0b0;">No accommodation data available.</p>';
  const luxMatch = text.match(/Luxury[^:]*:\s*([^.]+(?:\.[^.]+)*?)(?=Mid-range|Budget|Book|$)/i);
  const midMatch = text.match(/Mid-range[^:]*:\s*([^.]+(?:\.[^.]+)*?)(?=Budget|Book|Luxury|$)/i);
  const budMatch = text.match(/Budget[^:]*:\s*([^.]+(?:\.[^.]+)*?)(?=Mid-range|Luxury|Book|$)/i);
  const tipMatch = text.match(/(?:Book[^.]+\.|Airbnb[^.]+\.|Booking\.com[^.]+\.)/gi);
  const rows = [
    luxMatch ? ['Luxury', luxMatch[1].trim()] : null,
    midMatch ? ['Mid-Range', midMatch[1].trim()] : null,
    budMatch ? ['Budget', budMatch[1].trim()] : null,
    tipMatch ? ['Booking Tips', tipMatch.join(' ')] : null,
  ].filter(Boolean);
  if (!rows.length) return `<p style="font-size:0.95rem;color:var(--txt-sub);line-height:1.7;">${text}</p>`;
  return `<table class="info-table"><tbody>${rows.map(([k,v]) =>
    `<tr><td class="info-table-key">${k}</td><td class="info-table-val">${v}</td></tr>`
  ).join('')}</tbody></table>`;
}

function buildOverview(c) {
  setTxt('d-desc', c.description||'');
  setEl('d-tiles',[
    tile(IC.cap,  'Capital',    c.capital||(c.country_name+' Capital')||'—'),
    tile(IC.money,'Currency',   c.currency||'—'),
    tile(IC.lang, 'Language',  (c.language||'—').split(',')[0]),
    tile(IC.pop,  'Population', c.population||'—'),
    tile(IC.plug, 'Power',      c.power_voltage||'—'),
    tile(IC.clock,'Timezone',   c.timezone||'—'),
    tile(IC.tip,  'Tipping',    c.tipping||'—'),
    tile(IC.temp, 'Climate',    c.climate||'—'),
  ].join(''));
  const transport = c.transportation||c.transport||c.transport_info||'N/A';
  const housing   = c.housing||c.housing_info||'N/A';
  setEl('d-th', `
    <div class="th-card"><div class="th-title">Transport</div>${parseTransport(transport)}</div>
    <div class="th-card"><div class="th-title">Accommodation</div>${parseHousing(housing)}</div>
  `);
  const places = c.places||[];
  setEl('d-strip', places.map(p=>
    `<div class="ps-it"><img src="${safeUrl(p.image||p.img||'')}" alt="${escapeHtml(p.name||'')}" loading="lazy"></div>`
  ).join('')||`<p style="color:#a0a0b0;font-size:1rem;">No highlights available.</p>`);
  setEl('d-ai','Loading summary...');
}

function buildPlaces(c) {
  const places = c.places||[];
  setEl('d-places', places.length
    ? places.map(p=>`
        <div class="p-card">
          <img src="${safeUrl(p.image||p.img||'')}" alt="${escapeHtml(p.name||'')}" loading="lazy">
          <div class="p-fade"></div>
          <div class="p-lbl">
            <div class="p-name">${p.name||''}</div>
            <div class="p-desc">${p.description||p.desc||''}</div>
          </div>
        </div>`).join('')
    : `<p style="color:#a0a0b0;font-size:1rem;">No destination data available.</p>`
  );
}

function buildRules(d,c) {
  const dos   = d.dos  ||c.dos  ||[];
  const donts = d.donts||c.donts||[];
  const legal = d.legal_warnings||c.legalWarnings||d.warnings||[];
  setEl('d-dd',`
    <div class="dd-card">
      <div class="dd-head"><div class="dd-ico dd-do">${IC.chk}</div><span class="dd-ttl dt-do">Recommended</span></div>
      ${dos.map(x=>`<div class="r-item"><div class="pip pip-do"></div><span>${x}</span></div>`).join('')
        ||`<p style="color:#a0a0b0;font-size:1rem;">No data available.</p>`}
    </div>
    <div class="dd-card">
      <div class="dd-head"><div class="dd-ico dd-dont">${IC.x}</div><span class="dd-ttl dt-dont">Avoid</span></div>
      ${donts.map(x=>`<div class="r-item"><div class="pip pip-dont"></div><span>${x}</span></div>`).join('')
        ||`<p style="color:#a0a0b0;font-size:1rem;">No data available.</p>`}
    </div>`);
  setEl('d-legal', legal.length
    ? legal.map(w=>`
        <div class="leg-card">
          <div class="leg-ico">${IC.warn}</div>
          <div>
            <div class="leg-title">${w.title||w.warning||''}</div>
            <div class="leg-text">${w.description||w.desc||''}</div>
          </div>
        </div>`).join('')
    : `<p style="color:#a0a0b0;font-size:1rem;">No legal warnings on record.</p>`
  );
}

function buildVisa(v,c) {
  const status  = v.visa_status||c.visa_status||c.visaStatus||'';
  const sl      = status.toLowerCase();
  const isFree  = sl.includes('free');
  const isArr   = sl.includes('arrival');
  const cardCls = isFree?'vs-free':isArr?'vs-arrival':'vs-required';
  const icoCls  = isFree?'vif':isArr?'via':'vir';
  const days    = v.visa_free_days||c.visa_free_days||'';
  const info    = v.visa_info||v.notes||c.visa_info||'Please verify entry requirements with the official embassy or consulate.';
  const cname   = c.country_name||c.name||'this destination';
  setEl('d-visa',`
    <div class="vs-card ${cardCls}">
      <div class="vs-ico ${icoCls}">${IC.pass}</div>
      <div>
        <div class="vs-title">${v.visa_title||c.visa_title||visaLabel(status)}</div>
        <div class="vs-sub">${days?`Up to ${days} days`:'Duration — contact embassy'}</div>
      </div>
    </div>
    <div class="prose">
      ${info}
      <div class="prose-note">Visa regulations change frequently. Always confirm current requirements with the official embassy of ${cname} before booking travel.</div>
    </div>`);
}

function buildHealth(h,c) {
  const req  = h.required_vaccines   ||c.required_vaccines   ||[];
  const rec  = h.recommended_vaccines||c.recommended_vaccines||[];
  const risk = h.health_risks        ||c.health_risks        ||h.active_outbreaks||[];
  const med  = h.medication_rules||'';
  setEl('d-health',`
    <div class="h-sec">
      <div class="h-head"><div class="h-ico hir">${IC.syr}</div><span class="h-ttl ht-r">Required Vaccines</span></div>
      <ul class="vax-list">
        ${req.length
          ? req.map(x=>`<li class="vax-it"><span class="vbg vbr">Required</span>${x}</li>`).join('')
          : `<li class="vax-it" style="color:#a0a0b0;">No required vaccines for this destination.</li>`}
      </ul>
    </div>
    <div class="h-sec">
      <div class="h-head"><div class="h-ico hic">${IC.shld}</div><span class="h-ttl ht-c">Recommended</span></div>
      <ul class="vax-list">
        ${rec.map(x=>`<li class="vax-it"><span class="vbg vbc">Recommended</span>${x}</li>`).join('')
          ||`<li class="vax-it" style="color:#a0a0b0;">No recommendations on record.</li>`}
      </ul>
    </div>
    <div class="h-sec">
      <div class="h-head"><div class="h-ico hirk">${IC.warn}</div><span class="h-ttl" style="color:var(--accent);">Health Risks</span></div>
      <div class="risk-wrap">
        ${risk.map(x=>`<span class="risk-t">${x}</span>`).join('')
          ||`<span style="color:#a0a0b0;font-size:0.95rem;">No active risks on record.</span>`}
      </div>
      ${med?`<p style="margin-top:16px;font-size:0.96rem;color:#6a6a7e;line-height:1.65;">${med}</p>`:''}
    </div>`);
}

function buildEmergency(em) {
  const rows=[
    {lbl:'Police',    key:'police_number',    ico:IC.pol},
    {lbl:'Ambulance', key:'ambulance_number', ico:IC.amb},
    {lbl:'Fire',      key:'fire_number',      ico:IC.fire},
    {lbl:'General',   key:'general_emergency',ico:IC.sos},
  ];
  setEl('d-em', rows.map(r=>{
    const num = em[r.key]||'—';
    return `
      <div class="em-tile" onclick="copyNum('${num}','${r.lbl}')">
        <div class="em-ico">${r.ico}</div>
        <div class="em-lbl">${r.lbl}</div>
        <div class="em-num">${num}</div>
        <div class="em-cpy">Click to copy</div>
      </div>`;
  }).join(''));
}

/* ── TABS ── */
const TAB_ORDER=['overview','places','rules','visa','health','emergency'];
function switchTab(tab){
  document.querySelectorAll('.tab').forEach((b,i)=>b.classList.toggle('on',TAB_ORDER[i]===tab));
  document.querySelectorAll('.panel').forEach(p=>p.classList.remove('on'));
  const panel=document.getElementById(`p-${tab}`);
  if(panel) panel.classList.add('on');
}

/* ── NAVIGATION ── */
function goBack(){
  document.getElementById('detail').style.display   ='none';
  document.getElementById('home').style.display     ='block';
  document.getElementById('float-btn').style.display='none';
  window.scrollTo(0,0);
}

function switchToAdmin(){
  toast('Access denied. Admins only.','err');
}

/* ── UTILITIES ── */
function copyNum(num,lbl){
  if(num==='—') return;
  if (navigator.clipboard && navigator.clipboard.writeText) {
    navigator.clipboard.writeText(num)
      .then(()=>toast(`${lbl} number copied: ${num}`))
      .catch(()=>toast(`${lbl}: ${num}`));
  } else {
    toast(`${lbl}: ${num}`);
  }
} 


async function loadAiSummary(c){
  try {
    const name = c.country_name || c.name || 'this destination';
    const res = await api(EP.AI_QUERY, {
      method: 'POST',
      body: JSON.stringify({ query: `Give a structured travel overview for ${name}: 3 key safety points, 3 health considerations, 3 cultural tips, and 3 must‑see places.` }),
    });
    const textOut = res.aiText || '';
    renderAiSummary(textOut, c);
  } catch (err) {
    setEl('d-ai', `<div class="ai-empty">AI summary unavailable.</div>`);
  }
}


async function requestMoreInfo(){
  try {
    const c = window._aiCountry || {};
    const name = c.country_name || c.name || 'this destination';
    setEl('d-ai', 'Loading more info...');
    const res = await api(EP.AI_QUERY, {
      method: 'POST',
      body: JSON.stringify({ query: `More advanced travel guidance for ${name}: deeper detail on political stability (neutral and factual only), emergency services, and local laws travellers commonly misunderstand.` }),
    });
    const textOut = res.aiText || '';
    renderAiSummary(textOut, c);
  } catch (err) {
    setEl('d-ai', `<div class="ai-empty">AI summary unavailable.</div>`);
  }
}

/* ── NEW FEATURES ── */
let USER_TOKEN = localStorage.getItem('user_token');
let ADMIN_TOKEN = null;
let chatHistory = [];

// Load user info from localStorage on page load
if (USER_TOKEN) {
  const userInfo = localStorage.getItem('user_info');
  if (userInfo) {
    try {
      CURRENT_USER = JSON.parse(userInfo);
    } catch (e) {
      console.error('Failed to parse user info');
    }
  }
}

function openLogin() {
  document.getElementById('login-overlay').classList.add('open');
  document.getElementById('login-form').style.display = 'block';
  document.getElementById('signup-form').style.display = 'none';
  document.getElementById('login-err').style.display = 'none';
  document.getElementById('login-ok').style.display = 'none';
}

function closeLogin(event) {
  if (event.target.id === 'login-overlay') {
    document.getElementById('login-overlay').classList.remove('open');
  }
}

function closeLoginBtn() {
  document.getElementById('login-overlay').classList.remove('open');
}

function switchToSignup() {
  document.getElementById('login-form').style.display = 'none';
  document.getElementById('signup-form').style.display = 'block';
  document.getElementById('login-err').style.display = 'none';
  document.getElementById('login-ok').style.display = 'none';
}

function switchToLogin() {
  document.getElementById('signup-form').style.display = 'none';
  document.getElementById('login-form').style.display = 'block';
  document.getElementById('login-err').style.display = 'none';
  document.getElementById('login-ok').style.display = 'none';
}

async function submitLogin() {
  const email = document.getElementById('login-email').value.trim();
  const password = document.getElementById('login-password').value;
  if (!email || !password) {
    setEl('login-err', 'Please fill all fields.');
    document.getElementById('login-err').style.display = 'block';
    return;
  }
  try {
    const res = await api(EP.SUBSCRIBER_LOGIN, {
      method: 'POST',
      body: JSON.stringify({ email, password }),
    });
    USER_TOKEN = res.token;
    CURRENT_USER = { email, name: res.full_name || email.split('@')[0] };
    localStorage.setItem('user_token', USER_TOKEN);
    localStorage.setItem('user_info', JSON.stringify(CURRENT_USER));
    updateLoginUI();
    document.getElementById('login-overlay').classList.remove('open');
    toast('Login successful!');
    setTimeout(() => location.reload(), 1500);
  } catch (err) {
    setEl('login-err', err.message || 'Login failed.');
    document.getElementById('login-err').style.display = 'block';
  }
}

async function submitSignup() {
  const name = document.getElementById('signup-name').value.trim();
  const email = document.getElementById('signup-email').value.trim();
  const password = document.getElementById('signup-password').value;
  if (!name || !email || !password) {
    setEl('login-err', 'Please fill all fields.');
    document.getElementById('login-err').style.display = 'block';
    return;
  }
  try {
    await api(EP.SUBSCRIBER_SIGNUP, {
      method: 'POST',
      body: JSON.stringify({ full_name: name, email, password }),
    });
    // Auto-login after signup
    const loginRes = await api(EP.SUBSCRIBER_LOGIN, {
      method: 'POST',
      body: JSON.stringify({ email, password }),
    });
    USER_TOKEN = loginRes.token;
    CURRENT_USER = { email, name };
    localStorage.setItem('user_token', USER_TOKEN);
    localStorage.setItem('user_info', JSON.stringify(CURRENT_USER));
    setEl('login-ok', 'Account created and logged in!');
    document.getElementById('login-ok').style.display = 'block';
    updateLoginUI();
    setTimeout(() => {
      document.getElementById('login-overlay').classList.remove('open');
      location.reload();
    }, 1500);
  } catch (err) {
    setEl('login-err', err.message || 'Signup failed.');
    document.getElementById('login-err').style.display = 'block';
  }
}

function openChat() {
  document.getElementById('chat-overlay').classList.add('open');
  document.getElementById('chat-messages').innerHTML = '';
}

function closeChatBtn() {
  const overlay = document.getElementById('chat-overlay');
  if (overlay) overlay.classList.remove('open');
}

function closeChat(event) {
  if (event.target.id === 'chat-overlay') {
    document.getElementById('chat-overlay').classList.remove('open');
  }
}

function openAdminLogin() {
  document.getElementById('admin-login-overlay').style.display = 'flex';
}

function closeAdminLogin(event) {
  if (event.target.id === 'admin-login-overlay') {
    document.getElementById('admin-login-overlay').style.display = 'none';
  }
}

function closeAdminLoginBtn() {
  document.getElementById('admin-login-overlay').style.display = 'none';
}

async function submitAdminLogin() {
  const email = document.getElementById('admin-email').value.trim();
  const password = document.getElementById('admin-password').value;
  if (!email || !password) {
    setEl('admin-login-err', 'Please fill all fields.');
    document.getElementById('admin-login-err').style.display = 'block';
    return;
  }
  try {
    const res = await api(EP.ADMIN_LOGIN, {
      method: 'POST',
      body: JSON.stringify({ email, password }),
    });
    ADMIN_TOKEN = res.token;
    closeAdminLoginBtn();
    loadAdmin();
  } catch (err) {
    setEl('admin-login-err', err.message || 'Login failed.');
    document.getElementById('admin-login-err').style.display = 'block';
  }
}

async function loadAdmin() {
  document.getElementById('home').style.display = 'none';
  document.getElementById('detail').style.display = 'none';
  document.getElementById('admin').style.display = 'block';
  try {
    const res = await api(EP.ADMIN_SUBSCRIBERS, {
      headers: { 'Authorization': `Bearer ${ADMIN_TOKEN}` },
    });
    const subscribers = res.subscribers || [];
    const html = subscribers.map(s => `
      <div style="background: var(--card-bg); padding: 16px; margin-bottom: 12px; border-radius: var(--r);">
        <p><strong>Name:</strong> ${escapeHtml(s.name)}</p>
        <p><strong>Email:</strong> ${escapeHtml(s.email)}</p>
        <p><strong>Status:</strong> ${s.status}</p>
        <p><strong>Created:</strong> ${new Date(s.created_at).toLocaleDateString()}</p>
        <button onclick="deleteSubscriber(${s.id})">Delete</button>
      </div>
    `).join('');
    setEl('subscribers-list', html || '<p>No subscribers.</p>');
  } catch (err) {
    setEl('subscribers-list', '<p>Failed to load subscribers.</p>');
  }
}

async function deleteSubscriber(id) {
  try {
    await api(`/api/v1/admin/subscribers/${id}`, {
      method: 'DELETE',
      headers: { 'Authorization': `Bearer ${ADMIN_TOKEN}` },
    });
    loadAdmin(); // reload list
  } catch (err) {
    alert('Failed to delete subscriber.');
  }
}

function logoutAdmin() {
  ADMIN_TOKEN = null;
  document.getElementById('admin').style.display = 'none';
  document.getElementById('home').style.display = 'block';
}

// Keyboard shortcut for admin access
document.addEventListener('keydown', (e) => {
  if (e.ctrlKey && e.shiftKey && e.key === 'A') {
    e.preventDefault();
    openAdminLogin();
  }
});

function updateLoginUI() {
  const loginBtn = document.getElementById('login-btn');
  const chatBtn = document.getElementById('chat-btn');
  const newsSection = document.getElementById('news-section');
  const userProfile = document.getElementById('user-profile');
  if (USER_TOKEN && CURRENT_USER) {
    loginBtn.style.display = 'none';
    chatBtn.style.display = 'inline-block';
    userProfile.style.display = 'block';
    const initials = (CURRENT_USER.name || 'U').split(' ').map(n => n[0]).join('').toUpperCase();
    document.getElementById('user-initials').textContent = initials.slice(0, 2);
    document.getElementById('user-menu-name').textContent = CURRENT_USER.name || CURRENT_USER.email;
    if (newsSection) newsSection.style.display = 'block';
  } else {
    loginBtn.style.display = 'inline-block';
    loginBtn.textContent = 'Login';
    loginBtn.onclick = openLogin;
    chatBtn.style.display = 'none';
    userProfile.style.display = 'none';
    if (newsSection) newsSection.style.display = 'none';
  }
}

function toggleUserMenu() {
  const menu = document.getElementById('user-menu');
  if (menu) {
    menu.style.display = menu.style.display === 'none' ? 'block' : 'none';
  }
}

// Close menu when clicking outside
document.addEventListener('click', (e) => {
  const userProfile = document.getElementById('user-profile');
  const userMenu = document.getElementById('user-menu');
  if (userProfile && userMenu && !userProfile.contains(e.target)) {
    userMenu.style.display = 'none';
  }
});

function logoutUser() {
  USER_TOKEN = null;
  CURRENT_USER = null;
  localStorage.removeItem('user_token');
  localStorage.removeItem('user_info');
  updateLoginUI();
  toast('Logged out successfully.');
  const userMenu = document.getElementById('user-menu');
  if (userMenu) userMenu.style.display = 'none';
}

async function sendChat() {
  if (!USER_TOKEN) {
    const messagesDiv = document.getElementById('chat-messages');
    messagesDiv.innerHTML += `<div class="chat-message ai-message">
      <div class="chat-avatar"><i class="fa-solid fa-robot"></i></div>
      <div class="chat-bubble">Please log in to use the AI chat feature.</div>
    </div>`;
    messagesDiv.scrollTop = messagesDiv.scrollHeight;
    return;
  }
  const input = document.getElementById('chat-input');
  const message = input.value.trim();
  if (!message) return;
  input.value = '';

  const messagesDiv = document.getElementById('chat-messages');

  // Add user message
  messagesDiv.innerHTML += `<div class="chat-message user-message">
    <div class="chat-avatar"><i class="fa-solid fa-user"></i></div>
    <div class="chat-bubble">${escapeHtml(message)}</div>
  </div>`;
  messagesDiv.scrollTop = messagesDiv.scrollHeight;

  // Add to history
  chatHistory.push({ role: 'user', content: message });

  try {
    // Build history string
    const historyStr = chatHistory.slice(0, -1).map(h => `${h.role === 'user' ? 'User' : 'Assistant'}: ${h.content}`).join('\n');

    const res = await api(EP.CHAT, {
      method: 'POST',
      headers: { 'Authorization': `Bearer ${USER_TOKEN}` },
      body: JSON.stringify({ message, history: historyStr }),
    });

    // Add AI response to history
    chatHistory.push({ role: 'assistant', content: res.response });

    // Add AI response
    messagesDiv.innerHTML += `<div class="chat-message ai-message">
      <div class="chat-avatar"><i class="fa-solid fa-robot"></i></div>
      <div class="chat-bubble">${escapeHtml(res.response).replace(/\n/g, '<br>')}</div>
    </div>`;
    messagesDiv.scrollTop = messagesDiv.scrollHeight;
  } catch (err) {
    messagesDiv.innerHTML += `<div class="chat-message ai-message">
      <div class="chat-avatar"><i class="fa-solid fa-robot"></i></div>
      <div class="chat-bubble">Sorry, I couldn't process your question. Please try again.</div>
    </div>`;
  }
}

function handleChatKey(event) {
  if (event.key === 'Enter') sendChat();
}

function startNewChat() {
  // Clear chat history
  chatHistory = [];
  // Clear messages display
  const messagesDiv = document.getElementById('chat-messages');
  messagesDiv.innerHTML = `<div class="chat-message ai-message">
    <div class="chat-avatar"><i class="fa-solid fa-robot"></i></div>
    <div class="chat-bubble">
      Hello! I'm your travel assistant. Ask me about visas, health requirements, cultural tips, emergency contacts, or anything else about African destinations. What would you like to know?
    </div>
  </div>`;
  // Clear input
  document.getElementById('chat-input').value = '';
  // Scroll to bottom
  messagesDiv.scrollTop = messagesDiv.scrollHeight;
}

function toggleChatHistory() {
  const messagesDiv = document.getElementById('chat-messages');
  messagesDiv.innerHTML += `<div class="chat-message ai-message">
    <div class="chat-avatar"><i class="fa-solid fa-robot"></i></div>
    <div class="chat-bubble">
      Chat history feature is coming soon! For now, you can start a new chat to clear the conversation.
    </div>
  </div>`;
  messagesDiv.scrollTop = messagesDiv.scrollHeight;
}

function toggleChatSidebar() {
  const sidebar = document.getElementById('chat-sidebar');
  if (sidebar) {
    sidebar.classList.toggle('open');
  }
}

function openChat() {
  document.getElementById('chat-overlay').classList.add('open');
}

function closeChatBtn() {
  document.getElementById('chat-overlay').classList.remove('open');
}

function closeChat(e) {
  if (e.target === document.getElementById('chat-overlay')) {
    closeChatBtn();
  }
}

function updateChatHeader(c) {
  const name = c.country_name || c.name || 'this country';
  setTxt('chat-title', `AI Travel Assistant for ${name}`);
  setTxt('chat-subtitle', `Ask me anything about ${name} - visas, health, transport, places to visit, and more!`);
  setTxt('chat-welcome', `Hello! I am your traveler assistant. I can provide information about visas, health requirements, transportation, popular places to visit, and more for ${name}. What would you like to know?`);
}

async function sendCountryChat() {
  const input = document.getElementById('chat-input');
  const message = input.value.trim();
  if (!message) return;
  input.value = '';
  const messagesDiv = document.getElementById('chat-messages');
  messagesDiv.innerHTML += `<div class="chat-message user">
    <div class="chat-avatar"><i class="fa-solid fa-user"></i></div>
    <div class="chat-bubble">${escapeHtml(message)}</div>
  </div>`;
  messagesDiv.scrollTop = messagesDiv.scrollHeight;
  try {
    const query = `${window.currentCountry ? `About ${window.currentCountry}: ` : ''}${message}`;
    const res = await api(EP.AI_QUERY, {
      method: 'POST',
      body: JSON.stringify({ query }),
    });
    const answer = res.answer || res.response || 'No response';
    messagesDiv.innerHTML += `<div class="chat-message ai">
      <div class="chat-avatar"><i class="fa-solid fa-robot"></i></div>
      <div class="chat-bubble">${answer.replace(/\n/g, '<br>')}</div>
    </div>`;
    messagesDiv.scrollTop = messagesDiv.scrollHeight;
  } catch (err) {
    messagesDiv.innerHTML += `<div class="chat-message ai">
      <div class="chat-avatar"><i class="fa-solid fa-robot"></i></div>
      <div class="chat-bubble">Sorry, I couldn't process your question. Please try again.</div>
    </div>`;
  }
}

function handleCountryChatKey(event) {
  if (event.key === 'Enter') sendCountryChat();
}

async function loadNews() {
  try {
    const res = await api(EP.NEWS);
    const news = res.news || [];
    const html = news.map(n => `
      <div class="news-item">
        <h3>${escapeHtml(n.title)}</h3>
        <p>${escapeHtml(n.content)}</p>
        <small>${new Date(n.published_at).toLocaleDateString()}</small>
      </div>
    `).join('');
    setEl('news-list', html || '<p>No news available.</p>');
  } catch (err) {
    setEl('news-list', '<p>Failed to load news.</p>');
  }
}

async function loadAds() {
  try {
    const res = await api(EP.ADS);
    const ads = res.ads || [];
    const html = ads.map(a => `
      <div class="ad-item">
        <div class="ad-img-container">
          <img src="${safeUrl(a.image_url || '')}" alt="${escapeHtml(a.title)}" loading="lazy">
        </div>
        <div class="ad-content">
          <h4>${escapeHtml(a.title)}</h4>
          <p>${escapeHtml(a.description || '')}</p>
          <a href="${safeUrl(a.link_url || '#') || '#'}" class="ad-link" target="_blank" rel="noopener">Learn more</a>
        </div>
      </div>
    `).join('');
    setEl('ads-list', html || '<p style="grid-column: 1/-1; text-align: center; color: var(--txt-muted);">No featured offers at the moment.</p>');
  } catch (err) {
    setEl('ads-list', '<p style="grid-column: 1/-1; text-align: center; color: var(--accent);">Failed to load offers. Please refresh.</p>');
  }
}

/* ── INIT ── */
async function init() {
  setLoader(20, 'Loading destinations...');
  try {
    const res = await api(EP.COUNTRIES);
    ALL = Array.isArray(res) ? res : (res.countries || res.data || []);
    setLoader(60, 'Rendering countries...');
    renderCountries(ALL);
    setLoader(80, 'Loading ads...');
    await loadAds();
    // Only subscribers (logged-in users) see news in the main view
    if (USER_TOKEN) {
      await loadNews();
    } else {
      setEl('news-list', '<p>Please login or subscribe to see travel news.</p>');
    }
    setLoader(100, 'Ready!');
    hideLoader();
    showApp();
    updateLoginUI();
  } catch (err) {
    toast('Failed to load data. Please refresh.', 'err');
    hideLoader();
  }
}

window.onload = init;
