
let sortOptions = [...document.querySelectorAll('.sort-options label')]
sortOptions.forEach( function(el, i){
  el.addEventListener("click", function(){

    if(bodyId == "categorie"){
      setTimeout(function(){
        scrollContainer.scrollLeft = 0;
      }, 300);
    }
    
    // reset if double clic
    let id = el.getAttribute('for'),
        input = document.getElementById(id);
    if(input.checked){ 
      setTimeout(function(){
        document.getElementById('medium-reset').checked = true;
      }, 300);
    }
  });
});