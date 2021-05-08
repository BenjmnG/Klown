body = document.querySelector('body');

/* 
		Side 
					*/

/*let cats = [...document.querySelectorAll('.cat')] 
cats.forEach( function(el, i){

	el.addEventListener("mouseover", function(e) {
		// Set Show as focus
		if(!el.classList.contains("show")){
			document.querySelector(".cat.show").classList.remove("show")
			el.classList.add("show")
		}
	});

});

let els = [...document.querySelectorAll('.cat .item')]
els.forEach( function(el, i){
	el.addEventListener("click", function(e) {
		// Change color
		removeClassByPrefix(body, 'bg')
		body.classList.add('bg' + el.closest('.cat').getAttribute("data-color"));
	});
});
*/


/* 
		Strobos 
						*/

let strobos = document.querySelector('#i-strobos');
function toggleStrobos(){
	if(strobos.checked == true){
		body.classList.add('pulse')
	} else {
		body.classList.remove('pulse')	
	}
}

toggleStrobos();

strobos.addEventListener("change", function(e) {
	toggleStrobos();
});


/* 
		Open Side Nav 
									*/
function openSideNav(zone, callOn, callOff){
  let zoneEl = document.querySelector(zone)
  let toggle_sideNav = document.querySelector('#toggle-sideNav')

  if(!!window.IntersectionObserver){

    let observer = new IntersectionObserver((entries, observer) => { 

      entries.forEach(entry => {

        if(entry.isIntersecting){
          (entry.target).scrollIntoView(
          	{block: "end"}
          );
          toggle_sideNav.checked = true;
          if(callOn){callOn()}
        } else{
          toggle_sideNav.checked = false;
          if(callOff){callOff()}
        }

      });

    }, {threshold: 0.5});

    if(zoneEl){
      observer.observe(zoneEl);
    }
  }

}