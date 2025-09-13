(function(){
  const navbar = document.querySelector('.navbar');
  const hamburger = document.createElement('button');
  hamburger.className = 'hamburger';
  hamburger.setAttribute('aria-label','Toggle navigation');
  hamburger.setAttribute('aria-expanded','false');
  hamburger.innerHTML = `<span class="bar" aria-hidden="true"></span>`;
  const logo = navbar.querySelector('.logo');
  logo.insertAdjacentElement('afterend', hamburger);

  const navLinks = navbar.querySelector('.nav-links');
  const links = Array.from(navLinks.querySelectorAll('a'));

  function toggleMenu(open){
    const isOpen = open === undefined ? !navbar.classList.contains('open') : !!open;
    navbar.classList.toggle('open', isOpen);
    hamburger.setAttribute('aria-expanded', isOpen ? 'true' : 'false');
  }

  hamburger.addEventListener('click', (e)=>{
    e.stopPropagation();
    toggleMenu();
  });

  document.addEventListener('click', (e)=>{
    if(navbar.classList.contains('open') && !navbar.contains(e.target)){
      toggleMenu(false);
    }
  });

  links.forEach(a=>{
    a.addEventListener('click', (ev)=>{
      links.forEach(x=>x.classList.remove('active'));
      a.classList.add('active');
      if(window.innerWidth <= 860) toggleMenu(false);
    });
  });

  const sections = links
    .map(a => {
      const id = (a.getAttribute('href') || '').replace('#','');
      if(!id) return null;
      const el = document.getElementById(id);
      return el ? {link: a, el} : null;
    })
    .filter(Boolean);

  let ticking = false;
  function onScroll(){
    if(ticking) return;
    ticking = true;
    requestAnimationFrame(()=>{
      const top = window.scrollY + (window.innerHeight * 0.12);
      let current = null;
      for(const s of sections){
        const rect = s.el.getBoundingClientRect();
        const elTop = window.scrollY + rect.top;
        if(elTop <= top) current = s.link;
      }
      if(current){
        links.forEach(x=>x.classList.remove('active'));
        current.classList.add('active');
      }
      ticking = false;
    });
  }
  window.addEventListener('scroll', onScroll, {passive:true});
  onScroll();

  // keyboard: close on Escape
  window.addEventListener('keydown', (e)=>{
    if(e.key === 'Escape' && navbar.classList.contains('open')) toggleMenu(false);
  });

  // accessibility: trap focus when mobile nav open (basic)
  document.addEventListener('focusin', (e)=>{
    if(!navbar.classList.contains('open')) return;
    if(!navbar.contains(e.target)) {
      // keep focus within navbar
      const focusable = navbar.querySelectorAll('a,button, [tabindex]:not([tabindex="-1"])');
      if(focusable.length) focusable[0].focus();
    }
  });

})();
