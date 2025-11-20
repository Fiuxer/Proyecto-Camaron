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