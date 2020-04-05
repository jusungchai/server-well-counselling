require('dotenv').config()
const cors = require('cors');
const express = require('express');
const router = express.Router();
const nodemailer = require('nodemailer');

const transporter = nodemailer.createTransport({
  service: 'gmail',
  auth: {
    user: process.env.EMAIL,
    pass: process.env.PASSWORD
  }
});

router.post('/', cors(), (req, res) => {
  console.log(req.body)
  const mailOptions = {
    to: process.env.ADMIN,
    subject: `Inquiry from ${req.body.name}: ${req.body.title}`,
    text: req.body.body,
    replyTo: req.body.email
  };

  transporter.sendMail(mailOptions, function (error, info) {
    if (error) {
      throw error;
    }
    console.log(info)
    info.accepted[0] ? res.send("sent") : res.send("failed")
  });
})

module.exports = router;