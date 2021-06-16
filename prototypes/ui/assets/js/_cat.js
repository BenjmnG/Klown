let cat = body.getAttribute("data-for");
let Width = window.screen.width;
/*
	Catégorie
				*/
/*const mySiema = new Siema({
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
  onInit: () => {
    sideNav.classList.add('siema')
  },
  onChange: () => {},
});

window.addEventListener("resize", function(){
  mySiema.resizeHandler()
});*/



let scrollContainer =  document.querySelector('.cat-container'),
    scrollTrigger = document.querySelector('#scrollTrigger'),
    step = (document.body.clientWidth)*.9,
    delta = step/4;

scrollContainer.classList.remove('noJS');

scrollTrigger.addEventListener("click", function(){
  if (scrollContainer.offsetWidth + scrollContainer.scrollLeft + delta >= scrollContainer.scrollWidth) {
    scrollContainer.scrollLeft = 0    
  } else{
    scrollContainer.scrollBy(step ,0)
  }
});

let sortOptions = [...document.querySelectorAll('.sort-options label')]
sortOptions.forEach( function(el, i){
  el.addEventListener("click", function(){

    setTimeout(function(){
      scrollContainer.scrollLeft = 0;
    }, 300);
    
    // reset if double clic
    let id = el.getAttribute('for'),
        input = document.getElementById(id);
    if(input.checked){ 
      setTimeout(function(){
        document.getElementById('medium-reset').checked = true;
      }, 300);
    }
  });
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