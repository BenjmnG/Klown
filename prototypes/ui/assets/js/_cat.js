//let cat = body.getAttribute("data-categorie");
let Width = window.screen.width;

/*
  Carrousel
            */

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
