import React, { useState } from "react";
import { subscribeNewsletter } from "../utils/api";

/**
 * Newsletter — signup page
 * Fields: name (required) + email (required, validated)
 * States handled:
 *   - idle       → form shown
 *   - submitting → button disabled + spinner
 *   - success    → success message shown
 *   - duplicate  → "already subscribed" message (409)
 *   - error      → generic error message
 */

// Basic email validation regex
const isValidEmail = (email) => /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email.trim());

function Newsletter() {
  const [name, setName]       = useState("");
  const [email, setEmail]     = useState("");
  const [status, setStatus]   = useState("idle"); // idle | submitting | success | duplicate | error
  const [errors, setErrors]   = useState({});

  // ── Client-side validation ───────────────────────────
  const validate = () => {
    const errs = {};
    if (!name.trim())           errs.name  = "Name is required.";
    if (!email.trim())          errs.email = "Email address is required.";
    else if (!isValidEmail(email)) errs.email = "Please enter a valid email address.";
    return errs;
  };

  // ── Submit handler ───────────────────────────────────
  const handleSubmit = async () => {
    const errs = validate();
    if (Object.keys(errs).length > 0) { setErrors(errs); return; }

    setErrors({});
    setStatus("submitting");

    try {
      await subscribeNewsletter(name.trim(), email.trim());
      setStatus("success");
    } catch (err) {
      if (err.response?.status === 409) {
        setStatus("duplicate");
      } else {
        setStatus("error");
      }
    }
  };

  const handleReset = () => {
    setName(""); setEmail(""); setStatus("idle"); setErrors({});
  };

  // ── Success state ────────────────────────────────────
  if (status === "success") {
    return (
      <PageShell>
        <div className="fade-up" style={{ textAlign:"center", padding:"48px 24px" }}>
          <div style={{ fontSize:56, marginBottom:20 }}>✅</div>
          <h2 style={{ fontFamily:"Georgia, serif", color:"var(--navy)", fontSize:28, marginBottom:12 }}>You're subscribed!</h2>
          <p style={{ color:"var(--grey)", fontSize:16, marginBottom:32, maxWidth:400, margin:"0 auto 32px" }}>
            Thanks, <strong>{name}</strong>! We'll keep you updated on new country information and travel tips.
          </p>
          <button className="btn-primary" onClick={handleReset}>Subscribe Another Email</button>
        </div>
      </PageShell>
    );
  }

  // ── Already subscribed state ─────────────────────────
  if (status === "duplicate") {
    return (
      <PageShell>
        <div className="fade-up" style={{ textAlign:"center", padding:"48px 24px" }}>
          <div style={{ fontSize:56, marginBottom:20 }}>💌</div>
          <h2 style={{ fontFamily:"Georgia, serif", color:"var(--navy)", fontSize:28, marginBottom:12 }}>Already subscribed!</h2>
          <p style={{ color:"var(--grey)", fontSize:16, marginBottom:32, maxWidth:400, margin:"0 auto 32px" }}>
            <strong>{email}</strong> is already on our newsletter list. No duplicate entries — you're all good.
          </p>
          <button className="btn-primary" onClick={handleReset}>Try a Different Email</button>
        </div>
      </PageShell>
    );
  }

  // ── Form (idle / submitting / error) ─────────────────
  return (
    <PageShell>
      <div style={{ maxWidth:480, margin:"0 auto" }}>
        <div className="fade-up" style={{ marginBottom:32, textAlign:"center" }}>
          <h1 style={{ fontFamily:"Georgia, serif", color:"var(--navy)", fontSize:"clamp(26px,4vw,36px)", marginBottom:10 }}>
            Stay Informed
          </h1>
          <p style={{ color:"var(--grey)", fontSize:15, lineHeight:1.6 }}>
            Get updates when we add new countries or when travel requirements change. We only collect your name and email — nothing else.
          </p>
        </div>

        <div className="section-card fade-up delay-1" style={{ padding:"32px" }}>

          {/* Name field */}
          <div style={{ marginBottom:20 }}>
            <label
              htmlFor="newsletter-name"
              style={{ display:"block", fontWeight:700, color:"var(--navy)", marginBottom:8, fontSize:13, textTransform:"uppercase", letterSpacing:"0.06em" }}
            >
              Full Name
            </label>
            <input
              id="newsletter-name"
              type="text"
              value={name}
              onChange={(e) => { setName(e.target.value); setErrors(p => ({...p, name: undefined})); }}
              placeholder="e.g. Amara Diallo"
              className={`form-input ${errors.name ? "error" : ""}`}
              disabled={status === "submitting"}
              aria-describedby={errors.name ? "name-error" : undefined}
            />
            {errors.name && (
              <p id="name-error" style={{ color:"#C0392B", fontSize:13, marginTop:6 }}>{errors.name}</p>
            )}
          </div>

          {/* Email field */}
          <div style={{ marginBottom:28 }}>
            <label
              htmlFor="newsletter-email"
              style={{ display:"block", fontWeight:700, color:"var(--navy)", marginBottom:8, fontSize:13, textTransform:"uppercase", letterSpacing:"0.06em" }}
            >
              Email Address
            </label>
            <input
              id="newsletter-email"
              type="email"
              value={email}
              onChange={(e) => { setEmail(e.target.value); setErrors(p => ({...p, email: undefined})); }}
              placeholder="e.g. amara@example.com"
              className={`form-input ${errors.email ? "error" : ""}`}
              disabled={status === "submitting"}
              onKeyDown={(e) => e.key === "Enter" && handleSubmit()}
              aria-describedby={errors.email ? "email-error" : undefined}
            />
            {errors.email && (
              <p id="email-error" style={{ color:"#C0392B", fontSize:13, marginTop:6 }}>{errors.email}</p>
            )}
          </div>

          {/* Submit */}
          <button
            className="btn-primary"
            onClick={handleSubmit}
            disabled={status === "submitting"}
            style={{ width:"100%", fontSize:16, padding:"14px", display:"flex", alignItems:"center", justifyContent:"center", gap:10 }}
          >
            {status === "submitting" ? (
              <>
                <div className="spinner" style={{ width:18, height:18, borderWidth:2 }} />
                Subscribing…
              </>
            ) : "Subscribe →"}
          </button>

          {/* Generic error */}
          {status === "error" && (
            <p style={{ color:"#C0392B", fontSize:13, marginTop:14, textAlign:"center" }}>
              Something went wrong. Please try again in a moment.
            </p>
          )}

          {/* Privacy note */}
          <p style={{ color:"var(--grey)", fontSize:12, marginTop:20, textAlign:"center", lineHeight:1.5 }}>
            🔒 We collect only your name and email. No personal travel data stored. Unsubscribe anytime.
          </p>
        </div>
      </div>
    </PageShell>
  );
}

// ── Layout wrapper ─────────────────────────────────────────
function PageShell({ children }) {
  return (
    <div style={{
      background: "var(--sand)",
      minHeight: "calc(100vh - 63px)",
      padding: "56px 24px",
    }}>
      {children}
    </div>
  );
}

export default Newsletter;