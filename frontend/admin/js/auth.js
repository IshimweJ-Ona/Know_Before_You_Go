async function handleLogin() {
    const email    = document.getElementById('login-email').value.trim();
    const password = document.getElementById('login-password').value;
    const btn      = document.getElementById('login-btn');

    document.getElementById('login-error').style.display = 'none';
    if (!email || !password) { showLoginError('Email and password are required.'); return; }

    btn.textContent = 'Signing in...';
    btn.disabled    = true;

    try {
        const res = await API.login(email, password);
        if (res.user.role !== 'admin') {
            showLoginError('Access denied. Admin accounts only.');
            btn.textContent = 'Sign In';
            btn.disabled    = false;
            return;
        }
        localStorage.setItem('kbyg_admin_token', res.token);
        localStorage.setItem('kbyg_admin_name',  res.user.name);
        document.getElementById('login-screen').style.display = 'none';
        document.getElementById('sidebar-name').textContent   = res.user.name;
        document.getElementById('sidebar-avatar').textContent = res.user.name[0].toUpperCase();
        loadDashboard();
    } catch (e) {
        showLoginError(e.message || 'Login failed.');
        btn.textContent = 'Sign In';
        btn.disabled    = false;
    }
}

function showLoginError(msg) {
    const el     = document.getElementById('login-error');
    el.textContent   = msg;
    el.style.display = 'block';
}

function handleLogout() {
    localStorage.removeItem('kbyg_admin_token');
    localStorage.removeItem('kbyg_admin_name');
    location.reload();
}

(function init() {
    const token = localStorage.getItem('kbyg_admin_token');
    const name  = localStorage.getItem('kbyg_admin_name') || 'Admin';
    if (token) {
        document.getElementById('login-screen').style.display = 'none';
        document.getElementById('sidebar-name').textContent   = name;
        document.getElementById('sidebar-avatar').textContent = name[0].toUpperCase();
        loadDashboard();
    }
})();

document.getElementById('login-password')?.addEventListener('keydown', e => {
    if (e.key === 'Enter') handleLogin();
});
