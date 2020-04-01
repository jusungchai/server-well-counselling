require('dotenv').config;
const { db } = require('../config');
const express = require('express');
const router = express.Router();

router.get('/profiles', (req, res) => {
  const queryString = `
  SELECT firstName, lastName, title, avatar FROM users JOIN profiles ON users.id=profiles.userId
  `;  
  db.query(queryString, (error, results) => {
    if (error) {
      throw error
    }
    res.json(results.rows)
  })
})

router.post('/', (req, res) => {
  const values = [req.body];
  console.log(req.body)
  const queryString = `
  INSERT INTO checklists(data)
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
  SELECT * FROM profiles
  `;  
  db.query(queryString, (error, results) => {
    if (error) {
      throw error
    }
    res.json("good")
  })
})

module.exports = router;