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
		body.classList.add('motion')
	} else {
		body.classList.remove('motion')	
	}
}

toggleStrobos();

strobos.addEventListener("change", function(e) {
	toggleStrobos();
});