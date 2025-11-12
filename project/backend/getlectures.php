<?php

include "db.php";

$query = "SELECT * FROM lecciones";
$result = $conn->query($query);

$lectures = [];

while ($row = $result->fetch_assoc()) {
  $lectures [] = [
    "id"=> $row["id"],
    "name"=> $row["nombre"]
  ];
}

header("Content-Type: application/json");
echo json_encode($lectures);