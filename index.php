<?php

$uri = parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH);
$uri = str_replace('/Proyecto-Camaron/', '', $uri);

switch ($uri) {
  case '':
  case 'login':
    include 'project/frontend/login/login.html';
    break;
  case 'register':
    include 'project/frontend/register/register.html';
    break;
  case 'main':
    include 'project/frontend/main/main.html';
    break;
  case 'lecture':
    include 'project/frontend/lecture/lecture.html';
    break;
  default:
    echo '404 🥀';
    break;
}

?>