const { pool } = require('../config');
const express = require('express');
const router = express.Router();

router.get('/profiles', (req, res) => {
  const queryString = `
  SELECT firstName, lastName, title, avatar FROM users JOIN profiles ON users.id=profiles.userId
  `;  
  pool.query(queryString, (error, results) => {
    if (error) {
      throw error
    } else {
      res.json(results.rows)
    }    
  })
})

module.exports = router;