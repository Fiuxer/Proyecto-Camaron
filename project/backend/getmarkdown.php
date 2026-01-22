<?php

include "db.php";

if (isset($_GET["id"])) {
  // ID es lo que digo que se puede poner escondido. Si le das click al link sale como https://pagina?id=10
  $id = intval($_GET["id"]);

  $query = "SELECT * FROM lecciones WHERE id = $id";
  $result = $conn->query($query);
  
  $lecture = $result->fetch_assoc();
  
  if ($lecture) {
    echo json_encode(["success"=> true, "lecture"=> $lecture]);
  } else {
    echo json_encode(["success"=> false,"error"=> "Lecture not found"]);
  }
} else {
  echo json_encode(["success"=> false, "error"=> "Missing ID"]);
}