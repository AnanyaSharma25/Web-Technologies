var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var bodyParser = require('body-parser');
const https = require('https');

var app = express();

var location = require('./routes/location');
var weather = require('./routes/weather');
var seal = require('./routes/seal');
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(cookieParser())
app.use('/api/location', location);
app.use('/api/weather', weather);
app.use('/api/seal',seal);




app.use(function(req, res, next) {
  res.header("Access-Control-Allow-Origin", "*");
  res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
  next();
});
module.exports = app;
