'use strict';

const express  = require('express');
const router   = express.Router();
const supabase = require('../config/db');

// POST /api/v1/feedback — submit user feedback
router.post('/', async (req, res) => {
  try {
    const { name, email, country_code, message } = req.body;

    if (!message || typeof message !== 'string' || !message.trim()) {
      return res.status(400).json({ error: 'A feedback message is required' });
    }

    const { data, error } = await supabase
      .from('user_feedback')
      .insert([{
        name:         name?.trim()         || null,
        email:        email?.trim()        || null,
        country_code: country_code?.toUpperCase() || null,
        message:      message.trim(),
      }])
      .select()
      .single();

    if (error) throw error;
    res.status(201).json({ message: 'Feedback submitted', feedback: data });
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

module.exports = router;
