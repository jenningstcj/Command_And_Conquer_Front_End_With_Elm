//import './main.css';
import './material.min.css';
import './material.min.js';

import { Main } from './Main.elm';
import registerServiceWorker from './registerServiceWorker';

Main.embed(document.getElementById('root'));

registerServiceWorker();


setTimeout(() => {componentHandler.upgradeAllRegistered();}, 1000
);
