document.getElementById("register-form").addEventListener("submit", async (e) => {
  e.preventDefault();

  const formData = new FormData(e.target);

  const res = await fetch("project/backend/register.php", {
    method: "POST",
    body: formData
  });

  const data = await res.json();
  alert(data.message);
  
  document.getElementById("result").textContent = data.message;
});

function returnToLogin() {
  window.location.href = "http://localhost/Proyecto-Camaron/login";
}

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
  },8); // I totally did NOT reuse the animation I made for the login
}