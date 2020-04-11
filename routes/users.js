const { db } = require('../config');
const express = require('express');
const router = express.Router();

router.get('/profiles', (req, res) => {
  const queryString = `
  SELECT users.id, firstName, lastName FROM users JOIN profiles ON users.id=profiles.userId
  `;
  db.query(queryString, (error, results) => {
    if (error) {
      throw error
    }
    res.json(results.rows)
  })
})

module.exports = router;