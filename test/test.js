var supertest = require("supertest");
var should = require("should");

var build_url = process.env.BUILD_URL;
var request = supertest.agent(build_url);


console.log(build_url);
describe("Test 1",function(){

  it("Check Company Api Status Code 200", function (done) {
      request
      .get('company')
      .set('Accept', 'application/json')
      .expect(200)
      .end(function(err, res) {
        if (err) return done(err);
        done();
      });
  });
  
  
  it("Check User Api Status Code 200", function (done) {
      request
      .get('user')
      .set('Accept', 'application/json')
      .expect(200)
      .end(function(err, res) {
        if (err) return done(err);
        done();
      });
   });

});
