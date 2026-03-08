const PAGE_TITLES = {
    dashboard:   ['Dashboard',     'Overview'],
    countries:   ['Manage',        'Countries'],
    visa:        ['Visa',          'Requirements'],
    health:      ['Health',        'Requirements'],
    dosdont:     ['Dos and',       "Don'ts"],
    general:     ['General Entry', 'Requirements'],
    emergency:   ['Emergency',     'Contacts'],
    feedback:    ['User',          'Feedback'],
    subscribers: ['Newsletter',    'Subscribers'],
    users:       ['Registered',    'Users'],
};

const PAGE_LOADERS = {
    dashboard:   () => loadDashboard(),
    countries:   () => loadCountries(),
    visa:        () => loadVisa(),
    health:      () => loadHealth(),
    dosdont:     () => loadDosDonts(),
    general:     () => loadGeneral(),
    emergency:   () => loadEmergency(),
    feedback:    () => loadFeedback(),
    subscribers: () => loadSubscribers(),
    users:       () => loadUsers(),
};

function showPage(name, navEl) {
    document.querySelectorAll('.page').forEach(p => p.classList.remove('active'));
    document.querySelectorAll('.nav-item').forEach(n => n.classList.remove('active'));
    const page = document.getElementById(`page-${name}`);
    if (page) page.classList.add('active');
    if (navEl) navEl.classList.add('active');
    const [t, s] = PAGE_TITLES[name] || [name, ''];
    document.getElementById('topbar-title').innerHTML = `${t} <span>${s}</span>`;
    if (PAGE_LOADERS[name]) PAGE_LOADERS[name]();
}

function getCurrentPage() {
    const active = document.querySelector('.page.active');
    return active ? active.id.replace('page-', '') : 'dashboard';
}
