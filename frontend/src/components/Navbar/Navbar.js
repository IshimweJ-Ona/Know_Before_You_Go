import React from "react";
import { Link, useLocation } from "react-router-dom";

/**
 * Navbar — top navigation bar
 * - Brand logo/name on the left (links to Home)
 * - "Subscribe to Newsletter" button on the right
 * Uses PascalCase, functional component only — no class components.
 */
function Navbar() {
  const location = useLocation();

  return (
    <nav
      style={{
        background: "var(--navy)",
        borderBottom: "3px solid var(--teal)",
        position: "sticky",
        top: 0,
        zIndex: 100,
        boxShadow: "0 2px 12px rgba(13,27,42,0.25)",
      }}
    >
      <div
        style={{
          maxWidth: 1100,
          margin: "0 auto",
          padding: "0 24px",
          height: 60,
          display: "flex",
          alignItems: "center",
          justifyContent: "space-between",
        }}
      >
        {/* ── Brand ────────────────────────────────── */}
        <Link
          to="/"
          style={{ textDecoration: "none", display: "flex", alignItems: "center", gap: 10 }}
        >
          {/* Teal accent square */}
          <span
            style={{
              width: 28,
              height: 28,
              background: "var(--teal)",
              borderRadius: 4,
              display: "flex",
              alignItems: "center",
              justifyContent: "center",
              flexShrink: 0,
            }}
          >
            <svg width="16" height="16" viewBox="0 0 16 16" fill="none">
              <circle cx="8" cy="8" r="6" stroke="white" strokeWidth="1.8" />
              <path d="M8 4v4l3 2" stroke="white" strokeWidth="1.8" strokeLinecap="round" />
            </svg>
          </span>
          <span
            style={{
              color: "white",
              fontFamily: "Georgia, serif",
              fontSize: 18,
              fontWeight: "normal",
              letterSpacing: "0.01em",
            }}
          >
            Know Before You Go
          </span>
        </Link>

        {/* ── Nav Links ────────────────────────────── */}
        <div style={{ display: "flex", alignItems: "center", gap: 8 }}>
          <Link
            to="/"
            style={{
              color: location.pathname === "/" ? "var(--teal)" : "rgba(255,255,255,0.7)",
              textDecoration: "none",
              fontSize: 14,
              fontWeight: location.pathname === "/" ? 600 : 400,
              padding: "6px 12px",
              borderRadius: 4,
              transition: "color 0.2s",
            }}
          >
            Home
          </Link>
          <Link
            to="/newsletter"
            style={{
              background: "var(--teal)",
              color: "white",
              textDecoration: "none",
              fontSize: 14,
              fontWeight: 600,
              padding: "8px 18px",
              borderRadius: 6,
              transition: "background 0.2s",
              letterSpacing: "0.02em",
            }}
          >
            Subscribe to Newsletter
          </Link>
        </div>
      </div>
    </nav>
  );
}

export default Navbar;