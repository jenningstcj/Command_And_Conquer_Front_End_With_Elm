import './main.css';
import { Main } from './Main.elm';
import registerServiceWorker from './registerServiceWorker';


var rootDiv = document.getElementById('root');
var instance = Main.embed(rootDiv);

registerServiceWorker();

/*
instance.ports.emitFormData.subscribe(function(data){
	console.log('Data received:',data)
});


document.getElementById('nonElmButton').addEventListener('click', function(ev){
	instance.ports.receiveFormData.send({firstName:'John', lastName: 'Doe'});
});
*/
