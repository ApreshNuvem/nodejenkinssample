'use strict';

 /*============================================================================
     Author      : Adithya
     Module      : server.index
     Date        : 11-Nov-2017
     History     : Initial Draft (11-Nov-2017)
     Description : A single instance of Node runs in a single thread.
     To take advantage of multi - core systems the user will sometimes want
     to launch a cluster of Node processes to handle the load.
     The cluster module allows you to easily create child processes that all
     share server ports.
     =========================================================================*/

var cluster = require('cluster');
var os = require('os');
var server = require('./server');

if (cluster.isMaster) {
    var idx = 0;
    for (idx; idx < os.cpus().length; idx++) {
        cluster.fork();
    }
    cluster.on('fork', function(worker) {
        console.log('forking worker: #' + worker.id + ' (' +
                worker.process.pid + ')');
    });
    cluster.on('online', function(worker) {
        console.log('worker #' + worker.id + ' is online');
    });
    cluster.on('listening', function(worker, address) {
        console.log('worker #' + worker.id + ' is connected to ' +
                address.address + ':' + address.port);
    });
    cluster.on('disconnect', function(worker) {
        console.log('worker #' + worker.id + ' has dis-connected');
    });
    cluster.on('exit', function(worker) {
        console.log('worker #' + worker.id + ' has exited with code: ' +
                worker.process.exitCode);
        // if server down, it needs to up automatically(required for Release)
        cluster.fork();
    });
} else {
    server();
}
