/**
 * Define Global Variables
 * 
*/
let sections = document.querySelectorAll('section');
let liLists = document.getElementById('navbar__list');
/**
 * End Global Variables
 * Start Helper Functions
 * 
*/
function scrollToSection(yPosition){
    window.scrollTo(0, yPosition + 30);
}


/**
 * End Helper Functions
 * Begin Main Functions
 * 
*/

// build the nav
sections.forEach((value, key)=>{
    let sectionName = value.getAttribute('data-nav');
    let liTag = document.createElement('li');
    let yPosition = value.offsetTop
    liTag.setAttribute('class', 'navbar__menu');
    liTag.innerHTML = `<a class="menu__link" onClick="scrollToSection(${yPosition})">${sectionName}</a>`;
    liLists.appendChild(liTag);
});

// Add class 'active' to section and corresponding button when near top of viewport
document.addEventListener('scroll',()=>{
    sections.forEach((value)=>{
        let sectionName = value.getAttribute('data-nav'); 
        let activatedSection = document.querySelector(`[data-nav = '${sectionName}']`);
        let aTags = document.querySelectorAll('.menu__link');
        let flag = activatedSection.classList.contains('your-active-class');
        if(this.scrollY >= value.offsetTop){
            if(!flag){
                activatedSection.classList.add('your-active-class');
            }
            aTags.forEach((element)=>{
                let flag1 = element.classList.contains('active');
                if(element.innerHTML == `${sectionName}`){
                    if(!flag1){
                        element.classList.add('active');
                    }
                }else{
                    if(flag1){
                        element.classList.remove('active');
                    }
                }
            });
        }else{
            if(flag){
                activatedSection.classList.remove("your-active-class");
            }
        }
    });

});


