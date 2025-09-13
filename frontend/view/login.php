<?php
ob_start();
include_once '../../backend/business/sesionBusiness.php';
session_start();
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $username = $_POST['username'] ?? '';
    $password = $_POST['password'] ?? '';
    $sesionBusiness = new SesionBusiness();
    $resultado = $sesionBusiness->autenticarUsuario($username, $password);
    if ($resultado) {
        $_SESSION['user_role'] = $resultado['tbsesionrol'];
        $_SESSION['user_id'] = $resultado['tbsesionid'];
        $_SESSION['productor_id'] = $resultado['tbsesionproductorid'];
        header('Location: /frontend/index.html');
        exit();
    } else {
        // Redirige a login.html con parámetro error=1
        header('Location: /frontend/view/login.html?error=1');
        exit();
    }
}
ob_end_flush();
?>
