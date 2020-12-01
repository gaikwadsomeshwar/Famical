var express = require('express');
var router = express.Router();
var db = require('../database');

/* GET users listing. */

router.get('/dashboard', function(req, res, next) {
  if (req.session.loggedinUser) {
    db.query("SELECT * from personal_details where userid = ?", [req.session.userid], function(error, results) {
      res.render('dashboard',{data: results});
    });
  }
  else {
    res.redirect('/login');
  }
});

module.exports = router;
