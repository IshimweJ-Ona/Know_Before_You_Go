'use strict';

const express  = require('express');
const router   = express.Router();
const supabase = require('../config/db');

// GET /api/v1/visa/:code
router.get('/:code', async (req, res) => {
  try {
    const code = req.params.code.toUpperCase();

    const { data, error } = await supabase
      .from('visa_requirements')
      .select('*')
      .eq('dest_country', code)
      .single();

    if (error) throw error;
    if (!data) return res.status(404).json({ error: 'Visa data not found' });
    res.json(data);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

module.exports = router;
