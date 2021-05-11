/*
	Index
				*/
let els = [...document.querySelectorAll('main nav a')]
let videos = [...document.querySelectorAll('main videos')];
els.forEach( function(el, i){
  el.addEventListener("mouseover", function(e) {
    // Change color
    let cc = body.getAttribute('data-cc');
    let bg = el.getAttribute('data-bg');
    body.classList = 'bg' + bg.toUpperCase() + ' ' +
                     'cc' + cc.toUpperCase() + ' ' +
                     'ryochi';

    videos.forEach( function(v, iv){ v.classList.remove('wasActivate')});
  });
  el.addEventListener("mouseleave", function(e) {
    // Change color
    let cc = body.getAttribute('data-cc');
    let bg = body.getAttribute('data-bg');
    body.classList = 'bg' + bg.toUpperCase() + ' ' +
                     'cc' + cc.toUpperCase() + ' ' +
                     'pulse';
    //body.classList.replace('ryochi', 'pulse')
    (el.nextElementSibling).classList.add('wasActivate');
  });
});