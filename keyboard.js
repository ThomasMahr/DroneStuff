//Key press basics
//
//
//

/*
const readline = require('readline');
const { Readable } = require('stream');

const inStream = new Readable({
	read() { console.log('in reading'); }
});

let i = 0;
setInterval(() => { inStream.push(`${i++}`) }, 1000)
readline.emitKeypressEvents(inStream);

inStream.on('keypress', (...ar) => {
	console.log(ar);
});*/
/*
var readline = require('readline');

readline.emitKeypressEvents(process.stdin);
from Pyside import QtCore, QtGui;

if (process.stdin.isTTY)
	process.stdin.setRawMode(true);


process.stdin.on('keypress', (chunk, key) => {
	if (key && key.name == 'q')
		process.exit();
	else if (key) {
		console.log("Keypressed: ", key.name);
	}
var pitchForward = 'i';
var pitchBackward = 'k';
var rollLeft = 'j';
var rollRight
var yawLeft
var yawRight
var up
var down
var takeoff
var land

	class KeyMapping(object){
		PitchForward     = QtCore.Qt.Key.Key_E
		PitchBackward    = QtCore.Qt.Key.Key_D
		RollLeft         = QtCore.Qt.Key.Key_S
		RollRight        = QtCore.Qt.Key.Key_F
		YawLeft          = QtCore.Qt.Key.Key_W
		YawRight         = QtCore.Qt.Key.Key_R
		IncreaseAltitude = QtCore.Qt.Key.Key_Q
		DecreaseAltitude = QtCore.Qt.Key.Key_A
		Takeoff          = QtCore.Qt.Key.Key_Y
		Land             = QtCore.Qt.Key.Key_H
	}
});*/
var arDrone = require('ar-drone');
var client = arDrone.createClient();


var readline = require('readline');

//_________
const { exec } = require("child_process");

exec("cat /home/kali/DroneStuff/textStuff/dronePic.txt | lolcat -f ; figlet '\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tDRONEZ!!!' | lolcat -f", (error, stdout, stderr) => {
    if (error) {
        console.log(`error: ${error.message}`);
        return;
    }
    if (stderr) {
        console.log(`stderr: ${stderr}`);
        return;
    }
    console.log(`${stdout}`);
});
//________
readline.emitKeypressEvents(process.stdin);


if (process.stdin.isTTY)
        process.stdin.setRawMode(true);
console.log("q = quit\nUp arrow = takeoff\nDown arrow = land\nLeft arrow = FTRIM (do not use during flight)\nRight arrow = magnetometer callibration (used in air)\nSpace = hover");
process.stdin.on('keypress', (chunk, key) => {

        if (key && key.name == "q")
                process.exit();
	else if (key && key.name == "up"){
		client.takeoff();
		client.stop();
	}
	else if (key && key.name == "down"){
		client.land();
	}
	else if (key && key.name == "space"){
		client.stop();
	}
	else if (key && key.name == "left"){ //FTRIM - do NOT use during flight
		client.callibrate(1);
	}
	else if (key && key.name == "right"){ //magnetometer callibration - can be used during flight
		client.callibrate(0);
	}
/*----------------------left hand control--------------------------*/
	if (key && key.name == "w")
		client.up(.2);
	else if (key && key.name == "s"){
		client.down(.2);
	}
	else if (key && key.name == "d"){
		client.clockwise(.2);

	}
	else if (key && key.name == "a"){
		client.counterClockwise(.2);
	}
/*----------------------right hand control--------------------------*/
	if (key && key.name == "i")
		client.front(.2);
	else if (key && key.name == "k"){
		client.back(.2);
	}
	else if (key && key.name == "j"){
		client.left(.2);
	}
	else if (key && key.name == "l"){
		client.right(.2);
	}

	client.stop();
});
