// modules
const express = require("express");
const bodyParser = require("body-parser");
var session = require('express-session')
const path = require("path");
var morgan = require('morgan');
var session = require('express-session');
var cookieParser = require('cookie-parser');

// routes
var loginRouter = require('./routes/login');
var patientRegistrationRouter = require('./routes/patient_registration');
var doctorRegistrationRouter = require('./routes/doctor_registration');
var index = require('./routes/login');
const app = express();
var router = express.Router();
const publicdir = path.join(__dirname, './public');

app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
app.use(cookieParser());

app.use(session({
  secret: '123456cat',
  resave: false,
  saveUninitialized: true,
  cookie: { maxAge: 60000 }
}));

//static files
app.use(express.static("public"));

//using routes
app.use('/', loginRouter);
app.use('/',patientRegistrationRouter);
app.use('/',doctorRegistrationRouter);
app.use('/',index);


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
