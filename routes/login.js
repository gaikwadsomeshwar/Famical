var express = require('express');
var router = express.Router();
var db=require('../database');
var jwt = require('jsonwebtoken');
var bcrypt = require('bcryptjs');

var token = "";
/* GET  */
router.get('/login', function(req, res, next) {
  res.render('login');
});

router.post('/login', async function(req,res){
  try {

    var userid = req.body.userid;
    var password = req.body.password;

    db.query('SELECT * FROM users WHERE userid = ?', [userid], async function(error,results){
      if( !results || !(await bcrypt.compare(password,results[0].password) ) ){
        res.status(401).render("login", {message: "Incorrect Email or Password" } )
      }
      else{
        const id = results[0].userid;
        token = jwt.sign({id: id}, 'supersecretpassword', { expiresIn: '100d'});
      }

      const cookieOptions = {
        expires: new Date(
          Date.now() + 100 * 24 * 60 * 60 * 1000 
        ),
        httpOnly: true
      } 

      res.cookie('jwt', token, cookieOptions);
      req.session.loggedinUser= true;
      req.session.userid= userid;
      res.status(200).redirect('/dashboard');

    })

  } catch (error) {
    console.log(error);
  }
});

module.exports = router;
