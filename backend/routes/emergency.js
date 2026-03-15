'use strict';

const express  = require('express');
const router   = express.Router();
const supabase = require('../config/db');

// GET /api/v1/emergency/:code
router.get('/:code', async (req, res) => {
  try {
    const code = req.params.code.toUpperCase();

    const { data, error } = await supabase
      .from('emergency_contacts')
      .select('*')
      .eq('country_code', code)
      .single();

    if (error) throw error;
    if (!data) return res.status(404).json({ error: 'Emergency contacts not found' });
    res.json(data);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

module.exports = router;
