const express = require("express");
const bodyParser = require("body-parser");

const app = express();

app.use(bodyParser.urlencoded({extended: true}));

app.set('view engine', 'ejs');

// var items = ["Buy Food", "Cook Food", "Eat the Food"];
//
// app.get("/", function(req, res) {
//
//   var today = new Date();
//
//   var options = {
//     weekday: "long",
//     day: "numeric",
//     month: "long"
//   };
//
//   var day = today.toLocaleDateString("en-US", options);
//
//
//   res.render("list", {
//     kindOfDay: day,
//     listItems: items
//   });
// })
//
// app.post("/", function(req, res) {
//
//   items.push(req.body.newItem);
//   res.redirect("/");
// })

app.listen(3000, function() {
  console.log("Server Started at Port 3000");
})
