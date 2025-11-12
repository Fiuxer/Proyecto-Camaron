<?php

session_start();
echo json_encode(["path"=> "project/backend/" . $_SESSION["pfpPath"], "user"=> $_SESSION["user"]]);