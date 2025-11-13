window.onload = () => {
  const t2 = SplitText('.text2');
  const color1 = '#fff';
  const color2 = '#17c0fd';

  const movebar = () => {
    const width = gsap.getProperty('.text1', 'width');
    gsap.set('.title-bar', { left: width/2 + 360 }); // offset
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
      width: 290,
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
      x: 290,
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
