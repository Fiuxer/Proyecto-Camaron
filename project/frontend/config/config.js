// Llama a la imagen para ver si hay sesión
window.onload = async () => {

const res = await fetch("project/backend/getpfp.php", {
    method: "GET",
    credentials: "include"
});

// Verificación de sesión
const data = await res.json();
if (!data || data.success === false) {
    window.location.href = "/Proyecto-Camaron/login";
    return;
}
}