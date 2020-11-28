let mysql = require('mysql');

let connection = mysql.createConnection({
  host: '127.0.0.1',
  user: 'root',
  password: '15dEc!%!@',
  database: 'famical',
  insecureAuth: true
});

connection.connect(function(err) {
  if (err) {
    return console.error('error: ' + err.message);
  }
  console.log('Connected to the MySQL server.');
});

module.exports = connection;
