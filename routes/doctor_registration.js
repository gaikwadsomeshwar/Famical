// moudules
var express = require('express');
var router = express.Router();
var db = require('../database');
var bcrypt = require('bcryptjs');


// to display registration form
router.get('/register_doctor', function(req, res, next) {
  res.render('doctorReg');
});

// to store user input detail on post request
router.post('/register_doctor', async function(req, res, next) {

  personal_details = {
    userid: req.body.userid,
    fname: req.body.fname,
    lname: req.body.lname,
    phno: req.body.phno,
    email: req.body.email,
    dob: req.body.dob.toDateString(),
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

  professional_details = {
    userid: req.body.userid,
    docid: req.body.docid,
    qualification: req.body.qualification,
    hospital: req.body.hospital,
    department: req.body.department
  }

  var pass = user_details.password;
  var hashedpwd = await bcrypt.hash(user_details.password, 8);
  user_details.password = hashedpwd;

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
                // check doc id
                var docidCheck = 'SELECT * FROM doctor WHERE docid =?';
                db.query(docidCheck, [professional_details.docid], function(err, data, fields) {
                  if (err) throw err
                  if (data.length > 0) {
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

                        // save professional details into database
                        var sql3 = 'INSERT INTO doctor SET ?';
                        db.query(sql3, professional_details, function(err, data) {
                          if (err) throw err;

                          // save into patient
                          db.query('INSERT INTO patient(userid) values(?)', personal_details.userid, function(err, data) {
                            if (err) throw err;

                            var msg = "Your are successfully registered";
                          });
                        });
                      });
                    });
                  }
                });
              }
            });
          }
        });
      }
    });
  }

  res.render('doctorReg', {
    alertMsg: msg
  });
});

module.exports = router;
