import './main.css';
import './mdl/material.min.css';
import './mdl/material.min.js';

import { Main } from './Main.elm';
import registerServiceWorker from './registerServiceWorker';

Main.embed(document.getElementById('root'));

registerServiceWorker();


setTimeout(() => {componentHandler.upgradeAllRegistered();}, 1000
);
