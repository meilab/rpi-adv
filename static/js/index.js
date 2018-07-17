import elm from '../../src/Main.elm'

var container = document.getElementById('container');
var elmApp = elm.Main.fullscreen();

// Ports to elm Application
/*
let toElm = (tag, data) => {
  elmApp.ports.infoForElm.send({tag: tag, data: data})
}

toElm('UsbDevices', ["Geely", "Volvo"])
*/
