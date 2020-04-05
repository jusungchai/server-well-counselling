const express = require('express');
const path = require('path');
const app = express();
const bodyParser = require('body-parser');
const cors = require('cors');
const cookieSession = require('cookie-session');
const server = require("http").Server(app);
const users = require('./routes/users');
const checklists = require('./routes/checklists');
const homeInformations = require('./routes/homeInformations');
const contact = require('./routes/contact');


// Serve the static files from the React app
app.use(express.static(path.join(__dirname, 'client/build')));

app.use(function (req, res, next) {
    res.header('Access-Control-Allow-Credentials', true);
    res.header('Access-Control-Allow-Origin', req.headers.origin);
    res.header('Access-Control-Allow-Methods', 'GET,PUT,POST,DELETE,UPDATE,OPTIONS');
    res.header('Access-Control-Allow-Headers', 'X-Requested-With, X-HTTP-Method-Override, Content-Type, Accept');
    next();
});
app.use(cors())
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

// An api endpoint that returns a short list of items
app.get('/api/getList', (req, res) => {
    var list = ["item1", "item2", "item3"];
    res.json(list);
    console.log('Sent list of items');
});

app.use('/users', users);
app.use('/checklists', checklists);
app.use('/homeInformations', homeInformations);
app.use('/contact', contact);

// // Handles any requests that don't match the ones above
// app.get('*', (req, res) => {
//     res.sendFile(path.join(__dirname + '/client/build/index.html'));
// });

// Start server
const port = process.env.PORT || 8001;
server.listen(port);

console.log('App is listening on port ' + port);