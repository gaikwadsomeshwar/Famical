var express = require('express');
var router = express.Router();
var db = require('../database');
var bcrypt = require('bcryptjs');


// to display registration form
router.get('/register_patient', function(req, res, next) {
  res.render('patientReg');
});

// to store user input detail on post request
router.post('/register_patient', async function(req, res, next) {

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
  }

  var pass = user_details.password;
  var hashedpwd = await bcrypt.hash(user_details.password, 8);
  user_details.password = hashedpwd;
  console.log(pass);
  console.log(user_details.password);

  // check password
  if (pass != req.body.confirm_password) {
    var msg = "Password & Confirm Password is not Matched";
  }

  else {
    // check unique user
    var userCheck = 'SELECT * FROM users WHERE userid =?';
    db.query(userCheck, [user_details.userid], function(err, data, fields) {
      if (err) throw err
      if (data.length > 0) {
        var msg = user_details.userid + " already exists";
      }

      else {
        // check unique email address
        var emailCheck = 'SELECT * FROM personal_details WHERE email =?';
        db.query(emailCheck, [personal_details.email], function(err, data, fields) {
          if (err) throw err
          if (data.length > 0) {
            var msg = personal_details.email + " already exists";
          }

          else {
            // check phone number
            var phnoCheck = 'SELECT * FROM personal_details WHERE phno =?';
            db.query(phnoCheck, [personal_details.phno], function(err, data, fields) {
              if (err) throw err
              if (data.length > 0) {
                var msg = personal_details.phno + " already exists";
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
                    var msg = "Your are successfully registered";
                  });
                });
              }
            });
          }
        });
      }
    });
  }

  res.render('patientReg', {
    alertMsg: msg
  });
});

module.exports = router;
