'use strict';

const express  = require('express');
const router   = express.Router();
const supabase = require('../config/db');

// GET /api/v1/countries — all countries
router.get('/', async (req, res) => {
  try {
    const { data, error } = await supabase
      .from('countries')
      .select('*')
      .order('country_name', { ascending: true });

    if (error) throw error;
    res.json(data);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

// GET /api/v1/countries/:code — single country by ISO code
router.get('/:code', async (req, res) => {
  try {
    const code = req.params.code.toUpperCase();

    const { data, error } = await supabase
      .from('countries')
      .select('*')
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
