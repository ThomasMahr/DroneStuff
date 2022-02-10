var arDrone = require('ar-drone');
var client = arDrone.createClient();

client.takeoff();

client
	//.after(5000, function() { //after 5 seconds
	//	this.clockwise(0.5); //turn clockwise at half speed
	//})
	.after(7000, function() { //after 3 seconds
		this.stop(); //stop turning and then land the drone
		this.land(); 
	})
