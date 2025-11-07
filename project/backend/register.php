<?php
include("./db.php");

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
  $name = $_POST['name'];
  $username = $_POST['user'];
  $password = $_POST['password'];
  $confirm = $_POST['confirm'];

  if ($password != $confirm) {
    echo json_encode(["message"=> "Las contraseñas no coinciden"]);
    exit();
  }

  // hashing de la contraseña
  $hash = password_hash($password, PASSWORD_DEFAULT);

  // Subir imágenes
  $targetDir = 'uploads/';
  $filename = basename($_FILES['pfp']['name']);
  $targetFilePath = $targetDir . uniqid() . "_" . $filename;
  move_uploaded_file($_FILES["pfp"]["tmp_name"], $targetFilePath);

  // Insertar a db
  $stmt = $conn->prepare("INSERT INTO users(name, user, password, pfp_path) VALUES(?, ?, ?, ?)");
  $stmt->bind_param("ssss", $name, $username, $hash, $targetFilePath);

  if ($stmt->execute()) {
    echo json_encode(["message"=> "Usuario registrado exitosamente"]);
  } else {
    echo json_encode(["message"=> "Error: Puede que el usuario ya exista"]);
  }
}

?>