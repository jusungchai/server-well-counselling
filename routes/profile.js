const { db } = require('../config');
const express = require('express');
const router = express.Router();

router.get('/', (req, res) => {
  const values = [req.session.userId]
  const queryString = `
  SELECT data FROM profiles
  WHERE userId = $1
  `;
  db.query(queryString, values, (error, results) => {
    if (error) {
      throw error
    }
    console.log(results.rows[0])
    if (results.rows[0]) {
      res.json(results.rows[0])
    } else {
      res.json("empty")
    }
  })
})

router.post('/', (req, res) => {
  console.log(req.body)
  const values = [req.session.userId]
  const queryString = `
  SELECT * FROM profiles WHERE userId = $1
  `;
  db.query(queryString, values, (error, results) => {
    if (error) {
      throw error
    } else {
      const values = [req.body, req.session.userId]
      console.log("results", results.rows[0])  
      const queryString = results.rows[0] ? `UPDATE profiles SET data = $1 WHERE userId = $2` : `INSERT INTO profiles(userId, data) VALUES ($2, $1)`
      db.query(queryString, values, (error, results) => {
        if (error) {
          throw error
        } else {
          res.json("published")
        }
      })
    }
  })
})

module.exports = router;