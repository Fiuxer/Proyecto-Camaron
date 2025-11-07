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
  echo json_encode(["message"=> "Login exitoso", "user"=> $row["user"]]);
} else {
  echo json_encode(["message"=> "Credenciales incorrectas"]);
}

$stmt->close();
$conn->close(); 