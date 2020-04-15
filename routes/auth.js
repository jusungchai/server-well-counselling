require('dotenv').config();
const express = require('express');
const router = express.Router();
const { db } = require('../config');
const bcrypt = require('bcrypt');

router.get('/', (req, res) => {
  if (req.session.userId) {
    res.json("in")
  } else {
    res.json("out")
  }
})

router.post('/login', (req, res) => {
  const values = [req.body.email.toLowerCase()];
  const queryString = `
  SELECT * FROM users
  WHERE email = $1
  `;
  db.query(queryString, values, (error, results) => {
    if (error) {
      throw error
    }
    if (results.rows.length) {
      bcrypt.compare(req.body.password, results.rows[0].password)
        .then(result => {
          console.log(result)
          if (result) {
            req.session.userId = results.rows[0].id
            res.json("logged in")
          }
          else res.json("wrong pw")
        })
    }
    else res.json("user not found")
  })
})

router.post('/register', (req, res) => {
  if (req.body.registrationKey === process.env.REGISTRATION_KEY) {
    const values = [req.body.email];
    const queryString = `
    SELECT * FROM users
    WHERE email = $1
    `;
    db.query(queryString, values, (error, results) => {
      if (error) {
        throw error
      }
      if (results.rows.length) {
        res.json("email already registered")
      }
      else bcrypt.hash(req.body.password, 10)
        .then(hash => {
          const values = [req.body.firstName.toUpperCase(), req.body.lastName.toUpperCase(), hash, req.body.email.toLowerCase(), req.body.phone];
          const queryString = `
        INSERT INTO users(firstName, lastName, password, email, phone)
        VALUES ($1, $2, $3, $4, $5)
        `;
          db.query(queryString, values, (error, results) => {
            if (error) {
              throw error
            }
            res.json("user created")
          })
        })
    })
  }
  else {
    res.json("Invalid Registration Key")
  }
})

router.post('/logout', (req, res) => {
  req.session.userId = undefined
  res.json("logged out")
})

module.exports = router;