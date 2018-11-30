// import js module using ES6 import
import _ from 'lodash';
import printMe from './print.js';

function component() {
  let element = document.createElement('div');

  // use function from a module
  element.innerHTML = _.join(['Hello', 'webpack', '! Great world'], ' ');
  // add a style class from a css module
  element.classList.add('hello');

  var btn = document.createElement('button');
  btn.innerHTML = 'Click me and check the console!';
  btn.onclick = printMe;
  element.appendChild(btn);

  return element;
}

document.body.appendChild(component());
