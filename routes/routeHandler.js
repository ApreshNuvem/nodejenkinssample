(function () {
   'use strict';
//defining constants & variables
var express = require('express');
var app = express.Router();
var build = require('../config/build').Build;
var pg = require('pg');
//var connectionString = build.Environment[process.env.DATABASE_CONNECT_TYPE].DB.Url;
var connectionString = build.Environment[build.Type].DB.Url;
var stringformat = require('stringformat');
  // Import events module
var events = require('events');

var functionfilter=function(arr,str){
		var filtname='';
		var Filt = arr.filter(s => s.includes(str));
		var Val = Filt.toString();
		if (Val == null || Val == '') {
		 filtname='NA';
		} else {
		var arr_2 = Val.split("=");
		filtname = arr_2[1];	
		}
filtname=filtname.replace("'","''");
	return filtname;
};

var functionvalidation=function(arr,resp){
		var status_val='t';
		resp.Orgname='Becker Media';
		resp.SourceChannel='Hunter';
		var client = new pg.Client(connectionString);
		client.connect();
		var queryString =stringformat("SELECT * FROM leadfieldsbyclient('{0}');",resp.SourceChannel);
		console.log(queryString);
	client.query(queryString, function(error, result) {
    if (error) console.log(error);
	client.end();
	if(result)   { 
	for( var i=0; i<result.rowCount;i++){
		var rowval=result.rows[i];
		var filtname=functionfilter(arr,rowval.ppcparam+'=');
		if(rowval.pplreq==true){
			console.log(rowval.leadcolname+'=', rowval.ppcparam+':'+filtname);
			 if (filtname == null || filtname == 'NA') {
				resp.ClientStatusCode= rowval.statuscode;
				console.log(rowval.leadcolname+' Status=', rowval.statuscode);
				status_val='f';
				  return status_val;
			 }
		}	
	}
	//console.log("result countt -->", result.rowCount);
	//console.log("result -->", result);
	//res.json(result);
	}
	
  });
  return status_val;
};

/**
 * Default Homepage
 */
app.get('/', function(req, res, next) {
  res.send("<h2> ***** Welcome to BeckerMedia ***** - V2 </h2>");
});

/**
 * Default Homepage
 */
app.get('/test1', function(req, res, next) {
  res.send("<h2> ***** Welcome to BeckerMedia ***** - V2 </h2>");
});




app.get('/test', function(req, res, next) {
	res.status(200);
	 res.writeHead(200, {'Content-Type': 'text/html'});
  res.write("<h2>Welcome to BeckerMedia</h2>");
  res.end();
});

app.get('/test2', function(req, res, next) {
	res.status(200);
	 res.writeHead(200, {'Content-Type': 'text/html'});
  res.write("<h2>Welcome to BeckerMedia</h2>");
  res.end();
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
 // console.log('req.rawBody --> ' + raw);
 if(raw==null || raw==''){
	 resp.Error = 'no data' ;
		res.send(resp);
		console.log('----- end ---- ');
		return;
 }
 var arr = raw.split(";");
 var status_val='t';
    //status_val= functionvalidation(arr,resp);
	resp.Orgname='Becker Media';
	resp.Client='Hunter';
	resp.ClientStatusCode='200';
	resp.Fields='';
	var client = new pg.Client(connectionString);
	client.connect();
	var queryString =stringformat("SELECT * FROM leadfieldsbyclient('{0}');",resp.Client);
	console.log(queryString);
	client.query(queryString, function(error, result) {
    if (error) console.log(error);
	client.end();
	if(result)   { 
	 // /////////////// Validations Start as per Client wise Configuration //////////////////////////////////////
	for( var i=0; i<result.rowCount;i++){
		var rowval=result.rows[i];
		var filtname=functionfilter(arr,rowval.ppcparam+'=');
		if(rowval.pplreq==true){
			console.log(rowval.leadcolname+'(', rowval.ppcparam+')='+filtname);
			resp.Fields =resp.Fields+rowval.leadcolname+'('+ rowval.ppcparam+')='+filtname+';';
			 if (filtname == null || filtname == 'NA') {
				resp.ClientStatusCode= rowval.statuscode;				
				console.log(rowval.leadcolname+' Status=', rowval.statuscode);
				status_val='f';
				break;
			 }
		}	
	}
	// /////////////// Validations Start as per Client wise Configuration //////////////////////////////////////
	}
		if(status_val=='t'){
		resp.ClientStatusCode='200';
		console.log('Status=','200');
		// ////////////////////////// Lead Data insert into Database start/////////////////////// 
		// var client = new pg.Client(connectionString);
		// client.connect();
		// var queryString =stringformat("SELECT * FROM ppl_ppc('{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}','{8}','{9}','{10}','{11}','{12}');",resp.FName,resp.LName,resp.VendorID,resp.SourceChannel,resp.dayphone,resp.Email,resp.Zip,resp.ConsentVerbiage,resp.address,
		// resp.city,resp.country,resp.Orgname,resp.EducationLevel);
		// console.log(queryString);
		// client.query(queryString, function(error, result) {
		// if (error) console.log(error);
		// if(result)    console.log("result -->", result.rowCount);
		// client.end();		 
		// });
		// ////////////////////////// Lead Data insert into Database end/////////////////////// 
		}
		console.log('----- end ---- ');
		res.statuscode = 200;
		res.send(resp);
  });
});
module.exports = app;
//module.exports = {filter_by_param:fuc_filt_name};
}());