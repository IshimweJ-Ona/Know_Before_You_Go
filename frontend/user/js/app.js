/**
 * app.js — KBYG User Frontend
 * Requires: config.js, api.js
 */
'use strict';

let ALL = [];

/* ── Unique fallback hero images per country code ── */
const COUNTRY_IMAGES = {
  RW: 'https://images.unsplash.com/photo-1601925260368-ae2f83cf8b7f?w=800&q=80', // Rwanda gorillas/hills
  KE: 'https://images.unsplash.com/photo-1547471080-7cc2caa01a7e?w=800&q=80', // Kenya savannah
  TZ: 'https://images.unsplash.com/photo-1516426122078-c23e76319801?w=800&q=80', // Tanzania Serengeti
  UG: 'https://images.unsplash.com/photo-1580060839134-75a5edca2e99?w=800&q=80', // Uganda landscape
  NG: 'https://images.unsplash.com/photo-1569060762641-f3dc8b86f8e1?w=800&q=80', // Nigeria Lagos
  GH: 'https://images.unsplash.com/photo-1614859324967-b4e51c9d9c80?w=800&q=80', // Ghana coast
  ZA: 'https://images.unsplash.com/photo-1580060839134-75a5edca2e99?w=800&q=80', // South Africa Cape Town
  MA: 'https://images.unsplash.com/photo-1548704606-571c77043fa3?w=800&q=80', // Morocco Marrakech
  ET: 'https://images.unsplash.com/photo-1589553416260-f586c8f1514f?w=800&q=80', // Ethiopia mountains
  SN: 'https://images.unsplash.com/photo-1559494007-9f5847c49d94?w=800&q=80', // Senegal coast
};

/* ── SVG ICONS ── */
const IC = {
  cap:   `<svg viewBox="0 0 24 24"><path d="M3 21h18M9 21V9l3-6 3 6v12M3 21V9l9-6 9 6v12"/></svg>`,
  money: `<svg viewBox="0 0 24 24"><circle cx="12" cy="12" r="9"/><path d="M14.8 9A2 2 0 0 0 13 8h-2a2 2 0 0 0 0 4h2a2 2 0 0 1 0 4h-2a2 2 0 0 1-1.8-1M12 7v1m0 8v1"/></svg>`,
  lang:  `<svg viewBox="0 0 24 24"><path d="M21 15a2 2 0 0 1-2 2H7l-4 4V5a2 2 0 0 1 2-2h14a2 2 0 0 1 2 2z"/></svg>`,
  pop:   `<svg viewBox="0 0 24 24"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"/><circle cx="9" cy="7" r="4"/><path d="M23 21v-2a4 4 0 0 0-3-3.87M16 3.13a4 4 0 0 1 0 7.75"/></svg>`,
  plug:  `<svg viewBox="0 0 24 24"><path d="M7 2v7m10-7v7M5 9h14l-1.5 9H6.5L5 9z"/></svg>`,
  clock: `<svg viewBox="0 0 24 24"><circle cx="12" cy="12" r="9"/><polyline points="12 7 12 12 15.5 14"/></svg>`,
  tip:   `<svg viewBox="0 0 24 24"><circle cx="12" cy="12" r="9"/><path d="M9.09 9a3 3 0 0 1 5.83 1c0 2-3 3-3 3M12 17h.01"/></svg>`,
  temp:  `<svg viewBox="0 0 24 24"><path d="M14 14.76V3.5a2.5 2.5 0 0 0-5 0v11.26a4.5 4.5 0 1 0 5 0z"/></svg>`,
  pass:  `<svg viewBox="0 0 24 24"><rect x="3" y="2" width="18" height="20" rx="2"/><circle cx="12" cy="10" r="3"/><path d="M7 20h10M9 14h6"/></svg>`,
  chk:   `<svg viewBox="0 0 24 24"><polyline points="20 6 9 17 4 12"/></svg>`,
  x:     `<svg viewBox="0 0 24 24"><line x1="18" y1="6" x2="6" y2="18"/><line x1="6" y1="6" x2="18" y2="18"/></svg>`,
  warn:  `<svg viewBox="0 0 24 24"><path d="M10.29 3.86L1.82 18a2 2 0 0 0 1.71 3h16.94a2 2 0 0 0 1.71-3L13.71 3.86a2 2 0 0 0-3.42 0z"/><line x1="12" y1="9" x2="12" y2="13"/><line x1="12" y1="17" x2="12.01" y2="17"/></svg>`,
  syr:   `<svg viewBox="0 0 24 24"><path d="m18 2 4 4M7.5 11.5 11 8l5 5-3.5 3.5M7 13l-5 5 2 2 5-5M3 21l2-2M10 4l4 4-6 6-4-4z"/></svg>`,
  shld:  `<svg viewBox="0 0 24 24"><path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"/></svg>`,
  pol:   `<svg viewBox="0 0 24 24"><rect x="2" y="7" width="20" height="14" rx="2"/><path d="M16 21V5a2 2 0 0 0-2-2h-4a2 2 0 0 0-2 2v16"/></svg>`,
  amb:   `<svg viewBox="0 0 24 24"><rect x="1" y="8" width="22" height="13" rx="2"/><path d="M16 8V4H8v4M12 12v6m-3-3h6"/></svg>`,
  fire:  `<svg viewBox="0 0 24 24"><path d="M8.5 14.5A2.5 2.5 0 0 0 11 17c0 1.5-1 2-1 3s1 2 2 2 2-1 2-2-1-1.5-1-3a2.5 2.5 0 0 0 2.5-2.5c0-3-5-8-5-8s-2 3-2 5.5z"/></svg>`,
  sos:   `<svg viewBox="0 0 24 24"><circle cx="12" cy="12" r="9"/><line x1="12" y1="8" x2="12" y2="12"/><line x1="12" y1="16" x2="12.01" y2="16"/></svg>`,
};

/* ── DOM HELPERS ── */
function setEl(id, html)  { const e = document.getElementById(id); if (e) e.innerHTML  = html; }
function setTxt(id, text) { const e = document.getElementById(id); if (e) e.textContent = text; }
function setLoader(pct, text) {
  document.getElementById('ld-bar').style.width = `${pct}%`;
  document.getElementById('ld-txt').textContent  = text;
}
function hideLoader() {
  const el = document.getElementById('loader');
  el.style.opacity = '0';
  setTimeout(() => { el.style.display = 'none'; }, 440);
}
function showApp() { document.getElementById('app').style.display = 'block'; }

function toast(msg, type = 'ok') {
  const el = document.getElementById('toast');
  el.textContent = msg;
  el.className   = `show ${type}`;
  clearTimeout(el._t);
  el._t = setTimeout(() => { el.className = ''; }, 3400);
}

/* ── BOOT ── */
window.addEventListener('DOMContentLoaded', async () => {
  setLoader(20, 'Connecting to server');
  try {
    setLoader(50, 'Loading destinations');
    const res = await api(EP.COUNTRIES);
    ALL = Array.isArray(res) ? res : (res.countries || res.data || []);
    setLoader(100, 'Ready');
    setTimeout(() => {
      hideLoader(); showApp();
      renderSkeletons(10);
      setTimeout(() => {
        renderCountries(ALL);
        setTxt('count-lbl', `${ALL.length} destination${ALL.length !== 1 ? 's' : ''}`);
      }, 120);
    }, 280);
  } catch (err) {
    console.error('[KBYG] Boot error:', err.message);
    setLoader(100, 'Error loading');
    setTimeout(() => {
      hideLoader(); showApp(); renderError();
      setTxt('count-lbl', 'Unavailable');
    }, 600);
  }
});

/* ── NEWSLETTER ── */
function openNL()    { document.getElementById('nl-overlay').classList.add('open'); }
function closeNLBtn(){ document.getElementById('nl-overlay').classList.remove('open'); }
function closeNL(e)  { if (e.target === document.getElementById('nl-overlay')) closeNLBtn(); }

async function submitNewsletter() {
  const name  = document.getElementById('nl-name').value.trim();
  const email = document.getElementById('nl-email').value.trim();
  const errEl = document.getElementById('nl-modal-err');
  errEl.style.display = 'none';
  if (!email) { errEl.textContent = 'Please enter your email address.'; errEl.style.display = 'block'; return; }
  if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) { errEl.textContent = 'Please enter a valid email address.'; errEl.style.display = 'block'; return; }
  const btn = document.getElementById('nl-btn');
  btn.disabled = true; btn.classList.add('loading'); btn.textContent = 'Subscribing';
  try {
    await api(EP.NEWSLETTER, { method: 'POST', body: JSON.stringify({ name, email }) });
    document.getElementById('nl-modal-form').style.display = 'none';
    document.getElementById('nl-modal-ok').style.display   = 'block';
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
function renderCountries(list) {
  if (!list||!list.length){ renderError(); return; }
  setEl('grid', list.map((c,i)=>{
    const code = c.country_code||c.code||'';
    const name = c.country_name||c.name||'';
    // Use unique image per country — prefer DB value, fall back to country-specific default
    const img  = c.hero_image||c.heroImg||COUNTRY_IMAGES[code]||COUNTRY_IMAGES.KE;
    const lvl  = c.advisory_level||c.advisory||1;
    const vs   = c.visa_status||c.visaStatus||'';
    const hlvl = c.cdc_notice_level||0;
    const lang = (c.language||'').split(',')[0];
    return `
      <div class="c-card" onclick="openCountry('${code}')" style="animation-delay:${i*0.06}s">
        <div class="c-img">
          <img src="${img}" alt="${name}" loading="lazy"
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
  }).join(''));
}
function filterCountries(q) {
  const lq = q.toLowerCase();
  const visible = ALL.filter(c=>
    (c.country_name||c.name||'').toLowerCase().includes(lq)||
    (c.region||'').toLowerCase().includes(lq)||
    (c.capital||'').toLowerCase().includes(lq)
  );
  renderCountries(visible);
  setTxt('count-lbl',`${visible.length} destination${visible.length!==1?'s':''}`);
}

/* ── COUNTRY DETAIL ── */
async function openCountry(code) {
  document.getElementById('home').style.display      = 'none';
  document.getElementById('detail').style.display    = 'block';
  document.getElementById('float-btn').style.display = 'flex';
  window.scrollTo(0,0);
  switchTab('overview');

  setTxt('d-name','Loading');
  ['d-flag','d-reg','d-adv','d-desc'].forEach(id=>setTxt(id,''));
  const ph=`<div class="skel" style="height:80px;"></div>`;
  ['d-tiles','d-strip','d-places','d-dd','d-legal','d-visa','d-health','d-em'].forEach(id=>setEl(id,ph));

  try {
    const [country, visa, health, emergency, dd] = await Promise.all([
      api(EP.COUNTRY(code)),
      api(EP.VISA(code)).catch(()=>({})),
      api(EP.HEALTH(code)).catch(()=>({})),
      api(EP.EMERGENCY(code)).catch(()=>({})),
      api(EP.DOS_DONTS(code)).catch(()=>({})),
    ]);
    const c  = country.country   ||country.data   ||country;
    const v  = visa.visa         ||visa.data       ||visa    ||{};
    const h  = health.health     ||health.data     ||health  ||{};
    const em = emergency.emergency||emergency.data ||emergency||{};
    const d  = dd.guidelines     ||dd.data         ||dd      ||{};
    buildHero(c, code);
    buildOverview(c);
    buildPlaces(c);
    buildRules(d,c);
    buildVisa(v,c);
    buildHealth(h,c);
    buildEmergency(em);
  } catch(err) {
    console.error('[KBYG] Country load error:',err.message);
    toast('Failed to load country data. Please try again.','err');
    setTxt('d-name','Error');
  }
}

/* ── BUILD FUNCTIONS ── */
function buildHero(c, code) {
  const img = c.hero_image||c.heroImg||COUNTRY_IMAGES[code]||COUNTRY_IMAGES.KE;
  document.getElementById('d-img').src = img;
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
  const places = c.places||[];
  setEl('d-strip', places.map(p=>
    `<div class="ps-it"><img src="${p.image||p.img||''}" alt="${p.name||''}" loading="lazy"></div>`
  ).join('')||`<p style="color:#a0a0b0;font-size:1rem;">No highlights available.</p>`);
}

function buildPlaces(c) {
  const places = c.places||[];
  setEl('d-places', places.length
    ? places.map(p=>`
        <div class="p-card">
          <img src="${p.image||p.img||''}" alt="${p.name||''}" loading="lazy">
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

/* ── UTILITIES ── */
function copyNum(num,lbl){
  if(num==='—') return;
  navigator.clipboard.writeText(num)
    .then(()=>toast(`${lbl} number copied: ${num}`))
    .catch(()=>toast(`${lbl}: ${num}`));
} 