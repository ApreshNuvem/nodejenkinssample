'use strict';
const express = require('express');
const bodyParser = require('body-parser');
const routes = require('../routes/routeHandler');
var build = require('../config/build').Build;

/**
 * CreateServer: To Create a Server instance & to execute the middleware
 * functions in a specified manner.
 * returns server {Object} instance of a server
 */

function CreateServer() {
  var app = express();
  var rawBodySaver = function(req, res, buf, encoding) {
    if (buf && buf.length) {
      req.rawBody = buf.toString(encoding || 'utf8');
    }
  }
  app.use(bodyParser.json({
    verify: rawBodySaver
  }));
  app.use(bodyParser.urlencoded({
    verify: rawBodySaver,
    extended: true
  }));
  app.use(bodyParser.raw({
    inflate: true,
    limit: '9999kb',
    verify: rawBodySaver,
    type: function() {
      return true
    }
  }));
  app.use('/', routes);
  app.listen(build.Environment[build.Type].Port);
  console.log("Listening on --->", build.Environment[build.Type].Port);
  return app;
}
module.exports = CreateServer;
