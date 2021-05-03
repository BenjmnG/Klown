/*
	Piece
				*/
if(document.querySelector('#carrousel .siema')){
  const mySiema = new Siema({
    selector: '#carrousel .siema',
    duration: 500,
    easing: 'ease-in-out',
    perPage: 1,
    startIndex: 0,
    draggable: true,
    multipleDrag: true,
    threshold: 20,
    loop: true,
    rtl: false,
    onInit: () => {},
    onChange: () => {},
  });
  document.querySelector('#carrousel .prev').addEventListener('click', () => mySiema.prev());
  document.querySelector('#carrousel .next').addEventListener('click', () => mySiema.next());	
}


/*
  Related 
          */
function relatedWith(){
  console.log('This Piece is related to other')
}

openSideNav('#related', relatedWith)