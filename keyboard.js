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

readline.emitKeypressEvents(process.stdin);

if (process.stdin.isTTY)
        process.stdin.setRawMode(true);


process.stdin.on('keypress', (chunk, key) => {
        if (key && key.name == "q")
                process.exit();
	else if (key && key.name == "up"){
		client.takeoff();
	}
	else if (key && key.name == "down"){
		client.land();
	}
}
/*----------------------left hand control--------------------------*/
process.stdin.on('keypress', (chunk, key) => {
	if (key && key.name == "w")
		client.up();
	else if (key && key.name == "s"){
		client.down();
	}
	else if (key && key.name == "d"){
		client.clockwise(.5);
	}
	else if (key && key.name == "a"){
		client.counterClockwise(.5);
	}
}
/*----------------------right hand control--------------------------*/
process.stdin.on('keypress', (chunk, key) => {
	if (key && key.name == "i")
		client.front(.5);
	else if (key && key.name == "k"){
		client.back(.5);
	}
	else if (key && key.name == "j"){
		client.left();
	}
	else if (key && key.name == "l"){
		client.right();
	}	
        else if (key) {
                console.log("Keypressed: ", key.name);
        }
   
});
