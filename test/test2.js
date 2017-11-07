var supertest = require("supertest");
var should = require("should");
var ip = require('ip');
var request = supertest.agent("http://localhost:5000/");
//var request = supertest.agent("https://sampleherokuappshark.herokuapp.com/");

describe("Test 2",function(){

  it("Check user2 Api Status Code 200  ", function (done) {
      request
      .get('user3')
      .set('Accept', 'application/json')
      .expect(200)
      .end(function(err, res) {
        if (err) return done(err);
        done();
      });
  });
  
  
  it("Check user3 Api Status Code 200  ", function (done) {
      request
      .get('user4')
      .set('Accept', 'application/json')
      .expect(200)
      .end(function(err, res) {
        if (err) return done(err);
        done();
      });
   });

});
