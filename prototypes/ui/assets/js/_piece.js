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
  Sidenav
          */
let scrollContainer =  document.querySelector('.cat-container');

scrollContainer.classList.remove('noJS');          

/*
  Related 
          */
function callOn(){  
  sideNav.classList.add('related')
}
function callOff(){  
  sideNav.classList.remove('related')
}

/* 
    Open Side Nav if large screen
                                    */
let isLarge = false;
if(window.innerWidth > 700){ isLarge = true }
window.addEventListener("resize", function(){
  if(window.innerWidth > 700){ isLarge = true }
  else{ isLarge = false }
});

let zoneEl = document.querySelector('#related')
let toggleInput = document.querySelector('#toggle-sideNav')

if(!!window.IntersectionObserver){

  let observer = new IntersectionObserver((entries, observer) => { 

    entries.forEach(entry => {

      if(entry.isIntersecting){
        // Prevent True on small width
        if(isLarge){
          (entry.target).scrollIntoView(
            {block: "end"}
          );
          toggleInput.checked = true;
          if(callOn){callOn()}            
        }
      } else{
        toggleInput.checked = false;
        if(callOff){callOff()}
      }
    
    });

  }, {threshold: 0.5});

  if(zoneEl){
    observer.observe(zoneEl);
  }
}
