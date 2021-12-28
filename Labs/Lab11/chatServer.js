var net = require('net');
var eol = require('os').EOL;

var srvr = net.createServer();
var clientList = [];

var listUsers = "\\list";
var renameUser = "\\rename";
var privateMessageUser = "\\private";

srvr.on('connection', function(client) {
  client.name = client.remoteAddress + ':' + client.remotePort;
  client.write('Welcome, ' + client.name + eol);
  clientList.push(client);

  client.on('data', function(data) {
    support(data, client);
  });
});

function support(data, client) {
	data += '';

	if (data == eol) {
        return;
    }
	
	var newData = data;

	if (newData.indexOf(eol) > -1) {
        newData = newData.substring(0, newData.indexOf(eol));
    }
		
	var options = ('' + newData).split(' ');

	if (options.length > 0) {
		switch (options[0]) {
			case listUsers:
				client.write("Users List: ");
				for (let i of clientList) {
                    if (i !== client) {
                        client.write(i.name + " ");
                    } 
                }	
				client.write(eol);
				break;

			case renameUser:
				if (options.length > 1) {
					var newName = options[1] + ''; 
					client.name = newName;
					client.write("New name: " + newName + eol);
				} else {
                    client.write("Error: Name not given" + eol);
                }	
				break;

			case privateMessageUser:
				if (options.length > 2) {
					for (let i of clientList) {
                        if (i.name == options[1]) {
                            i.write(client.name + " messaged " + newData.substring(newData.indexOf(options[2])) + eol);
                        }
                    }		
				} else {
                    client.write("Error: No message sent");
                }
				break;

			default:
				broadcast(newData + eol, client);
				break;
		}
	}
}

function broadcast(data, client) {
  for (var i in clientList) {
    if (client !== clientList[i]) {
      clientList[i].write(client.name + " says " + data);
    }
  }
}

srvr.listen(9000);
