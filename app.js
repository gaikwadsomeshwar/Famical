// modules
const express = require("express");
const bodyParser = require("body-parser");
var session = require('express-session')
const ejs = require("ejs");
const path = require("path");
var morgan = require('morgan');
var session = require('express-session');
var cookieParser = require('cookie-parser');

const app = express();
var router = express.Router();
app.set('view engine', 'ejs');

// routes
var loginRouter = require('./routes/login');
var patientRegistrationRouter = require('./routes/patient_registration');
var doctorRegistrationRouter = require('./routes/doctor_registration');
var dashRouter = require('./routes/dashboard');
var professionalDetailsRouter = require('./routes/professional_details');
var medicalDetailsRouter = require('./routes/medical_details');
var logoutRouter = require('./routes/logout');

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
app.use('/',patientRegistrationRouter);
app.use('/',doctorRegistrationRouter);
app.use('/',loginRouter);
app.use('/',dashRouter);
app.use('/',professionalDetailsRouter);
app.use('/',medicalDetailsRouter);
app.use('/',logoutRouter);

// To serve cross-domain requests
app.use(function(req, res, next) {
  res.header("Access-Control-Allow-Origin", "*");
  res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
  next();
});

app.listen(3000, function() {
  console.log("Server Started at Port 3000");
})
