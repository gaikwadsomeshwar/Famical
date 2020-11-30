const express = require("express");
const bodyParser = require("body-parser");
var session = require('express-session')
const path = require("path");
var morgan = require('morgan');
var session = require('express-session');
var cookieParser = require('cookie-parser');
var db=require('../database');
var jwt = require('jsonwebtoken');
var bcrypt = require('bcryptjs');
var router = express.Router();



router.get('/dashboard', function(req, res, next) {
    if(req.session.loggedinUser){
        db.query("SELECT * from personal_details where userid = ?", [req.session.userid], async function(error,results){
            //res.render('dashboard',{id:req.session.userid});
            res.send(results[0]);
        });
    }else{
        res.redirect('/login');
    }
});



module.exports = router;