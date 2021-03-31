body = document.querySelector('body');

let buttons = [...document.querySelectorAll('button')] 
buttons.forEach( function(el, i){
	
	let from, to, click;

	el.addEventListener("mouseover", function(e) {
			
			from = body.classList[0];
			to = el.getAttribute('data-→');		
	    click = false;

	    if( from[2] == to){
	    	// if actual & targeted color are the same so take alternative
				to = el.getAttribute('data-←');
	    }

	    body.classList = from + '→' + to;
	});

	el.addEventListener("click", function(e) {
    click = true;
    body.classList = 'bg' + to + ' motion';
	});

	el.addEventListener("mouseout", function(e) {
		if(!click){
    	body.classList = 'bg' + from[2] + ' motion';
		}
	});

});