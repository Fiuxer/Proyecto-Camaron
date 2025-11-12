
function returnToLogin() {
  window.location.href = "/Proyecto-Camaron/";
}

window.onload = async (e) => {

  const res = await fetch("project/backend/getpfp.php", {
    method: "GET",
    credentials: "include"
  });

  const data = await res.json();
  if (data.path) {
    console.log(data.path);
    img = document.querySelector(".pfp-holder");
    img.src = data.path;
    console.log(img.src);
  }
  if (data.user) {
    console.log(data.user);
    const name = document.getElementById("username");
    name.innerHTML = data.user;
  }

  // setTimeout(() => {
  //   document.querySelector(".ad-div").style.display = "grid";
  // }, 2000);

  const container = document.getElementById("container");
  
  for (let i = 1; i <= 15; i++ ) {
    const article = document.createElement("article");
    article.textContent = `Lección ${i}`;
    container.appendChild(article);
  }
};
