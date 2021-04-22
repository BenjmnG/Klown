/*
	Piece
				*/

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

/*
  Related 
          */

let relatedEl = document.querySelector('#related')
let toggle_sideNav = document.querySelector('#toggle-sideNav')

if(!!window.IntersectionObserver){
  let observer = new IntersectionObserver((entries, observer) => { 
    entries.forEach(entry => {
      if(entry.isIntersecting){
        (entry.target).scrollIntoView({block: "end"});
        //observer.unobserve(entry.target);
        toggle_sideNav.checked = true;
      } else{
        toggle_sideNav.checked = false;
      }
    });
  }, {rootMargin: "50% 0px -25% 0px"});
  if(relatedEl){
    observer.observe(relatedEl);
  }
}
