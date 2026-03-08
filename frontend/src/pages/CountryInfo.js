import React, { useState, useEffect } from "react";
import { useParams, useNavigate } from "react-router-dom";
import { getCountryData } from "../utils/api";

/**
 * CountryInfo — displays all 5 travel information sections for a country.
 * Uses Promise.all to fetch all 5 endpoints in parallel — no section renders
 * until ALL data has resolved. This eliminates partial render race conditions.
 */
function CountryInfo() {
  const { code }                    = useParams();
  const navigate                    = useNavigate();
  const [data, setData]             = useState(null);
  const [loading, setLoading]       = useState(true);
  const [error, setError]           = useState(null);

  // ── Fetch all sections in parallel ──────────────────
  useEffect(() => {
    if (!code) return;
    setLoading(true);
    setError(null);
    setData(null);

    getCountryData(code)
      .then(setData)
      .catch((err) => {
        if (err.response?.status === 404) {
          setError(`No information found for country code "${code}".`);
        } else {
          setError("Failed to load travel information. Please try again.");
        }
      })
      .finally(() => setLoading(false));
  }, [code]);

  // ── Loading state ────────────────────────────────────
  if (loading) {
    return (
      <div style={{ minHeight:"calc(100vh - 63px)", display:"flex", flexDirection:"column", alignItems:"center", justifyContent:"center", gap:16 }}>
        <div className="spinner" style={{ width:48, height:48 }} />
        <p style={{ color:"var(--grey)", fontSize:15 }}>Loading travel information…</p>
      </div>
    );
  }

  // ── Error state ──────────────────────────────────────
  if (error) {
    return (
      <div style={{ minHeight:"calc(100vh - 63px)", display:"flex", flexDirection:"column", alignItems:"center", justifyContent:"center", gap:16, padding:24 }}>
        <div style={{ fontSize:48 }}>⚠️</div>
        <p style={{ color:"#C0392B", fontWeight:600, fontSize:17 }}>{error}</p>
        <button className="btn-primary" onClick={() => navigate("/")}>← Back to Home</button>
      </div>
    );
  }

  const countryName = data?.visa?.[0]?.country_name || code;

  // ── Render ────────────────────────────────────────────
  return (
    <div style={{ background:"var(--sand)", minHeight:"calc(100vh - 63px)", paddingBottom:60 }}>

      {/* ── Country Header ───────────────────────────── */}
      <div style={{
        background:"linear-gradient(135deg, var(--navy-dark) 0%, var(--navy) 100%)",
        padding:"36px 24px 40px",
        borderBottom:"3px solid var(--teal)",
      }}>
        <div style={{ maxWidth:900, margin:"0 auto" }}>
          <button
            onClick={() => navigate("/")}
            style={{ background:"none", border:"none", color:"rgba(255,255,255,0.6)", cursor:"pointer", fontSize:14, marginBottom:16, padding:0, display:"flex", alignItems:"center", gap:6 }}
          >
            ← Back to Country Selector
          </button>
          <div className="fade-up" style={{ display:"flex", alignItems:"center", gap:16 }}>
            <div style={{
              width:56, height:56, borderRadius:10,
              background:"var(--teal)", display:"flex", alignItems:"center", justifyContent:"center",
              fontSize:28, flexShrink:0,
            }}>
              🌍
            </div>
            <div>
              <p style={{ color:"var(--teal)", fontSize:12, fontWeight:700, textTransform:"uppercase", letterSpacing:"0.1em", marginBottom:4 }}>Travel Information</p>
              <h1 style={{ fontFamily:"Georgia, serif", color:"white", fontSize:"clamp(24px,4vw,38px)", fontWeight:"normal" }}>
                {countryName}
              </h1>
            </div>
          </div>

          {/* Section nav pills */}
          <div className="fade-up delay-2" style={{ display:"flex", gap:8, marginTop:24, flexWrap:"wrap" }}>
            {["Visa","Health","Dos & Don'ts","Entry","Emergency"].map((lbl, i) => (
              <a
                key={lbl}
                href={`#section-${i}`}
                style={{
                  background:"rgba(255,255,255,0.10)", color:"rgba(255,255,255,0.85)",
                  padding:"6px 14px", borderRadius:20, fontSize:13, textDecoration:"none",
                  transition:"background 0.2s",
                  border:"1px solid rgba(255,255,255,0.15)",
                }}
              >
                {lbl}
              </a>
            ))}
          </div>
        </div>
      </div>

      {/* ── 5 Sections ───────────────────────────────── */}
      <div style={{ maxWidth:900, margin:"0 auto", padding:"32px 24px", display:"flex", flexDirection:"column", gap:24 }}>

        {/* 1 — Visa Requirements */}
        <div id="section-0" className="section-card fade-up">
          <div className="section-card-header">
            <span className="accent-dot" />
            <span style={{ fontFamily:"Georgia, serif", fontSize:18 }}>1. Visa Requirements</span>
          </div>
          <div className="section-card-body">
            {data.visa.length === 0 ? (
              <p style={{ color:"var(--grey)", fontStyle:"italic" }}>No visa information available.</p>
            ) : data.visa.map((v, i) => (
              <div key={i} className="info-row">
                <span className="label">Visa Type</span>
                <div>
                  <strong>{v.visa_type}</strong>
                  {v.duration_days && <span style={{ color:"var(--grey)", fontSize:13, marginLeft:10 }}>· Valid for {v.duration_days} days</span>}
                  {v.cost_usd != null && <span style={{ color:"var(--grey)", fontSize:13, marginLeft:10 }}>· ${v.cost_usd} USD</span>}
                </div>
              </div>
            ))}
          </div>
        </div>

        {/* 2 — Health Documentation */}
        <div id="section-1" className="section-card fade-up delay-1">
          <div className="section-card-header">
            <span className="accent-dot" />
            <span style={{ fontFamily:"Georgia, serif", fontSize:18 }}>2. Health Documentation</span>
          </div>
          <div className="section-card-body">
            {data.health.length === 0 ? (
              <p style={{ color:"var(--grey)", fontStyle:"italic" }}>No health requirements on record.</p>
            ) : data.health.map((h, i) => (
              <div key={i} className="info-row">
                <span className="label">{h.requirement_name}</span>
                <span className={`badge ${h.is_mandatory ? "badge-mandatory" : "badge-recommended"}`}>
                  {h.is_mandatory ? "Mandatory" : "Recommended"}
                </span>
              </div>
            ))}
          </div>
        </div>

        {/* 3 — Dos and Don'ts */}
        <div id="section-2" className="section-card fade-up delay-2">
          <div className="section-card-header">
            <span className="accent-dot" />
            <span style={{ fontFamily:"Georgia, serif", fontSize:18 }}>3. Dos and Don'ts</span>
          </div>
          <div className="section-card-body">
            {data.dosDonts.length === 0 ? (
              <p style={{ color:"var(--grey)", fontStyle:"italic" }}>No dos and don'ts recorded.</p>
            ) : (
              <div style={{ display:"grid", gridTemplateColumns:"1fr 1fr", gap:20 }}>
                <div>
                  <h4 style={{ color:"var(--teal-dark)", fontWeight:700, marginBottom:10, fontSize:13, textTransform:"uppercase", letterSpacing:"0.06em" }}>✓ Dos</h4>
                  {data.dosDonts.filter(d => d.type === "do").map((d, i) => (
                    <div key={i} className="info-row" style={{ gap:8 }}>
                      <span className="badge badge-do" style={{ flexShrink:0 }}>Do</span>
                      <span style={{ fontSize:14 }}>{d.description}</span>
                    </div>
                  ))}
                </div>
                <div>
                  <h4 style={{ color:"#C0392B", fontWeight:700, marginBottom:10, fontSize:13, textTransform:"uppercase", letterSpacing:"0.06em" }}>✗ Don'ts</h4>
                  {data.dosDonts.filter(d => d.type === "dont").map((d, i) => (
                    <div key={i} className="info-row" style={{ gap:8 }}>
                      <span className="badge badge-dont" style={{ flexShrink:0 }}>Don't</span>
                      <span style={{ fontSize:14 }}>{d.description}</span>
                    </div>
                  ))}
                </div>
              </div>
            )}
          </div>
        </div>

        {/* 4 — General Entry Requirements */}
        <div id="section-3" className="section-card fade-up delay-3">
          <div className="section-card-header">
            <span className="accent-dot" />
            <span style={{ fontFamily:"Georgia, serif", fontSize:18 }}>4. General Entry Requirements</span>
          </div>
          <div className="section-card-body">
            {data.general.length === 0 ? (
              <p style={{ color:"var(--grey)", fontStyle:"italic" }}>No entry requirements listed.</p>
            ) : data.general.map((g, i) => (
              <div key={i} className="info-row">
                <span className="label">{g.title}</span>
                <div>
                  <span style={{ fontSize:14 }}>{g.description}</span>
                  {g.is_mandatory && (
                    <span className="badge badge-mandatory" style={{ marginLeft:10 }}>Required</span>
                  )}
                </div>
              </div>
            ))}
          </div>
        </div>

        {/* 5 — Emergency Contacts */}
        <div id="section-4" className="section-card fade-up delay-4">
          <div className="section-card-header">
            <span className="accent-dot" />
            <span style={{ fontFamily:"Georgia, serif", fontSize:18 }}>5. Emergency Contacts</span>
          </div>
          <div className="section-card-body">
            {data.emergency.length === 0 ? (
              <p style={{ color:"var(--grey)", fontStyle:"italic" }}>No emergency contacts recorded.</p>
            ) : data.emergency.map((e, i) => (
              <div key={i} style={{ padding:"14px 0", borderBottom:"1px solid var(--lgrey)" }}>
                <p style={{ fontWeight:700, color:"var(--navy)", marginBottom:6 }}>{e.embassy_name}</p>
                <div style={{ display:"flex", gap:24, flexWrap:"wrap" }}>
                  {e.phone && <span style={{ fontSize:13, color:"var(--grey)" }}>📞 {e.phone}</span>}
                  {e.email && <span style={{ fontSize:13, color:"var(--grey)" }}>✉️ {e.email}</span>}
                  {e.address && <span style={{ fontSize:13, color:"var(--grey)" }}>📍 {e.address}</span>}
                </div>
              </div>
            ))}
          </div>
        </div>

        {/* Back button */}
        <div style={{ textAlign:"center", marginTop:8 }}>
          <button className="btn-primary" onClick={() => navigate("/")}>
            ← Search Another Country
          </button>
        </div>
      </div>
    </div>
  );
}

export default CountryInfo;