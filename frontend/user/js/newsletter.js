const isValidEmail = email => /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email.trim());

function clearErrors() {
    ['err-name', 'err-email', 'err-server'].forEach(id => {
        document.getElementById(id).style.display = 'none';
    });
    document.getElementById('input-name').classList.remove('error');
    document.getElementById('input-email').classList.remove('error');
}

function showFieldError(fieldId, errId, msg) {
    const el     = document.getElementById(errId);
    el.textContent   = msg;
    el.style.display = 'block';
    document.getElementById(fieldId).classList.add('error');
}

function showState(id) {
    ['state-form', 'state-success', 'state-duplicate'].forEach(s => {
        document.getElementById(s).style.display = s === id ? 'block' : 'none';
    });
}

async function handleSubmit() {
    clearErrors();
    const name  = document.getElementById('input-name').value;
    const email = document.getElementById('input-email').value;
    let valid   = true;

    if (!name.trim())          { showFieldError('input-name',  'err-name',  'Name is required.'); valid = false; }
    if (!email.trim())         { showFieldError('input-email', 'err-email', 'Email is required.'); valid = false; }
    else if (!isValidEmail(email)) { showFieldError('input-email', 'err-email', 'Please enter a valid email.'); valid = false; }
    if (!valid) return;

    const btn       = document.getElementById('submit-btn');
    btn.disabled    = true;
    btn.textContent = 'Subscribing...';

    try {
        await API.subscribeNewsletter(name.trim(), email.trim());
        document.getElementById('success-name').textContent = name.trim();
        showState('state-success');
    } catch (err) {
        if (err.status === 409) {
            document.getElementById('duplicate-email').textContent = email.trim();
            showState('state-duplicate');
        } else {
            document.getElementById('err-server').style.display = 'block';
            btn.disabled    = false;
            btn.textContent = 'Subscribe';
        }
    }
}

function resetForm() {
    document.getElementById('input-name').value  = '';
    document.getElementById('input-email').value = '';
    const btn       = document.getElementById('submit-btn');
    btn.disabled    = false;
    btn.textContent = 'Subscribe';
    clearErrors();
    showState('state-form');
}

document.getElementById('input-email').addEventListener('keydown', e => {
    if (e.key === 'Enter') handleSubmit();
});
