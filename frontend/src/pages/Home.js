import React, { useState, useEffect } from "react";
import { useNavigate } from "react-router-dom";
import { getCountries } from "../utils/api";

/**
 * Home — landing page
 * Fetches all countries on load → populates dropdown.
 * User selects country → navigates to /country/:code
 */
function Home() {
  const [countries, setCountries]     = useState([]);
  const [selected, setSelected]       = useState("");
  const [loading, setLoading]         = useState(true);
  const [error, setError]             = useState(null);
  const navigate                      = useNavigate();

  // ── Fetch countries on mount ─────────────────────────
  useEffect(() => {
    getCountries()
      .then((res) => setCountries(res.data))
      .catch(() => setError("Could not load countries. Please try again."))
      .finally(() => setLoading(false));
  }, []);

  // ── Handlers ─────────────────────────────────────────
  const handleGo = () => {
    if (selected) navigate(`/country/${selected}`);
  };

  const handleKeyDown = (e) => {
    if (e.key === "Enter") handleGo();
  };

  // ── Render ────────────────────────────────────────────
  return (
    <div style={{ minHeight: "calc(100vh - 63px)", background: "var(--sand)" }}>

      {/* ── Hero ─────────────────────────────────────── */}
      <div
        style={{
          background: "linear-gradient(135deg, var(--navy-dark) 0%, var(--navy) 60%, var(--navy-light) 100%)",
          padding: "72px 24px 80px",
          textAlign: "center",
          position: "relative",
          overflow: "hidden",
        }}
      >
        {/* Decorative teal bar */}
        <div style={{ position:"absolute", top:0, left:0, right:0, height:4, background:"var(--teal)" }} />

        {/* Subtle map pattern overlay */}
        <div style={{
          position:"absolute", inset:0, opacity:0.04,
          backgroundImage:`url("data:image/svg+xml,%3Csvg width='60' height='60' viewBox='0 0 60 60' xmlns='http://www.w3.org/2000/svg'%3E%3Cg fill='none' fill-rule='evenodd'%3E%3Cg fill='%23ffffff' fill-opacity='1'%3E%3Cpath d='M36 34v-4h-2v4h-4v2h4v4h2v-4h4v-2h-4zm0-30V0h-2v4h-4v2h4v4h2V6h4V4h-4zM6 34v-4H4v4H0v2h4v4h2v-4h4v-2H6zM6 4V0H4v4H0v2h4v4h2V6h4V4H6z'/%3E%3C/g%3E%3C/g%3E%3C/svg%3E")`,
        }} />

        <div className="fade-up" style={{ position:"relative", zIndex:1 }}>
          <p style={{ color:"var(--teal)", fontWeight:700, fontSize:13, letterSpacing:"0.12em", textTransform:"uppercase", marginBottom:16 }}>
            A Digital Hub for African Travelers
          </p>
          <h1
            style={{
              fontFamily: "Georgia, serif",
              color: "white",
              fontSize: "clamp(36px, 6vw, 60px)",
              fontWeight: "normal",
              lineHeight: 1.15,
              marginBottom: 20,
            }}
          >
            Know Before<br />
            <span style={{ color:"var(--teal)" }}>You Go</span>
          </h1>
          <p style={{ color:"rgba(255,255,255,0.65)", fontSize:17, maxWidth:520, margin:"0 auto 40px", lineHeight:1.6 }}>
            Select any African country to instantly see visa requirements, health documentation, cultural dos and don'ts, entry requirements, and emergency contacts — all on one page.
          </p>

          {/* ── Country Selector Card ─────────────── */}
          <div
            className="fade-up delay-2"
            style={{
              background: "white",
              borderRadius: 12,
              padding: "32px 36px",
              maxWidth: 520,
              margin: "0 auto",
              boxShadow: "0 8px 32px rgba(13,27,42,0.3)",
            }}
          >
            <label
              htmlFor="country-select"
              style={{ display:"block", fontWeight:700, color:"var(--navy)", marginBottom:10, fontSize:14, textAlign:"left", textTransform:"uppercase", letterSpacing:"0.06em" }}
            >
              Select Destination Country
            </label>

            {loading ? (
              <div style={{ display:"flex", justifyContent:"center", padding:"16px 0" }}>
                <div className="spinner" />
              </div>
            ) : error ? (
              <p style={{ color:"#C0392B", fontSize:14, padding:"12px 0" }}>{error}</p>
            ) : (
              <>
                <select
                  id="country-select"
                  value={selected}
                  onChange={(e) => setSelected(e.target.value)}
                  onKeyDown={handleKeyDown}
                  className="form-input country-select"
                  style={{ marginBottom:16 }}
                  aria-label="Select a country"
                >
                  <option value="" disabled>— Choose a country —</option>
                  {countries.map((c) => (
                    <option key={c.country_code} value={c.country_code}>
                      {c.name}
                    </option>
                  ))}
                </select>

                <button
                  className="btn-primary"
                  onClick={handleGo}
                  disabled={!selected}
                  style={{ width:"100%", fontSize:16, padding:"14px" }}
                  aria-label={`View travel information for selected country`}
                >
                  View Travel Information →
                </button>
              </>
            )}
          </div>
        </div>
      </div>

      {/* ── 5 Sections Preview ───────────────────────── */}
      <div style={{ maxWidth:1100, margin:"0 auto", padding:"60px 24px" }}>
        <h2 className="fade-up" style={{ fontFamily:"Georgia, serif", color:"var(--navy)", fontSize:28, textAlign:"center", marginBottom:8 }}>
          Everything You Need, In One Place
        </h2>
        <p className="fade-up delay-1" style={{ color:"var(--grey)", textAlign:"center", marginBottom:40, fontSize:15 }}>
          No login required. No payment. Just select a country and go.
        </p>

        <div style={{ display:"grid", gridTemplateColumns:"repeat(auto-fit, minmax(200px, 1fr))", gap:16 }}>
          {[
            { icon:"🛂", title:"Visa Requirements",       desc:"Type, cost, processing time, required documents" },
            { icon:"💉", title:"Health Documentation",    desc:"Mandatory and recommended vaccinations by country" },
            { icon:"🤝", title:"Dos and Don'ts",          desc:"Cultural norms, etiquette, and local laws to know" },
            { icon:"📋", title:"General Entry",           desc:"Passport validity, proof of funds, return tickets" },
            { icon:"🆘", title:"Emergency Contacts",      desc:"Embassy details, emergency numbers, consular help" },
          ].map((item, i) => (
            <div
              key={item.title}
              className={`section-card fade-up delay-${i + 2}`}
              style={{ padding:"24px 20px", textAlign:"center" }}
            >
              <div style={{ fontSize:32, marginBottom:12 }}>{item.icon}</div>
              <h3 style={{ color:"var(--navy)", fontWeight:700, fontSize:15, marginBottom:8 }}>{item.title}</h3>
              <p style={{ color:"var(--grey)", fontSize:13, lineHeight:1.5 }}>{item.desc}</p>
            </div>
          ))}
        </div>

        {/* Countries strip */}
        <div className="fade-up" style={{ marginTop:52, background:"var(--navy)", borderRadius:10, padding:"20px 28px", display:"flex", alignItems:"center", gap:16, flexWrap:"wrap" }}>
          <span style={{ color:"var(--teal)", fontWeight:700, fontSize:13, textTransform:"uppercase", letterSpacing:"0.08em", flexShrink:0 }}>10 Countries:</span>
          {["Rwanda","Kenya","Tanzania","Uganda","Nigeria","Ghana","South Africa","Morocco","Ethiopia","Senegal"].map((c) => (
            <span key={c} style={{ color:"rgba(255,255,255,0.75)", fontSize:13 }}>{c}</span>
          ))}
        </div>
      </div>
    </div>
  );
}

export default Home;