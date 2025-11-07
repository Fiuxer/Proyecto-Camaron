<?php
include("./db.php");

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
  $name = $_POST['name'];
  $username = $_POST['username'];
  $password = $_POST['password'];
  $confirm = $_POST['confirm'];

  if ($password != $confirm) {
    echo json_encode(["message"=> "Las contraseñas no coinciden"]);
    exit();
  }
}

?>