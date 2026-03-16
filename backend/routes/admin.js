'use strict';

const express      = require('express');
const router       = express.Router();
const supabase     = require('../config/db');
const { requireAuth } = require('../middleware/auth');

// All admin routes require a valid JWT
router.use(requireAuth);

// GET /api/v1/admin/subscribers
router.get('/subscribers', async (req, res) => {
  try {
    const { data, error } = await supabase
      .from('newsletter_subscribers')
      .select('*')
      .order('created_at', { ascending: false });

    if (error) throw error;
    res.json(data);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

// DELETE /api/v1/admin/subscribers/:id
router.delete('/subscribers/:id', async (req, res) => {
  try {
    const { error } = await supabase
      .from('newsletter_subscribers')
      .delete()
      .eq('id', req.params.id);

    if (error) throw error;
    res.json({ message: 'Subscriber removed' });
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

// GET /api/v1/admin/feedback
router.get('/feedback', async (req, res) => {
  try {
    const { data, error } = await supabase
      .from('user_feedback')
      .select('*')
      .order('created_at', { ascending: false });

    if (error) throw error;
    res.json(data);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

// DELETE /api/v1/admin/feedback/:id
router.delete('/feedback/:id', async (req, res) => {
  try {
    const { error } = await supabase
      .from('user_feedback')
      .delete()
      .eq('id', req.params.id);

    if (error) throw error;
    res.json({ message: 'Feedback entry removed' });
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

// GET /api/v1/admin/stats — summary counts for the dashboard
router.get('/stats', async (req, res) => {
  try {
    const [subRes, fbRes, countryRes] = await Promise.all([
      supabase.from('newsletter_subscribers').select('id', { count: 'exact', head: true }),
      supabase.from('user_feedback').select('id', { count: 'exact', head: true }),
      supabase.from('countries').select('id', { count: 'exact', head: true }),
    ]);

    res.json({
      subscribers: subRes.count  || 0,
      feedback:    fbRes.count   || 0,
      countries:   countryRes.count || 0,
    });
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

// PATCH /api/v1/admin/countries/:code â€” update transportation/housing
router.patch('/countries/:code', async (req, res) => {
  try {
    const code = req.params.code.toUpperCase();
    const { transportation, housing } = req.body || {};
    const updates = {};
    if (transportation !== undefined) updates.transportation = transportation;
    if (housing !== undefined) updates.housing = housing;
    if (!Object.keys(updates).length) {
      return res.status(400).json({ error: 'No valid fields provided' });
    }

    const { data, error } = await supabase
      .from('countries')
      .update(updates)
      .eq('country_code', code)
      .select('*')
      .single();

    if (error) throw error;
    if (!data) return res.status(404).json({ error: 'Country not found' });
    res.json(data);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

module.exports = router;
