// import js module using ES6 import
import _ from 'lodash';
// import style files
import './style.css';
// import image files, url in a variable 
import Icon from './icon.png';
// load data file, parsed to json data
import Data from './data.xml';

function component() {
  let element = document.createElement('div');

  // use function from a module
  element.innerHTML = _.join(['Hello', 'webpack', '! Great world'], ' ');
  // add a style class from a css module
  element.classList.add('hello');

  // Add the image to our existing div.
  var myIcon = new Image();
  // this is processed url of the image file
  myIcon.src = Icon;
  element.appendChild(myIcon);

  console.log(Data);

  return element;
}

document.body.appendChild(component());
