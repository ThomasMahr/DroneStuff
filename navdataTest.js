var arDrone = require('ar-drone');
const fs = require('fs');
var client = arDrone.createClient();


//client.on('navdata', console.log);
//client.on('navdata.demo.batteryPercentage', console.log);
//client.on('navdata.demo', console.log);

/*client.on('navdata', function(navdata) {
	console.log(navdata.demo.batteryPercentage);
});*/


var lastNavDataMs = 0;

client.on('navdata', function(d) {
	var nowMs = new Date().getTime();
	if (nowMs - lastNavDataMs > 1000) {
		lastNavDataMs = nowMs;
		if (d.demo){
			/*console.log('battery = ' + d.demo.batteryPercentage);
			console.log('pitch = ' + d.demo.rotation.pitch);
			console.log('roll = ' + d.demo.rotation.roll);
			console.log('yaw = ' + d.demo.rotation.yaw);*/
			var string = "Battery = ";
			string += String(d.demo.batteryPercentage);
			string += "\nPitch = ";
			string += String(d.demo.rotation.pitch);
			string += "\nRoll = ";
			string += String(d.demo.rotation.roll);
			string += "\nYaw = ";
			string += String(d.demo.rotation.yaw);
			string += "\n";
			fs.appendFile('output.txt', string, err => {
				if (err) {
					console.error(err)
					return
				}
			})
		}
	}
});
