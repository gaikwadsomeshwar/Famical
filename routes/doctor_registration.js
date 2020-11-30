// moudules
var express = require('express');
var router = express.Router();
var db = require('../database');
var bcrypt = require('bcryptjs');
var jwt = require('jsonwebtoken');

var msg = "";

// to display registration form
router.get('/register_doctor', function(req, res, next) {
  res.render('doctorReg', {alertMsg: msg} );
 // msg = "";
});

// to store user input detail on post request
router.post('/register_doctor', function(req, res, next) {

  personal_details = {
    userid: req.body.userid,
    fname: req.body.fname,
    lname: req.body.lname,
    phno: req.body.phno,
    email: req.body.email,
    dob: req.body.dob,
    stno: req.body.stno,
    stname: req.body.stname,
    city: req.body.city,
    state: req.body.state,
    zipcode: req.body.zipcode,
    gender: req.body.gender
  }

  user_details = {
    userid: req.body.userid,
    password: req.body.password,
    type: "doctor"
  }

  professional_details = {
    userid: req.body.userid,
    docid: req.body.docid,
    qualification: req.body.qualification,
    hospital: req.body.hospital,
    department: req.body.department
  }

  // check password
  if (user_details.password != req.body.confirm_password) {
    msg = "Password & Confirm Password is not Matched";
  }

  else {
    // check unique user
    var userCheck = 'SELECT * FROM users WHERE userid =?';
    db.query(userCheck, [user_details.userid], function(err, data, fields) {
      if (err) throw err
<<<<<<< HEAD
      if (data.length > 0) {
        msg = personal_details.email + " already exists";
=======
      if (data.length > 1) {
        var msg = user_details.userid + " already exists";
>>>>>>> dcb89a04fec6e15988022484803c76612a820ba4
      }

      else {
        // check unique email address
        var emailCheck = 'SELECT * FROM personal_details WHERE email =?';
        db.query(emailCheck, [personal_details.email], function(err, data, fields) {
          if (err) throw err
          if (data.length > 1) {
<<<<<<< HEAD
            msg = personal_details.phno + " already exists";
=======
            var msg = personal_details.email + " already exists";
>>>>>>> dcb89a04fec6e15988022484803c76612a820ba4
          }

          else {
            // check phone number
            var phnoCheck = 'SELECT * FROM personal_details WHERE phno =?';
            db.query(phnoCheck, [personal_details.phno], function(err, data, fields) {
              if (err) throw err
              if (data.length > 1) {
                var msg = personal_details.phno + " already exists";
              }

              else {
                // check doc id
                var docidCheck = 'SELECT * FROM doctor WHERE docid =?';
                db.query(docidCheck, [professional_details.docid], function(err, data, fields) {
                  if (err) throw err
                  if (data.length > 1) {
                    var msg = professional_details.docid + " already exists";
                  }
                  else {
                    // save users login data into database
                    var sql1 = 'INSERT INTO users SET ?';
                    db.query(sql1, user_details, function(err, data) {
                      if (err) throw err;

                      // save users personal data into database
                      var sql2 = 'INSERT INTO personal_details SET ?';
                      db.query(sql2, personal_details, function(err, data) {
                        if (err) throw err;

<<<<<<< HEAD
              // save users personal data into database
              var sql2 = 'INSERT INTO personal_details SET ?';
              db.query(sql2, personal_details, function(err, data) {
                if (err) throw err;
                msg = "You are successfully registered";
              });
=======
                        // save professional details into database
                        var sql3 = 'INSERT INTO doctor SET ?';
                        db.query(sql3, professional_details, function(err, data) {
                          if (err) throw err;
                          var msg = "Your are successfully registered";
                        });
                      });
                    });
                  }
                });
              }
>>>>>>> dcb89a04fec6e15988022484803c76612a820ba4
            });
          }
        });
      }
    });
  }
  res.redirect('/register_doctor');
});

module.exports = router;
