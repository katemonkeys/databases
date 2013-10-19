var mysql = require('mysql');
var basic = require(__dirname + '/server/basic-server');
// var handler = require(__dirname + '/server/request-handler');

var dbConnection = mysql.createConnection({
  user: "root",
  password: "",
  database: "chat"
});

dbConnection.connect();
/* Now you can make queries to the Mysql database using the
 * dbConnection.query() method.
 * See https://github.com/felixge/node-mysql for more details about
 * using this module.*/

/* You already know how to create an http server from the previous
 * assignment; you can re-use most of that code here. */

module.exports.getFromDB = function(room_ID){
  room_ID = room_ID || 1;
  var queryString = 'Select * from messages where room_ID =' + room_ID +";";
  return dbConnection.query(queryString, function(err){
    if (err) throw err;
    console.log("retrieved from database");
  });
};

