import React from "react";
import { BrowserRouter, Routes, Route, Navigate } from "react-router-dom";
import Navbar from "./components/Navbar/Navbar";
import Home from "./pages/Home";
import CountryInfo from "./pages/CountryInfo";
import Newsletter from "./pages/Newsletter";
import "./index.css";

/**
 * App — root component
 * Routes:
 *   /                → Home (country selector)
 *   /country/:code   → CountryInfo (all 5 sections)
 *   /newsletter      → Newsletter (signup form)
 *   *                → redirect to /
 */
function App() {
  return (
    <BrowserRouter>
      <Navbar />
      <Routes>
        <Route path="/"                element={<Home />} />
        <Route path="/country/:code"   element={<CountryInfo />} />
        <Route path="/newsletter"      element={<Newsletter />} />
        <Route path="*"                element={<Navigate to="/" replace />} />
      </Routes>
    </BrowserRouter>
  );
}

export default App;