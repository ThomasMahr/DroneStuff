var arDrone = require('ar-drone');
var client = arDrone.createClient();
//client.takeoff();
client
	.after(1000,  function() {
    var keyPressed = false;
console.log("its working");
    //$(document).keydown(keydownListener)
      //         .keyup(keyupListener);

    function keydownListener(event) {

        var useKeyboardForNavigation = $("#cbx-use-keyboard").is(":checked");

//	if (!keyPressed && useKeyboardFor Navigation){


        if (!keyPressed && useKeyboardForNavigation) {
	var key= "";
            switch (event.which) {
                //Right hand controls
		    case 73: // i key
			//client.moveForward();
                    //moveForward();
                    keyPressed = true;
			console.log("i key was pressed");
                    break;
                case 75: // K key
                    //moveBackward();
                    keyPressed = true;
			console.log("k key was pressed");
                    break;
                case 76: // L key
                    //moveRighti();
                    keyPressed = true;
			console.log("L key was pressed");
                    break;
                case 74: // J key
                    //moveLeft();
                    keyPressed = true;
			console.log("J key was pressed");
                    break;

		//Left hand controls
                case 87: // w key
                    //moveForward();
                    keyPressed = true;
			console.log("w key was pressed");
                    break;
                case 83: // s key
                    //moveBackward();
                    keyPressed = true;
			console.log("s key was pressed");
                    break;
                case 68: // d key
                    //moveRotateR();
                    keyPressed = true;
			console.log("d key was pressed");
                    break;
                case 65: // a key
                    //moveRotateL();
                    keyPressed = true;
			console.log("a key was pressed");
                    break;
                case 32: // space key
                    //client.land();
                    keyPressed = true;
			console.log("space key was pressed");
                    break;
	    }
	}
    }
});
