const params = new URLSearchParams(window.location.search);
const id = params.get('id');

window.addEventListener("load", async () => {
  // ----------------Probar la sesión---------------- //
  // Llama a la imagen para ver si hay sesión
  const sessionRes = await fetch("project/backend/getpfp.php", {
      method: "GET",
      credentials: "include"
  });

  // Verificación de sesión
  const sessionData = await sessionRes.json();
  if (!sessionData || sessionData.success === false) {
      window.location.href = "/Proyecto-Camaron/login";
      return;
  }
  // ----------------------------------------------- //

  // Profile stuff
  const pfpData = sessionData;

  if (!pfpData) {
    console.error("Got an error gang");
    return;
  }
  console.log(pfpData.path);
  img = document.querySelector(".pfp-holder");
  asideimg = document.querySelector(".aside-pfp");
  img.src = pfpData.path;
  console.log(pfpData.user);
  const name = document.getElementById("username");
  name.innerHTML = pfpData.user;
  console.log(pfpData.name);
});