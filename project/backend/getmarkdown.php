<?php

include "db.php";

if (isset($_GET["id"])) {
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