<?php

include("db.php");

session_start();
$userid = $_SESSION["id"];

$query = $conn->prepare("SELECT streak, last_login FROM user_data WHERE user_id = ?");
$query->bind_param("s", $userid);
$query->execute();
$query->bind_result($streak, $last_login);
$query->fetch();
$query->close();

$today = date("Y-m-d");
$yesterday = date("Y-m-d", strtotime("-1 day"));

if ( $last_login == $today ) {
  $newStreak = $streak;
} else if ( $last_login == $yesterday ) {
  $newStreak = $streak + 1;
} else {
  $newStreak = 1;
  echo json_encode(['success'=> true, 'streak'=> $newStreak, 'lost'=> true]);
}

if ( $newStreak == 0 ) {
  $newStreak = 1;
}

$update = $conn->prepare('UPDATE user_data SET streak = ?, last_login = ? WHERE user_id = ?');
$update->bind_param('isi', $newStreak, $today, $userid);
$update->execute();

echo json_encode(['success'=> true, 'streak'=> $newStreak, 'lost'=> false]);