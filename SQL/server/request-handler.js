var url = require('url');
var fs = require('fs');
var persistent = require(__dirname + '/../persistent_server');

var _chatrooms = {lobby: [{username: "bill", message: "this is dummby data", roomname: "lobby", createdAt: new Date()}]};//{lobby: 'lobby'};

var handleRequest = function(request, response) {
  console.log("Serving request type " + request.method + " for url " + request.url);
  var headers =  {
    "access-control-allow-origin": "*",
    "access-control-allow-methods": "GET, POST, PUT, DELETE, OPTIONS",
    "access-control-allow-headers": "content-type, accept",
    "access-control-max-age": 10, // Seconds.
    "content-type": "application/json"
  };


  var chatroom = (url.parse(request.url).pathname).split('/')[2];  //this is a hack!! fix me!
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
var handleGet = function(request, response, headers, chatroom) {
  response.writeHead(200, headers);
  //room_ID should be passed in getFromDB however
  // currently chatroom is a string not connected to ID
  // to fix in refactor
  var fromdB = persistent.getFromDB();
  console.log(fromDB);
  response.end(JSON.stringify( fromDB ));
};

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
    POST.createdAt = new Date();
    _chatrooms[chatroom].push(POST);
  });
  response.writeHead(201, headers);
  response.end();
};




exports.handleRequest = handleRequest;