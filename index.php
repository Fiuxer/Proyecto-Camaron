<?php

$uri = parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH);
$uri = str_replace('/Proyecto-Camaron/', '', $uri);

// Logged in → renew cookie
if (isset($_COOKIE["isLogged"])) {
  setcookie("isLogged","true", time() + 3600,"/");
} else {
  // Not logged in → if not homepage, redirect
  if (!in_array($uri, ['', 'login', 'register'])) {
    header('Location: /Proyecto-Camaron/login');
    exit; // <— CRITICAL
  }
}

// Router
switch ($uri) {
  case '':
    include 'project/frontend/homepage/home.html';
    break;
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
  case 'config':
    include 'project/frontend/config/config.html';
    break;
  case 'credits':
    include 'project/frontend/credits/credits.html';
    break;
  case 'congrats':
    include 'project/frontend/congrats/congrats.html';
    break;
  default:
    echo '404 🥀';
    break;
}
