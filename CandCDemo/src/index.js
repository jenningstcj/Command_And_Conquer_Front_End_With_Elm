import './main.css';
import { Main } from './Main.elm';
import registerServiceWorker from './registerServiceWorker';


var rootDiv = document.getElementById('root');
var instance = Main.embed(rootDiv);

registerServiceWorker();

/*
instance.ports.sendDataOutside.subscribe(function(data){
	console.log('Data received:',data)
});


rootDiv.addEventListener('contextmenu', function(ev){
	ev.preventDefault();
	instance.ports.receiveDataFromOutside.send({firstName:'John', lastName: 'Doe'});
});
*/
