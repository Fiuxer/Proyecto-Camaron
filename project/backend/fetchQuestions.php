<?php

include "db.php";

if(!isset($_GET["id"])) {
  echo json_encode(["error"=> true, "body"=> "ERR001: Could not find ID"]);
  exit;
}

$id = intval($_GET["id"]);

$query = $conn->prepare("SELECT * FROM preguntas WHERE id_lecture = ?");
$query->bind_param("i", $id);                   // Supposedly id is already set here
$query->execute();
$result = $query->get_result();                 // I get a json that I have to send back
$questions = $result->fetch_all();

if ($questions) {
  echo json_encode(["error"=> false,"body"=> $questions]);
} else {
  echo json_encode(["error"=> true, "body"=> "ERR002: Questions not found"]);
}
