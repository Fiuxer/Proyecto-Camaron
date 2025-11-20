<?php
header("Content-Type: application/json");
if (session_status() === PHP_SESSION_NONE) {
  session_start();
}

// Limpiar variables de sesión
$_SESSION = [];
session_unset();

// Destruir la sesión en servidor
session_destroy();

// Borrar cookie de sesión si existe (usar los mismos params que la sesión)
$params = session_get_cookie_params();
$path = isset($params['path']) && $params['path'] !== '' ? $params['path'] : '/';
$domain = isset($params['domain']) ? $params['domain'] : '';
setcookie(session_name(), '', time() - 42000, $path, $domain, isset($params['secure']) ? $params['secure'] : false, isset($params['httponly']) ? $params['httponly'] : false);

// Asegurar que no quede handle abierto
session_write_close();

echo json_encode(["success" => true, "redirect" => "/Proyecto-Camaron/login"]);
?>