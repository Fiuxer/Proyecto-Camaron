document.getElementById("login-form").onsubmit = async (e) => {
  e.preventDefault(); // Evitar que se recarge la pag

  const username = document.getElementById("username").value;
  const password = document.getElementById("password").value;

  // Enviar datos al backend
  const res = await fetch("project/backend/login.php", {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify({ username, password })
  });

  const data = await res.json();

  if (data.redirect) {
    window.location.href = data.redirect;
  } else {
    document.getElementById("result").textContent = data.message;
  }
};

window.onload = () => {
  const background = document.querySelector(".background-circles");

  setInterval(() => {
    let rand = Math.floor(Math.random() * window.innerWidth);
    let size = Math.floor(Math.random() * 4) * 50;
    let circle = document.createElement("i");
    circle.style.left = rand + "px";
    circle.style.width = size + "px";
    circle.style.bottom = -size + "px";

    circle.classList.add("circle");

    background.appendChild(circle);
  }, Math.floor(Math.random() * 500) + 500);

  setInterval(()=> {
    let circles = document.querySelectorAll(".circle");
    circles.forEach(circ => {
      let posY = parseInt(circ.style.bottom) || 0;
      circ.style.bottom = (posY + 1) + "px";

      if (posY > 1000) {
        circ.remove();
      }
    });

  },8);
}