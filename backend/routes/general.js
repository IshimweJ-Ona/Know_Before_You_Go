'use strict';

const express  = require('express');
const router   = express.Router();
const supabase = require('../config/db');

// GET /api/v1/general/:code
// Returns general travel info: power, tipping, climate, timezone, currency etc.
router.get('/:code', async (req, res) => {
  try {
    const code = req.params.code.toUpperCase();

    const { data, error } = await supabase
      .from('countries')
      .select('country_code, country_name, currency, language, population, power_voltage, timezone, tipping, climate, description')
      .eq('country_code', code)
      .single();

    if (error) throw error;
    if (!data) return res.status(404).json({ error: 'Country not found' });
    res.json(data);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

module.exports = router;
