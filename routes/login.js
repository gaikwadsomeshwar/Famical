var express = require('express');
var router = express.Router();
var db = require('../database');
var jwt = require('jsonwebtoken');
var bcrypt = require('bcryptjs');

var token = "";

router.get('/login', function(req, res, next) {
  res.render('login');
});

router.post('/login', function(req, res) {

  var userid = req.body.userid;
  var password = req.body.password;

  var sql = 'SELECT * FROM users WHERE userid = ?';
  db.query(sql, [userid], async function(err, data, fields) {
    if (err) throw err
    if (data.length > 0) {
      const comparison = await bcrypt.compare(password, data[0].password);
      if(comparison) {
        const id = data[0].userid;
        token = jwt.sign({
          id: id
        }, 'supersecretpassword', {
          expiresIn: '100d'
        });
        const cookieOptions = {
          expires: new Date(
            Date.now() + 100 * 24 * 60 * 60 * 1000
          ),
          httpOnly: true
        }

        res.cookie('jwt', token, cookieOptions);
        req.session.loggedinUser = true;
        req.session.userid = userid;
        res.redirect('/dashboard');
      }
      else {
        res.render('login',{alertMsg:"Incorrect UserId and Password"});
      }
    }
    else {
      res.render('login',{alertMsg:"Incorrect UserId"});
    }
  })
});

module.exports = router;
