import './main.css';
import { Main } from './Main.elm';
import registerServiceWorker from './registerServiceWorker';


let rootDiv = document.getElementById('root');
let instance = Main.embed(rootDiv);

registerServiceWorker();

/*
instance.ports.emitFormData.subscribe((data) => {
	console.log('Data received:',data)
});


document.getElementById('nonElmButton').addEventListener('click', (ev) => {
	instance.ports.receiveFormData.send({firstName:'John', lastName: 'Doe'});
});
*/
