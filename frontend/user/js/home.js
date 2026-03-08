async function loadCountries() {
    try {
        const countries = await API.getCountries();
        const select    = document.getElementById('country-select');

        countries.forEach(c => {
            const opt       = document.createElement('option');
            opt.value       = c.country_code;
            opt.textContent = c.name;
            select.appendChild(opt);
        });

        document.getElementById('loading-indicator').style.display = 'none';
        document.getElementById('selector-body').style.display     = 'block';

        select.addEventListener('change', () => {
            document.getElementById('go-btn').disabled = !select.value;
        });

    } catch {
        document.getElementById('loading-indicator').style.display = 'none';
        document.getElementById('load-error').style.display        = 'block';
    }
}

function goToCountry() {
    const code = document.getElementById('country-select').value;
    if (code) window.location.href = `country.html?code=${code}`;
}

document.getElementById('country-select')?.addEventListener('keydown', e => {
    if (e.key === 'Enter') goToCountry();
});

loadCountries();
