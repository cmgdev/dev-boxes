var Nightmare = require('nightmare');
var express = require('express');

var app = express();
var nightmare = Nightmare();

function* run(){
  yield nightmare
    .goto('http://yahoo.com')
    .type('input[title="Search"]', 'github nightmare')
    .click('.searchsubmit')
	.screenshot('screen');
}

app.get('/', function (req, res) {
  run();
  res.send('Hello World');
})
 
app.listen(8080);