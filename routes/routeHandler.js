'use strict';
//defining constants & variables
var express = require('express');
var app = express.Router();
var build = require('../config/build').Build;
var pg = require('pg');
var connectionString = build.Environment[build.Type].DB.Url;
var client = new pg.Client(connectionString);

/**
 * Default Homepage
 */
app.get('/', function(req, res, next) {
  res.json("Welcome to BeckerMedia");
  next();
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
  var LeadBuyerID = '';
  var SourceChannel = '';
  var VendorID = '';
  var firstname = '';
  var resp = {};
  console.log('----- Start ---- ');
  console.log('req.rawBody --> ' + raw);
  var arr = raw.split(";");
  /////////////// LeadBuyerID Start //////////////////////////////////////
  var str_Lead = 'LeadBuyerID';
  var Filt_Lead = arr.filter(s => s.includes(str_Lead));
  var Lead_Val = Filt_Lead.toString();
  if (Lead_Val == null || Lead_Val == '') {
    console.log('LeadBuyerID not available');
  } else {
    var arr_Lead = Lead_Val.split("=");
    LeadBuyerID = arr_Lead[1];
    resp.LeadBuyerID = LeadBuyerID;
    console.log('LeadBuyerID=' + arr_Lead[1]);
  }
  /////////////// LeadBuyerID  End//////////////////////////////////////
  /////////////// SourceChannel Start //////////////////////////////////////
  var str_SC = 'SourceChannel';
  var Filt_SC = arr.filter(s => s.includes(str_SC));
  var SC_Val = Filt_SC.toString();
  if (SC_Val == null || SC_Val == '') {
    console.log('SourceChannel not available');
  } else {
    var arr_SC = SC_Val.split("=");
    SourceChannel = arr_SC[1];
    resp.SourceChannel = SourceChannel;
    console.log('SourceChannel=' + arr_SC[1]);
  }
  /////////////// SourceChannel  End//////////////////////////////////////
  /////////////// Find VendorID Start //////////////////////////////////////
  var str_VID = 'VendorID=';
  var Filt_VID = arr.filter(s => s.includes(str_VID));
  var V_Val = Filt_VID.toString();
  if (V_Val == null || V_Val == '') {
    console.log('VendorID not available');
  } else {
    var arr_V = V_Val.split("=");
    VendorID = arr_V[1];
    resp.VendorID = VendorID;
    console.log('VendorID=' + arr_V[1]);
  }
  /////////////// Find VendorID  End//////////////////////////////////////
  /////////////// First Name Start //////////////////////////////////////
  var str_FName = 'firstname';
  var Filt_FName = arr.filter(s => s.includes(str_FName));
  var FName_Val = Filt_FName.toString();
  if (FName_Val == null || FName_Val == '') {
    //console.log('firstname not available');
    /////////////// Last Name Start //////////////////////////////////////
    var str_LName = 'LastName';
    var Filt_LName = arr.filter(s => s.includes(str_LName));
    var LName_Val = Filt_LName.toString();
    if (LName_Val == null || LName_Val == '') { //console.log('lastname not available');
      /////////////// full_name Start //////////////////////////////////////
      var str_Name = 'full_name';
      var Filt_Name = arr.filter(s => s.includes(str_Name));
      var Name_Val = Filt_Name.toString();
      if (Name_Val == null || Name_Val == '') {
        console.log('full_name not available');
      } else {
        var arr_L = Name_Val.split("=");
        firstname = arr_L[1];
        resp.FullName = firstname;
        console.log('full_name=' + arr_L[1]);
      }
      /////////////// full_name  End//////////////////////////////////////
    } else {
      var arr_Name = LName_Val.split("=");
      firstname = arr_Name[1];
      resp.LastName = firstname;
      console.log('lastname=' + arr_Name[1]);
    }
    /////////////// Last Name  End//////////////////////////////////////
  } else {
    var arr_F = FName_Val.split("=");
    firstname = arr_F[1];
    resp.FirstName = firstname;
    console.log('firstname=' + arr_F[1]);
  }
  /////////////// First Name  End//////////////////////////////////////

  if (LeadBuyerID == null || LeadBuyerID == '') {
    LeadBuyerID = "N/A";
  }
  if (SourceChannel == null || SourceChannel == '') {
    SourceChannel = "N/A";
  }
  if (VendorID == null || VendorID == '') {
    VendorID = "N/A";
  }
  if (firstname == null || firstname == '') {
    firstname = "N/A";
  }
  client.connect();
  var queryString = "INSERT INTO public.leads (leadbuyer, source, name,vendor) VALUES (" +
    "'" + [LeadBuyerID, SourceChannel, VendorID, firstname].join("','") + "'" + ")";
  console.log(queryString);
  client.query(queryString, function(error, result) {
    console.log("err -->", error);
    console.log("result -->", result.rowCount);
    res.send(resp);
    next();
  });
});

module.exports = app;
