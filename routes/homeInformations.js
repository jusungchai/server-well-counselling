const { db } = require('../config');
const express = require('express');
const router = express.Router();

router.post('/', (req, res) => {
  const values = [req.body];
  const queryString = `
  INSERT INTO homeInformations(data)
  VALUES($1)
  `;  
  db.query(queryString, values, (error, results) => {
    if (error) {
      throw error
    }
    res.json("good")
  })
})

router.get('/', (req, res) => {  
  const queryString = `
  SELECT data FROM homeInformations
  `;  
  db.query(queryString, (error, results) => {
    if (error) {
      throw error
    }
    res.json(results.rows)
  })
})

module.exports = router;