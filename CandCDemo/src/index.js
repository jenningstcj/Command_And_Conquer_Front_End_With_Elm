import './main.css';
import * as nameForm from './Main.elm';
import registerServiceWorker from './registerServiceWorker';


var app = nameForm.Elm.Main.init({
 node: document.getElementById('root')
});

registerServiceWorker();

/*
app
    .ports
    .emitFormData
    .subscribe(data => console.log('Data received:', data));


document.getElementById('nonElmButton')
	.addEventListener('click', (ev) => {
	    app
        .ports
        .receiveFormData
        .send({firstName:'John', lastName: 'Doe'});
});
*/
