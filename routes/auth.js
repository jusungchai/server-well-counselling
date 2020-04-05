const express = require('express');
const router = express.Router();
let userId;

router.get('/', (req, res) => {
  if (req.session.userId) {
    res.send("in")
  }
  res.send("out")
})

router.post('/login', (req, res) => {
  req.session.userId = 1
  res.send("in")
})

router.post('/logout', (req, res) => {
  req.session.userId = null
  res.send("out")
})

module.exports = router;