let body = document.querySelector('body'), 
		bodyId = body.id,
		toggleSideNav = document.querySelector('#toggle-sideNav'),
		sideNav = document.querySelector('#sideNav');

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
		Change Favicon & theme color based on data-bg 
						*/
function updateColor(){
	let currentBg = body.getAttribute('data-bg'),
			currentBgHex;

	if(currentBg == 'w'){currentBgHex = '#ffffff'}
	else if(currentBg == 'k'){currentBgHex = '#262626'}
	else if(currentBg == 'r'){currentBgHex = '#db0d06'}

	//console.log('Colors Changes → ', currentBg, currentBgHex)
	
	document.querySelector('meta[name="theme-color"]').setAttribute("content", currentBgHex);
	document.querySelectorAll('link[rel="icon"]')[0].setAttribute("href", 'static/favicon-' + currentBg + '.ico');
	document.querySelectorAll('link[rel="icon"]')[1].setAttribute("href", 'static/favicon-' + currentBg + '.svg');
	document.querySelector('link[rel="apple-touch-icon"]').setAttribute("href", 'static/apple-touch-icon-' + currentBg + '.png');

}

