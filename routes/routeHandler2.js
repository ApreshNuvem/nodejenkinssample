(function () {
   'use strict';
//defining constants & variables
var express = require('express');
var app = express.Router();


/**
 * Default Homepage
 */
app.get('/test/newapi', function(req, res, next) {
res.send("<h2> Test Path New Api </h2>");
});

}());