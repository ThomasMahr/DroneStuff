//Key press basics
//
//
//


/*const readline = require('readline');
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

var readline = require('readline');

readline.emitKeypressEvents(process.stdin);

if (process.stdin.isTTY)
	process.stdin.setRawMode(true);


process.stdin.on('keypress', (chunk, key) => {
	if (key && key.name == 'q')
		process.exit();
	else if (key) {
		console.log(key.name);
	}
});

