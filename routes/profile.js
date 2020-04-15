require('dotenv').config()
const { db } = require('../config');
const express = require('express');
const router = express.Router();
const multer = require('multer');
const { Storage } = require('@google-cloud/storage');
const path = require('path');

const credentials = process.env.type ? {
  type: process.env.type,
  project_id: process.env.project_id,
  private_key_id: process.env.private_key_id,
  client_email: process.env.client_email,
  private_key: process.env.private_key.replace(/\\n/g, '\n'),
  client_id: process.env.client_id,
  auth_uri: process.env.auth_uri,
  token_uri: process.env.token_uri,
  auth_provider_x509_cert_url: process.env.auth_provider_x509_cert_url,
  client_x509_cert_url: process.env.client_x509_cert_url,
} : null
// console.log(credentials)

const multerMid = multer({
  storage: multer.memoryStorage(),
  limits: {
    fileSize: 5 * 1024 * 1024,
  },
})

router.use(multerMid.single('bio'))

const storage = credentials ? 
new Storage({
  projectId: process.env.projectId,
  credentials
})
: 
new Storage({
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
          console.log(results.rows.length)
          const avatarURL = url ? url : results.rows.length ? results.rows[0].data.avatarURL : "https://storage.cloud.google.com/jay-files/profileImage/defaultProfile.png"
          const bio = [...req.body.bio]
          console.log(bio)
          const profileData = {
            info: bio[1],
            jobTitle: bio[2],
            specialField: bio[3],
            certificate: bio[4],
            experience: bio[5],
            degree: bio[6],
            blog: bio[7],
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