var express = require('express');
const https = require('https');
var router = express.Router();
var request = require('request');
/* GET users listing. */

var options = {
    //gquery = 'https://www.googleapis.com/customsearch/v1?q=[STATE]%20State%20Seal&cx=[YOUR_SEARCH_ENGINE_ID]&imgSize=huge&imgType=news&num=1&searchType=image&key=[YOUR_API_KEY]',


    gquery1 = 'https://www.googleapis.com/customsearch/v1?q=',
    state = " ", 
    gquery2 = '%20State%20Seal&cx=006923599142534294543:sypuiee9t6p&imgSize=huge&imgType=news&num=1&searchType=image&key=AIzaSyAZAFRef7A8ijPOclYec-GvC0nGviYdss8',
    //seid = '006923599142534294543:sypuiee9t6p',
    //gquery3 = '&imgSize=huge&imgType=news&num=1&searchType=image&key=',
    //apikey = 'AIzaSyAZAFRef7A8ijPOclYec-GvC0nGviYdss8'
};
router.get('/',  (req, res, next) =>{
    var add=req.query.state;
    var link= options.gquery1+add+options.gquery2;
    //options.api+"address="+add+"&key="+options.key;
  request(link,function (error, response, body) {
    //console.error('error:', error); // Print the error if one occurred
    //console.log('statusCode:', response && response.statusCode); // Print the response status code if a response was received
    //console.log('body:', body); // Print the HTML for the Google homepage.
      
    return res.status(201).json(JSON.parse(body));
  })});
  module.exports = router;
  





