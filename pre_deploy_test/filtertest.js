(function () {
   'use strict';
var chai  = require('chai');
var assert = chai.assert;

var routeHandler = require('../routes/routeHandler.js');
var filter_by_param = routeHandler.filter_by_param;


console.log("teset",process.env.NODE_ENV);

describe('Predeployment Filter Test', function() {
	
  it('should check for LeadBuyerID exists', function() {
	  var arr = ['LeadBuyerID=Ancora Education','LocationID=28','VendorID=MASH'];
	  
	  var leadBuyerId = filter_by_param(arr,'LeadBuyerID=');  
	  assert.equal(leadBuyerId.length>0, true);
  
  });
  
  
  it('should check for LeadBuyerID exists', function() {
	  var arr = ['LeadBuyerID=Ancora Education','LocationID=28','VendorID=MASH'];
	  
	  var leadBuyerId = filter_by_param(arr,'LocationID=');  
	  assert.equal(leadBuyerId.length>0, true);
  
  });
  
  
  it('should check for LeadBuyerID exists', function() {
	  var arr = ['LeadBuyerID=Ancora Education','LocationID=28','VendorID=MASH'];
	  
	  var leadBuyerId = filter_by_param(arr,'LeadBuyerID=');  
	  assert.equal(leadBuyerId.length>0, true);
  
  });
  
});


}());