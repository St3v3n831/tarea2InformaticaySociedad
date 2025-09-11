<?php
include_once './business/sessionManager.php';
?>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="view/css/dashboard.css">
    <title>Sistema de Servicios</title>
    <style>
        body {
            margin: 20px;
            font-family: Arial, sans-serif;
        }

        header {
            text-align: center;
        }

        a {
            text-decoration: none;
            color: black;
            padding: 5px;
            display: block;
        }

        a:hover {
            text-decoration: underline;
        }

        hr {
            border: none;
            border-top: 2px solid #ccc;
            margin: 20px 0;
        }

        .container {
            margin: 20px auto;
        }

        .section {
            padding: 10px;
            border: 1px solid #ccc;
            margin-bottom: 20px;
        }

        h2 {
            margin-bottom: 10px;
            color: #333;
        }

        .sub-section {
            padding-left: 20px;
        }

        h3 {
            margin-top: 15px;
            color: #555;
        }
    </style>
</head>

<body>
    <header>
        <hr>
        <h1>Sistema de Servicios</h1>
        <hr>
    </header>

    <nav>
        <a href="./view/logout.php">Cerrar Sesión</a>
    </nav>

    <div class="container">
        <?php if (isAdmin()) : ?>
            <div class="section">
                <h2>Administración General</h2>
                <br><hr>
                <a href="./view/servicioView.php">Administración de Servicios</a>
            </div>
        <?php endif; ?>
</body>

</html>