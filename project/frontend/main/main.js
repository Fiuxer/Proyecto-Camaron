async function returnToLogin() {
  try {
    const res = await fetch("project/backend/logout.php", {
      method: "GET",
      credentials: "include"
    });
    if (res.ok) {
      // Intentar leer JSON con la ruta de redirección si el backend la devuelve
      try {
        const data = await res.json();
        if (data && data.redirect) {
          window.location.href = data.redirect;
          return;
        }
      } catch (_) {}
      // Fallback: redirigir a login
      window.location.href = "/Proyecto-Camaron/login";
    } else {
      console.error("Logout failed: HTTP", res.status);
    }
  } catch (error) {
    console.error("Logout failed:", error);
  }
 
  
}

window.onload = async (e) => {

  const res = await fetch("project/backend/getpfp.php", {
    method: "GET",
    credentials: "include"
  });
  const data = await res.json();

  // Si no autenticado, redirigir al login
  if (!data || data.success === false) {
    window.location.href = "/Proyecto-Camaron/login";
    return;
  }
  console.log(data.path);
  img = document.querySelector(".pfp-holder");
  asideimg = document.querySelector(".aside-pfp");
  img.src = data.path;
  asideimg.src = data.path;
  console.log(data.user);
  const name = document.getElementById("username");
  name.innerHTML = data.user;
  console.log(data.name);
  document.querySelector("#name").textContent = data.name;
  document.querySelector("#aside-username").textContent = data.user;

  // setTimeout(() => {
  //   document.querySelector(".ad-div").style.display = "grid";
  // }, 2000);
  
  //LOAD LECTURES
  const container = document.getElementById("container");

  const lecturesRes = await fetch("project/backend/getlectures.php", {
    method: "GET",
    credentials: "include"
  });

  const lecturesData = await lecturesRes.json();

  

  if (!lecturesData || !Array.isArray(lecturesData)) {
    console.error("No data");
    return;
  }

  lecturesData.forEach(lecture => {
    const a = document.createElement("a");
    a.href = `/Proyecto-Camaron/lecture?id=${lecture.id}`;
    a.classList.add("lecture-link");

    const article = document.createElement("article");
    article.textContent = lecture.name;

    a.appendChild(article);
    container.appendChild(a);
  })
};
