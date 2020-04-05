const express = require('express');
const router = express.Router();
let userId;

router.get('/', (req, res) => {
  if (req.session.userId) {
    res.json("in")
  } else {
    res.json("out")
  }  
})

router.post('/login', (req, res) => {
  req.session.userId = 1
  res.json("in")
})

router.post('/logout', (req, res) => {
  req.session.userId = null
  res.json("out")
})

module.exports = router;