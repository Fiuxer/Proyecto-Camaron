<?php

$uri = parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH);
$uri = str_replace('/Proyecto-Camaron/', '', $uri);

switch ($uri) {
  case '':
  case 'login':
    include 'project/frontend/login.html';
    break;
  case 'register':
    include 'project/frontend/register.html';
    break;
  default:
    echo '404 🥀';
    break;
}

?>