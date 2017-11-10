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

var fuc_filt_name=function(arr,str)
{

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



/**

 * Default Homepage

 */

app.get('/', function(req, res, next) {

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

 // console.log('req.rawBody --> ' + raw);

  var arr = raw.split(";");

    /////////////// LeadBuyerID Start //////////////////////////////////////
		resp.LeadBuyerID=fuc_filt_name(arr,'LeadBuyerID=');
		console.log('LeadBuyerID=' +resp.LeadBuyerID);
		
  /////////////// LeadBuyerID  End//////////////////////////////////////
  
  /////////////// SourceChannel Start //////////////////////////////////////
		resp.SourceChannel=fuc_filt_name(arr,'SourceChannel=');
		console.log('SourceChannel=' +resp.SourceChannel);
		
  /////////////// SourceChannel  End//////////////////////////////////////
  
  /////////////// Find VendorID Start //////////////////////////////////////
		resp.VendorID=fuc_filt_name(arr,'VendorID=');
		console.log('VendorID=' +resp.VendorID);
		
  /////////////// Find VendorID  End//////////////////////////////////////
  
  /////////////// First Name Start //////////////////////////////////////
		resp.FName=fuc_filt_name(arr,'firstname=');
		 if (resp.FName == null || resp.FName == 'NA') {
			 resp.FName=fuc_filt_name(arr,'full_name');
		 }
		console.log('FName=' +resp.FName);
		//resp.FName = firstname;
  /////////////// First Name  End//////////////////////////////////////		
  
  /////////////// Last Name Start //////////////////////////////////////
		resp.LName=fuc_filt_name(arr,'lastname=');
		console.log('LName=' +resp.LName);
		
  /////////////// Last Name end //////////////////////////////////////
  
  /////////////// ZIP Start //////////////////////////////////////
		resp.Zip=fuc_filt_name(arr,'zip=');
		console.log('ZIP=' +resp.Zip);
		
  /////////////// ZIP end //////////////////////////////////////
  
  /////////////// dayphone Start //////////////////////////////////////
		resp.dayphone=fuc_filt_name(arr,'dayphone=');
		console.log('DayPhone=' +resp.dayphone);
		
  /////////////// ZIP end //////////////////////////////////////
  
  /////////////// Email Start //////////////////////////////////////
		resp.Email=fuc_filt_name(arr,'email=');
		console.log('Email=' +resp.Email);
		
  /////////////// Email end //////////////////////////////////////
  
  /////////////// CurriculumID Start //////////////////////////////////////
		resp.CurriculumID=fuc_filt_name(arr,'CurriculumID=');
		console.log('CurriculumID=' +resp.CurriculumID);
		
  /////////////// CurriculumID end //////////////////////////////////////
  
  /////////////// ConsentVerbiage Start //////////////////////////////////////
		resp.ConsentVerbiage=fuc_filt_name(arr,'ConsentVerbiage=');
		console.log('ConsentVerbiage=' +resp.ConsentVerbiage);
		
  /////////////// ConsentVerbiage end //////////////////////////////////////
  
   /////////////// city Start //////////////////////////////////////
		resp.city=fuc_filt_name(arr,'city=');
		console.log('city=' +resp.city);
		
  /////////////// city end //////////////////////////////////////
  
   /////////////// country  Start //////////////////////////////////////
		resp.country =fuc_filt_name(arr,'country=');
		console.log('country =' +resp.country );
		
  /////////////// country end //////////////////////////////////////
  
   /////////////// address Start //////////////////////////////////////
		resp.address=fuc_filt_name(arr,'address=');
		console.log('address=' +resp.address);
		
  /////////////// address end //////////////////////////////////////  
  /////////////// EducationLevel Start //////////////////////////////////////
		resp.EducationLevel=fuc_filt_name(arr,'EducationLevel=');
		console.log('EducationLevel=' +resp.EducationLevel);
		
  /////////////// EducationLevel end //////////////////////////////////////  
  resp.Orgname='Becker Media';
  resp.SourceChannel='Hunter';
  // for(var i = 0; i < arr.length;i++){
         // var arr_2 = arr[i].split("=");
		 // console.log(arr_2[0]+' = ' +arr_2[1]);
		 // //resp.Gana+i=arr_2[0]+' = ' +arr_2[1];
  // }
	var client = new pg.Client(connectionString);
	client.connect();
	 
	  console.log(stringformat("Hello, {0}!", "World"));
	  console.log(stringformat("hi {0}, i'am {1}","everybody", "stackoverflower"));  //Hello Alice
	 //console('{0}, you have {1} unread message{2}'.format('Steve', 1));
	// // var queryString = "INSERT INTO public.leads (leadbuyer, source, name,vendor) VALUES (" +
	// // "'" + [resp.LeadBuyerID, resp.SourceChannel, resp.VendorID, resp.FName].join("','") + "'" + ")";
	// var queryString = "SELECT * FROM ppl_ppc('"+resp.FName+"','"+resp.LName+"','"+resp.VendorID+"','"+resp.SourceChannel+ 
	 // "','"+resp.dayphone+ "','"+resp.Email+ "','"+resp.Zip+ "','"+resp.ConsentVerbiage+ "','"+resp.address+ "','"
	 // +resp.city+ "','"+resp.country+ "','"+resp.Orgname+ "','"+resp.EducationLevel+ "');";
	 var queryString =stringformat("SELECT * FROM ppl_ppc('{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}','{8}','{9}','{10}','{11}','{12}');",resp.FName,resp.LName,resp.VendorID,resp.SourceChannel,resp.dayphone,resp.Email,resp.Zip,resp.ConsentVerbiage,resp.address,
	 resp.city,resp.country,resp.Orgname,resp.EducationLevel);
	 console.log(queryString);
	 client.query(queryString, function(error, result) {
    if (error) console.log(error);
	if(result)    console.log("result -->", result.rowCount);
	client.end();
	console.log('----- end ---- ');
	res.statusCode = 200;
    res.send(resp);
  });
});
module.exports = app;
module.exports = fuc_filt_name;
}());