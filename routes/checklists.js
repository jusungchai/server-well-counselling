const { pool } = require('../config');
const express = require('express');
const router = express.Router();

router.post('/', (req, res) => {
  const values = [req.body];
  const queryString = `
  INSERT INTO checklists(data)
  VALUES($1)
  `;  
  pool.query(queryString, values, (error, results) => {
    if (error) {
      throw error
    }
    res.json("good")
  })
})

router.get('/', (req, res) => {  
  const queryString = `
  SELECT data FROM checklists
  `;  
  pool.query(queryString, (error, results) => {
    if (error) {
      throw error
    }
    res.json(results.rows)
  })
})

module.exports = router;