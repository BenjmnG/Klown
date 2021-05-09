let cat = body.getAttribute("data-for");
/*
	Catégorie
				*/
const mySiema = new Siema({
  selector: '#sideNav .item-container:first-of-type',
  duration: 500,
  easing: 'ease-in-out',
  perPage: 5,
  startIndex: 0,
  draggable: true,
  multipleDrag: true,
  threshold: 20,
  loop: true,
  rtl: false,
  onInit: () => {sideNav.classList.add('siema')},
  onChange: () => {},
});


/*
  Slider
          */


/*const delta = 0;
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
});*/