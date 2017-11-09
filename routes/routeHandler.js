(function () {
   'use strict';
//defining constants & variables
var express = require('express');
var app = express.Router();
var build = require('../config/build').Build;
var pg = require('pg');
//var connectionString = build.Environment[process.env.DATABASE_CONNECT_TYPE].DB.Url;
var connectionString = build.Environment[build.Type].DB.Url;

var client = new pg.Client(connectionString);


var fuc_filt_name=function(arr,str)
{
		var filtname='';
		var Filt = arr.filter(s => s.includes(str));
		var Val = Filt.toString();
		if (Val == null || Val == '') {
		 filtname='LeadBuyerID not available';
		} else {
		var arr_2 = Val.split("=");
		filtname = arr_2[1];	
		}
	return filtname;
};

/**
 * Default Homepage
 */
app.get('/', function(req, res, next) {
  res.send("<h2>Welcome to BeckerMedia</h2>");
});

/**
 * Default Homepage
 */
app.get('/test', function(req, res, next) {
  res.send("<h2>Welcome to BeckerMedia</h2>");
});


/**
 * Lead Filtering
 */
app.post('/lead', function(req, res, next) {
  var data = '';
  var resp = {};
  req.on('data', function(chunk) {
    data += chunk;
  });
  req.on('end', function() {
    req.rawBody = data;
  });
  var raw = req.rawBody;  
  console.log('----- Start ---- ');
  console.log('req.rawBody --> ' + raw);
  var arr = raw.split(";");
  /////////////// LeadBuyerID Start //////////////////////////////////////
		resp.LeadBuyerID=fuc_filt_name(arr,'LeadBuyerID=');
		console.log('LeadBuyerID=' +resp.LeadBuyerID);
		
  /////////////// LeadBuyerID  End//////////////////////////////////////
  
  /////////////// SourceChannel Start //////////////////////////////////////
		resp.SourceChannel=fuc_filt_name(arr,'SourceChannel');
		console.log('SourceChannel=' +resp.SourceChannel);
		
  /////////////// SourceChannel  End//////////////////////////////////////
  
  /////////////// Find VendorID Start //////////////////////////////////////
		resp.VendorID=fuc_filt_name(arr,'VendorID=');
		console.log('VendorID=' +resp.VendorID);
		
  /////////////// Find VendorID  End//////////////////////////////////////
  
  /////////////// First Name Start //////////////////////////////////////
		resp.FName=fuc_filt_name(arr,'firstname');
		 if (resp.FName == null || resp.FName == '') {
			 resp.FName=fuc_filt_name(arr,'full_name');
		 }
		console.log('FName=' +resp.FName);
		//resp.FName = firstname;
  /////////////// First Name  End//////////////////////////////////////		
  
  /////////////// Last Name Start //////////////////////////////////////
		resp.LName=fuc_filt_name(arr,'lastname');
		console.log('LName=' +resp.LName);
		
  /////////////// Last Name Start //////////////////////////////////////
	
  client.connect();
  var queryString = "INSERT INTO public.leads (leadbuyer, source, name,vendor) VALUES (" +
    "'" + [resp.LeadBuyerID, resp.SourceChannel, resp.VendorID, resp.FName].join("','") + "'" + ")";
  console.log(queryString);
  client.query(queryString, function(error, result) {
	  
    console.log("err -->", error);
	if(result)
    console.log("result -->", result.rowCount);
	res.statusCode = 200;
    res.send(resp);
  
  });
});

module.exports = app;
}());