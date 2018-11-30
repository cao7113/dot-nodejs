// import js module using ES6 import
import _ from 'lodash';
import printMe from './print.js';
import './style.css'

function component() {
  let element = document.createElement('div');

  // use function from a module
  element.innerHTML = _.join(['Hello', 'webpack'], ' ');
  // add a style class from a css module
  element.classList.add('hello');

  var btn = document.createElement('button');
  btn.innerHTML = 'Click me and check the console!';
  btn.onclick = printMe;
  element.appendChild(btn);

  return element;
}

document.body.appendChild(component());


if (module.hot) {
  module.hot.accept('./print.js', function() {
    console.log('Accepting the updated printMe module!');
    printMe();
  })
}
