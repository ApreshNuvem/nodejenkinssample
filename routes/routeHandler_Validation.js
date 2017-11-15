
var build = require('../config/build').Build;
var pg = require('pg');
var stringformat = require('stringformat');
//var connectionString = build.Environment[process.env.DATABASE_CONNECT_TYPE].DB.Url;
var connectionString = build.Environment[build.Type].DB.Url;
module.exports = { 
	returnMyFunc : function (req){
		 var resp = {};
		 // var arr = req.split(";");
		// var status_val='t';
		// resp.Orgname='Becker Media';
		// resp.Client='Hunter';
		// resp.ClientStatusCode='200';
	    // resp.Fields='';
	// var client = new pg.Client(connectionString);
	// client.connect();
	// var queryString =stringformat("SELECT * FROM leadfieldsbyclient('{0}');",resp.Client);
	// console.log(queryString);
	// client.query(queryString, function(error, result) {
    // if (error) console.log(error);
	// client.end();
	// if(result)   { 

	 // // /////////////// Validations Start as per Client wise Configuration Chnages //////////////////////////////////////

	// for( var i=0; i<result.rowCount;i++){

		// var rowval=result.rows[i];

		// var filtname=functionfilter(arr,rowval.ppcparam+'=');

		// if(rowval.ppcreq==true){

			// console.log(rowval.leadcolname+'(', rowval.ppcparam+')='+filtname);


			 // if (filtname == null || filtname == 'NA') {

				// resp.ClientStatusCode= rowval.statuscode;				
				// console.log('Status=',resp.ClientStatusCode);
				// console.log(rowval.leadcolname+'('+ rowval.ppcparam+')='+filtname+';');
				// status_val='f';
				
				// resp.Fields =rowval.leadcolname+'('+ rowval.ppcparam+')='+filtname+';';
				
				// break;

			 // }

		// }	

	// }

	// // /////////////// Validations Start as per Client wise Configuration //////////////////////////////////////

	// }
	
	
	// });
		
console.log('-------Validation -------');
	resp.message = 'Validation';
	resp.statusCode = 200;
	return JSON.stringify(resp);		
	
	}
}

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