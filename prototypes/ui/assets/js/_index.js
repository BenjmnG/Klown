/*
	Index
				*/
let els = [...document.querySelectorAll('main nav a')]
els.forEach( function(el, i){
  el.addEventListener("mouseover", function(e) {
    // Change color
   body.setAttribute('data-cc', el.getAttribute('data-cc') ); 
   body.setAttribute('data-bg', el.getAttribute('data-bg') ); 
   // Video history
   removeClassByPrefix(body, 'fadeVideo')
    //speedUp();
    updateColor()
  });
  el.addEventListener("mouseleave", function(e) {    
    body.classList.add('fadeVideo' + (i+1));
  });
});

function speedUp(){
    let duration = parseFloat(window.getComputedStyle(body).animationDuration);
    if(duration > .15){
      console.log(duration);
       setTimeout(function(){
       (document.querySelector("body.ryochi")).style.animationDuration = (duration - .3) + 's'
       speedUp()
      }, 300);    
    }
}

