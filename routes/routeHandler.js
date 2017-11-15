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



/**

 * Default Homepage

 */

app.get('/', function(req, res, next) {

  res.send("<h2>Welcome to BeckerMedia -V1</h2>");

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


	resp.Orgname='Becker Media';

	resp.Client='Hunter';

	resp.ClientStatusCode='200';

	resp.Fields='';
	resp.Fields2='';
	var client = new pg.Client(connectionString);

	client.connect();

	var queryString =stringformat("SELECT * FROM leadfieldsbyclient('{0}');",resp.Client);

	console.log(queryString);

	client.query(queryString, function(error, result) {

    if (error) console.log(error);

	client.end();

	if(result)   { 

	 // /////////////// Validations Start as per Client wise Configuration Chnages //////////////////////////////////////

	for( var i=0; i<result.rowCount;i++){

		var rowval=result.rows[i];

		var filtname=functionfilter(arr,rowval.ppcparam+'=');

		if(rowval.ppcreq==true){

			console.log(rowval.leadcolname+'(', rowval.ppcparam+')='+filtname);


			 if (filtname == null || filtname == 'NA') {

				resp.ClientStatusCode= rowval.statuscode;				
				console.log('Status=',resp.ClientStatusCode);
				console.log(rowval.leadcolname+'('+ rowval.ppcparam+')='+filtname+';');
				status_val='f';
				
				resp.Fields =rowval.leadcolname+'('+ rowval.ppcparam+')='+filtname+';';
				
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