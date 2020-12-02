var express = require('express');
var router = express.Router();
var db = require('../database');

router.get('/dashboard', function(req, res, next) {
  if (req.session.loggedinUser) {
    db.query("SELECT * from personal_details where userid = ?", [req.session.userid], function(error, results1) {
      db.query("SELECT * from patient where userid = ?", [req.session.userid], function(error, results2) {
        db.query("SELECT * from consults where pid = ?", [req.session.userid], function(error, results3) {
          db.query("SELECT * from family where userid = ?", [req.session.userid], function(error, results4) {
            db.query("SELECT * from doctor where userid = ?", [req.session.userid], function(error, results5) {
              if(results5.length>0) {
                db.query("SELECT * from consults where docid = ?", [results5[0].docid], function(error, results6) {
                  res.render('dashboard',{data1: results1, data2: results2, data3: results3, data4: results4, data5: results5, data6: results6});
                });
              }
              else {
                res.render('dashboard',{data1: results1, data2: results2, data3: results3, data4: results4, data5: results5, data6: {}});
              }
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
