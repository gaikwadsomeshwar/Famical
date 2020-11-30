var express = require('express');
var router = express.Router();
var db = require('../database');

/* GET users listing. */

router.get('/medical_details', function(req, res, next) {
  if (req.session.loggedinUser) {
    db.query("SELECT * from patient where userid = ?", [req.session.userid], async function(error, results1) {
      db.query("SELECT * from consults where pid = ?", [req.session.userid], async function(error, results2) {
        res.render('medical_details',{data1: results1, data2: results2});
      });
    });
  }
  else {
    res.redirect('/login');
  }
});

module.exports = router;
