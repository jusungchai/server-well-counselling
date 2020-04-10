const { db } = require('../config');
const express = require('express');
const router = express.Router();
const multer = require('multer');

const multerMid = multer({
  storage: multer.memoryStorage(),
  limits: {
      fileSize: 5 * 1024 * 1024,
  },
})

router.use(multerMid.single('bio'))

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
    //console.log(results.rows[0])
    if (results.rows[0]) {
      res.json(results.rows[0])
    } else {
      res.json("empty")
    }
  })
})

router.post('/', (req, res) => {
  //console.log(req.body)
  const values = [req.session.userId]
  const queryString = `
  SELECT * FROM profiles WHERE userId = $1
  `;
  db.query(queryString, values, (error, results) => {
    if (error) {
      throw error
    } else {
      console.log(req.file)
      if (req.file)
        console.log("ok")
      else
        console.log("no")
      //console.log(req.body.avatarData.files)
      // if (req.files === null) return res.status(400).json({ msg: 'No file was uploaded' });
      // if (req.files) {
      //   console.log(req.files)
      //   const file = req.files.file;
      //   uploadImage(file).then(x => console.log(x));
      // } else (res.json("hahaha"))






      // const values = [req.body, req.session.userId]
      // console.log("results", results.rows[0])
      // const queryString = results.rows[0] ? `UPDATE profiles SET data = $1 WHERE userId = $2` : `INSERT INTO profiles(userId, data) VALUES ($2, $1)`
      // db.query(queryString, values, (error, results) => {
      //   if (error) {
      //     throw error
      //   } else {
      //     res.json("published")
      //   }
      // })
    }
  })
})

module.exports = router;