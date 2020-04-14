const { db } = require('../config');
const express = require('express');
const router = express.Router();
const multer = require('multer');
const { Storage } = require('@google-cloud/storage');
const path = require('path');

const multerMid = multer({
  storage: multer.memoryStorage(),
  limits: {
    fileSize: 5 * 1024 * 1024,
  },
})

router.use(multerMid.single('bio'))

const storage = new Storage({
  keyFilename: path.join(__dirname, '../gcp-demo-268618-7d36d1163a07.json'),
  projectId: 'gcp-demo-268618'
});

const bucket = storage.bucket('jay-files');

const uploadImage = (file, userId) => new Promise((resolve, reject) => {
  if (!file) {
    resolve(null)
  }
  const fileName = file.mimetype === 'image/jpeg' ? `${userId}.jpg` : `${userId}.png`
  const blob = bucket.file("profileImage/" + fileName)

  const blobStream = blob.createWriteStream({
    metadata: {
      contentType: file.mimetype,
    },
    resumable: false
  })
  blobStream.on('finish', () => {
    const publicUrl = `https://storage.cloud.google.com/${bucket.name}/${blob.name}`

    resolve(publicUrl)
  })
    .on('error', () => {
      reject(`Unable to upload image, something went wrong`)
    })
    .end(file.buffer)
})


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
  const values = [req.session.userId]
  const queryString = `
  SELECT * FROM profiles WHERE userId = $1
  `;
  db.query(queryString, values, (error, results) => {
    if (error) {
      throw error
    } else {
      uploadImage(req.file, req.session.userId)
        .then(url => {
          console.log(results.rows)
          const avatarURL = url ? url : results.rows[0].data.avatarURL
          const bio = [...req.body.bio]
          console.log(bio)
          const profileData = {
            info: bio[0],
            jobTitle: bio[1],
            specialField: bio[2],
            certificate: bio[3],
            experience: bio[4],
            degree: bio[5],
            blog: bio[6],
            avatarURL
          }

          const values = [profileData, req.session.userId]
          console.log(values)
          const queryString = results.rows[0] ? `UPDATE profiles SET data = $1 WHERE userId = $2` : `INSERT INTO profiles(userId, data) VALUES ($2, $1)`

          db.query(queryString, values, (error, results) => {
            if (error) {
              //console.log(error)
              res.json("error")
            } else {
              res.json("published")
            }
          })
        })
        .catch(() => res.json(error))
    }
  })
})

module.exports = router;