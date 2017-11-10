(function () {
   'use strict';
var chai  = require('chai');
var assert = chai.assert;

var routeHandler = require('../routes/routeHandler.js');
var fuc_filt_name = routeHandler.fuc_filt_name;

describe('Filter Test', function() {
	
  it('should check if LeadBuyerID exists', function() {
  var arr = ['LeadBuyerID=Ancora Education','LocationID=28','VendorID=MASH'];

  var leadBuyerId = fuc_filt_name(arr,'LeadBuyerID=');
  
  assert.equal(leadBuyerId.lenght>0, true);
  
  
});
  
});


}());