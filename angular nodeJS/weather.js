var express = require('express');
const https = require('https');
var router = express.Router();
var request = require('request');
/* GET users listing. */

var options = {
  forcastapi: 'https://api.darksky.net/forecast/4a6c9f5acab3b9f0d9137122b0174660/'
};
router.get('/',  (req, res, next) =>{
var lat=req.query.lat;
var lng=req.query.lng;

  var api=options.forcastapi+lat+","+lng;
request(api,function (error, response, body) {
  console.log(body);
  return res.status(201).json(JSON.parse(body));
});

});

router.get('/time',  (req, res, next) =>{
var lat=req.query.lat;
var lng=req.query.lng;
var time=req.query.time;
  var api=options.forcastapi+lat+","+lng+","+time;
request(api,function (error, response, body) {
  console.log(body);
  return res.status(201).json(JSON.parse(body));
});

});
module.exports = router;
