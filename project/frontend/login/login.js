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