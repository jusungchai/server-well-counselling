const { db } = require('../config');
const express = require('express');
const router = express.Router();

router.get('/profiles', (req, res) => {
  const queryString = `
  SELECT profiles.userId, firstName, lastName, profiles.data -> 'avatarURL' as avatarURL FROM users JOIN profiles ON users.id=profiles.userId
  `;
  db.query(queryString, (error, results) => {
    if (error) {
      throw error
    }
    res.json(results.rows)
  })
})

router.get('/profile', (req, res) => {
  const values = [req.query.id]
  const queryString = `
  SELECT profiles.userId, firstName, lastName, profiles.data FROM users JOIN profiles ON users.id=profiles.userId
  WHERE profiles.userId = $1
  `;
  db.query(queryString, values, (error, results) => {
    if (error) {
      throw error
    }
    res.json(results.rows)
  })
})

module.exports = router;