var http = require('http');
const express = require('express');   
const pg = require('pg'); //npm install pg@6.1.0
const path = require('path');

var postHTML = 
	'<html><head><title>Post Example 2</title></head>' +
	'<body> Post Example' +
	'<form method="post">' +
	'<br/><input name="input2"><br>' +
	'<input type="submit">' +  
	'</form>' +
	'</body></html>';
//npm install express
//npm install trim
 
 


http.createServer(function (req, res,done) {
  var body = "";
  req.on('data', function (chunk) {
    body += chunk;
  });
  
  req.on('end', function () {
if(body==null || body=='' )
	{
		postHTML = 
		'<html><head><title>Post Result 2</title></head>' +
		'<body>' +
		'<form method="post">' +
		'<br/><input name="input2"><br>' +
		'<input type="submit">' +  
		'</form>' +
		'</body></html>';	
	}
	else{
		var LeadBuyerID='';var SourceChannel='';var VendorID='';var firstname='';
	console.log('----- Start ---- ' );
    //console.log('POSTed: ' + body);
   	var arr = body.split("%3B");
	/////////////// LeadBuyerID Start //////////////////////////////////////
	var str_Lead = 'LeadBuyerID';
	var Filt_Lead = arr.filter(s => s.includes(str_Lead));
	var Lead_Val=Filt_Lead.toString().replace("]",'').replace("[",'').trim();
	if(Lead_Val==null || Lead_Val=='' )
	{		console.log('LeadBuyerID not available');}
	else{
		var arr_Lead = Lead_Val.split("%3D");
		LeadBuyerID=arr_Lead[1];
		console.log('LeadBuyerID='+arr_Lead[1]);}				
	/////////////// LeadBuyerID  End//////////////////////////////////////
	
	/////////////// SourceChannel Start //////////////////////////////////////
	var str_SC = 'SourceChannel';
	var Filt_SC = arr.filter(s => s.includes(str_SC));
	var SC_Val=Filt_SC.toString().replace("]",'').replace("[",'').trim();
	if(SC_Val==null || SC_Val=='' )
	{		console.log('SourceChannel not available');}
	else{
		var arr_SC = SC_Val.split("%3D");
		SourceChannel=arr_SC[1];
		console.log('SourceChannel='+arr_SC[1]);}				
	/////////////// SourceChannel  End//////////////////////////////////////
	
	/////////////// Find VendorID Start //////////////////////////////////////
	var str_VID = 'VendorID';
	//console.log( arr );
	var Filt_VID = arr.filter(s => s.includes(str_VID));
	var V_Val=Filt_VID.toString().replace("]",'').replace("[",'').trim();
    //console.log(Filt_VID) // ['dogcat']
	if(V_Val==null || V_Val=='' )
	{		console.log('VendorID not available');}
	else{
		//var V_Val=Filt_VID.toString().replace("]",'').replace("[",'').trim();
		//console.log(V_Val);
		var arr_V = V_Val.split("%3D");
		VendorID=arr_V[1];
		console.log('VendorID='+arr_V[1]);}	
	
	/////////////// Find VendorID  End//////////////////////////////////////
	
	/////////////// First Name Start //////////////////////////////////////
	var str_FName = 'firstname';
	var Filt_FName = arr.filter(s => s.includes(str_FName));
	var FName_Val=Filt_FName.toString().replace("]",'').replace("[",'').trim();
	if(FName_Val==null || FName_Val=='' )
	{		
			//console.log('firstname not available');
			/////////////// Last Name Start //////////////////////////////////////
			var str_LName = 'LastName';
			var Filt_LName = arr.filter(s => s.includes(str_LName));
			var LName_Val=Filt_LName.toString().replace("]",'').replace("[",'').trim();
			if(LName_Val==null || LName_Val=='' )
			{		//console.log('lastname not available');
					/////////////// full_name Start //////////////////////////////////////
					var str_Name = 'full_name';
					var Filt_Name = arr.filter(s => s.includes(str_Name));
					var Name_Val=Filt_Name.toString().replace("]",'').replace("[",'').trim();
					if(Name_Val==null || Name_Val=='' )
					{		console.log('full_name not available');}
					else{
						var arr_L = Name_Val.split("%3D");
						firstname=arr_L[1];
						console.log('full_name='+arr_L[1]);}				
					/////////////// full_name  End//////////////////////////////////////
			}
			else{
				var arr_Name = LName_Val.split("%3D");
				firstname=arr_Name[1];
				console.log('lastname='+arr_Name[1]);}				
			/////////////// Last Name  End//////////////////////////////////////
	}
	else{
		var arr_F = FName_Val.split("%3D");
		firstname=arr_F[1];
		console.log('firstname='+arr_F[1]);}	
		/////////////// First Name  End//////////////////////////////////////
	
		/////////////// Database Start//////////////////////////////////////


			
			 const router = express.Router();
			 const connectionString = process.env.DATABASE_URL || 'postgres://dzqmcwtpxocfic:6a1fffcb9884f37a569dc7db611473f3a0df30b1dbd5a03c6fe200eb6edade40@ec2-23-21-85-76.compute-1.amazonaws.com:5432/d9vgknh43ooldu';
			 const client = new pg.Client(connectionString);

			 client.connect();
			 var queryString = "INSERT INTO public.leads (leadbuyer, source, name,vendor) VALUES (" 
			 + "'" + [LeadBuyerID, SourceChannel, VendorID,firstname].join("','") + "'" + ")";
			 console.log(queryString);
			 client.query(queryString, function (error, result) {
				 console.log(error);
			 console.log(result.rows);
			//done();
			
			});
			// client.end();
			
			 //const query = client.query(
			 //'INSERT INTO Leads(LeadBuyer, Source,Name,Vendor) values('+LeadBuyerID+','+SourceChannel+','+VendorID+','+firstname+')');
			// [LeadBuyerID, SourceChannel,VendorID,firstname]);
			//var LeadBuyerID="";var SourceChannel="";var VendorID="";var firstname="";
			//'CREATE TABLE items(id SERIAL PRIMARY KEY, text VARCHAR(40) not null, complete BOOLEAN)');
			//query.on('end', () => { client.end(); });

	    /////////////// Database end//////////////////////////////////////
	
			console.log('----- END ---- ' );
			postHTML = 
			'<html><head><title>Post Result 1</title></head>' +
			'<body>' +
			'<form method="post">' +
			'<br/><input name="input2"><br>' +
			'<input type="submit">' +  
			'<p>LeadBuyerID: '+LeadBuyerID+'</p>'+
			'<p>SourceChannel: '+SourceChannel+'</p>'+
			'<p>VendorID: '+VendorID+'</p>'+
			'<p>firstname: '+firstname+'</p>'+
			'</form>' +
			'</body></html>';	
	}
	
		//var rtValInd=arr.indexOf(Filt_VID);
		//console.log('Index: ' + rtValInd);
		//var outval=arr.includes(Filt_VID);
		//console.log('Out: ' + outval)
		// if(arr.includes(Filt_VID)){
		// var rtValInd=arr.indexOf(Filt_VID);  
		// console.log('Index: ' + rtValInd);
		// }
	
    res.writeHead(800);
    res.end(postHTML);
  });
}).listen(process.env.PORT || 3000, function(){
  console.log("Express server listening on port");
});