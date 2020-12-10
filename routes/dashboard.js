var express = require('express');
var router = express.Router();
var db = require('../database');

router.get('/admin_dash', function(req, res, next) {
  if (req.session.loggedinUser) {

    db.query("SELECT userid, fname, lname, phno, email from personal_details", function(error, results1) {

      db.query("SELECT fname, lname, email, hospital, department FROM personal_details, doctor where personal_details.userid = doctor.userid", function(error, results2) {

        db.query("SELECT * FROM consults", function(error, results3) {

          res.render('admin_dash',{data1: results1, data2: results2, data3: results3});
        });
      });
    });
  }
});

router.get('/dashboard', function(req, res, next) {
  if (req.session.loggedinUser) {

    // All Doctors Available
    db.query("SELECT * FROM DOCTOR, personal_details where Doctor.userid = personal_details.userid", function(error, results0) {

      // Personal Details of Logged in User
      db.query("SELECT * from personal_details where userid = ?", [req.session.userid], function(error, results1) {

        //Basic History of Logged in User
        db.query("SELECT * from patient where userid = ?", [req.session.userid], function(error, results2) {

          //Medical History of Logged in User
          db.query("SELECT pid, fname, lname, email, phno, hospital, department, consults.docid, cdate, prescriptions, medtests, diagnosis  from consults, personal_details, doctor where pid = ? and doctor.userid = personal_details.userid", [req.session.userid], function(error, results3) {

            //Family Members of Logged in User
            db.query("SELECT fname, lname, email, phno, family.userid, memberid, type from family, personal_details where family.userid = ? and family.memberid = personal_details.userid", [req.session.userid], function(error, results4) {

              db.query("SELECT pid, cdate, prescriptions, diagnosis from consults, family where family.memberid = pid and family.userid = ? ", [req.session.userid], function(error, results7) {

                // Professional Details of Logged in User if exists
                db.query("SELECT * from doctor where userid = ?", [req.session.userid], function(error, results5) {
                  if(results5.length>0) {

                    // If doctor, Patient Data of the Logged in User
                    db.query("SELECT fname, lname, email, phno, pid, docid, cdate, prescriptions, medtests, diagnosis from personal_details, consults where docid = ? and pid = userid", [results5[0].docid], function(error, results6) {
                      res.render('dashboard',{data0: results0, data1: results1, data2: results2, data3: results3, data4: results4, data5: results5, data6: results6, data7: results7});
                    });
                  }
                  else {
                    res.render('dashboard',{data0: results0, data1: results1, data2: results2, data3: results3, data4: results4, data5: [{docid: ""}], data6: [{docid: ""}], data7: results7});
                  }
                });
              });
            });
          });
        });
      });
    });
  }
  else {
    res.redirect('/login');
  }
});

module.exports = router;
