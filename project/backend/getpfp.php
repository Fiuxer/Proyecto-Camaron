<?php

session_start();
if (!isset($_SESSION["user"])) {
	http_response_code(401);
	echo json_encode(["success" => false, "message" => "No autenticado"]);
	exit();
}

echo json_encode(["success" => true, "path"=> "project/backend/" . $_SESSION["pfpPath"], "user"=> $_SESSION["user"], "name"=> $_SESSION["name"]]);
exit();