var express = require('express');
var router = express.Router();
var db=require('../database');

/* GET users listing. */
router.get('/login', function(req, res, next) {
  res.render('index.ejs');
});

module.exports = router;
