<?php
include("./db.php");

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
  $name = $_POST['name'];
  $username = $_POST['user'];
  $password = $_POST['password'];
  $confirm = $_POST['confirm'];
  $email = $_POST['email'];

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
  $stmt = $conn->prepare("INSERT INTO users(name, user, email, password, pfp_path) VALUES(?, ?, ?, ?, ?)");
  $stmt->bind_param("sssss", $name, $username, $email, $hash, $targetFilePath);

  if ($stmt->execute()) {
    $userid = $conn->insert_id;
    $streak = 0;
    $date = date("Y-m-d");
    $level = 1;
    $exp = 0;

    $stmt = $conn->prepare("INSERT INTO user_data(user_id, streak, last_login, user_level, user_exp) VALUES (?, ?, ?, ?, ?)");
    $stmt->bind_param("iisii", $userid, $streak, $date, $level, $exp );

    if ($stmt->execute()) {
      echo json_encode(["message"=> "Usuario registrado exitosamente"]);
    } else {
      echo json_encode(["message"=> "Error: No se pudo agregar a la base de datos"]);
    }
  } else {
    echo json_encode(["message"=> "Error: Puede que el usuario ya exista"]);
  }

}