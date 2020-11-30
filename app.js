const express = require("express");
const bodyParser = require("body-parser");
const path = require("path");
const app = express();
var router = express.Router();
const publicdir = path.join(__dirname, './public');

app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

app.use(express.static(publicdir));

// To serve cross-domain requests
app.use(function(req, res, next) {
  res.header("Access-Control-Allow-Origin", "*");
  res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
  next();
});

app.set('view engine', 'ejs');

app.get("/index", function(req,res){
  res.render("index");
});

app.get("/doctorReg", function(req,res){
  res.render("doctorReg");
});

app.get("/patientReg", function(req,res){
  res.render("patientReg");
});

app.get("/user-list", function(req,res){
  res.render("user-list");
});


app.listen(3000, function() {
  console.log("Server Started at Port 3000");
})
