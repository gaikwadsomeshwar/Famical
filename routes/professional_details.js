var express = require('express');
var router = express.Router();
var db = require('../database');

/* GET users listing. */

router.get('/professional_details', function(req, res, next) {
  if (req.session.loggedinUser) {
    db.query("SELECT * from personal_details where userid = ?", [req.session.userid], function(error, results1) {
      db.query("SELECT * from doctor where userid = ?", [req.session.userid], function(error, results2) {
        res.render('professional_details',{data1:results1, data2: results2});
      });
    });
  }
  else {
    res.redirect('/login');
  }
});

module.exports = router;
