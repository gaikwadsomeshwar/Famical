var express = require('express');
var router = express.Router();
var db = require('../database');
var bcrypt = require('bcryptjs');

var userid;
var errmsg;

router.post('/update_personal', async function(req,res,next) {
    userid = req.session.userid;
    var email = req.body.email;
    var phno = req.body.phno;
    var stno = req.body.stno;
    var stname = req.body.stname;
    var state = req.body.state;
    var city = req.body.city;
    var zipcode = req.body.zipcode;
    var old_pass = req.body.old_pass;
    var new_pass = req.body.new_pass;
    var confirm_pass = req.body.confirm_pass;

    if(phno == ''){
        phno = 0;
    }
    if(stno == ''){
        stno = 0;
    }
    if(zipcode == ''){
        zipcode = 0;
    }

    var sql = 'SELECT * FROM users WHERE userid = ?';
    db.query(sql, [userid], async function(err, data, fields) {
        if (err) throw err
        if (data.length > 0) {
            const comparison = await bcrypt.compare(old_pass, data[0].password);
            if(comparison) {
                if(new_pass == confirm_pass){
                    var hashedpwd = await bcrypt.hash(new_pass, 8);
                    db.query('UPDATE users SET password = ? WHERE userid = ?', [hashedpwd,userid], async function(err,results){
                        if(err) throw err;
                    });
                }
                else{
                    errmsg = "New Password and Confirm Password don't match";
                }
            }
            else{
                errmsg = "Enter Correct Old Password";
            }
        }
    });

    db.query('UPDATE personal_details SET email = ?, phno = ?, stno = ?, stname = ?, state = ?, city = ?, zipcode = ? WHERE userid = ?', [email,phno,stno,stname,state,city,zipcode,userid], async function(error, results){
        if(error) throw error;
    });
    res.redirect('dashboard');//, {alertMsg:errmsg});
});

router.post('/update_professional', async function(req,res,next) {
    userid = req.session.userid;
    var quali = req.body.qualification;
    var hosp = req.body.Hospital;
    var dept = req.body.department;

    db.query('UPDATE doctor SET qualification = ?, hospital = ?, department = ? WHERE userid = ?', [quali,hosp,dept,userid], async function(error, results){
        if(error) throw error;
    });

    res.redirect('dashboard');
});

router.post('/update_history', async function(req,res,next) {
    userid = req.session.userid;
    var weight = req.body.weight;
    var height = req.body.height;
    var bp = req.body.bp;
    var allergies = req.body.allergies;

    if(weight == ''){
        weight = 0;
    }
    if(height == ''){
        height = 0;
    }
    if(bp == ''){
        bp = 0;
    }

    db.query('UPDATE patient SET weight = ?, height = ?, bp = ?, allergies = ? WHERE userid = ?', [weight,height,bp,allergies,userid], async function(error, results){
        if(error) throw error;
    });
    res.redirect('dashboard');
});

router.post('/book_appointment', async function(req,res,next) {
  var pid = req.session.userid;
  var docid = req.body.docid;
  var cdate = req.body.consultdate;

  db.query('INSERT into consults values(?, ?, ?, ?, ?, ?)', [pid, docid, cdate, "", "", ""], async function(error, results){
      if(error) throw error;
  });
  res.redirect('dashboard');
});

router.post('/add_family', async function(req,res,next) {
  var userid = req.session.userid;
  var memberid = req.body.memberid;
  var type = req.body.type;

  if(userid!=memberid) {
    db.query('INSERT into family values(?, ?, ?)', [userid, memberid, type], async function(error, results){
        if(error) throw error;
    });
    db.query('INSERT into family values(?, ?, ?)', [memberid, userid, ""], async function(error, results){
        if(error) throw error;
    });
  }
  res.redirect('dashboard');
});

router.post('/update_family', async function(req,res,next) {
  var userid = req.session.userid;
  var memberid = req.body.memberid;
  var type = req.body.type;

  db.query('UPDATE family set type = ? where userid = ? and memberid = ?', [type, userid, memberid], async function(error, results){
    if(error) throw error;
  });

  res.redirect('dashboard');
});

router.post('/consults', async function(req,res,next) {
  var pid = req.body.pid;
  var cdate = req.body.cdate;
  var prescriptions = req.body.prescriptions;
  var medtests = req.body.medtests;
  var diagnosis = req.body.diagnosis;
  console.log(pid, cdate, prescriptions, medtests, diagnosis);

  db.query('UPDATE consults SET prescriptions = ?, medtests = ?, diagnosis = ? where docid = ? and pid = ? and diagnosis = ""', [prescriptions, medtests, diagnosis, req.session.userid, pid, cdate], async function(error, results){
      if(error) throw error;
  });
  res.redirect('dashboard');
});

module.exports = router;
