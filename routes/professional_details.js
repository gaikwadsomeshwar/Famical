var express = require('express');
var router = express.Router();
var db = require('../database');

/* GET users listing. */

router.get('/professional_details', function(req, res, next) {
  if (req.session.loggedinUser) {
    db.query("SELECT * from doctor where userid = ?", [req.session.userid], async function(error, results) {
      res.render('professional_details',{data: results});
    });
  }
  else {
    res.redirect('/login');
  }
});

module.exports = router;
