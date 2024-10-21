<?php
session_start();
if (!isset($_SESSION['loggedin']) || $_SESSION['loggedin'] !== true) {
    header('Location: index.php');
    exit;
}
?>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - Plataforma SIM</title>
</head>
<body>
    <h1>Bem-vindo, <?php echo $_SESSION['username']; ?>!</h1>
    <a href="logout.php">Sair</a>
</body>
</html>
