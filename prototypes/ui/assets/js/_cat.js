let cat = body.getAttribute("data-for");
/*
	Catégorie
				*/

/*const mySiema = new Siema({
  selector: '#carrousel .siema',
  duration: 500,
  easing: 'ease-in-out',
  perPage: 1,
  startIndex: 0,
  draggable: true,
  multipleDrag: true,
  threshold: 20,
  loop: true,
  rtl: false,
  onInit: () => {},
  onChange: () => {},
});
document.querySelector('#carrousel .prev').addEventListener('click', () => mySiema.prev());
document.querySelector('#carrousel .next').addEventListener('click', () => mySiema.next());	
*/

/*
  Catégorie pieces
                    */

function sideAsLine(){
  sideNav.classList.add('inline');
}
function sideAsCol(){
  sideNav.classList.remove('inline');
}

openSideNav('#pièces', sideAsLine, sideAsCol)

/*
  Slider
          */

/*let isDown = false;
let startX;
let scrollLeft;
const slider = document.querySelector('.cat-container');

const end = () => {
  isDown = false;
  slider.classList.remove('active');
}

const start = (e) => {
  isDown = true;
  slider.classList.add('active');
  startX = e.pageX || e.touches[0].pageX - slider.offsetLeft;
  scrollLeft = slider.scrollLeft; 
}

const move = (e) => {
  if(!isDown) return;

  e.preventDefault();
  const x = e.pageX || e.touches[0].pageX - slider.offsetLeft;
  const dist = (x - startX);
  slider.scrollLeft = scrollLeft - dist;
}

(() => {
  slider.addEventListener('mousedown', start);
  slider.addEventListener('touchstart', start);

  slider.addEventListener('mousemove', move);
  slider.addEventListener('touchmove', move);

  slider.addEventListener('mouseleave', end);
  slider.addEventListener('mouseup', end);
  slider.addEventListener('touchend', end);
})();
*/

const delta = 6;
let startX;
let startY;
let scrollLeft;

const slider = document.querySelector('.cat-container ');

slider.addEventListener('mousedown', function (event) {
  startX = event.pageX || event.touches[0].pageX - slider.offsetLeft;
  startY = event.pageY;

  slider.classList.add('active');
  scrollLeft = slider.scrollLeft;   
});

slider.addEventListener('mouseup', function (event) {
  event.preventDefault();
  const x = event.pageX || event.touches[0].pageX - slider.offsetLeft;
  const diffX = Math.abs(x - startX);
  console.log(x)
  if (diffX < delta) {
    // Click!
  } else {
    const dist = (x - startX);
    slider.scrollLeft = scrollLeft - dist;
  }
  slider.classList.remove('active');
});