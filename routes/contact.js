const express = require('express');
const router = express.Router();
const nodemailer = require('nodemailer');

const transporter = nodemailer.createTransport({
  service: 'gmail',
  auth: {
    user: 'btiqa0@gmail.com',
    pass: 'avrfvkyztrndonsy'
  }
});

router.post('/', (req, res) => {
  const mailOptions = {
    from: 'btiqa0@gmail.com',
    to: 'chunsaa@gmail.com',
    subject: 'Sending Email using Node.js',
    text: 'That was easy!'
  };

  transporter.sendMail(mailOptions, function (error, info) {
    if (error) {
      throw error;
    }
    console.log(info)
    res.send("sent")
  });
})

module.exports = router;