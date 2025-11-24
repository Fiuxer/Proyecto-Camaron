<?php
session_start();
header('Content-Type: application/json; charset=utf-8');
include 'db.php';

if (!isset($_SESSION['id'])) {
  echo json_encode(['ok' => false, 'message' => 'No autenticado']);
  exit();
}

$userId = $_SESSION['id'];

// Leer inputs
$name = trim($_POST['name'] ?? '');
$user = trim($_POST['user'] ?? '');
$email = trim($_POST['email'] ?? '');
$current = $_POST['current'] ?? '';
$new = $_POST['new'] ?? '';
$confirm = $_POST['confirm'] ?? '';
$remove_pfp = isset($_POST['remove_pfp']) ? true : false;

try {
  // 1) Verificar contraseña actual si se solicita cambio de contraseña, usuario o email
  if ($new || $user || $email) {
    $stmt = $conn->prepare('SELECT password FROM users WHERE id = ? LIMIT 1');
    $stmt->bind_param('i', $userId);
    $stmt->execute();
    $result = $stmt->get_result();
    $row = $result->fetch_assoc();
    
    if (!$row || !password_verify($current, $row['password'])) {
      throw new Exception('Contraseña actual incorrecta');
    }
    $stmt->close();
  }

  // 2) Si hay nueva contraseña, validarla
  if ($new) {
    if ($new !== $confirm) throw new Exception('Las contraseñas no coinciden');
    if (strlen($new) < 6) throw new Exception('La contraseña es demasiado corta');
    $newHash = password_hash($new, PASSWORD_DEFAULT);
    $stmt = $conn->prepare('UPDATE users SET password = ? WHERE id = ?');
    $stmt->bind_param('si', $newHash, $userId);
    $stmt->execute();
    $stmt->close();
  }

  // 3) Actualizar campos básicos
  $updates = [];
  $types = '';
  $values = [];
  
  if ($name !== '') {
    $updates[] = 'name = ?';
    $types .= 's';
    $values[] = $name;
  }
  if ($user !== '') {
    $stmt = $conn->prepare('SELECT id FROM users WHERE user = ? AND id != ? LIMIT 1');
    $stmt->bind_param('si', $user, $userId);
    $stmt->execute();
    if ($stmt->get_result()->num_rows > 0) throw new Exception('Nombre de usuario en uso');
    $stmt->close();
    $updates[] = 'user = ?';
    $types .= 's';
    $values[] = $user;
    $_SESSION['user'] = $user;
  }
  if ($email !== '') {
    $updates[] = 'email = ?';
    $types .= 's';
    $values[] = $email;
  }

  if (count($updates) > 0) {
    $values[] = $userId;
    $types .= 'i';
    $sql = 'UPDATE users SET ' . implode(', ', $updates) . ' WHERE id = ?';
    $stmt = $conn->prepare($sql);
    $stmt->bind_param($types, ...$values);
    $stmt->execute();
    $stmt->close();
  }

  // 4) Manejar foto de perfil
  $uploadDir = __DIR__ . '/uploads/';
  if (!is_dir($uploadDir)) mkdir($uploadDir, 0755, true);

  if ($remove_pfp) {
    $stmt = $conn->prepare('UPDATE users SET pfp_path = NULL WHERE id = ?');
    $stmt->bind_param('i', $userId);
    $stmt->execute();
    $stmt->close();
    echo json_encode(['ok' => true, 'message' => 'Foto de perfil eliminada']);
    exit();
  }

  if (!empty($_FILES['pfp']) && $_FILES['pfp']['error'] === UPLOAD_ERR_OK) {
    $f = $_FILES['pfp'];
    $ext = strtolower(pathinfo($f['name'], PATHINFO_EXTENSION));
    $allowed = ['png', 'jpg', 'jpeg', 'gif', 'webp'];
    if (!in_array($ext, $allowed)) throw new Exception('Formato de imagen no permitido');
    
    $newName = 'pfp_' . $userId . '_' . time() . '.' . $ext;
    $dst = $uploadDir . $newName;
    if (!move_uploaded_file($f['tmp_name'], $dst)) throw new Exception('No se pudo guardar la imagen');
    
    $stmt = $conn->prepare('UPDATE users SET pfp_path = ? WHERE id = ?');
    $stmt->bind_param('si', $newName, $userId);
    $stmt->execute();
    $stmt->close();
  }

  echo json_encode(['ok' => true, 'message' => 'Perfil actualizado correctamente']);

} catch (Exception $e) {
  echo json_encode(['ok' => false, 'message' => $e->getMessage()]);
}

$conn->close();
?>