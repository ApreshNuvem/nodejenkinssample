
var chai  = require('chai');
var assert = chai.assert;

var routeHandler = require('../routes/routeHandler.js');
var filter_by_param = routeHandler.filter_by_param;


describe('Predeployment Filter Test', function() {
	
  it('should check for LeadBuyerID exists', function() {
	  var arr = ['LeadBuyerID=Ancora Education','LocationID=28','VendorID=MASH'];
	  
	  var leadBuyerId = filter_by_param(arr,'LeadBuyerID=');  	  
	  assert.notEqual(leadBuyerId,'NA');	  
  
  });
  
  
  it('should check for LocationID exists', function() {
	  var arr = ['LeadBuyerID=Ancora Education','LocationID=28','VendorID=MASH'];
	  
	  var LocationID = filter_by_param(arr,'LocationID=');  	  
	  assert.notEqual(LocationID,'NA');
  
  });
  
  
  it('should check for VendorID exists', function() {
	  var arr = ['LeadBuyerID=Ancora Education','LocationID=28','VendorID=MASH'];
	  
	  var VendorID = filter_by_param(arr,'VendorID=');  
	  assert.notEqual(VendorID,'NA');
  
  });
  
   it('should check for TestID exists', function() {
	  var arr = ['LeadBuyerID=Ancora Education','LocationID=28','VendorID=MASH'];
	  
	  var TestID = filter_by_param(arr,'TestID=');  	  
	  assert.equal(TestID, 'NA');
  
  });
  
});

