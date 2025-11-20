<?php

include "db.php";

$query = "SELECT * FROM lecciones";
$result = $conn->query($query);
$search = file_get_contents("php://input");
$search == "" ? $doSearch = false : $doSearch = true;

$lectures = [];

while ($row = $result->fetch_assoc()) {
  if ($doSearch) {
    if (stripos($row["nombre"],$search) !== false) {
      $lectures [] = [
        "id"=> $row["id"],
        "name"=> $row["nombre"]
      ];
    }
  } else {
    $lectures [] = [
      "id"=> $row["id"],
      "name"=> $row["nombre"]
    ];
  }
}

header("Content-Type: application/json");
echo json_encode($lectures);