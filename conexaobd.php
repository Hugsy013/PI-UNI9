<?php 

// métodos de conexão de BD mysqli, mysql e pdo.

// conexão com dreamweaver
$hostname_conn_bd_sim = "localhost";
$database_conn_bd_sim = "bd_sim";
$username_conn_bd_sim = "root";
$password_conn_bd_sim = "";

//criando a conexão usando as variáveis

$conn_bd_sim = mysqli_connect($hostname_conn_bd_sim, $username_conn_bd_sim, $password_conn_bd_sim, $database_conn_bd_sim) or trigger_error(mysqli_errno(), e_user_error());

//verification da conexao: echo "oi"


?>