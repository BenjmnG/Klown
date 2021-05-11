/*
	Index
				*/
let els = [...document.querySelectorAll('main nav a')]
let videos = [...document.querySelectorAll('main videos')];
els.forEach( function(el, i){
  el.addEventListener("mouseover", function(e) {
    // Change color
    let cc = el.getAttribute('data-cc');
    let bg = el.getAttribute('data-bg');
    body.classList = 'bg' + bg.toUpperCase() + ' ' +
                     'cc' + cc.toUpperCase() + ' ' +
                     'ryochi';

    //videos.forEach( function(v, iv){ v.classList.remove('wasActivate')});
    //speedUp();
  });
  el.addEventListener("mouseleave", function(e) {
    // Change color
    let cc = body.getAttribute('data-cc');
    let bg = body.getAttribute('data-bg');
    body.classList = 'bg' + bg.toUpperCase() + ' ' +
                     'cc' + cc.toUpperCase() + ' ';
    
    toggleStrobos()                     
    
    //(el.nextElementSibling).classList.add('wasActivate');
    body.removeAttribute('style');
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

