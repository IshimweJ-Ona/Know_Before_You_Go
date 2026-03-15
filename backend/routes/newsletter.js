'use strict';

const express  = require('express');
const router   = express.Router();
const supabase = require('../config/db');

// POST /api/v1/newsletter
router.post('/', async (req, res) => {
  try {
    const { name, email } = req.body;

    if (!email || typeof email !== 'string') {
      return res.status(400).json({ error: 'A valid email address is required' });
    }

    const normalised = email.toLowerCase().trim();
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailRegex.test(normalised)) {
      return res.status(400).json({ error: 'Invalid email address format' });
    }

    // Check for duplicate
    const { data: existing } = await supabase
      .from('newsletter_subscribers')
      .select('id')
      .eq('email', normalised)
      .single();

    if (existing) {
      return res.status(409).json({ error: 'This email is already subscribed' });
    }

    const { data, error } = await supabase
      .from('newsletter_subscribers')
      .insert([{ name: name?.trim() || null, email: normalised }])
      .select()
      .single();

    if (error) throw error;

    res.status(201).json({ message: 'Successfully subscribed', subscriber: data });
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

module.exports = router;
