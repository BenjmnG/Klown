let cat = body.getAttribute("data-for");
let Width = window.screen.width;

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