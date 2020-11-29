// modules
const express = require("express");
const bodyParser = require("body-parser");
var session = require('express-session')

// routes
var registrationRouter = require('./routes/registration');

const app = express();
var router = express.Router();

app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

//static files
app.use(express.static("public"));

//using routes
app.use('/',registrationRouter)


// To serve cross-domain requests
app.use(function(req, res, next) {
  res.header("Access-Control-Allow-Origin", "*");
  res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
  next();
});

app.set('view engine', 'ejs');

app.listen(3000, function() {
  console.log("Server Started at Port 3000");
})
