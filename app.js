const express = require("express");
const bodyParser = require("body-parser");

const app = express();
app.listen(3000, function() {
  console.log("Server Started at Port 3000");
})

app.use(bodyParser.urlencoded({
  extended: true
}));
app.use(express.static("public"));

app.set('view engine', 'ejs');

var usersRouter = require('./routes/users');
app.use('/users',usersRouter);
