<?php
session_start();

if(!$_SESSION['username'] && !$_SESSION['password']) {
header('Location: login.php');
exit();
}



?>