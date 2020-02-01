var express = require('express');
const https = require('https');
var router = express.Router();
var request = require('request');
/* GET users listing. */

var options = {
  api: "https://maps.googleapis.com/maps/api/geocode/json?",
  key:"AIzaSyC_yozqCtFVz57wL-iniIRIemVAoLw0zTo",
  address:""
};
router.get('/',  (req, res, next) =>{
  var add=req.query.address;
  var link=options.api+"address="+add+"&key="+options.key;
request(link,function (error, response, body) {
  //console.error('error:', error); // Print the error if one occurred
  //console.log('statusCode:', response && response.statusCode); // Print the response status code if a response was received
  //console.log('body:', body); // Print the HTML for the Google homepage.

  return res.status(201).json(JSON.parse(body));
})});
module.exports = router;
