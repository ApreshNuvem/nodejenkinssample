var express = require('express');
var app = express();
var ip = require('ip');
var gulp = require('gulp');
var jshint = require('gulp-jshint');

app.set('port', (process.env.PORT || 5000));
app.use(express.static(__dirname + '/public'));


gulp.task('lint', function() {
  return gulp.src('./lib/*.js')
    .pipe(jshint())
    .pipe(jshint.reporter('gulp-checkstyle-jenkins-reporter'));
});
app.get('/', function(request, response) {  

   console.log("Home Request");
   response.writeHead(200, {'Content-Type': 'text/html'});
   response.write('<h1>  *** Welcome to Backer Media Lead Management Release 3 *** </h1>'+ip.address());
   response.end();
});

app.get('/company', function(request, response) {
  response.status(200);
  response.setHeader('Content-Type', 'application/json');
  response.send(JSON.stringify({ "companyName": "Appshark" }));
});

app.get('/user', function(request, response) {
  response.status(200);
  response.setHeader('Content-Type', 'application/json');
  response.send(JSON.stringify({ "userName": "User1" }));
});


app.get('/user2', function(request, response) {
  response.status(200);
  response.setHeader('Content-Type', 'application/json');
  response.send(JSON.stringify({ "userName": "User2" }));
});

app.get('/user3', function(request, response) {
  response.status(200);
  response.setHeader('Content-Type', 'application/json');
  response.send(JSON.stringify({ "userName": "User3" }));
});


app.get('/user4', function(request, response) {
  response.status(200);
  response.setHeader('Content-Type', 'application/json');
  response.send(JSON.stringify({ "userName": "User4" }));
});

app.get('/user5', function(request, response) {
  response.status(200);
  response.setHeader('Content-Type', 'application/json');
  response.send(JSON.stringify({ "userName": "Ram" }));
});


app.get('/test', function(request, response) {  
   response.writeHead(200, {'Content-Type': 'text/html'});
   response.write('<h1>  ** Welcome to Backer Media Lead Management Release 2 ** </h1>');
   response.end();
});

app.listen(app.get('port'), function() {
  console.log("Node app is running at localhost:" + app.get('port'))
});
