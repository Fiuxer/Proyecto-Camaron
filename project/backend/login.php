<?php

header("Content-Type: application/json");
include "db.php";

// Leer json de login.js
$data = json_decode(file_get_contents("php://input"), true);

$username = $data["username"];
$password = $data["password"];

// Preparar query
$stmt = $conn->prepare("SELECT * FROM users WHERE user = ?");
$stmt->bind_param("s", $username);
$stmt->execute();

$result = $stmt->get_result();

// Revisar si el usuario existe
if ($result->num_rows === 0) {
  echo json_encode(["message" => "Usuario no encontrado"]);
  exit();
}

$row = $result->fetch_assoc();

// Comprobar usuario y contraseña (Contraseña hashed)
if (password_verify($password, $row["password"])) {
  session_start();
  // Regenerar id de sesión al iniciar sesión para evitar reutilización
  session_regenerate_id(true);
  $_SESSION["id"] = $row["id"];
  $_SESSION["pfpPath"] = $row["pfp_path"];
  $_SESSION["user"] = $row["user"];
  $_SESSION["name"] = $row["name"];
  echo json_encode(["redirect"=> "/Proyecto-Camaron/main"]);
  exit();
} else {
  echo json_encode(["message"=> "Credenciales incorrectas"]);
}

$stmt->close();
$conn->close(); 