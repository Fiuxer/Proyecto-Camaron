<?php
session_start();
header("Content-Type: application/json; charset=utf-8");
include "db.php";

if (!isset($_SESSION["id"])) {
  echo json_encode(["ok" => false, "message" => "No autenticado"]);
  exit();
}

$userId = $_SESSION["id"];

// Obtener datos del usuario desde la BD
$stmt = $conn->prepare("SELECT name, user, email FROM users WHERE id = ? LIMIT 1");
$stmt->bind_param("i", $userId);
$stmt->execute();

$result = $stmt->get_result();

if ($result->num_rows === 0) {
  echo json_encode(["ok" => false, "message" => "Usuario no encontrado"]);
  exit();
}

$row = $result->fetch_assoc();

echo json_encode([
  "ok" => true,
  "name" => $row["name"] ?? "",
  "user" => $row["user"] ?? "",
  "email" => $row["email"] ?? ""
]);

$stmt->close();
$conn->close();
?>
