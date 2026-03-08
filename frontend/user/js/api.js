const API_BASE = 'http://localhost:5000';

const API = {

    async getCountries() {
        const res = await fetch(`${API_BASE}/api/countries`);
        if (!res.ok) throw { status: res.status };
        return res.json();
    },

    async getCountryData(code) {
        const [visa, health, dosDonts, general, emergency] = await Promise.all([
            fetch(`${API_BASE}/api/visa?country=${code}`),
            fetch(`${API_BASE}/api/health?country=${code}`),
            fetch(`${API_BASE}/api/dos-donts?country=${code}`),
            fetch(`${API_BASE}/api/general?country=${code}`),
            fetch(`${API_BASE}/api/emergency?country=${code}`),
        ]);
        for (const r of [visa, health, dosDonts, general, emergency]) {
            if (!r.ok) throw { status: r.status };
        }
        const [visaData, healthData, dosDontsData, generalData, emergencyData] = await Promise.all([
            visa.json(), health.json(), dosDonts.json(), general.json(), emergency.json(),
        ]);
        return { visa: visaData, health: healthData, dosDonts: dosDontsData, general: generalData, emergency: emergencyData };
    },

    async subscribeNewsletter(name, email) {
        const res = await fetch(`${API_BASE}/api/newsletter/subscribe`, {
            method:  'POST',
            headers: { 'Content-Type': 'application/json' },
            body:    JSON.stringify({ name, email }),
        });
        if (!res.ok) throw { status: res.status };
        return res.json();
    },
};
