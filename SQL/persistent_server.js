var http = require("http");
var mysql = require('mysql');
var url = require('url');
var fs = require('fs');
var q = require('q');
// var requestHandler = require("./request-handler.js");
// var handler = require(__dirname + '/server/request-handler');

var port = 8080;
var ip = "127.0.0.1";
var _chatrooms = {lobby: [{username: "bill", message: "this is dummby data", roomname: "lobby", createdAt: new Date()}]};//{lobby: 'lobby'};

var dbConnection = mysql.createConnection({
  user: "root",
  password: "",
  database: "chat",
  port: 3306,
  host: ip
});
dbConnection.connect();

// dbConnection.query("describe messages;", function(err,data){
//   if (err) throw err;
//   console.log(data);
// });


var requestListener = function (request, response) {
  console.log("Serving request type " + request.method + " for url " + request.url);
  var headers =  {
    "access-control-allow-origin": "*",
    "access-control-allow-methods": "GET, POST, PUT, DELETE, OPTIONS",
    "access-control-allow-headers": "content-type, accept",
    "access-control-max-age": 10, // Seconds.
    "content-type": "application/json"
  };

//FIXME: 
  var chatroom = (url.parse(request.url).pathname).split('/')[2];  //TODO: this is a hack!! fix me!
  // Switches between request methods
  if (chatroom) {
    _chatrooms[chatroom] = ( _chatrooms[chatroom] ) ? _chatrooms[chatroom]: [];
    if (request.method === 'GET'){
      handleGet(request, response, headers, chatroom);
    } else if (request.method === 'POST'){
      handlePost(request, response, headers, chatroom);
    } else if (request.method === 'OPTIONS'){
      response.writeHead(200, headers);
      response.end();
    }
  } else {
    response.writeHead(404, headers);
    response.end();
  }
};


//
//  ---------- GET Request Method Handlers ---------------------
//

  //room_ID should be passed in getFromDB however
  // currently chatroom is a string not connected to ID
  // to fix in refactor
var handleGet = function(request, response, headers, chatroom) {
  response.writeHead(200, headers);
  // console.log(request.);
  return getFromDB(1, function(data){
    console.log("GOT response from Database: <>");
    response.end(JSON.stringify( data ));
  });
};

var intializeClient = function(request, response, newData, headers){
  //send back to client room id
  //user id
  console.log('::::::: intitalizing client ::::::::');
  var referenceIDs = {};

  getUserID(newData.username, function(id){
    referenceIDs.user_ID = id;
    getRoomID(newData.chatroom, function(id){
      referenceIDs.room_ID = id;
    });
  });

  response.writeHead(201, headers);   //this is happening twice!
  response.end(JSON.stringify(referenceIDs));

};

var getFromDB = function(room_ID, cb){
  room_ID = room_ID || 1;
  var queryString = 'select * from messages where room_ID = '+room_ID+';';
  return dbConnection.query(queryString, function(err, data){
    if (err) throw err;
    cb(data);
  });
};

var getRoomID = function(chatroom, cb){
  var queryString = 'SELECT * FROM rooms WHERE name=\''+chatroom+'\';';
  return dbConnection.query(queryString, function(err,data){
    if (err) throw err;
    cb(data[0].id);
  });
};
var getUserID = function(username, cb){
  var queryString = 'SELECT * FROM users WHERE username=\''+username+'\';';
  return dbConnection.query(queryString, function(err,data){
    if (err) throw err;
    console.log(data);
    cb(data[0].id);
  });
};

//this is a test
//
//  ---------- POST Request Method Handlers ---------------------
//
var handlePost = function(request, response, headers, chatroom, userID) {
  var body = "";
  request.on('data', function(data){
    body += data;
  });
  request.on('end', function(){
    var POST = JSON.parse(body);
    console.log("this is what we POST: ", POST);

    if(POST.isFirstConnect){
      intializeClient(request, response, POST, headers);
    }else{
      POST.createdAt = new Date();
      //need POST to reflect {user_ID, room_ID, content, createdAt}
      postToDB(POST);
      response.writeHead(201, headers);
      response.end();
    }

  });
};

var postToDB = function(post){
  var queryString = 'INSERT INTO messages SET ?';
  return dbConnection.query(queryString, post, function(err){
    if (err) throw err;
    console.log('successfully inserted');
  });
};

// ---------- this starts the server after everything is initalized
var server = http.createServer(requestListener);
server.listen(port, ip);