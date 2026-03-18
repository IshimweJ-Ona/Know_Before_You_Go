'use strict';

const express      = require('express');
const router       = express.Router();
const supabase     = require('../config/db');
const { requireAuth } = require('../middleware/auth');

// GET /api/v1/users — list admin users (protected)
router.get('/', requireAuth, async (req, res) => {
  try {
    const { data, error } = await supabase
      .from('admin_users')
      .select('id, name, email, created_at')
      .order('created_at', { ascending: false });

    if (error) throw error;
    res.json(data);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

// DELETE /api/v1/users/:id — remove an admin user (protected)
router.delete('/:id', requireAuth, async (req, res) => {
  try {
    // Prevent self-deletion
    if (req.params.id === req.user.id) {
      return res.status(400).json({ error: 'You cannot delete your own account' });
    }

    const { error } = await supabase
      .from('admin_users')
      .delete()
      .eq('id', req.params.id);

    if (error) throw error;
    res.json({ message: 'User removed' });
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

module.exports = router;
