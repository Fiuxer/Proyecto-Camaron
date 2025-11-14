window.onload = () => {
  const t2 = SplitText('.text2');
  const color1 = '#5995fbff';
  const color2 = '#ffffffff';

  const movebar = () => {
    const width = gsap.getProperty('.text1', 'width');
    const part = window.innerWidth/3.7;
    gsap.set('.title-bar', { left: width/2 + part }); // offset
  };

  const tl = gsap.timeline({ delay: 0.2 });

  tl.set('.text1', { color: color1, fontWeight: '300' })
    .set('.text2', {
      color: color2,
      fontWeight: '700',
      opacity: 0,
      x: gsap.getProperty('.text1', 'width') - 2
    })
    .set('.title-bar', { left: 360, backgroundColor: color1 })

    // typing effect with synced movebar
    .from('.text1', {
      duration: 1.1,
      width: 0,
      ease: "steps(14)",
      onUpdate: movebar
    }, 2.5)

    .to('.title-bar', {
      duration: 0.05,
      backgroundColor: color2
    }, '+=0.15')

    .to('.title-bar', {
      duration: 1.0,
      width: 700,
      ease: "power4.inOut"
    }, '+=0.1')

    .from('.container', {
      duration: 1.0,
      x: 135,
      ease: "power4.inOut"
    }, '-=1.0')

    .to('.text2', {
      duration: 0.01,
      x: 0,
      opacity: 1
    }, '-=0.1')

    .to('.title-bar', {
      duration: 0.4,
      x: 700,
      width: 0,
      ease: "power4.in"
    })

    .from(t2, {
      duration: 0.6,
      opacity: 0,
      ease: "power3.inOut",
      stagger: 0.02
    }, '-=0.5')

    .to('.text1', {
      duration: 1.5,
      opacity: 0.25,
      ease: "power3.inOut"
    }, '-=1.2')
    
    .timeScale(1.45);
};


function SplitText(selector) {
  const el = document.querySelector(selector);
  const text = el.textContent.trim();
  el.textContent = "";
  const chars = [];

  for (const char of text) {
    const span = document.createElement("span");
    span.textContent = char === " " ? "\u00A0" : char;
    el.appendChild(span);
    chars.push(span);
  }

  return chars;
}

const faders = document.querySelectorAll('.fade');

const appearOptions = {
  threshold: 0.1,
  rootMargin: "0px 0px -100px 0px"
};

const appearOnScroll = new IntersectionObserver(function(entries, appearOnScroll) {
  entries.forEach(entry => {
    if (!entry.isIntersecting) {
      return;
    } else {
      entry.target.classList.add('show');
      appearOnScroll.unobserve(entry.target);
    }
  });
}, appearOptions);

faders.forEach(fader => {
  appearOnScroll.observe(fader);
});